"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { Loader2, Pencil, Trash2, Eye, Settings } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import {
    AlertDialog,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from "@/components/ui/alert-dialog";
import { Badge } from "@/components/ui/badge";
import { useRole } from "../role-context";
import { useRouter } from "next/navigation";
import { useToast } from "@/hooks/use-toast";

export default function KelolaUjianPage() {
    const { token } = useRole();
    const { toast } = useToast();
    const router = useRouter();
    const queryClient = useQueryClient();
    const [page, setPage] = useState(1);
    const [search, setSearch] = useState("");
    const [filterStatus, setFilterStatus] = useState("");
    const [filterJenisUjianId, setFilterJenisUjianId] = useState("");
    const [deletingItem, setDeletingItem] = useState<any>(null);

    // Fetch jenis ujian for filter
    const { data: jenisUjianList } = useQuery({
        queryKey: ["jenis-ujian-list"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/jenis-ujian`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
    });

    const { data, isLoading } = useQuery({
        queryKey: ["kelola-ujian", "list", page, search, filterStatus, filterJenisUjianId],
        queryFn: async () => {
            const params = new URLSearchParams({
                page: page.toString(),
                limit: "10",
            });
            if (search) params.append("search", search);
            if (filterJenisUjianId) params.append("jenisUjianId", filterJenisUjianId);
            if (filterStatus) params.append("status", filterStatus);
            // Tidak ada filter status default - tampilkan semua

            const res = await fetch(
                `${API_URL}/ujian?${params.toString()}`,
                { headers: { Authorization: `Bearer ${token}` } }
            );
            return res.json();
        },
    });

    const deleteMutation = useMutation({
        mutationFn: async (id: string) => {
            const res = await fetch(`${API_URL}/ujian/${id}`, {
                method: "DELETE",
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Failed to delete");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kelola-ujian"] });
            setDeletingItem(null);
            toast({ title: "Berhasil!", description: "Ujian berhasil dihapus" });
        },
        onError: () => {
            toast({ title: "Error", description: "Gagal menghapus ujian", variant: "destructive" });
        }
    });

    const getStatusBadge = (status: string) => {
        const statusConfig: any = {
            DRAFT: { className: "bg-gray-500/15 text-gray-400", label: "Draft" },
            PUBLISHED: { className: "bg-blue-500/15 text-blue-500", label: "Siap Dimulai" },
            ONGOING: { className: "bg-green-500/15 text-green-500", label: "Sedang Berlangsung" },
            SELESAI: { className: "bg-purple-500/15 text-purple-500", label: "Selesai" },
            DIBATALKAN: { className: "bg-red-500/15 text-red-500", label: "Dibatalkan" },
        };
        const config = statusConfig[status] || statusConfig.DRAFT;
        return <Badge className={config.className}>{config.label}</Badge>;
    };

    const getJenisUjianLabel = (jenisUjian: any) => {
        if (!jenisUjian) return "-";
        return jenisUjian.nama;
    };

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div className="md:flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold flex items-center gap-2">
                                <Settings className="h-8 w-8" />
                                Kelola Ujian
                            </h1>
                            <p className="text-sm text-muted-foreground">
                                Kelola semua data ujian (edit & hapus)
                            </p>
                        </div>
                    </div>

                    <div className="space-y-2">
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

                        <div className="flex gap-2">
                            <select
                                value={filterJenisUjianId}
                                onChange={(e) => {
                                    setFilterJenisUjianId(e.target.value);
                                    setPage(1);
                                }}
                                className="flex-1 rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                            >
                                <option value="">Semua Jenis</option>
                                {jenisUjianList?.map((jenis: any) => (
                                    <option key={jenis.id} value={jenis.id}>
                                        {jenis.nama}
                                    </option>
                                ))}
                            </select>

                            <select
                                value={filterStatus}
                                onChange={(e) => {
                                    setFilterStatus(e.target.value);
                                    setPage(1);
                                }}
                                className="flex-1 rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                            >
                                <option value="">Semua Status</option>
                                <option value="DRAFT">Draft</option>
                                <option value="PUBLISHED">Siap Dimulai</option>
                                <option value="ONGOING">Sedang Berlangsung</option>
                                <option value="SELESAI">Selesai</option>
                                <option value="DIBATALKAN">Dibatalkan</option>
                            </select>
                        </div>
                    </div>
                </CardHeader>

                <CardContent className="p-2 md:p-4">
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-border">
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kode</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Judul</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Jenis</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Mata Pelajaran</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kelas</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Peserta</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Jadwal</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Status</th>
                                    <th className="text-right py-3 px-4 text-sm font-semibold text-muted-foreground">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {isLoading ? (
                                    Array.from({ length: 5 }).map((_, i) => (
                                        <tr key={i}>
                                            <td colSpan={9} className="py-4">
                                                <div className="h-12 animate-pulse rounded bg-muted/50" />
                                            </td>
                                        </tr>
                                    ))
                                ) : data?.data?.length === 0 ? (
                                    <tr>
                                        <td colSpan={9} className="py-8 text-center text-muted-foreground">
                                            Data tidak ditemukan
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
                                                <div>
                                                    <p className="font-medium">{item.judul}</p>
                                                    {item.deskripsi && (
                                                        <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">
                                                            {item.deskripsi}
                                                        </p>
                                                    )}
                                                </div>
                                            </td>
                                            <td className="py-4 px-4">
                                                {item.jenisUjian ? (
                                                    <Badge className="bg-amber-500/15 text-amber-600 text-xs">
                                                        {getJenisUjianLabel(item.jenisUjian)}
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
                                                <div className="text-xs space-y-1">
                                                    <div className="flex items-center gap-1">
                                                        <span className="text-muted-foreground">Mulai:</span>
                                                        <span>{new Date(item.tanggalMulai).toLocaleString("id-ID", {
                                                            day: "2-digit",
                                                            month: "short",
                                                            year: "numeric",
                                                            hour: "2-digit",
                                                            minute: "2-digit"
                                                        })}</span>
                                                    </div>
                                                    <div className="flex items-center gap-1">
                                                        <span className="text-muted-foreground">Selesai:</span>
                                                        <span>{new Date(item.tanggalSelesai).toLocaleString("id-ID", {
                                                            day: "2-digit",
                                                            month: "short",
                                                            year: "numeric",
                                                            hour: "2-digit",
                                                            minute: "2-digit"
                                                        })}</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td className="py-4 px-4 text-center">
                                                {getStatusBadge(item.status)}
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex justify-end gap-1">
                                                    {/* Lihat Detail */}
                                                    <Button
                                                        variant="ghost"
                                                        size="sm"
                                                        onClick={() => router.push(`/ujian/monitoring/${item.id}`)}
                                                        title="Lihat Detail"
                                                    >
                                                        <Eye size={14} />
                                                    </Button>
                                                    
                                                    {/* Edit - hanya jika belum selesai */}
                                                    {item.status !== "SELESAI" && (
                                                        <Button
                                                            variant="ghost"
                                                            size="sm"
                                                            onClick={() => router.push(`/ujian/edit/${item.id}`)}
                                                            title="Edit"
                                                        >
                                                            <Pencil size={14} />
                                                        </Button>
                                                    )}
                                                    
                                                    {/* Hapus - admin bisa hapus apapun kecuali yang sedang berlangsung */}
                                                    {item.status !== "ONGOING" && (
                                                        <Button
                                                            variant="ghost"
                                                            size="sm"
                                                            onClick={() => setDeletingItem(item)}
                                                            className="text-destructive"
                                                            title="Hapus"
                                                        >
                                                            <Trash2 size={14} />
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

                    {!isLoading && data?.meta && (
                        <div className="flex items-center justify-between mt-4 pt-4 border-t">
                            <div className="text-sm text-muted-foreground">
                                Halaman {page} dari {data.meta.totalPages} • Total {data.meta.total} ujian
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

            {deletingItem && (
                <DeleteModal
                    item={deletingItem}
                    onClose={() => setDeletingItem(null)}
                    onConfirm={() => deleteMutation.mutate(deletingItem.id)}
                    isLoading={deleteMutation.isPending}
                />
            )}
        </div>
    );
}

function DeleteModal({ item, onClose, onConfirm, isLoading }: any) {
    return (
        <AlertDialog open={true} onOpenChange={(open) => !open && onClose()}>
            <AlertDialogContent>
                <AlertDialogHeader>
                    <AlertDialogTitle>Konfirmasi Hapus</AlertDialogTitle>
                    <AlertDialogDescription>
                        Apakah Anda yakin ingin menghapus ujian <strong>{item.judul}</strong>?
                        <br />
                        <span className="text-xs text-muted-foreground mt-2 block">
                            Data ujian dan hasil siswa akan dihapus secara permanen.
                        </span>
                    </AlertDialogDescription>
                </AlertDialogHeader>
                <AlertDialogFooter>
                    <AlertDialogCancel onClick={onClose}>Batal</AlertDialogCancel>
                    <Button variant="destructive" onClick={onConfirm} disabled={isLoading}>
                        {isLoading ? <Loader2 className="animate-spin" size={16} /> : "Hapus"}
                    </Button>
                </AlertDialogFooter>
            </AlertDialogContent>
        </AlertDialog>
    );
}
