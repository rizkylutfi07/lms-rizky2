import { useState } from 'react';

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:3001';

export interface GenerateMateriInput {
    mataPelajaran: string;
    topik: string;
    tingkat: string;
    tipeMateri: 'DOKUMEN' | 'VIDEO' | 'LINK' | 'GAMBAR' | 'TEKS';
    durasi?: number;
    targetAudience?: string;
}

export interface GeneratedMateriContent {
    judul: string;
    deskripsi: string;
    konten: string;
    ringkasan?: string;
    tujuanPembelajaran?: string[];
    materiPokok?: string[];
    latihan?: string[];
    referensi?: string[];
}

export function useAiMateriGenerator() {
    const [isGenerating, setIsGenerating] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const generateMateri = async (input: GenerateMateriInput): Promise<GeneratedMateriContent | null> => {
        setIsGenerating(true);
        setError(null);

        try {
            // Get token from localStorage (matching app's auth pattern)
            const authData = typeof window !== 'undefined'
                ? JSON.parse(localStorage.getItem('arunika-auth') || '{}')
                : {};
            const token = authData.token;

            const response = await fetch(`${API_BASE_URL}/materi/generate`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    ...(token ? { Authorization: `Bearer ${token}` } : {}),
                },
                body: JSON.stringify(input),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || 'Failed to generate materi with AI');
            }

            const generated: GeneratedMateriContent = await response.json();
            return generated;
        } catch (err: any) {
            setError(err.message || 'An error occurred while generating materi');
            return null;
        } finally {
            setIsGenerating(false);
        }
    };

    return {
        generateMateri,
        isGenerating,
        error,
    };
}
