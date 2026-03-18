"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { Plus, Search, Pencil, Trash2, Loader2, RefreshCw, CheckCircle2, BookOpen } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import {
  Dialog,
  DialogContent,
  DialogDescription,
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
import { useRole } from "../role-context";

const tahunajaranApi = {
  getAll: async (params: any, token: string | null) => {
    const searchParams = new URLSearchParams();
    if (params.page) searchParams.set('page', params.page.toString());
    if (params.limit) searchParams.set('limit', params.limit.toString());
    if (params.search) searchParams.set('search', params.search);

    const res = await fetch(`${API_URL}/tahun-ajaran?${searchParams}`, {
      headers: { Authorization: `Bearer ${token}` },
    });
    if (!res.ok) throw new Error('Gagal memuat data');
    return res.json();
  },
  create: async (data: any, token: string | null) => {
    const res = await fetch(`${API_URL}/tahun-ajaran`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify(data),
    });
    if (!res.ok) { const err = await res.json(); throw new Error(err.message || 'Gagal menyimpan'); }
    return res.json();
  },
  update: async (id: string, data: any, token: string | null) => {
    const res = await fetch(`${API_URL}/tahun-ajaran/${id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify(data),
    });
    if (!res.ok) { const err = await res.json(); throw new Error(err.message || 'Gagal menyimpan'); }
    return res.json();
  },
  delete: async (id: string, token: string | null) => {
    const res = await fetch(`${API_URL}/tahun-ajaran/${id}`, {
      method: 'DELETE',
      headers: { Authorization: `Bearer ${token}` },
    });
    if (!res.ok) { const err = await res.json(); throw new Error(err.message || 'Gagal menghapus'); }
    return res.json();
  },
  setActive: async (id: string, semester: string, token: string | null) => {
    const res = await fetch(`${API_URL}/tahun-ajaran/${id}/set-active`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ semester }),
    });
    if (!res.ok) { const err = await res.json(); throw new Error(err.message || 'Gagal mengaktifkan'); }
    return res.json();
  },
  setSemester: async (id: string, semester: string, token: string | null) => {
    const res = await fetch(`${API_URL}/tahun-ajaran/${id}/set-semester`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ semester }),
    });
    if (!res.ok) { const err = await res.json(); throw new Error(err.message || 'Gagal mengganti semester'); }
    return res.json();
  },
};

function SemesterBadge({ semester }: { semester?: string | null }) {
  if (!semester) return null;
  const isGanjil = semester === 'GANJIL';
  return (
    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${isGanjil ? 'bg-blue-500/20 text-blue-400' : 'bg-purple-500/20 text-purple-400'}`}>
      Sem. {isGanjil ? 'Ganjil' : 'Genap'}
    </span>
  );
}

function StatusBadge({ status }: { status: string }) {
  const map: Record<string, string> = {
    AKTIF: 'bg-green-500/20 text-green-400',
    SELESAI: 'bg-gray-500/20 text-gray-400',
    AKAN_DATANG: 'bg-yellow-500/20 text-yellow-400',
  };
  const label: Record<string, string> = { AKTIF: 'Aktif', SELESAI: 'Selesai', AKAN_DATANG: 'Akan Datang' };
  return (
    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${map[status] ?? 'bg-muted text-muted-foreground'}`}>
      {label[status] ?? status}
    </span>
  );
}

export default function TahunAjaranPage() {
  const { token } = useRole();
  const queryClient = useQueryClient();
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);
  const [isCreateModalOpen, setIsCreateModalOpen] = useState(false);
  const [editingItem, setEditingItem] = useState<any>(null);
  const [deletingItem, setDeletingItem] = useState<any>(null);
  // State for set-active modal (semester picker)
  const [activatingItem, setActivatingItem] = useState<any>(null);
  const [activatingSemester, setActivatingSemester] = useState("GANJIL");
  // State for change-semester modal
  const [changingSemesterItem, setChangingSemesterItem] = useState<any>(null);
  const [newSemester, setNewSemester] = useState("GANJIL");
  const [errorMsg, setErrorMsg] = useState<string | null>(null);

  const { data, isLoading } = useQuery({
    queryKey: ["tahun-ajaran", page, search],
    queryFn: () => tahunajaranApi.getAll({ page, limit: 10, search: search || undefined }, token),
  });

  const createMutation = useMutation({
    mutationFn: (data: any) => tahunajaranApi.create(data, token),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["tahun-ajaran"] });
      queryClient.invalidateQueries({ queryKey: ["active-tahun-ajaran"] });
      setIsCreateModalOpen(false);
      setErrorMsg(null);
    },
    onError: (err: any) => setErrorMsg(err.message),
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, data }: { id: string; data: any }) => tahunajaranApi.update(id, data, token),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["tahun-ajaran"] });
      queryClient.invalidateQueries({ queryKey: ["active-tahun-ajaran"] });
      setEditingItem(null);
      setErrorMsg(null);
    },
    onError: (err: any) => setErrorMsg(err.message),
  });

  const deleteMutation = useMutation({
    mutationFn: (id: string) => tahunajaranApi.delete(id, token),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["tahun-ajaran"] });
      setDeletingItem(null);
    },
  });

  const setActiveMutation = useMutation({
    mutationFn: ({ id, semester }: { id: string; semester: string }) =>
      tahunajaranApi.setActive(id, semester, token),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["tahun-ajaran"] });
      queryClient.invalidateQueries({ queryKey: ["active-tahun-ajaran"] });
      setActivatingItem(null);
    },
    onError: (err: any) => setErrorMsg(err.message),
  });

  const setSemesterMutation = useMutation({
    mutationFn: ({ id, semester }: { id: string; semester: string }) =>
      tahunajaranApi.setSemester(id, semester, token),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["tahun-ajaran"] });
      queryClient.invalidateQueries({ queryKey: ["active-tahun-ajaran"] });
      setChangingSemesterItem(null);
    },
    onError: (err: any) => setErrorMsg(err.message),
  });

  const activeItem = data?.data?.find((item: any) => item.status === 'AKTIF');

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold">Tahun Ajaran</h1>
          <p className="text-muted-foreground">Kelola tahun ajaran dan semester aktif</p>
        </div>
        <Button onClick={() => setIsCreateModalOpen(true)}>
          <Plus size={16} />
          Tambah Tahun Ajaran
        </Button>
      </div>

      {/* Active info banner */}
      {activeItem && (
        <Card className="border-green-500/30 bg-green-500/5">
          <CardContent className="py-4">
            <div className="flex flex-wrap items-center justify-between gap-4">
              <div className="flex items-center gap-3">
                <CheckCircle2 className="shrink-0 text-green-400" size={20} />
                <div>
                  <p className="font-semibold text-green-400">Tahun Ajaran Aktif</p>
                  <p className="text-sm text-muted-foreground">
                    {activeItem.tahun} — Semester{" "}
                    <span className="font-medium text-foreground">
                      {activeItem.semester === 'GANJIL' ? 'Ganjil' : activeItem.semester === 'GENAP' ? 'Genap' : '-'}
                    </span>
                  </p>
                </div>
              </div>
              <Button
                variant="outline"
                size="sm"
                className="border-green-500/30 text-green-400 hover:bg-green-500/10"
                onClick={() => {
                  setChangingSemesterItem(activeItem);
                  setNewSemester(activeItem.semester === 'GANJIL' ? 'GENAP' : 'GANJIL');
                  setErrorMsg(null);
                }}
              >
                <RefreshCw size={14} />
                Ganti ke Semester {activeItem.semester === 'GANJIL' ? 'Genap' : 'Ganjil'}
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Table */}
      <Card>
        <CardHeader>
          <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
            <div>
              <CardTitle>Daftar Tahun Ajaran</CardTitle>
              <CardDescription>Total {data?.meta?.total ?? 0} data</CardDescription>
            </div>
            <div className="relative flex-1 md:max-w-xs">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground" size={16} />
              <input
                type="text"
                placeholder="Cari..."
                value={search}
                onChange={(e) => { setSearch(e.target.value); setPage(1); }}
                className="w-full rounded-lg border border-border bg-background py-2 pl-10 pr-4 text-sm outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
              />
            </div>
          </div>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="flex items-center justify-center py-12">
              <Loader2 className="animate-spin text-muted-foreground" size={32} />
            </div>
          ) : (
            <>
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b border-border text-left text-sm text-muted-foreground">
                      <th className="pb-3 font-medium">Tahun Ajaran</th>
                      <th className="pb-3 font-medium">Semester Aktif</th>
                      <th className="pb-3 font-medium">Tanggal Mulai</th>
                      <th className="pb-3 font-medium">Tanggal Selesai</th>
                      <th className="pb-3 font-medium">Status</th>
                      <th className="pb-3 font-medium text-right">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    {data?.data?.map((item: any) => (
                      <tr key={item.id} className="border-b border-white/5 transition hover:bg-muted/40">
                        <td className="py-4 font-medium">{item.tahun}</td>
                        <td className="py-4">
                          {item.semester ? (
                            <SemesterBadge semester={item.semester} />
                          ) : (
                            <span className="text-xs text-muted-foreground">—</span>
                          )}
                        </td>
                        <td className="py-4 text-muted-foreground">
                          {new Date(item.tanggalMulai).toLocaleDateString("id-ID", { day: 'numeric', month: 'long', year: 'numeric' })}
                        </td>
                        <td className="py-4 text-muted-foreground">
                          {new Date(item.tanggalSelesai).toLocaleDateString("id-ID", { day: 'numeric', month: 'long', year: 'numeric' })}
                        </td>
                        <td className="py-4"><StatusBadge status={item.status} /></td>
                        <td className="py-4 text-right">
                          <div className="flex justify-end gap-2">
                            {item.status !== 'AKTIF' && (
                              <Button
                                variant="outline"
                                size="sm"
                                onClick={() => {
                                  setActivatingItem(item);
                                  setActivatingSemester('GANJIL');
                                  setErrorMsg(null);
                                }}
                              >
                                <BookOpen size={12} />
                                Set Aktif
                              </Button>
                            )}
                            {item.status === 'AKTIF' && (
                              <Button
                                variant="outline"
                                size="sm"
                                className="border-blue-500/30 text-blue-400 hover:bg-blue-500/10"
                                onClick={() => {
                                  setChangingSemesterItem(item);
                                  setNewSemester(item.semester === 'GANJIL' ? 'GENAP' : 'GANJIL');
                                  setErrorMsg(null);
                                }}
                              >
                                <RefreshCw size={12} />
                                Ganti Semester
                              </Button>
                            )}
                            <Button variant="ghost" size="sm" onClick={() => { setEditingItem(item); setErrorMsg(null); }}>
                              <Pencil size={14} />
                            </Button>
                            <Button variant="ghost" size="sm" onClick={() => setDeletingItem(item)}>
                              <Trash2 size={14} />
                            </Button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {data && data.meta.totalPages > 1 && (
                <div className="mt-6 flex items-center justify-between">
                  <p className="text-sm text-muted-foreground">
                    Halaman {data.meta.page} dari {data.meta.totalPages}
                  </p>
                  <div className="flex gap-2">
                    <Button variant="outline" size="sm" disabled={page === 1} onClick={() => setPage(page - 1)}>
                      Sebelumnya
                    </Button>
                    <Button variant="outline" size="sm" disabled={page === data.meta.totalPages} onClick={() => setPage(page + 1)}>
                      Selanjutnya
                    </Button>
                  </div>
                </div>
              )}
            </>
          )}
        </CardContent>
      </Card>

      {/* Create/Edit modal */}
      {isCreateModalOpen && (
        <FormModal
          title="Tambah Tahun Ajaran"
          onClose={() => { setIsCreateModalOpen(false); setErrorMsg(null); }}
          onSubmit={(data: any) => createMutation.mutate(data)}
          isLoading={createMutation.isPending}
          errorMsg={errorMsg}
        />
      )}

      {editingItem && (
        <FormModal
          title="Edit Tahun Ajaran"
          item={editingItem}
          onClose={() => { setEditingItem(null); setErrorMsg(null); }}
          onSubmit={(data: any) => updateMutation.mutate({ id: editingItem.id, data })}
          isLoading={updateMutation.isPending}
          errorMsg={errorMsg}
        />
      )}

      {/* Set Active modal — requires semester selection */}
      {activatingItem && (
        <Dialog open={true} onOpenChange={(open) => { if (!open) setActivatingItem(null); }}>
          <DialogContent className="max-w-sm">
            <DialogHeader>
              <DialogTitle>Aktifkan Tahun Ajaran</DialogTitle>
              <DialogDescription>
                Pilih semester yang akan diaktifkan untuk tahun ajaran{" "}
                <span className="font-semibold">{activatingItem.tahun}</span>.
                Tahun ajaran yang sedang aktif akan dinonaktifkan.
              </DialogDescription>
            </DialogHeader>
            <div className="space-y-4 pt-2">
              <div>
                <label className="mb-2 block text-sm font-medium">Semester</label>
                <div className="grid grid-cols-2 gap-3">
                  {["GANJIL", "GENAP"].map((s) => (
                    <button
                      key={s}
                      type="button"
                      onClick={() => setActivatingSemester(s)}
                      className={`rounded-lg border px-4 py-3 text-sm font-medium transition ${
                        activatingSemester === s
                          ? 'border-primary bg-primary/10 text-primary'
                          : 'border-border bg-background hover:bg-muted/40'
                      }`}
                    >
                      Semester {s === 'GANJIL' ? 'Ganjil' : 'Genap'}
                    </button>
                  ))}
                </div>
              </div>
              {errorMsg && <p className="text-sm text-destructive">{errorMsg}</p>}
              <div className="flex gap-2">
                <Button variant="outline" onClick={() => setActivatingItem(null)} className="flex-1">Batal</Button>
                <Button
                  className="flex-1"
                  disabled={setActiveMutation.isPending}
                  onClick={() => setActiveMutation.mutate({ id: activatingItem.id, semester: activatingSemester })}
                >
                  {setActiveMutation.isPending ? <Loader2 className="animate-spin" size={16} /> : "Aktifkan"}
                </Button>
              </div>
            </div>
          </DialogContent>
        </Dialog>
      )}

      {/* Change semester modal */}
      {changingSemesterItem && (
        <Dialog open={true} onOpenChange={(open) => { if (!open) setChangingSemesterItem(null); }}>
          <DialogContent className="max-w-sm">
            <DialogHeader>
              <DialogTitle>Ganti Semester</DialogTitle>
              <DialogDescription>
                Pilih semester baru untuk tahun ajaran{" "}
                <span className="font-semibold">{changingSemesterItem.tahun}</span>.
                Semester saat ini:{" "}
                <span className="font-semibold">
                  {changingSemesterItem.semester === 'GANJIL' ? 'Ganjil' : 'Genap'}
                </span>.
              </DialogDescription>
            </DialogHeader>
            <div className="space-y-4 pt-2">
              <div>
                <label className="mb-2 block text-sm font-medium">Semester Baru</label>
                <div className="grid grid-cols-2 gap-3">
                  {["GANJIL", "GENAP"].map((s) => (
                    <button
                      key={s}
                      type="button"
                      onClick={() => setNewSemester(s)}
                      className={`rounded-lg border px-4 py-3 text-sm font-medium transition ${
                        newSemester === s
                          ? 'border-primary bg-primary/10 text-primary'
                          : 'border-border bg-background hover:bg-muted/40'
                      }`}
                    >
                      Semester {s === 'GANJIL' ? 'Ganjil' : 'Genap'}
                    </button>
                  ))}
                </div>
              </div>
              {errorMsg && <p className="text-sm text-destructive">{errorMsg}</p>}
              <div className="flex gap-2">
                <Button variant="outline" onClick={() => setChangingSemesterItem(null)} className="flex-1">Batal</Button>
                <Button
                  className="flex-1"
                  disabled={setSemesterMutation.isPending || newSemester === changingSemesterItem.semester}
                  onClick={() => setSemesterMutation.mutate({ id: changingSemesterItem.id, semester: newSemester })}
                >
                  {setSemesterMutation.isPending ? <Loader2 className="animate-spin" size={16} /> : "Simpan"}
                </Button>
              </div>
            </div>
          </DialogContent>
        </Dialog>
      )}

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

function FormModal({ title, item, onClose, onSubmit, isLoading, errorMsg }: any) {
  const [formData, setFormData] = useState(() => {
    if (!item) return { status: 'AKAN_DATANG' };
    return {
      tahun: item.tahun || '',
      tanggalMulai: item.tanggalMulai ? new Date(item.tanggalMulai).toISOString().split('T')[0] : '',
      tanggalSelesai: item.tanggalSelesai ? new Date(item.tanggalSelesai).toISOString().split('T')[0] : '',
      status: item.status || 'AKAN_DATANG',
      semester: item.semester || '',
    };
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const payload: any = {
      tahun: formData.tahun,
      tanggalMulai: formData.tanggalMulai,
      tanggalSelesai: formData.tanggalSelesai,
      status: formData.status,
    };
    if (formData.semester) payload.semester = formData.semester;
    onSubmit(payload);
  };

  const needsSemester = formData.status === 'AKTIF';

  return (
    <Dialog open={true} onOpenChange={(open) => !open && onClose()}>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>{title}</DialogTitle>
        </DialogHeader>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="mb-2 block text-sm font-medium">Tahun</label>
            <input
              type="text"
              required
              placeholder="2024/2025"
              value={formData.tahun || ''}
              onChange={(e) => setFormData({ ...formData, tahun: e.target.value })}
              className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="mb-2 block text-sm font-medium">Tanggal Mulai</label>
              <input
                type="date"
                required
                value={formData.tanggalMulai || ''}
                onChange={(e) => setFormData({ ...formData, tanggalMulai: e.target.value })}
                className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
              />
            </div>
            <div>
              <label className="mb-2 block text-sm font-medium">Tanggal Selesai</label>
              <input
                type="date"
                required
                value={formData.tanggalSelesai || ''}
                onChange={(e) => setFormData({ ...formData, tanggalSelesai: e.target.value })}
                className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
              />
            </div>
          </div>
          <div>
            <label className="mb-2 block text-sm font-medium">Status</label>
            <select
              required
              value={formData.status || ''}
              onChange={(e) => setFormData({ ...formData, status: e.target.value })}
              className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none transition focus:border-primary/60 focus:ring-2 focus:ring-primary/20"
            >
              <option value="AKAN_DATANG">Akan Datang</option>
              <option value="AKTIF">Aktif</option>
              <option value="SELESAI">Selesai</option>
            </select>
          </div>
          {needsSemester && (
            <div>
              <label className="mb-2 block text-sm font-medium">
                Semester <span className="text-destructive">*</span>
              </label>
              <div className="grid grid-cols-2 gap-3">
                {["GANJIL", "GENAP"].map((s) => (
                  <button
                    key={s}
                    type="button"
                    onClick={() => setFormData({ ...formData, semester: s })}
                    className={`rounded-lg border px-4 py-2.5 text-sm font-medium transition ${
                      formData.semester === s
                        ? 'border-primary bg-primary/10 text-primary'
                        : 'border-border bg-background hover:bg-muted/40'
                    }`}
                  >
                    Semester {s === 'GANJIL' ? 'Ganjil' : 'Genap'}
                  </button>
                ))}
              </div>
            </div>
          )}
          {errorMsg && <p className="text-sm text-destructive">{errorMsg}</p>}
          <div className="flex gap-2 pt-4">
            <Button type="button" variant="outline" onClick={onClose} className="flex-1">
              Batal
            </Button>
            <Button type="submit" disabled={isLoading || (needsSemester && !formData.semester)} className="flex-1">
              {isLoading ? <Loader2 className="animate-spin" size={16} /> : "Simpan"}
            </Button>
          </div>
        </form>
      </DialogContent>
    </Dialog>
  );
}

function DeleteModal({ item, onClose, onConfirm, isLoading }: any) {
  return (
    <AlertDialog open={true} onOpenChange={(open) => !open && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Hapus Tahun Ajaran</AlertDialogTitle>
          <AlertDialogDescription>
            Apakah Anda yakin ingin menghapus tahun ajaran <strong>{item.tahun}</strong>?
            Data yang sudah tersimpan tidak akan terhapus, hanya entri tahun ajaran ini yang dihapus.
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

