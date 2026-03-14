import { Injectable, Logger } from '@nestjs/common';
import { createGoogleGenerativeAI } from '@ai-sdk/google';
import { generateText } from 'ai';
import { ConfigService } from '@nestjs/config';

export interface GenerateMateriInput {
    mataPelajaran: string;
    topik: string;
    tingkat: string; // e.g., "Kelas 10", "Fase E"
    tipeMateri: 'DOKUMEN' | 'VIDEO' | 'LINK' | 'GAMBAR' | 'TEKS';
    durasi?: number; // in minutes
    targetAudience?: string; // e.g., "SMA", "SMK"
}

export interface GeneratedMateriContent {
    judul: string;
    deskripsi: string;
    konten: string; // Main content - can be text, explanation, or structured content
    ringkasan?: string;
    tujuanPembelajaran?: string[];
    materiPokok?: string[];
    latihan?: string[];
    referensi?: string[];
}

@Injectable()
export class AiMateriService {
    private readonly logger = new Logger(AiMateriService.name);
    private readonly apiKey: string;

    constructor(private configService: ConfigService) {
        const apiKey = this.configService.get<string>('GOOGLE_GENERATIVE_AI_API_KEY');
        this.apiKey = apiKey || '';
        if (!this.apiKey) {
            this.logger.warn('GOOGLE_GENERATIVE_AI_API_KEY not configured. AI Materi generation will not work.');
        }
    }

    async generateMateri(input: GenerateMateriInput): Promise<GeneratedMateriContent> {
        if (!this.apiKey) {
            throw new Error('Google Gemini API key not configured. Please set GOOGLE_GENERATIVE_AI_API_KEY in environment variables.');
        }

        this.logger.log(`Generating Materi for: ${input.mataPelajaran} - ${input.topik}`);

        const tipeLabels = {
            DOKUMEN: 'dokumen/modul pembelajaran',
            VIDEO: 'skrip video pembelajaran',
            LINK: 'panduan dengan referensi link',
            GAMBAR: 'materi dengan deskripsi visual',
            TEKS: 'teks penjelasan lengkap',
        };

        const tipeDescription = tipeLabels[input.tipeMateri] || 'materi pembelajaran';

        const prompt = `Anda adalah guru berpengalaman di Indonesia yang ahli dalam menyusun materi pembelajaran yang menarik dan mudah dipahami.

Buatkan materi pembelajaran dengan data berikut:
- Mata Pelajaran: ${input.mataPelajaran}
- Topik/Materi: ${input.topik}
- Tingkat/Kelas: ${input.tingkat}
- Tipe Materi: ${tipeDescription}
${input.durasi ? `- Durasi Belajar: ${input.durasi} menit` : ''}
${input.targetAudience ? `- Target Siswa: ${input.targetAudience}` : ''}

INSTRUKSI PENTING:
1. Gunakan bahasa Indonesia yang baik, benar, dan mudah dipahami siswa
2. Sesuaikan dengan tingkat kemampuan siswa pada jenjang tersebut
3. Konten harus informatif, menarik, dan aplikatif
4. Sertakan contoh-contoh yang relevan dengan kehidupan sehari-hari
5. JANGAN gunakan format markdown seperti **, *, #, atau simbol lainnya. Tulis teks polos saja. Gunakan angka untuk daftar bernomor dan tanda hubung (-) untuk daftar tidak bernomor.

Format output dalam JSON dengan struktur:
{
  "judul": "Judul materi yang menarik dan deskriptif",
  "deskripsi": "Deskripsi singkat tentang materi ini dalam 2-3 kalimat",
  "konten": "Konten utama materi pembelajaran yang lengkap dan terstruktur. Tuliskan penjelasan materi secara detail dengan sub-bab yang jelas. Sertakan contoh dan ilustrasi.",
  "ringkasan": "Ringkasan poin-poin penting dari materi",
  "tujuanPembelajaran": ["Tujuan 1", "Tujuan 2", "Tujuan 3"],
  "materiPokok": ["Poin materi 1", "Poin materi 2", "Poin materi 3"],
  "latihan": ["Soal latihan 1", "Soal latihan 2", "Soal latihan 3"],
  "referensi": ["Sumber referensi 1", "Sumber referensi 2"]
}

PASTIKAN output adalah valid JSON yang dapat di-parse. Konten utama harus detail dan lengkap, minimal 500 kata.`;

        try {
            // Create a Google AI instance with the API key
            const google = createGoogleGenerativeAI({
                apiKey: this.apiKey,
            });

            this.logger.log('Calling Gemini API with model gemini-2.5-flash...');
            const { text } = await generateText({
                model: google('gemini-2.5-flash'),
                prompt,
                temperature: 0.7,
            });

            this.logger.log('AI generation completed, response length: ' + text.length);

            // Parse JSON response - extract the first valid JSON object
            let jsonString = '';
            let braceCount = 0;
            let inString = false;
            let escapeNext = false;
            let started = false;

            for (const char of text) {
                if (escapeNext) {
                    if (started) jsonString += char;
                    escapeNext = false;
                    continue;
                }

                if (char === '\\' && inString) {
                    if (started) jsonString += char;
                    escapeNext = true;
                    continue;
                }

                if (char === '"' && !escapeNext) {
                    inString = !inString;
                }

                if (!inString) {
                    if (char === '{') {
                        if (!started) started = true;
                        braceCount++;
                    } else if (char === '}') {
                        braceCount--;
                    }
                }

                if (started) {
                    jsonString += char;
                    if (braceCount === 0) break;
                }
            }

            if (!jsonString) {
                throw new Error('Failed to extract JSON from AI response');
            }

            const generated: GeneratedMateriContent = JSON.parse(jsonString);

            // Validate required fields
            if (!generated.judul || !generated.konten) {
                throw new Error('AI generated incomplete materi content');
            }

            return generated;
        } catch (error) {
            this.logger.error('Failed to generate Materi with AI', error);
            throw new Error(`AI generation failed: ${error.message}`);
        }
    }
}
