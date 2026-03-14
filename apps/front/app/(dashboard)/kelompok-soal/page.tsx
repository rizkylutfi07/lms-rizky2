"use client";
import { API_URL } from "@/lib/api";
import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { Loader2, Pencil, Trash2, Plus, BookText, FileText, ChevronDown, ChevronUp } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog";
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
import { useToast } from "@/hooks/use-toast";
import dynamic from "next/dynamic";

const RichTextEditor = dynamic(() => import("@/components/ui/rich-text-editor"), { ssr: false });

export default function KelompokSoalPage() {
    const { token, role } = useRole();
    const { toast } = useToast();
    const queryClient = useQueryClient();
    const [page, setPage] = useState(1);
    const [search, setSearch] = useState("");
    const [filterMapel, setFilterMapel] = useState("");
    const [isCreateOpen, setIsCreateOpen] = useState(false);
    const [editingItem, setEditingItem] = useState<any>(null);
    const [deletingItem, setDeletingItem] = useState<any>(null);
    const [expandedId, setExpandedId] = useState<string | null>(null);

    const { data, isLoading } = useQuery({
        queryKey: ["kelompok-soal", page, search, filterMapel],
        queryFn: async () => {
            const params = new URLSearchParams({ page: page.toString(), limit: "10" });
            if (search) params.append("search", search);
            if (filterMapel) params.append("mataPelajaranId", filterMapel);
            const res = await fetch(`${API_URL}/kelompok-soal?${params}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
    });

    const { data: mapelList } = useQuery({
        queryKey: ["mata-pelajaran-list-ks"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/mata-pelajaran?limit=100`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
    });

    const createMutation = useMutation({
        mutationFn: async (data: any) => {
            const res = await fetch(`${API_URL}/kelompok-soal`, {
                method: "POST",
                headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
                body: JSON.stringify(data),
            });
            if (!res.ok) {
                const err = await res.json().catch(() => ({}));
                throw new Error(err.message || "Gagal menyimpan");
            }
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kelompok-soal"] });
            queryClient.invalidateQueries({ queryKey: ["kelompok-soal-list-modal"] });
            setIsCreateOpen(false);
            toast({ title: "Berhasil", description: "Kelompok soal berhasil dibuat" });
        },
        onError: (e: any) => toast({ title: "Error", description: e.message, variant: "destructive" }),
    });

    const updateMutation = useMutation({
        mutationFn: async ({ id, data }: any) => {
            const res = await fetch(`${API_URL}/kelompok-soal/${id}`, {
                method: "PATCH",
                headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
                body: JSON.stringify(data),
            });
            if (!res.ok) {
                const err = await res.json().catch(() => ({}));
                throw new Error(err.message || "Gagal menyimpan");
            }
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kelompok-soal"] });
            queryClient.invalidateQueries({ queryKey: ["kelompok-soal-list-modal"] });
            setEditingItem(null);
            toast({ title: "Berhasil", description: "Kelompok soal berhasil diperbarui" });
        },
        onError: (e: any) => toast({ title: "Error", description: e.message, variant: "destructive" }),
    });

    const deleteMutation = useMutation({
        mutationFn: async (id: string) => {
            const res = await fetch(`${API_URL}/kelompok-soal/${id}`, {
                method: "DELETE",
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Gagal menghapus");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kelompok-soal"] });
            queryClient.invalidateQueries({ queryKey: ["kelompok-soal-list-modal"] });
            setDeletingItem(null);
            toast({ title: "Berhasil", description: "Kelompok soal berhasil dihapus" });
        },
        onError: () => toast({ title: "Error", description: "Gagal menghapus", variant: "destructive" }),
    });

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div className="md:flex items-center justify-between gap-4">
                        <div>
                            <h1 className="text-3xl font-bold flex items-center gap-2">
                                <BookText className="h-8 w-8" />
                                Kelompok Soal (Wacana)
                            </h1>
                            <p className="text-sm text-muted-foreground">
                                Buat naskah/wacana referensi yang dapat digunakan bersama oleh beberapa soal
                            </p>
                        </div>
                        <Button onClick={() => setIsCreateOpen(true)} className="mt-4 md:mt-0 shrink-0">
                            <Plus size={16} />
                            Tambah Kelompok
                        </Button>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-2 mt-2">
                        <input
                            type="text"
                            placeholder="Cari judul atau isi wacana..."
                            value={search}
                            onChange={(e) => { setSearch(e.target.value); setPage(1); }}
                            className="rounded-lg border border-border bg-background py-2 px-4 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        />
                        <select
                            value={filterMapel}
                            onChange={(e) => { setFilterMapel(e.target.value); setPage(1); }}
                            className="rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        >
                            <option value="">Semua Mata Pelajaran</option>
                            {mapelList?.data?.map((mp: any) => (
                                <option key={mp.id} value={mp.id}>{mp.nama}</option>
                            ))}
                        </select>
                    </div>
                </CardHeader>

                <CardContent className="p-2 md:p-4 space-y-3">
                    {isLoading ? (
                        Array.from({ length: 4 }).map((_, i) => (
                            <div key={i} className="h-24 animate-pulse rounded-lg bg-muted/50" />
                        ))
                    ) : data?.data?.length === 0 ? (
                        <div className="py-12 text-center text-muted-foreground">
                            <BookText className="mx-auto mb-3 h-10 w-10 opacity-30" />
                            <p>Belum ada kelompok soal.</p>
                            <p className="text-xs mt-1">Buat kelompok soal untuk menyimpan wacana/naskah referensi.</p>
                        </div>
                    ) : (
                        data?.data?.map((item: any) => (
                            <Card key={item.id} className="overflow-hidden">
                                <div className="p-4">
                                    <div className="flex items-start justify-between gap-3">
                                        <div className="flex-1 min-w-0">
                                            <div className="flex flex-wrap items-center gap-2 mb-1">
                                                <h3 className="font-semibold text-base">
                                                    {item.judul || <span className="text-muted-foreground italic">Tanpa judul</span>}
                                                </h3>
                                                {item.mataPelajaran && (
                                                    <Badge className="bg-secondary/20 text-secondary-foreground border-secondary/40">{item.mataPelajaran.nama}</Badge>
                                                )}
                                                <Badge className="bg-amber-500/15 text-amber-700 border-amber-200">
                                                    <FileText size={11} className="mr-1" />
                                                    {item._count?.bankSoal ?? 0} soal
                                                </Badge>
                                            </div>
                                            <div
                                                className={`text-sm text-muted-foreground prose prose-sm max-w-none dark:prose-invert [&_img]:max-h-16 [&_img]:w-auto [&_img]:inline-block transition-all ${expandedId === item.id ? "" : "line-clamp-2"}`}
                                                dangerouslySetInnerHTML={{ __html: item.wacana }}
                                            />
                                        </div>
                                        <div className="flex gap-1 shrink-0">
                                            <Button variant="ghost" size="icon" className="h-8 w-8"
                                                onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}>
                                                {expandedId === item.id ? <ChevronUp size={15} /> : <ChevronDown size={15} />}
                                            </Button>
                                            <Button variant="ghost" size="icon" className="h-8 w-8"
                                                onClick={() => setEditingItem(item)}>
                                                <Pencil size={15} />
                                            </Button>
                                            <Button variant="ghost" size="icon" className="h-8 w-8 text-destructive"
                                                onClick={() => setDeletingItem(item)}>
                                                <Trash2 size={15} />
                                            </Button>
                                        </div>
                                    </div>
                                </div>
                            </Card>
                        ))
                    )}

                    {!isLoading && data?.meta && data.meta.totalPages > 1 && (
                        <div className="flex items-center justify-between pt-4 border-t">
                            <span className="text-sm text-muted-foreground">
                                Halaman {page} dari {data.meta.totalPages}
                            </span>
                            <div className="flex gap-2">
                                <Button variant="outline" size="sm" onClick={() => setPage(p => Math.max(1, p - 1))} disabled={page === 1}>
                                    Sebelumnya
                                </Button>
                                <Button variant="outline" size="sm" onClick={() => setPage(p => Math.min(data.meta.totalPages, p + 1))} disabled={page === data.meta.totalPages}>
                                    Selanjutnya
                                </Button>
                            </div>
                        </div>
                    )}
                </CardContent>
            </Card>

            {(isCreateOpen || editingItem) && (
                <KelompokFormModal
                    item={editingItem}
                    token={token!}
                    mapelList={mapelList?.data ?? []}
                    onClose={() => { setIsCreateOpen(false); setEditingItem(null); }}
                    onSubmit={(data: any) => {
                        if (editingItem) {
                            updateMutation.mutate({ id: editingItem.id, data });
                        } else {
                            createMutation.mutate(data);
                        }
                    }}
                    isLoading={createMutation.isPending || updateMutation.isPending}
                />
            )}

            {deletingItem && (
                <AlertDialog open onOpenChange={(open) => !open && setDeletingItem(null)}>
                    <AlertDialogContent>
                        <AlertDialogHeader>
                            <AlertDialogTitle>Hapus Kelompok Soal?</AlertDialogTitle>
                            <AlertDialogDescription>
                                Kelompok <strong>{deletingItem.judul || "ini"}</strong> akan dihapus.
                                Soal-soal yang tergabung tidak akan dihapus, hanya relasi ke wacana ini yang dihapus.
                            </AlertDialogDescription>
                        </AlertDialogHeader>
                        <AlertDialogFooter>
                            <AlertDialogCancel disabled={deleteMutation.isPending}>Batal</AlertDialogCancel>
                            <Button variant="destructive" onClick={() => deleteMutation.mutate(deletingItem.id)} disabled={deleteMutation.isPending}>
                                {deleteMutation.isPending ? <Loader2 size={14} className="animate-spin" /> : "Ya, Hapus"}
                            </Button>
                        </AlertDialogFooter>
                    </AlertDialogContent>
                </AlertDialog>
            )}
        </div>
    );
}

function KelompokFormModal({ item, token, mapelList, onClose, onSubmit, isLoading }: any) {
    const [judul, setJudul] = useState(item?.judul ?? "");
    const [wacana, setWacana] = useState(item?.wacana ?? "");
    const [mataPelajaranId, setMataPelajaranId] = useState(item?.mataPelajaranId ?? "");
    const { toast } = useToast();

    const isEmptyHtml = (html: string) => !html || html.replace(/<[^>]+>/g, "").trim() === "";

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        if (isEmptyHtml(wacana)) {
            toast({ title: "Perhatian", description: "Isi wacana tidak boleh kosong!", variant: "destructive" });
            return;
        }
        onSubmit({
            judul: judul.trim() || undefined,
            wacana,
            mataPelajaranId: mataPelajaranId || undefined,
        });
    };

    return (
        <Dialog open onOpenChange={(open) => !open && onClose()}>
            <DialogContent className="max-w-3xl max-h-[90vh] overflow-y-auto">
                <DialogHeader>
                    <DialogTitle>{item ? "Edit Kelompok Soal" : "Tambah Kelompok Soal (Wacana)"}</DialogTitle>
                </DialogHeader>
                <form onSubmit={handleSubmit} className="space-y-4">
                    <div>
                        <label className="mb-1 block text-sm font-medium">Judul / Petunjuk (Opsional)</label>
                        <input
                            type="text"
                            value={judul}
                            onChange={(e) => setJudul(e.target.value)}
                            placeholder='Contoh: "Bacalah teks berikut untuk menjawab soal 1-5!"'
                            className="w-full rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        />
                    </div>

                    <div>
                        <label className="mb-1 block text-sm font-medium">Mata Pelajaran (Opsional)</label>
                        <select
                            value={mataPelajaranId}
                            onChange={(e) => setMataPelajaranId(e.target.value)}
                            className="w-full rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                        >
                            <option value="">— Pilih Mata Pelajaran —</option>
                            {mapelList.map((mp: any) => (
                                <option key={mp.id} value={mp.id}>{mp.nama}</option>
                            ))}
                        </select>
                    </div>

                    <div>
                        <label className="mb-1 block text-sm font-medium">Isi Wacana / Naskah *</label>
                        <RichTextEditor
                            value={wacana}
                            onChange={setWacana}
                            token={token}
                            minHeight={200}
                            placeholder="Ketik atau tempel naskah/wacana di sini. Mendukung gambar, tabel, format teks lengkap..."
                        />
                        <p className="text-xs text-muted-foreground mt-1">
                            Naskah ini akan tampil satu kali di atas soal-soal yang tergabung dalam kelompok ini.
                        </p>
                    </div>

                    <div className="flex gap-2 pt-2">
                        <Button type="button" variant="outline" className="flex-1" onClick={onClose} disabled={isLoading}>
                            Batal
                        </Button>
                        <Button type="submit" className="flex-1" disabled={isLoading}>
                            {isLoading ? <Loader2 size={14} className="animate-spin mr-2" /> : null}
                            {isLoading ? "Menyimpan..." : "Simpan"}
                        </Button>
                    </div>
                </form>
            </DialogContent>
        </Dialog>
    );
}
