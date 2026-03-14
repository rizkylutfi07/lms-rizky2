"use client";
import { API_URL } from "@/lib/api";
import * as XLSX from "xlsx";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { BarChart3, Eye, Download, EyeOff, Archive, Loader2 } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Switch } from "@/components/ui/switch";
import { useRole } from "../../role-context";
import { useRouter } from "next/navigation";
import { useToast } from "@/hooks/use-toast";
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from "@/components/ui/alert-dialog";

export default function HasilUjianPage() {
    const { token } = useRole();
    const router = useRouter();
    const { toast } = useToast();
    const queryClient = useQueryClient();
    const [page, setPage] = useState(1);
    const [search, setSearch] = useState("");
    const [tab, setTab] = useState<"aktif" | "arsip">("aktif");
    const [deleteId, setDeleteId] = useState<string | null>(null);
    const [filterKelasId, setFilterKelasId] = useState("");
    const [filterJenisUjianId, setFilterJenisUjianId] = useState("");

    const { data: kelasList } = useQuery({
        queryKey: ["kelas", "list"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/kelas?limit=100`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    const { data: jenisUjianList } = useQuery({
        queryKey: ["jenis-ujian", "list"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/jenis-ujian`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    // Mutation untuk toggle tampilkan nilai
    const toggleNilaiMutation = useMutation({
        mutationFn: async ({ ujianId, enabled }: { ujianId: string; enabled: boolean }) => {
            const res = await fetch(`${API_URL}/ujian/${ujianId}/toggle-nilai`, {
                method: "POST",
                headers: {
                    Authorization: `Bearer ${token}`,
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ enabled }),
            });
            if (!res.ok) throw new Error("Gagal mengubah status tampilkan nilai");
            return res.json();
        },
        onSuccess: (data) => {
            queryClient.invalidateQueries({ queryKey: ["ujian", "list", "selesai"] });
            toast({
                title: "Berhasil",
                description: `Nilai siswa ${data.tampilkanNilai ? "ditampilkan" : "disembunyikan"}`,
            });
        },
        onError: () => {
            toast({
                title: "Error",
                description: "Gagal mengubah status tampilkan nilai",
                variant: "destructive",
            });
        },
    });

    // Mutation untuk arsip/hapus ujian (soft delete)
    const deleteMutation = useMutation({
        mutationFn: async (ujianId: string) => {
            const res = await fetch(`${API_URL}/ujian/${ujianId}`, {
                method: "DELETE",
                headers: {
                    Authorization: `Bearer ${token}`,
                },
            });
            if (!res.ok) throw new Error("Gagal mengarsipkan hasil ujian");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["ujian", "list", "selesai"] });
            toast({
                title: "Berhasil",
                description: "Hasil ujian berhasil diarsipkan",
            });
            setDeleteId(null);
        },
        onError: () => {
            toast({
                title: "Error",
                description: "Gagal mengarsipkan hasil ujian",
                variant: "destructive",
            });
            setDeleteId(null);
        },
    });

    const [downloadingId, setDownloadingId] = useState<string | null>(null);

    const downloadExcel = async (item: any) => {
        setDownloadingId(item.id);
        try {
            const res = await fetch(`${API_URL}/ujian-siswa/monitoring/${item.id}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Gagal mengambil data nilai");
            const monitoring: any[] = await res.json();

            const tanggalMulai = item.tanggalMulai
                ? new Date(item.tanggalMulai).toLocaleDateString("id-ID", { day: "2-digit", month: "short", year: "numeric" })
                : "-";
            const tanggalSelesai = item.tanggalSelesai
                ? new Date(item.tanggalSelesai).toLocaleDateString("id-ID", { day: "2-digit", month: "short", year: "numeric" })
                : "-";

            const rows = monitoring.map((s: any, i: number) => {
                const total = s.ujian?._count?.ujianSoal || 0;
                const answered = s.answeredCount ?? 0;
                const percent = total ? Math.round((answered / total) * 100) : 0;
                const statusLabel =
                    s.status === "SELESAI" ? "Selesai" :
                    s.status === "SEDANG_MENGERJAKAN" ? "Berlangsung" :
                    s.status === "DIBLOKIR" ? "Diblokir" : "Belum Mulai";
                return {
                    "No": i + 1,
                    "Nama": s.siswa?.nama ?? "-",
                    "NISN": s.siswa?.nisn ?? "-",
                    "Kelas": s.siswa?.kelas?.nama ?? "-",
                    "Tanggal Ujian": `${tanggalMulai} – ${tanggalSelesai}`,
                    "Status": statusLabel,
                    "Soal Dijawab": answered,
                    "Total Soal": total,
                    "Progres (%)": percent,
                    "PG Benar": s.pgBenar ?? 0,
                    "PG Salah": s.pgSalah ?? 0,
                    "Nilai": s.nilaiTotal !== null && s.nilaiTotal !== undefined ? parseFloat(s.nilaiTotal.toFixed(1)) : "-",
                    "Pelanggaran": s.violationCount ?? 0,
                };
            });

            const ws = XLSX.utils.json_to_sheet(rows);
            ws["!cols"] = [6, 30, 18, 20, 28, 14, 14, 12, 12, 12, 12, 12, 14].map((w) => ({ wch: w }));
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Nilai Peserta");
            const fileName = item.judul?.replace(/[^a-zA-Z0-9 ]/g, "").trim() || "Nilai";
            XLSX.writeFile(wb, `${fileName}.xlsx`);
        } catch (err: any) {
            toast({ title: "Error", description: err.message, variant: "destructive" });
        } finally {
            setDownloadingId(null);
        }
    };

    const { data, isLoading } = useQuery({
        queryKey: ["ujian", "list", "selesai", page, search, tab, filterKelasId, filterJenisUjianId],
        queryFn: async () => {
            const params = new URLSearchParams({
                page: page.toString(),
                limit: "10",
                status: "SELESAI",
            });
            if (search) params.append("search", search);
            if (tab === "arsip") params.append("isArchived", "true");
            if (filterKelasId) params.append("kelasId", filterKelasId);
            if (filterJenisUjianId) params.append("jenisUjianId", filterJenisUjianId);

            const res = await fetch(
                `${API_URL}/ujian?${params.toString()}`,
                { headers: { Authorization: `Bearer ${token}` } }
            );
            return res.json();
        },
    });

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div className="md:flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold flex items-center gap-2">
                                <BarChart3 className="h-8 w-8" />
                                Hasil Ujian
                            </h1>
                            <p className="text-sm text-muted-foreground">
                                Lihat dan kelola nilai ujian yang sudah selesai
                            </p>
                        </div>
                        <div className="flex gap-2">
                            <Button
                                variant={tab === "aktif" ? "default" : "outline"}
                                size="sm"
                                onClick={() => {
                                    setTab("aktif");
                                    setPage(1);
                                }}
                            >
                                Aktif
                            </Button>
                            <Button
                                variant={tab === "arsip" ? "default" : "outline"}
                                size="sm"
                                onClick={() => {
                                    setTab("arsip");
                                    setPage(1);
                                }}
                            >
                                Diarsipkan
                            </Button>
                        </div>
                    </div>

                    <div className="flex flex-col md:flex-row gap-2">
                        <input
                            type="text"
                            placeholder="Cari ujian..."
                            value={search}
                            onChange={(e) => {
                                setSearch(e.target.value);
                                setPage(1);
                            }}
                            className="flex-1 rounded-lg border border-border bg-background py-2 px-4 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        />
                        <select
                            value={filterKelasId}
                            onChange={(e) => { setFilterKelasId(e.target.value); setPage(1); }}
                            className="rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        >
                            <option value="">Semua Kelas</option>
                            {(kelasList?.data ?? kelasList ?? []).map((k: any) => (
                                <option key={k.id} value={k.id}>{k.nama}</option>
                            ))}
                        </select>
                        <select
                            value={filterJenisUjianId}
                            onChange={(e) => { setFilterJenisUjianId(e.target.value); setPage(1); }}
                            className="rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        >
                            <option value="">Semua Jenis Ujian</option>
                            {(jenisUjianList?.data ?? jenisUjianList ?? []).map((j: any) => (
                                <option key={j.id} value={j.id}>{j.nama}</option>
                            ))}
                        </select>
                    </div>
                </CardHeader>

                <CardContent className="p-2 md:p-4">
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-border">
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kode</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Judul</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Jenis Ujian</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Mata Pelajaran</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kelas</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Peserta</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Tanggal Selesai</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Tampil Nilai</th>
                                    <th className="text-right py-3 px-4 text-sm font-semibold text-muted-foreground">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {isLoading ? (
                                    Array.from({ length: 3 }).map((_, i) => (
                                        <tr key={i}>
                                            <td colSpan={9} className="py-4">
                                                <div className="h-12 animate-pulse rounded bg-muted/50" />
                                            </td>
                                        </tr>
                                    ))
                                ) : data?.data?.length === 0 ? (
                                    <tr>
                                        <td colSpan={9} className="py-16 text-center">
                                            <div className="flex flex-col items-center gap-2 text-muted-foreground">
                                                <BarChart3 size={48} className="opacity-30" />
                                                <p className="font-medium">Belum ada ujian yang selesai</p>
                                                <p className="text-sm">Hasil ujian akan muncul di sini setelah ujian berakhir</p>
                                            </div>
                                        </td>
                                    </tr>
                                ) : (
                                    data?.data?.map((item: any) => (
                                        <tr key={item.id} className="border-b border-border hover:bg-muted/30 transition">
                                            <td className="py-4 px-4">
                                                <Badge className="border border-border bg-transparent text-muted-foreground font-mono">
                                                    {item.kode}
                                                </Badge>
                                            </td>
                                            <td className="py-4 px-4">
                                                <p className="font-medium">{item.judul}</p>
                                            </td>
                                            <td className="py-4 px-4">
                                                {item.jenisUjian ? (
                                                    <Badge className="bg-purple-500/15 text-purple-600">
                                                        {item.jenisUjian.nama}
                                                    </Badge>
                                                ) : (
                                                    <span className="text-muted-foreground">-</span>
                                                )}
                                            </td>
                                            <td className="py-4 px-4">
                                                {item.mataPelajaran ? (
                                                    <Badge className="bg-indigo-500/15 text-indigo-500">
                                                        {item.mataPelajaran.nama}
                                                    </Badge>
                                                ) : (
                                                    <span className="text-muted-foreground">-</span>
                                                )}
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex flex-wrap gap-1">
                                                    {item.ujianKelas?.length > 0 ? (
                                                        item.ujianKelas.map((uk: any) => (
                                                            <Badge key={uk.id} className="bg-emerald-500/15 text-emerald-500">
                                                                {uk.kelas?.nama}
                                                            </Badge>
                                                        ))
                                                    ) : item.kelas ? (
                                                        <Badge className="bg-emerald-500/15 text-emerald-500">
                                                            {item.kelas.nama}
                                                        </Badge>
                                                    ) : (
                                                        <span className="text-muted-foreground">-</span>
                                                    )}
                                                </div>
                                            </td>
                                            <td className="py-4 px-4 text-center">
                                                <div className="flex flex-col items-center gap-0.5">
                                                    <span className="text-sm font-medium">{item._count?.ujianSiswa || 0}</span>
                                                    <span className="text-xs text-muted-foreground">siswa</span>
                                                </div>
                                            </td>
                                            <td className="py-4 px-4">
                                                <span className="text-sm">
                                                    {new Date(item.tanggalSelesai).toLocaleString("id-ID", {
                                                        day: "2-digit",
                                                        month: "short",
                                                        year: "numeric"
                                                    })}
                                                </span>
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex items-center justify-center gap-2">
                                                    <Switch
                                                        checked={item.tampilkanNilai ?? false}
                                                        onCheckedChange={(checked) => 
                                                            toggleNilaiMutation.mutate({ ujianId: item.id, enabled: checked })
                                                        }
                                                        disabled={toggleNilaiMutation.isPending}
                                                    />
                                                    {item.tampilkanNilai ? (
                                                        <Eye size={16} className="text-blue-600" />
                                                    ) : (
                                                        <EyeOff size={16} className="text-gray-400" />
                                                    )}
                                                </div>
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex justify-end gap-1">
                                                    <Button
                                                        variant="ghost"
                                                        size="sm"
                                                        onClick={() => downloadExcel(item)}
                                                        disabled={downloadingId === item.id}
                                                    >
                                                        {downloadingId === item.id ? (
                                                            <Loader2 size={14} className="animate-spin" />
                                                        ) : (
                                                            <Download size={14} />
                                                        )}
                                                        Excel
                                                    </Button>
                                                    <Button
                                                        variant="ghost"
                                                        size="sm"
                                                        onClick={() => router.push(`/penilaian?ujianId=${item.id}`)}
                                                    >
                                                        <Eye size={14} />
                                                        Lihat Nilai
                                                    </Button>
                                                    {tab === "aktif" && (
                                                        <Button
                                                            variant="ghost"
                                                            size="sm"
                                                            className="text-red-500 hover:text-red-600 hover:bg-red-50"
                                                            onClick={() => setDeleteId(item.id)}
                                                        >
                                                            <Archive size={14} />
                                                            Arsip
                                                        </Button>
                                                    )}
                                                </div>
                                            </td>
                                        </tr>
                                    ))
                                )}
                            </tbody>
                        </table>
                    </div>

                    {!isLoading && data?.meta && data.meta.totalPages > 1 && (
                        <div className="flex items-center justify-between mt-4 pt-4 border-t">
                            <div className="text-sm text-muted-foreground">
                                Halaman {page} dari {data.meta.totalPages}
                            </div>
                            <div className="flex gap-2">
                                <Button
                                    className="border border-border bg-transparent text-muted-foreground"
                                    size="sm"
                                    onClick={() => setPage((p) => Math.max(1, p - 1))}
                                    disabled={page === 1}
                                >
                                    Sebelumnya
                                </Button>
                                <Button
                                    className="border border-border bg-transparent text-muted-foreground"
                                    size="sm"
                                    onClick={() =>
                                        setPage((p) => Math.min(data.meta.totalPages, p + 1))
                                    }
                                    disabled={page === data.meta.totalPages}
                                >
                                    Selanjutnya
                                </Button>
                            </div>
                        </div>
                    )}
                </CardContent>
            </Card>

            <AlertDialog open={!!deleteId} onOpenChange={(open) => !open && setDeleteId(null)}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>Arsipkan Hasil Ujian?</AlertDialogTitle>
                        <AlertDialogDescription>
                            Tindakan ini akan menyembunyikan hasil ujian dari daftar. Data nilai siswa tetap tersimpan namun ujian ini akan dianggap sebagai arsip.
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel disabled={deleteMutation.isPending}>Batal</AlertDialogCancel>
                        <AlertDialogAction
                            onClick={() => deleteId && deleteMutation.mutate(deleteId)}
                            disabled={deleteMutation.isPending}
                            className="bg-red-500 hover:bg-red-600 focus:ring-red-500"
                        >
                            {deleteMutation.isPending ? (
                                <>
                                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                    Mengarsipkan...
                                </>
                            ) : (
                                "Ya, Arsipkan"
                            )}
                        </AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>
        </div>
    );
}
