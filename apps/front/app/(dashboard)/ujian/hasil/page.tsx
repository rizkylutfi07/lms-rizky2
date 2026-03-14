"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { BarChart3, Eye, Download, FileText, EyeOff, Archive, Loader2 } from "lucide-react";

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

    const { data, isLoading } = useQuery({
        queryKey: ["ujian", "list", "selesai", page, search, tab],
        queryFn: async () => {
            const params = new URLSearchParams({
                page: page.toString(),
                limit: "10",
                status: "SELESAI",
            });
            if (search) params.append("search", search);
            if (tab === "arsip") params.append("isArchived", "true");

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

                    <input
                        type="text"
                        placeholder="Cari ujian..."
                        value={search}
                        onChange={(e) => {
                            setSearch(e.target.value);
                            setPage(1);
                        }}
                        className="w-full rounded-lg border border-border bg-background py-2 px-4 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                    />
                </CardHeader>

                <CardContent className="p-2 md:p-4">
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-border">
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kode</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Judul</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Mata Pelajaran</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kelas</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Peserta</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Tanggal Selesai</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Tampil</th>
                                    <th className="text-right py-3 px-4 text-sm font-semibold text-muted-foreground">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {isLoading ? (
                                    Array.from({ length: 3 }).map((_, i) => (
                                        <tr key={i}>
                                            <td colSpan={8} className="py-4">
                                                <div className="h-12 animate-pulse rounded bg-muted/50" />
                                            </td>
                                        </tr>
                                    ))
                                ) : data?.data?.length === 0 ? (
                                    <tr>
                                        <td colSpan={8} className="py-16 text-center">
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
                                                        onClick={() => router.push(`/penilaian?ujianId=${item.id}`)}
                                                    >
                                                        <Eye size={14} />
                                                        Lihat Nilai
                                                    </Button>
                                                    <Button
                                                        variant="ghost"
                                                        size="sm"
                                                        onClick={() => router.push(`/penilaian?ujianId=${item.id}`)}
                                                    >
                                                        <FileText size={14} />
                                                        Detail
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
