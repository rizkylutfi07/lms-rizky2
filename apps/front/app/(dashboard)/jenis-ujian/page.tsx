"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { Loader2, Pencil, Trash2, Plus, GripVertical, Tags } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
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

export default function JenisUjianPage() {
    const { token } = useRole();
    const { toast } = useToast();
    const queryClient = useQueryClient();

    const [isModalOpen, setIsModalOpen] = useState(false);
    const [editingItem, setEditingItem] = useState<any>(null);
    const [deletingItem, setDeletingItem] = useState<any>(null);

    const [formData, setFormData] = useState({
        nama: "",
        kode: "",
        deskripsi: "",
        aktif: true,
        urutan: 0,
    });

    const { data: jenisUjianList, isLoading } = useQuery({
        queryKey: ["jenis-ujian"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/jenis-ujian`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
    });

    const saveMutation = useMutation({
        mutationFn: async (data: any) => {
            const url = editingItem
                ? `${API_URL}/jenis-ujian/${editingItem.id}`
                : `${API_URL}/jenis-ujian`;
            const method = editingItem ? "PATCH" : "POST";

            const res = await fetch(url, {
                method,
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`,
                },
                body: JSON.stringify(data),
            });
            if (!res.ok) {
                const err = await res.json();
                throw new Error(err.message || "Failed to save");
            }
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["jenis-ujian"] });
            closeModal();
            toast({
                title: "Berhasil!",
                description: editingItem
                    ? "Jenis ujian berhasil diupdate"
                    : "Jenis ujian berhasil ditambahkan",
            });
        },
        onError: (err: any) => {
            toast({
                title: "Error",
                description: err.message,
                variant: "destructive",
            });
        },
    });

    const deleteMutation = useMutation({
        mutationFn: async (id: string) => {
            const res = await fetch(`${API_URL}/jenis-ujian/${id}`, {
                method: "DELETE",
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) {
                const err = await res.json();
                throw new Error(err.message || "Failed to delete");
            }
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["jenis-ujian"] });
            setDeletingItem(null);
            toast({ title: "Berhasil!", description: "Jenis ujian berhasil dihapus" });
        },
        onError: (err: any) => {
            toast({
                title: "Error",
                description: err.message,
                variant: "destructive",
            });
        },
    });

    const openAddModal = () => {
        setEditingItem(null);
        setFormData({
            nama: "",
            kode: "",
            deskripsi: "",
            aktif: true,
            urutan: jenisUjianList ? jenisUjianList.length : 0,
        });
        setIsModalOpen(true);
    };

    const openEditModal = (item: any) => {
        setEditingItem(item);
        setFormData({
            nama: item.nama || "",
            kode: item.kode || "",
            deskripsi: item.deskripsi || "",
            aktif: item.aktif ?? true,
            urutan: item.urutan ?? 0,
        });
        setIsModalOpen(true);
    };

    const closeModal = () => {
        setIsModalOpen(false);
        setEditingItem(null);
        setFormData({
            nama: "",
            kode: "",
            deskripsi: "",
            aktif: true,
            urutan: 0,
        });
    };

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        saveMutation.mutate(formData);
    };

    return (
        <div className="space-y-6">
            <Card>
                <CardHeader>
                    <div className="md:flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold flex items-center gap-2">
                                <Tags className="h-8 w-8" />
                                Kelola Jenis Ujian
                            </h1>
                            <p className="text-sm text-muted-foreground">
                                Tambah dan kelola jenis-jenis ujian yang tersedia
                            </p>
                        </div>

                        <div className="flex gap-2 mt-4 md:mt-0">
                            <Button onClick={openAddModal}>
                                <Plus size={16} />
                                Tambah Jenis Ujian
                            </Button>
                        </div>
                    </div>
                </CardHeader>

                <CardContent className="p-2 md:p-4">
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-border">
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground w-12"></th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Nama</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Kode</th>
                                    <th className="text-left py-3 px-4 text-sm font-semibold text-muted-foreground">Deskripsi</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Digunakan</th>
                                    <th className="text-center py-3 px-4 text-sm font-semibold text-muted-foreground">Status</th>
                                    <th className="text-right py-3 px-4 text-sm font-semibold text-muted-foreground">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {isLoading ? (
                                    Array.from({ length: 5 }).map((_, i) => (
                                        <tr key={i}>
                                            <td colSpan={7} className="py-4">
                                                <div className="h-12 animate-pulse rounded bg-muted/50" />
                                            </td>
                                        </tr>
                                    ))
                                ) : jenisUjianList?.length === 0 ? (
                                    <tr>
                                        <td colSpan={7} className="py-8 text-center text-muted-foreground">
                                            Belum ada jenis ujian
                                        </td>
                                    </tr>
                                ) : (
                                    jenisUjianList?.map((item: any) => (
                                        <tr key={item.id} className="border-b border-border hover:bg-muted/30 transition">
                                            <td className="py-4 px-4">
                                                <GripVertical className="h-4 w-4 text-muted-foreground cursor-move" />
                                            </td>
                                            <td className="py-4 px-4">
                                                <span className="font-medium">{item.nama}</span>
                                            </td>
                                            <td className="py-4 px-4">
                                                {item.kode ? (
                                                    <Badge className="bg-muted text-muted-foreground font-mono text-xs">
                                                        {item.kode}
                                                    </Badge>
                                                ) : (
                                                    <span className="text-muted-foreground text-sm">-</span>
                                                )}
                                            </td>
                                            <td className="py-4 px-4">
                                                <span className="text-sm text-muted-foreground line-clamp-1">
                                                    {item.deskripsi || "-"}
                                                </span>
                                            </td>
                                            <td className="py-4 px-4 text-center">
                                                <Badge className="bg-blue-500/15 text-blue-500">
                                                    {item._count?.ujian || 0} ujian
                                                </Badge>
                                            </td>
                                            <td className="py-4 px-4 text-center">
                                                {item.aktif ? (
                                                    <Badge className="bg-green-500/15 text-green-500">Aktif</Badge>
                                                ) : (
                                                    <Badge className="bg-gray-500/15 text-gray-500">Nonaktif</Badge>
                                                )}
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex items-center justify-end gap-2">
                                                    <Button
                                                        variant="ghost"
                                                        size="icon"
                                                        className="h-8 w-8"
                                                        onClick={() => openEditModal(item)}
                                                    >
                                                        <Pencil size={16} />
                                                    </Button>
                                                    <Button
                                                        variant="ghost"
                                                        size="icon"
                                                        className="h-8 w-8 text-red-500 hover:text-red-600 hover:bg-red-500/10"
                                                        onClick={() => setDeletingItem(item)}
                                                    >
                                                        <Trash2 size={16} />
                                                    </Button>
                                                </div>
                                            </td>
                                        </tr>
                                    ))
                                )}
                            </tbody>
                        </table>
                    </div>
                </CardContent>
            </Card>

            {/* Modal Add/Edit */}
            <Dialog open={isModalOpen} onOpenChange={closeModal}>
                <DialogContent className="sm:max-w-[500px]">
                    <form onSubmit={handleSubmit}>
                        <DialogHeader>
                            <DialogTitle>
                                {editingItem ? "Edit Jenis Ujian" : "Tambah Jenis Ujian"}
                            </DialogTitle>
                            <DialogDescription>
                                Isi form berikut untuk {editingItem ? "mengupdate" : "menambahkan"} jenis ujian
                            </DialogDescription>
                        </DialogHeader>

                        <div className="space-y-4 py-4">
                            <div>
                                <label className="mb-2 block text-sm font-medium">
                                    Nama Jenis Ujian *
                                </label>
                                <input
                                    type="text"
                                    required
                                    value={formData.nama}
                                    onChange={(e) =>
                                        setFormData({ ...formData, nama: e.target.value })
                                    }
                                    className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                    placeholder="Contoh: Ulangan Harian"
                                />
                            </div>

                            <div>
                                <label className="mb-2 block text-sm font-medium">
                                    Kode (Opsional)
                                </label>
                                <input
                                    type="text"
                                    value={formData.kode}
                                    onChange={(e) =>
                                        setFormData({ ...formData, kode: e.target.value })
                                    }
                                    className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                    placeholder="Contoh: UH"
                                />
                            </div>

                            <div>
                                <label className="mb-2 block text-sm font-medium">
                                    Deskripsi (Opsional)
                                </label>
                                <textarea
                                    value={formData.deskripsi}
                                    onChange={(e) =>
                                        setFormData({ ...formData, deskripsi: e.target.value })
                                    }
                                    className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
                                    rows={3}
                                    placeholder="Keterangan tentang jenis ujian ini..."
                                />
                            </div>

                            <div className="flex items-center gap-2">
                                <input
                                    type="checkbox"
                                    id="aktif"
                                    checked={formData.aktif}
                                    onChange={(e) =>
                                        setFormData({ ...formData, aktif: e.target.checked })
                                    }
                                    className="rounded border-border"
                                />
                                <label htmlFor="aktif" className="text-sm">
                                    Status Aktif
                                </label>
                            </div>
                        </div>

                        <DialogFooter>
                            <Button
                                type="button"
                                variant="outline"
                                onClick={closeModal}
                                disabled={saveMutation.isPending}
                            >
                                Batal
                            </Button>
                            <Button type="submit" disabled={saveMutation.isPending}>
                                {saveMutation.isPending && (
                                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                )}
                                {editingItem ? "Update" : "Tambah"}
                            </Button>
                        </DialogFooter>
                    </form>
                </DialogContent>
            </Dialog>

            {/* Delete Confirmation */}
            <AlertDialog open={!!deletingItem} onOpenChange={() => setDeletingItem(null)}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>Hapus Jenis Ujian</AlertDialogTitle>
                        <AlertDialogDescription>
                            Apakah Anda yakin ingin menghapus jenis ujian{" "}
                            <strong>{deletingItem?.nama}</strong>?
                            {deletingItem?._count?.ujian > 0 && (
                                <span className="block mt-2 text-red-500 font-medium">
                                    Peringatan: Jenis ujian ini digunakan oleh {deletingItem._count.ujian} ujian!
                                </span>
                            )}
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel disabled={deleteMutation.isPending}>
                            Batal
                        </AlertDialogCancel>
                        <Button
                            variant="destructive"
                            onClick={() => deleteMutation.mutate(deletingItem.id)}
                            disabled={deleteMutation.isPending}
                        >
                            {deleteMutation.isPending && (
                                <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                            )}
                            Hapus
                        </Button>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>
        </div>
    );
}
