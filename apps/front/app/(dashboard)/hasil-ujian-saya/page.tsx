"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { useRouter } from "next/navigation";
import { BarChart3, Eye, CheckCircle, XCircle, Clock } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { useRole } from "../role-context";

export default function HasilUjianSayaPage() {
    const { token } = useRole();
    const router = useRouter();
    const [search, setSearch] = useState("");

    const { data = [], isLoading } = useQuery({
        queryKey: ["hasil-ujian-saya", search],
        queryFn: async () => {
            const res = await fetch(
                `${API_URL}/ujian-siswa/completed`,
                { headers: { Authorization: `Bearer ${token}` } }
            );
            return res.json();
        },
    });

    // Filter by search query
    const completedExams = Array.isArray(data) 
        ? data
        : [];

    const filteredExams = completedExams.filter((item: any) => {
        const q = search.toLowerCase();
        const judul = item.ujian?.judul?.toLowerCase() || "";
        const mapel = item.ujian?.mataPelajaran?.nama?.toLowerCase() || "";
        return judul.includes(q) || mapel.includes(q);
    });

    const getStatusBadge = (passed: boolean) => {
        return passed ? (
            <Badge className="bg-green-500/15 text-green-600">
                <CheckCircle size={14} className="mr-1" />
                Lulus
            </Badge>
        ) : (
            <Badge className="bg-red-500/15 text-red-600">
                <XCircle size={14} className="mr-1" />
                Tidak Lulus
            </Badge>
        );
    };

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div>
                        <h1 className="text-3xl font-bold flex items-center gap-2">
                            <BarChart3 className="h-8 w-8" />
                            Hasil Ujian Saya
                        </h1>
                        <p className="text-sm text-muted-foreground">
                            Lihat hasil ujian yang sudah Anda selesaikan
                        </p>
                    </div>

                    <input
                        type="text"
                        placeholder="Cari ujian..."
                        value={search}
                        onChange={(e) => setSearch(e.target.value)}
                        className="w-full rounded-lg border border-border bg-background py-2 px-4 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                    />
                </CardHeader>

                <CardContent className="p-2 md:p-4">
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-border">
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Ujian</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Mata Pelajaran</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Nilai</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Status</th>
                                    
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Tanggal</th>
                                    <th className="text-right py-3 px-4 text-sm font-semibold text-muted-foreground">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {isLoading ? (
                                    Array.from({ length: 3 }).map((_, i) => (
                                        <tr key={i}>
                                            <td colSpan={7} className="py-4">
                                                <div className="h-12 animate-pulse rounded bg-muted/50" />
                                            </td>
                                        </tr>
                                    ))
                                ) : filteredExams.length === 0 ? (
                                    <tr>
                                        <td colSpan={7} className="py-16 text-center">
                                            <div className="flex flex-col items-center gap-2 text-muted-foreground">
                                                <BarChart3 size={48} className="opacity-30" />
                                                <p className="font-medium">Belum ada ujian yang selesai</p>
                                                <p className="text-sm">Hasil ujian akan muncul di sini setelah Anda menyelesaikan ujian</p>
                                            </div>
                                        </td>
                                    </tr>
                                ) : (
                                    filteredExams.map((item: any) => {
                                        const isPassed = item.isPassed ?? false;
                                        const ujian = item.ujian;
                                        
                                        return (
                                            <tr key={item.id} className="border-b border-border hover:bg-muted/30 transition">
                                                <td className="py-4 px-4">
                                                    <div>
                                                        <p className="font-medium">{ujian?.judul || "-"}</p>
                                                        {ujian?.deskripsi && (
                                                            <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">
                                                                {ujian.deskripsi}
                                                            </p>
                                                        )}
                                                    </div>
                                                </td>
                                                <td className="py-4 px-4">
                                                    {ujian?.mataPelajaran ? (
                                                        <Badge className="bg-indigo-500/15 text-indigo-500">
                                                            {ujian.mataPelajaran.nama}
                                                        </Badge>
                                                    ) : (
                                                        <span className="text-muted-foreground">-</span>
                                                    )}
                                                </td>
                                                <td className="py-4 px-4 text-center">
                                                    {ujian?.tampilkanNilai ? (
                                                        item.nilaiTotal !== null && item.nilaiTotal !== undefined ? (
                                                            <div className="flex flex-col items-center">
                                                                <span className="text-2xl font-bold text-primary">
                                                                    {item.nilaiTotal.toFixed(1)}
                                                                </span>
                                                                <span className="text-xs text-muted-foreground">
                                                                    / {ujian?.nilaiMinimal || 0}
                                                                </span>
                                                            </div>
                                                        ) : (
                                                            <span className="text-muted-foreground">-</span>
                                                        )
                                                    ) : (
                                                        <Badge className="bg-gray-500/15 text-gray-600">
                                                            <Eye size={14} className="mr-1" />
                                                            Disembunyikan
                                                        </Badge>
                                                    )}
                                                </td>
                                                <td className="py-4 px-4 text-center">
                                                    {ujian?.tampilkanNilai ? (
                                                        getStatusBadge(isPassed)
                                                    ) : (
                                                        <Badge className="bg-gray-500/15 text-gray-600">
                                                            Disembunyikan
                                                        </Badge>
                                                    )}
                                                </td>
                                     
                                                <td className="py-4 px-4">
                                                    <div className="text-xs space-y-1">
                                                        {item.waktuSelesai ? (
                                                            <div>
                                                                {new Date(item.waktuSelesai).toLocaleString("id-ID", {
                                                                    day: "2-digit",
                                                                    month: "short",
                                                                    year: "numeric",
                                                                    hour: "2-digit",
                                                                    minute: "2-digit"
                                                                })}
                                                            </div>
                                                        ) : (
                                                            <span className="text-muted-foreground">-</span>
                                                        )}
                                                    </div>
                                                </td>
                                                <td className="py-4 px-4">
                                                    <div className="flex justify-end gap-1">
                                                        {ujian?.tampilkanNilai ? (
                                                            <Button
                                                                variant="ghost"
                                                                size="sm"
                                                                onClick={() => router.push(`/ujian-saya/hasil/${item.id}`)}
                                                            >
                                                                <Eye size={14} />
                                                                Lihat Detail
                                                            </Button>
                                                        ) : (
                                                            <Button
                                                                variant="ghost"
                                                                size="sm"
                                                                disabled
                                                            >
                                                                <Eye size={14} />
                                                                Disembunyikan
                                                            </Button>
                                                        )}
                                                    </div>
                                                </td>
                                            </tr>
                                        );
                                    })
                                )}
                            </tbody>
                        </table>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
