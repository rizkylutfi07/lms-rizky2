"use client";
import { API_URL } from "@/lib/api";

import { useState, useEffect } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import {
    Settings2, Pencil, Archive, Trash2, Eye, Plus,
    ArrowUpDown, ArrowUp, ArrowDown, X, Loader2, BarChart3,
} from "lucide-react";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogFooter,
} from "@/components/ui/dialog";
import { useRole } from "../role-context";
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

const STATUS_CONFIG: Record<string, { className: string; label: string }> = {
    DRAFT: { className: "bg-gray-500/15 text-gray-400", label: "Draft" },
    PUBLISHED: { className: "bg-blue-500/15 text-blue-600", label: "Siap Dimulai" },
    ONGOING: { className: "bg-green-500/15 text-green-600", label: "Berlangsung" },
    SELESAI: { className: "bg-purple-500/15 text-purple-600", label: "Selesai" },
    DIBATALKAN: { className: "bg-red-500/15 text-red-500", label: "Dibatalkan" },
};

export default function KelolaUjianPage() {
    const { token, role, user } = useRole();
    const { toast } = useToast();
    const router = useRouter();
    const queryClient = useQueryClient();

    const [page, setPage] = useState(1);
    const [search, setSearch] = useState("");
    const [tab, setTab] = useState<"aktif" | "arsip">("aktif");
    const [filterStatus, setFilterStatus] = useState("");
    const [filterKelasId, setFilterKelasId] = useState("");
    const [filterJenisUjianId, setFilterJenisUjianId] = useState("");
    const [filterDateFrom, setFilterDateFrom] = useState("");
    const [filterDateTo, setFilterDateTo] = useState("");
    const [sortBy, setSortBy] = useState("createdAt");
    const [sortOrder, setSortOrder] = useState<"asc" | "desc">("desc");
    const [confirmItem, setConfirmItem] = useState<{ id: string; judul: string; mode: "hapus" | "arsip" } | null>(null);
    const [editItem, setEditItem] = useState<any>(null);
    const [editForm, setEditForm] = useState({
        judul: "",
        deskripsi: "",
        tanggalMulai: "",
        tanggalSelesai: "",
        durasi: 60,
        nilaiMinimal: 0,
        acakSoal: false,
        tampilkanNilai: false,
    });

    useEffect(() => {
        if (editItem) {
            const toLocal = (iso: string) => {
                if (!iso) return "";
                const d = new Date(iso);
                const pad = (n: number) => n.toString().padStart(2, "0");
                return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}`;
            };
            setEditForm({
                judul: editItem.judul ?? "",
                deskripsi: editItem.deskripsi ?? "",
                tanggalMulai: toLocal(editItem.tanggalMulai),
                tanggalSelesai: toLocal(editItem.tanggalSelesai),
                durasi: editItem.durasi ?? 60,
                nilaiMinimal: editItem.nilaiMinimal ?? 0,
                acakSoal: editItem.acakSoal ?? false,
                tampilkanNilai: editItem.tampilkanNilai ?? false,
            });
        }
    }, [editItem]);

    const toggleSort = (col: string) => {
        if (sortBy === col) {
            setSortOrder((o) => (o === "desc" ? "asc" : "desc"));
        } else {
            setSortBy(col);
            setSortOrder("desc");
        }
        setPage(1);
    };

    const SortIcon = ({ col }: { col: string }) => {
        if (sortBy !== col) return <ArrowUpDown size={13} className="ml-1 opacity-40" />;
        return sortOrder === "asc"
            ? <ArrowUp size={13} className="ml-1 text-primary" />
            : <ArrowDown size={13} className="ml-1 text-primary" />;
    };

    const { data: kelasList } = useQuery({
        queryKey: ["kelas", "list-kelola", user?.guru?.id],
        queryFn: async () => {
            const params = new URLSearchParams({ limit: "100" });
            if (role === "GURU" && user?.guru?.id) params.append("guruId", user.guru.id);
            const res = await fetch(`${API_URL}/kelas?${params.toString()}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    const { data: jenisUjianList } = useQuery({
        queryKey: ["jenis-ujian-list-kelola"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/jenis-ujian`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    const { data, isLoading } = useQuery({
        queryKey: ["kelola-ujian", page, search, tab, filterStatus, filterKelasId, filterJenisUjianId, filterDateFrom, filterDateTo, sortBy, sortOrder],
        queryFn: async () => {
            const params = new URLSearchParams({
                page: page.toString(),
                limit: "15",
                sortBy,
                sortOrder,
            });
            if (search) params.append("search", search);
            if (tab === "arsip") params.append("isArchived", "true");
            if (filterStatus) params.append("status", filterStatus);
            if (filterKelasId) params.append("kelasId", filterKelasId);
            if (filterJenisUjianId) params.append("jenisUjianId", filterJenisUjianId);
            if (filterDateFrom) params.append("dateFrom", filterDateFrom);
            if (filterDateTo) params.append("dateTo", filterDateTo);

            const res = await fetch(`${API_URL}/ujian?${params.toString()}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    const editMutation = useMutation({
        mutationFn: async (payload: typeof editForm) => {
            const res = await fetch(`${API_URL}/ujian/${editItem?.id}`, {
                method: "PATCH",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`,
                },
                body: JSON.stringify({
                    ...payload,
                    durasi: Number(payload.durasi),
                    nilaiMinimal: Number(payload.nilaiMinimal),
                }),
            });
            if (!res.ok) throw new Error("Gagal menyimpan perubahan");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kelola-ujian"] });
            queryClient.invalidateQueries({ queryKey: ["ujian"] });
            toast({ title: "Berhasil", description: "Data ujian berhasil diperbarui" });
            setEditItem(null);
        },
        onError: () => {
            toast({ title: "Error", description: "Gagal menyimpan perubahan", variant: "destructive" });
        },
    });

    const deleteMutation = useMutation({
        mutationFn: async (id: string) => {
            const res = await fetch(`${API_URL}/ujian/${id}`, {
                method: "DELETE",
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Gagal memproses ujian");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kelola-ujian"] });
            queryClient.invalidateQueries({ queryKey: ["ujian"] });
            const mode = confirmItem?.mode ?? "hapus";
            toast({
                title: "Berhasil",
                description: mode === "arsip" ? "Ujian berhasil diarsipkan" : "Ujian berhasil dihapus",
            });
            setConfirmItem(null);
        },
        onError: () => {
            toast({ title: "Error", description: "Gagal memproses ujian", variant: "destructive" });
            setConfirmItem(null);
        },
    });

    const hasActiveFilter = search || filterStatus || filterKelasId || filterJenisUjianId || filterDateFrom || filterDateTo;

    const resetFilter = () => {
        setSearch(""); setFilterStatus(""); setFilterKelasId("");
        setFilterJenisUjianId(""); setFilterDateFrom(""); setFilterDateTo("");
        setPage(1);
    };

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div className="md:flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold flex items-center gap-2">
                                <Settings2 className="h-8 w-8" />
                                Kelola Ujian
                            </h1>
                            <p className="text-sm text-muted-foreground">
                                Lihat dan kelola semua data ujian dari rencana hingga selesai
                            </p>
                        </div>
                        <div className="flex gap-2 mt-4 md:mt-0">
                            <Button
                                variant={tab === "aktif" ? "default" : "outline"}
                                size="sm"
                                onClick={() => { setTab("aktif"); setPage(1); }}
                            >
                                Aktif
                            </Button>
                            <Button
                                variant={tab === "arsip" ? "default" : "outline"}
                                size="sm"
                                onClick={() => { setTab("arsip"); setPage(1); }}
                            >
                                Diarsipkan
                            </Button>
                            <Button onClick={() => router.push("/ujian/create")}>
                                <Plus size={16} />
                                Buat Ujian
                            </Button>
                        </div>
                    </div>

                    {/* Filter baris 1 */}
                    <div className="flex flex-col md:flex-row gap-2 mt-2">
                        <input
                            type="text"
                            placeholder="Cari judul atau kode ujian..."
                            value={search}
                            onChange={(e) => { setSearch(e.target.value); setPage(1); }}
                            className="flex-1 rounded-lg border border-border bg-background py-2 px-4 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        />
                        <select
                            value={filterStatus}
                            onChange={(e) => { setFilterStatus(e.target.value); setPage(1); }}
                            className="rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        >
                            <option value="">Semua Status</option>
                            <option value="DRAFT">Draft</option>
                            <option value="PUBLISHED">Siap Dimulai</option>
                            <option value="ONGOING">Berlangsung</option>
                            <option value="SELESAI">Selesai</option>
                            <option value="DIBATALKAN">Dibatalkan</option>
                        </select>
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
                            <option value="">Semua Jenis</option>
                            {(jenisUjianList?.data ?? jenisUjianList ?? []).map((j: any) => (
                                <option key={j.id} value={j.id}>{j.nama}</option>
                            ))}
                        </select>
                    </div>

                    {/* Filter baris 2: tanggal + reset */}
                    <div className="flex flex-col md:flex-row gap-2 items-center">
                        <span className="text-xs text-muted-foreground whitespace-nowrap">Tanggal selesai:</span>
                        <div className="flex items-center gap-1">
                            <input
                                type="date"
                                value={filterDateFrom}
                                onChange={(e) => { setFilterDateFrom(e.target.value); setPage(1); }}
                                className="rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                            />
                            <span className="text-xs text-muted-foreground">–</span>
                            <input
                                type="date"
                                value={filterDateTo}
                                min={filterDateFrom || undefined}
                                onChange={(e) => { setFilterDateTo(e.target.value); setPage(1); }}
                                className="rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                            />
                        </div>
                        {hasActiveFilter && (
                            <button
                                onClick={resetFilter}
                                className="flex items-center gap-1 text-xs text-muted-foreground hover:text-foreground rounded-md px-2 py-1.5 hover:bg-muted transition"
                            >
                                <X size={13} /> Reset Filter
                            </button>
                        )}
                    </div>
                </CardHeader>

                <CardContent className="p-2 md:p-4">
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-border">
                                    <th className="text-left py-3 px-3 text-sm font-semibold text-muted-foreground">Kode</th>
                                    <th
                                        className="text-left py-3 px-3 text-sm font-semibold text-muted-foreground cursor-pointer select-none hover:text-foreground transition"
                                        onClick={() => toggleSort("judul")}
                                    >
                                        <span className="inline-flex items-center">Judul<SortIcon col="judul" /></span>
                                    </th>
                                    <th className="text-left py-3 px-3 text-sm font-semibold text-muted-foreground">Jenis</th>
                                    <th className="text-left py-3 px-3 text-sm font-semibold text-muted-foreground">Mata Pelajaran</th>
                                    <th className="text-left py-3 px-3 text-sm font-semibold text-muted-foreground">Kelas</th>
                                    <th className="text-center py-3 px-3 text-sm font-semibold text-muted-foreground">Durasi</th>
                                    <th className="text-center py-3 px-3 text-sm font-semibold text-muted-foreground">Peserta</th>
                                    <th
                                        className="text-left py-3 px-3 text-sm font-semibold text-muted-foreground cursor-pointer select-none hover:text-foreground transition"
                                        onClick={() => toggleSort("tanggalMulai")}
                                    >
                                        <span className="inline-flex items-center">Jadwal<SortIcon col="tanggalMulai" /></span>
                                    </th>
                                    <th className="text-center py-3 px-3 text-sm font-semibold text-muted-foreground">Status</th>
                                    <th className="text-right py-3 px-3 text-sm font-semibold text-muted-foreground">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {isLoading ? (
                                    Array.from({ length: 5 }).map((_, i) => (
                                        <tr key={i}>
                                            <td colSpan={10} className="py-4">
                                                <div className="h-12 animate-pulse rounded bg-muted/50" />
                                            </td>
                                        </tr>
                                    ))
                                ) : !data?.data?.length ? (
                                    <tr>
                                        <td colSpan={10} className="py-16 text-center">
                                            <div className="flex flex-col items-center gap-2 text-muted-foreground">
                                                <Settings2 size={48} className="opacity-30" />
                                                <p className="font-medium">Tidak ada data ujian</p>
                                                <p className="text-sm">Coba ubah filter atau buat ujian baru</p>
                                            </div>
                                        </td>
                                    </tr>
                                ) : (
                                    data.data.map((item: any) => {
                                        const statusCfg = STATUS_CONFIG[item.status] ?? STATUS_CONFIG.DRAFT;
                                        return (
                                            <tr key={item.id} className="border-b border-border hover:bg-muted/30 transition">
                                                <td className="py-3 px-3">
                                                    <Badge className="border border-border bg-transparent text-muted-foreground font-mono text-xs">
                                                        {item.kode}
                                                    </Badge>
                                                </td>
                                                <td className="py-3 px-3 max-w-[180px]">
                                                    <p className="font-medium text-sm leading-snug">{item.judul}</p>
                                                    {item.deskripsi && (
                                                        <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">{item.deskripsi}</p>
                                                    )}
                                                </td>
                                                <td className="py-3 px-3">
                                                    {item.jenisUjian
                                                        ? <Badge className="bg-amber-500/15 text-amber-600 text-xs">{item.jenisUjian.nama}</Badge>
                                                        : <span className="text-muted-foreground text-sm">-</span>}
                                                </td>
                                                <td className="py-3 px-3">
                                                    {item.mataPelajaran
                                                        ? <Badge className="bg-indigo-500/15 text-indigo-500 text-xs">{item.mataPelajaran.nama}</Badge>
                                                        : <span className="text-muted-foreground text-sm">-</span>}
                                                </td>
                                                <td className="py-3 px-3">
                                                    <div className="flex flex-wrap gap-1">
                                                        {item.ujianKelas?.length > 0 ? (
                                                            item.ujianKelas.map((uk: any) => (
                                                                <Badge key={uk.id} className="bg-emerald-500/15 text-emerald-600 text-xs">
                                                                    {uk.kelas?.nama}
                                                                </Badge>
                                                            ))
                                                        ) : item.kelas ? (
                                                            <Badge className="bg-emerald-500/15 text-emerald-600 text-xs">{item.kelas.nama}</Badge>
                                                        ) : (
                                                            <span className="text-muted-foreground text-sm">-</span>
                                                        )}
                                                    </div>
                                                </td>
                                                <td className="py-3 px-3 text-center text-sm">{item.durasi} mnt</td>
                                                <td className="py-3 px-3 text-center">
                                                    <div className="flex flex-col items-center">
                                                        <span className="text-sm font-medium">{item._count?.ujianSiswa ?? 0}</span>
                                                        <span className="text-xs text-muted-foreground">siswa</span>
                                                    </div>
                                                </td>
                                                <td className="py-3 px-3">
                                                    <div className="text-xs space-y-0.5">
                                                        <div>
                                                            <span className="text-muted-foreground">Mulai: </span>
                                                            {new Date(item.tanggalMulai).toLocaleString("id-ID", {
                                                                day: "2-digit", month: "short", year: "numeric",
                                                                hour: "2-digit", minute: "2-digit",
                                                            })}
                                                        </div>
                                                        <div>
                                                            <span className="text-muted-foreground">Selesai: </span>
                                                            {new Date(item.tanggalSelesai).toLocaleString("id-ID", {
                                                                day: "2-digit", month: "short", year: "numeric",
                                                                hour: "2-digit", minute: "2-digit",
                                                            })}
                                                        </div>
                                                    </div>
                                                </td>
                                                <td className="py-3 px-3 text-center">
                                                    <Badge className={statusCfg.className}>{statusCfg.label}</Badge>
                                                </td>
                                                <td className="py-3 px-3">
                                                    <div className="flex justify-end gap-1 flex-wrap">
                                                        {item.status === "SELESAI" && (
                                                            <Button variant="ghost" size="sm"
                                                                onClick={() => router.push(`/penilaian?ujianId=${item.id}`)}>
                                                                <BarChart3 size={14} /> Nilai
                                                            </Button>
                                                        )}
                                                        {(item.status === "ONGOING" || item.status === "PUBLISHED") && (
                                                            <Button variant="ghost" size="sm"
                                                                onClick={() => router.push(`/ujian/berlangsung`)}>
                                                                <Eye size={14} /> Monitor
                                                            </Button>
                                                        )}
                                                        {item.status !== "DIBATALKAN" && (
                                                            <Button variant="ghost" size="sm"
                                                                onClick={() => setEditItem(item)}>
                                                                <Pencil size={14} /> Edit
                                                            </Button>
                                                        )}
                                                        {tab === "aktif" && (
                                                            <Button
                                                                variant="ghost"
                                                                size="sm"
                                                                className="text-red-500 hover:text-red-600 hover:bg-red-50"
                                                                onClick={() => setConfirmItem({
                                                                    id: item.id,
                                                                    judul: item.judul,
                                                                    mode: item.status === "SELESAI" ? "arsip" : "hapus",
                                                                })}
                                                            >
                                                                {item.status === "SELESAI"
                                                                    ? <><Archive size={14} /> Arsip</>
                                                                    : <><Trash2 size={14} /> Hapus</>}
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

                    {!isLoading && data?.meta && data.meta.totalPages > 1 && (
                        <div className="flex items-center justify-between mt-4 pt-4 border-t">
                            <div className="text-sm text-muted-foreground">
                                Halaman {page} dari {data.meta.totalPages} · Total {data.meta.total} ujian
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
                                    onClick={() => setPage((p) => Math.min(data.meta.totalPages, p + 1))}
                                    disabled={page === data.meta.totalPages}
                                >
                                    Selanjutnya
                                </Button>
                            </div>
                        </div>
                    )}
                </CardContent>
            </Card>

            <Dialog open={!!editItem} onOpenChange={(open) => !open && setEditItem(null)}>
                <DialogContent className="max-w-lg max-h-[90vh] overflow-y-auto">
                    <DialogHeader>
                        <DialogTitle>Edit Ujian</DialogTitle>
                    </DialogHeader>
                    <div className="space-y-4 py-2">
                        <div className="space-y-1.5">
                            <label className="text-sm font-medium">Judul</label>
                            <input
                                type="text"
                                value={editForm.judul}
                                onChange={(e) => setEditForm((f) => ({ ...f, judul: e.target.value }))}
                                className="w-full rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                            />
                        </div>
                        <div className="space-y-1.5">
                            <label className="text-sm font-medium">Deskripsi</label>
                            <textarea
                                value={editForm.deskripsi}
                                onChange={(e) => setEditForm((f) => ({ ...f, deskripsi: e.target.value }))}
                                rows={3}
                                className="w-full rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20 resize-none"
                            />
                        </div>
                        <div className="grid grid-cols-2 gap-3">
                            <div className="space-y-1.5">
                                <label className="text-sm font-medium">Tanggal Mulai</label>
                                <input
                                    type="datetime-local"
                                    value={editForm.tanggalMulai}
                                    onChange={(e) => setEditForm((f) => ({ ...f, tanggalMulai: e.target.value }))}
                                    className="w-full rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                />
                            </div>
                            <div className="space-y-1.5">
                                <label className="text-sm font-medium">Tanggal Selesai</label>
                                <input
                                    type="datetime-local"
                                    value={editForm.tanggalSelesai}
                                    min={editForm.tanggalMulai || undefined}
                                    onChange={(e) => setEditForm((f) => ({ ...f, tanggalSelesai: e.target.value }))}
                                    className="w-full rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                />
                            </div>
                        </div>
                        <div className="grid grid-cols-2 gap-3">
                            <div className="space-y-1.5">
                                <label className="text-sm font-medium">Durasi (menit)</label>
                                <input
                                    type="number"
                                    min={1}
                                    value={editForm.durasi}
                                    onChange={(e) => setEditForm((f) => ({ ...f, durasi: Number(e.target.value) }))}
                                    className="w-full rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                />
                            </div>
                            <div className="space-y-1.5">
                                <label className="text-sm font-medium">Nilai Minimal</label>
                                <input
                                    type="number"
                                    min={0}
                                    max={100}
                                    value={editForm.nilaiMinimal}
                                    onChange={(e) => setEditForm((f) => ({ ...f, nilaiMinimal: Number(e.target.value) }))}
                                    className="w-full rounded-lg border border-border bg-background py-2 px-3 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                />
                            </div>
                        </div>
                        <div className="flex gap-6">
                            <label className="flex items-center gap-2 text-sm cursor-pointer">
                                <input
                                    type="checkbox"
                                    checked={editForm.acakSoal}
                                    onChange={(e) => setEditForm((f) => ({ ...f, acakSoal: e.target.checked }))}
                                    className="rounded"
                                />
                                Acak Soal
                            </label>
                            <label className="flex items-center gap-2 text-sm cursor-pointer">
                                <input
                                    type="checkbox"
                                    checked={editForm.tampilkanNilai}
                                    onChange={(e) => setEditForm((f) => ({ ...f, tampilkanNilai: e.target.checked }))}
                                    className="rounded"
                                />
                                Tampilkan Nilai ke Siswa
                            </label>
                        </div>
                    </div>
                    <DialogFooter className="gap-2">
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => { setEditItem(null); router.push(`/ujian/edit/${editItem?.id}`); }}
                        >
                            Edit Lengkap
                        </Button>
                        <Button
                            size="sm"
                            onClick={() => editMutation.mutate(editForm)}
                            disabled={editMutation.isPending || !editForm.judul.trim()}
                        >
                            {editMutation.isPending
                                ? <><Loader2 className="mr-2 h-4 w-4 animate-spin" /> Menyimpan...</>
                                : "Simpan"}
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>

            <AlertDialog open={!!confirmItem} onOpenChange={(open) => !open && setConfirmItem(null)}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>
                            {confirmItem?.mode === "arsip" ? "Arsipkan Ujian?" : "Hapus Ujian?"}
                        </AlertDialogTitle>
                        <AlertDialogDescription>
                            {confirmItem?.mode === "arsip" ? (
                                <>Ujian <strong>{confirmItem?.judul}</strong> akan dipindahkan ke arsip. Data nilai siswa tetap tersimpan.</>
                            ) : (
                                <>Ujian <strong>{confirmItem?.judul}</strong> akan dihapus. Tindakan ini tidak dapat dibatalkan.</>
                            )}
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel disabled={deleteMutation.isPending}>Batal</AlertDialogCancel>
                        <AlertDialogAction
                            onClick={() => confirmItem && deleteMutation.mutate(confirmItem.id)}
                            disabled={deleteMutation.isPending}
                            className="bg-red-500 hover:bg-red-600"
                        >
                            {deleteMutation.isPending
                                ? <><Loader2 className="mr-2 h-4 w-4 animate-spin" /> Memproses...</>
                                : confirmItem?.mode === "arsip" ? "Ya, Arsipkan" : "Ya, Hapus"}
                        </AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>
        </div>
    );
}

