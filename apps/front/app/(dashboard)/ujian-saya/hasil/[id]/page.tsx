"use client";
import { API_URL } from "@/lib/api";

import { useQuery } from "@tanstack/react-query";
import { useRouter, useParams } from "next/navigation";
import { Loader2, ArrowLeft, CheckCircle, XCircle, Clock, Award, HelpCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { useRole } from "../../../role-context";

export default function HasilUjianPage() {
    const { token } = useRole();
    const router = useRouter();
    const params = useParams();
    const ujianSiswaId = params.id as string;

    const { data: result, isLoading } = useQuery({
        queryKey: ["ujian-result", ujianSiswaId],
        queryFn: async () => {
            const res = await fetch(
                `${API_URL}/ujian-siswa/result/${ujianSiswaId}`,
                { headers: { Authorization: `Bearer ${token}` } }
            );
            if (!res.ok) throw new Error("Failed to load result");
            return res.json();
        },
    });

    if (isLoading) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <Loader2 className="h-8 w-8 animate-spin" />
            </div>
        );
    }

    const isPassed = result.nilaiTotal >= result.ujian.nilaiMinimal;
    const duration = result.durasi
        ? `${result.durasi} menit`
        : "-";

    const normalizeText = (text: string) =>
        (text || "")
            .toLowerCase()
            .replace(/[^a-z0-9\u00c0-\u024f\s]/g, " ")
            .replace(/\s+/g, " ")
            .trim();

    const isEssayCorrect = (kunci: string | null | undefined, jawaban: string | null | undefined) => {
        if (!kunci || !jawaban) return false;
        const keyNorm = normalizeText(kunci);
        const ansNorm = normalizeText(jawaban);
        if (!keyNorm || !ansNorm) return false;
        if (keyNorm === ansNorm) return true;
        if (ansNorm.includes(keyNorm) || keyNorm.includes(ansNorm)) return true;
        const keyTokens = new Set(keyNorm.split(" "));
        const ansTokens = new Set(ansNorm.split(" "));
        const intersect = Array.from(keyTokens).filter((t) => ansTokens.has(t)).length;
        const union = new Set([...Array.from(keyTokens), ...Array.from(ansTokens)]).size || 1;
        const jaccard = intersect / union;
        return jaccard >= 0.5;
    };

    const soalList = result.ujian.ujianSoal || [];
    const jawabanMap = Array.isArray(result.jawaban)
        ? result.jawaban.reduce((acc: any, item: any) => {
            acc[item.soalId] = item.jawaban;
            return acc;
        }, {})
        : {};

    const soalBreakdown = soalList.map((soal: any, idx: number) => {
        const tipe = soal.bankSoal.tipe;
        const kunci = soal.bankSoal.jawabanBenar;
        const jawabanSiswaId = jawabanMap[soal.bankSoalId];
        const isPg = tipe === "PILIHAN_GANDA" || tipe === "BENAR_SALAH";
        const pilihanJawaban = Array.isArray(soal.bankSoal.pilihanJawaban)
            ? soal.bankSoal.pilihanJawaban
            : [];
        const correctOption = pilihanJawaban.find((p: any) => p.isCorrect);
        
        // Find the selected option for display
        const selectedOption = pilihanJawaban.find((p: any) => p.id === jawabanSiswaId);
        
        // Format jawaban siswa with label (A, B, C, D) and text
        let jawabanSiswaLabel = null;
        if (jawabanSiswaId) {
            if (isPg && selectedOption) {
                // Find index to get letter (A, B, C, D)
                const optionIndex = pilihanJawaban.findIndex((p: any) => p.id === jawabanSiswaId);
                const letter = String.fromCharCode(65 + optionIndex); // A=65, B=66, etc
                jawabanSiswaLabel = `${letter}. ${selectedOption.text}`;
            } else {
                // For essay/isian singkat, just use the answer as is
                jawabanSiswaLabel = jawabanSiswaId;
            }
        }
        
        // Format correct answer with label
        let correctLabel = null;
        if (isPg && correctOption) {
            const correctIndex = pilihanJawaban.findIndex((p: any) => p.isCorrect);
            const letter = String.fromCharCode(65 + correctIndex);
            correctLabel = `${letter}. ${correctOption.text}`;
        } else {
            correctLabel = kunci;
        }

        let status: "BENAR" | "SALAH" | "BELUM_DIISI" | "OTOMATIS" = "BELUM_DIISI";
        if (jawabanSiswaId) {
            if (isPg && correctOption) {
                status = jawabanSiswaId === correctOption.id ? "BENAR" : "SALAH";
            } else if (tipe === "ESSAY" || tipe === "ISIAN_SINGKAT") {
                status = isEssayCorrect(kunci, jawabanSiswaId) ? "BENAR" : "OTOMATIS";
            }
        }

        return {
            idx,
            soal,
            status,
            jawabanSiswa: jawabanSiswaLabel,
            correctLabel,
        };
    });

    const correctCount = soalBreakdown.filter((s: any) => s.status === "BENAR").length;
    const answeredCount = soalBreakdown.filter((s: any) => s.status !== "BELUM_DIISI").length;

    return (
        <div className="max-w-4xl mx-auto space-y-6 p-4">
            {/* Header */}
            <Card>
                <CardHeader>
                    <div className="flex items-center gap-4">
                        <Button variant="ghost" size="icon" onClick={() => router.push("/ujian-saya")}>
                            <ArrowLeft size={20} />
                        </Button>
                        <div className="flex-1">
                            <h1 className="text-2xl font-bold">Hasil Ujian</h1>
                            <p className="text-sm text-muted-foreground">{result.ujian.judul}</p>
                        </div>
                    </div>
                </CardHeader>
            </Card>

            {/* Score Card */}
            <Card>
                <CardContent className="p-8">
                    <div className="text-center space-y-6">
                        {isPassed ? (
                            <div className="flex justify-center">
                                <div className="h-20 w-20 rounded-full bg-green-500/20 flex items-center justify-center">
                                    <CheckCircle className="h-12 w-12 text-green-600" />
                                </div>
                            </div>
                        ) : (
                            <div className="flex justify-center">
                                <div className="h-20 w-20 rounded-full bg-red-500/20 flex items-center justify-center">
                                    <XCircle className="h-12 w-12 text-red-600" />
                                </div>
                            </div>
                        )}

                        <div>
                            <p className="text-sm text-muted-foreground mb-2">Nilai Anda</p>
                            <p className="text-6xl font-bold">{result.nilaiTotal?.toFixed(1) ?? 0}</p>
                            <p className="text-sm text-muted-foreground mt-2">
                                Passing Grade: {result.ujian.nilaiMinimal}
                            </p>
                        </div>

                        <Badge
                            className={`text-lg px-6 py-2 ${isPassed
                                ? "bg-green-500/15 text-green-600"
                                : "bg-red-500/15 text-red-600"
                                }`}
                        >
                            {isPassed ? "LULUS" : "TIDAK LULUS"}
                        </Badge>
                    </div>
                </CardContent>
            </Card>

            

            {/* Details */}
            <Card>
                <CardHeader>
                    <CardTitle>Detail Ujian</CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                    <div className="flex justify-between py-2 border-b">
                        <span className="text-muted-foreground">Status</span>
                        <span className="font-medium">{result.status || "-"}</span>
                    </div>
                    <div className="flex justify-between py-2 border-b">
                        <span className="text-muted-foreground">Mata Pelajaran</span>
                        <span className="font-medium">{result.ujian.mataPelajaran?.nama || "-"}</span>
                    </div>
                    <div className="flex justify-between py-2 border-b">
                        <span className="text-muted-foreground">Kelas</span>
                        <span className="font-medium">
                            {result.ujian.ujianKelas?.length > 0
                                ? result.ujian.ujianKelas.map((uk: any) => uk.kelas?.nama).filter(Boolean).join(", ")
                                : result.ujian.kelas?.nama || result.siswa?.kelas?.nama || "-"}
                        </span>
                    </div>
                    <div className="flex justify-between py-2 border-b">
                        <span className="text-muted-foreground">Waktu Mulai</span>
                        <span className="font-medium">
                            {new Date(result.waktuMulai).toLocaleString("id-ID")}
                        </span>
                    </div>
                    <div className="flex justify-between py-2 border-b">
                        <span className="text-muted-foreground">Waktu Selesai</span>
                        <span className="font-medium">
                            {result.waktuSelesai
                                ? new Date(result.waktuSelesai).toLocaleString("id-ID")
                                : "-"}
                        </span>
                    </div>
                    <div className="flex justify-between py-2">
                        <span className="text-muted-foreground">Jumlah Soal</span>
                        <span className="font-medium">{soalList.length || 0}</span>
                    </div>
                </CardContent>
            </Card>

            {/* Feedback */}
            {result.ujian.tampilkanNilai && (
                <Card>
                    <CardHeader>
                        <CardTitle>Catatan</CardTitle>
                    </CardHeader>
                    <CardContent>
                        {isPassed ? (
                            <p className="text-green-600">
                                Selamat! Anda telah lulus ujian ini dengan nilai {result.nilaiTotal?.toFixed(1)}. Pertahankan
                                prestasi Anda!
                            </p>
                        ) : (
                            <p className="text-red-600">
                                Nilai Anda belum mencapai passing grade. Tetap semangat dan terus belajar!
                            </p>
                        )}
                    </CardContent>
                </Card>
            )}

            {/* Breakdown */}
            {result.ujian.tampilkanNilai && (
                <Card>
                    <CardHeader>
                        <CardTitle>Rincian Soal</CardTitle>
                        <p className="text-sm text-muted-foreground">
                            Benar: {correctCount} • Dijawab: {answeredCount} / {soalBreakdown.length}
                        </p>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        {soalBreakdown.map((item: any) => (
                            <div
                                key={item.soal.id}
                                className="border border-border rounded-lg p-4 space-y-2 bg-muted/30"
                            >
                                <div className="flex items-center gap-2 text-sm text-muted-foreground">
                                    <span className="font-semibold text-foreground">Soal {item.idx + 1}</span>
                                    <Badge className="text-xs border">
                                        {item.soal.bankSoal.tipe.replace("_", " ")}
                                    </Badge>
                                </div>
                                <div className="text-foreground" dangerouslySetInnerHTML={{ __html: item.soal.bankSoal.pertanyaan }} />
                                <div className="flex items-center gap-2 text-sm">
                                    {item.status === "BENAR" && (
                                        <Badge className="bg-green-500/15 text-green-700">Benar</Badge>
                                    )}
                                    {item.status === "SALAH" && (
                                        <Badge className="bg-red-500/15 text-red-700">Salah</Badge>
                                    )}
                                    {item.status === "BELUM_DIISI" && (
                                        <Badge className="bg-amber-500/15 text-amber-700">Belum diisi</Badge>
                                    )}
                                    {item.status === "OTOMATIS" && (
                                        <Badge className="bg-blue-500/15 text-blue-700 flex items-center gap-1">
                                            <HelpCircle size={14} />
                                            Perlu cek manual
                                        </Badge>
                                    )}
                                </div>
                                <div className="text-sm text-muted-foreground space-y-1">
                                    <div>
                                        <span className="font-medium text-foreground">Jawaban Anda: </span>
                                        {item.jawabanSiswa ? (
                                            <span dangerouslySetInnerHTML={{ __html: item.jawabanSiswa }} />
                                        ) : (
                                            <span>-</span>
                                        )}
                                    </div>
                                    {item.correctLabel && (
                                        <div>
                                            <span className="font-medium text-foreground">Kunci: </span>
                                            <span dangerouslySetInnerHTML={{ __html: item.correctLabel }} />
                                        </div>
                                    )}
                                </div>
                            </div>
                        ))}
                    </CardContent>
                </Card>
            )}

            {/* Actions */}
            <div className="flex justify-center">
                <Button onClick={() => router.push("/ujian-saya")} size="lg">
                    Kembali ke Daftar Ujian
                </Button>
            </div>
        </div>
    );
}
