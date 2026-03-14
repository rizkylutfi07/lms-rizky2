"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery, useMutation } from "@tanstack/react-query";
import { Loader2, ArrowLeft, BookOpen, Users, Info } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { SearchableSelect } from "@/components/ui/searchable-select";
import { MultiSelect } from "@/components/ui/multi-select";
import { useRole } from "../../role-context";
import { useRouter } from "next/navigation";
import { useToast } from "@/hooks/use-toast";

export default function CreatePaketSoalPage() {
    const { token, role, user } = useRole();
    const { toast } = useToast();
    const router = useRouter();
    const [formData, setFormData] = useState({
        kode: "",
        nama: "",
        deskripsi: "",
        mataPelajaranId: "",
        guruId: "",
        kelasIds: [] as string[],
    });
    const [mapelTouched, setMapelTouched] = useState(false);
    // Search state no longer needed with SearchableSelect
    // const [mapelSearch, setMapelSearch] = useState("");

    const { data: generatedKode, isLoading: isLoadingKode } = useQuery({
        queryKey: ["generate-kode-paket"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/paket-soal/generate-kode`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Failed to generate kode");
            const data = await res.json();
            return data.kode || "";
        },
        enabled: !!token,
    });



    const { data: mataPelajaranList } = useQuery({
        queryKey: ["mata-pelajaran-list", role],
        queryFn: async () => {
            const queryParams = role === "GURU" ? "?mySubjects=true&limit=100" : "?limit=100";
            const res = await fetch(`${API_URL}/mata-pelajaran${queryParams}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
    });

    const { data: kelasList } = useQuery({
        queryKey: ["kelas-list", role, user?.guru?.id],
        queryFn: async () => {
            // For GURU role, only fetch classes they teach
            const guruId = role === "GURU" ? user?.guru?.id : undefined;
            const params = new URLSearchParams({ limit: "100" });
            if (guruId) params.set("guruId", guruId);
            const res = await fetch(`${API_URL}/kelas?${params}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    const { data: guruList } = useQuery({
        queryKey: ["guru-list"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/guru?limit=100`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: role === "ADMIN", // Only fetch if admin
    });

    const createMutation = useMutation({
        mutationFn: async (data: any) => {
            const res = await fetch(`${API_URL}/paket-soal`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`,
                },
                body: JSON.stringify(data),
            });
            if (!res.ok) throw new Error("Failed to create");
            return res.json();
        },
        onSuccess: (data) => {
            router.push(`/paket-soal/${data.id}`);
        },
    });

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();

        const submitData: any = { ...formData };

        if (generatedKode) {
            submitData.kode = generatedKode;
        }

        if (!submitData.nama) {
            toast({ title: "Perhatian", description: "Nama paket soal harus diisi!", variant: "destructive" });
            return;
        }

        // Auto-fill guruId for GURU role
        if (role === "GURU" && user?.guru?.id) {
            submitData.guruId = user.guru.id;
        }

        // Remove empty optional fields
        if (!submitData.mataPelajaranId) delete submitData.mataPelajaranId;
        if (!submitData.guruId) delete submitData.guruId;
        if (!submitData.kelasIds || submitData.kelasIds.length === 0) delete submitData.kelasIds;
        if (!submitData.deskripsi) delete submitData.deskripsi;

        createMutation.mutate(submitData);
    };

    const mataPelajaranOptions = (mataPelajaranList?.data ?? [])
        .sort((a: any, b: any) => a.nama.localeCompare(b.nama, "id", { sensitivity: "base" }));

    const kelasOptions = (kelasList?.data ?? [])
        .sort((a: any, b: any) => a.nama.localeCompare(b.nama, "id", { sensitivity: "base" }));

    const guruOptions = (guruList?.data ?? []).sort((a: any, b: any) =>
        a.nama.localeCompare(b.nama, "id", { sensitivity: "base" })
    );
    const selectedGuru = guruOptions.find((guru: any) => guru.id === formData.guruId);
    const filteredGuruOptions = formData.mataPelajaranId
        ? guruOptions.filter((guru: any) =>
            guru.mataPelajaran?.some((mp: any) => mp.id === formData.mataPelajaranId)
        )
        : guruOptions;

    const handleMataPelajaranChange = (value: string) => {
        setFormData((prev) => {
            const next = { ...prev, mataPelajaranId: value };
            if (prev.guruId) {
                const guru = guruOptions.find((g: any) => g.id === prev.guruId);
                const guruHasMapel = guru?.mataPelajaran?.some((mp: any) => mp.id === value);
                if (!guruHasMapel) {
                    next.guruId = "";
                }
            }
            return next;
        });
        setMapelTouched(true);
    };

    const handleGuruChange = (value: string) => {
        if (!value) {
            setFormData((prev) => ({ ...prev, guruId: "", mataPelajaranId: mapelTouched ? prev.mataPelajaranId : "" }));
            return;
        }

        const guru = guruOptions.find((g: any) => g.id === value);
        const guruMapelIds = (guru?.mataPelajaran || []).map((mp: any) => mp.id);

        setFormData((prev) => {
            const next = { ...prev, guruId: value };

            if (guruMapelIds.length === 1) {
                next.mataPelajaranId = guruMapelIds[0];
            } else if (prev.mataPelajaranId && !guruMapelIds.includes(prev.mataPelajaranId)) {
                next.mataPelajaranId = "";
            } else if (!prev.mataPelajaranId && guruMapelIds.length > 0) {
                // Default to the first mapel the guru teaches to keep the relation valid
                next.mataPelajaranId = guruMapelIds[0];
            }

            return next;
        });
    };

    return (
        <div className="space-y-6 max-w-2xl mx-auto">
            {/* Header */}
            <div className="flex items-center gap-3">
                <Button
                    variant="ghost"
                    size="icon"
                    onClick={() => router.back()}
                    className="shrink-0"
                >
                    <ArrowLeft size={20} />
                </Button>
                <div>
                    <h1 className="text-2xl font-bold">Buat Paket Soal Baru</h1>
                    <p className="text-sm text-muted-foreground">
                        Isi informasi paket soal di bawah ini
                    </p>
                </div>
            </div>

            <form onSubmit={handleSubmit} className="space-y-4">
                {/* Informasi Dasar */}
                <Card>
                    <CardHeader className="pb-3">
                        <div className="flex items-center gap-2">
                            <BookOpen size={18} className="text-primary" />
                            <CardTitle className="text-base">Informasi Dasar</CardTitle>
                        </div>
                        <CardDescription>Detail identitas paket soal</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        {/* Kode Paket */}
                        <div>
                            <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium">
                                Kode Paket
                                <Badge className="text-[10px] font-normal px-1.5 py-0 bg-transparent border-border text-muted-foreground">
                                    Otomatis
                                </Badge>
                            </label>
                            <input
                                type="text"
                                value={generatedKode || "Memuat..."}
                                disabled
                                className="w-full rounded-lg border border-border bg-muted/40 px-4 py-2 text-sm text-muted-foreground font-mono outline-none opacity-80"
                            />
                        </div>

                        {/* Nama */}
                        <div>
                            <label className="mb-1.5 block text-sm font-medium">
                                Nama Paket Soal <span className="text-destructive">*</span>
                            </label>
                            <input
                                type="text"
                                value={formData.nama}
                                onChange={(e) =>
                                    setFormData({ ...formData, nama: e.target.value })
                                }
                                placeholder="Contoh: Paket Soal Matematika Kelas XII"
                                className="w-full rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-1 focus:ring-primary/40"
                                required
                            />
                        </div>

                        {/* Deskripsi */}
                        <div>
                            <label className="mb-1.5 block text-sm font-medium text-foreground/80">
                                Deskripsi
                                <span className="ml-1 text-xs font-normal text-muted-foreground">(opsional)</span>
                            </label>
                            <textarea
                                value={formData.deskripsi}
                                onChange={(e) =>
                                    setFormData({ ...formData, deskripsi: e.target.value })
                                }
                                placeholder="Deskripsi singkat tentang paket soal ini..."
                                rows={3}
                                className="w-full rounded-lg border border-border bg-background px-4 py-2 text-sm outline-none transition focus:border-primary/60 focus:ring-1 focus:ring-primary/40 resize-none"
                            />
                        </div>
                    </CardContent>
                </Card>

                {/* Pengaitan */}
                <Card>
                    <CardHeader className="pb-3">
                        <div className="flex items-center gap-2">
                            <Users size={18} className="text-primary" />
                            <CardTitle className="text-base">Pengaitan</CardTitle>
                        </div>
                        <CardDescription>Hubungkan paket soal ke mata pelajaran, kelas, dan guru</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        {/* Mata Pelajaran */}
                        <div>
                            <label className="mb-1.5 block text-sm font-medium text-foreground/80">
                                Mata Pelajaran
                                <span className="ml-1 text-xs font-normal text-muted-foreground">(opsional)</span>
                            </label>
                            <SearchableSelect
                                options={mataPelajaranOptions.map((mp: any) => ({
                                    value: mp.id,
                                    label: mp.nama,
                                    description: mp.kode ? `Kode: ${mp.kode}` : undefined,
                                }))}
                                value={formData.mataPelajaranId}
                                onChange={handleMataPelajaranChange}
                                placeholder="Pilih Mata Pelajaran"
                                searchPlaceholder="Cari mata pelajaran..."
                                emptyMessage="Tidak ada mata pelajaran yang cocok"
                            />
                            {formData.guruId && !selectedGuru?.mataPelajaran?.some((mp: any) => mp.id === formData.mataPelajaranId) && (
                                <p className="mt-1 flex items-center gap-1 text-xs text-amber-600">
                                    <Info size={11} />
                                    Guru yang dipilih tidak mengajar mapel ini.
                                </p>
                            )}
                        </div>

                        {/* Guru — ADMIN only */}
                        {role === "ADMIN" && (
                            <div>
                                <label className="mb-1.5 block text-sm font-medium text-foreground/80">
                                    Guru Mata Pelajaran
                                    <span className="ml-1 text-xs font-normal text-muted-foreground">(opsional)</span>
                                </label>
                                <SearchableSelect
                                    options={filteredGuruOptions.map((guru: any) => ({
                                        value: guru.id,
                                        label: guru.nama,
                                    }))}
                                    value={formData.guruId}
                                    onChange={handleGuruChange}
                                    placeholder="Pilih Guru"
                                    searchPlaceholder="Cari guru..."
                                    emptyMessage={formData.mataPelajaranId ? "Tidak ada guru yang mengajar mapel ini" : "Guru tidak ditemukan"}
                                />
                            </div>
                        )}

                        {/* Kelas */}
                        <div>
                            <label className="mb-1.5 block text-sm font-medium text-foreground/80">
                                Kelas
                                <span className="ml-1 text-xs font-normal text-muted-foreground">(opsional)</span>
                            </label>
                            {role === "GURU" && kelasOptions.length === 0 && (
                                <p className="mb-2 flex items-center gap-1 text-xs text-muted-foreground">
                                    <Info size={11} />
                                    Belum ada kelas yang Anda ampu. Hubungi admin untuk menambahkan jadwal pelajaran.
                                </p>
                            )}
                            {role === "GURU" && kelasOptions.length > 0 && (
                                <p className="mb-2 flex items-center gap-1 text-xs text-muted-foreground">
                                    <Info size={11} />
                                    Menampilkan kelas yang Anda ampu.
                                </p>
                            )}
                            <MultiSelect
                                options={kelasOptions.map((kelas: any) => ({
                                    value: kelas.id,
                                    label: kelas.nama,
                                    description: kelas.tingkat ? `Tingkat ${kelas.tingkat}` : undefined,
                                }))}
                                values={formData.kelasIds}
                                onChange={(values) => setFormData({ ...formData, kelasIds: values })}
                                placeholder="Pilih Kelas"
                                searchPlaceholder="Cari kelas..."
                                emptyMessage="Tidak ada kelas yang cocok"
                            />
                            {formData.kelasIds.length > 0 && (
                                <p className="mt-1 text-xs text-muted-foreground">
                                    {formData.kelasIds.length} kelas dipilih
                                </p>
                            )}
                        </div>
                    </CardContent>
                </Card>

                {/* Actions */}
                <div className="flex gap-3">
                    <Button
                        type="button"
                        variant="outline"
                        onClick={() => router.back()}
                        className="flex-1"
                    >
                        Batal
                    </Button>
                    <Button
                        type="submit"
                        disabled={createMutation.isPending || !formData.nama.trim()}
                        className="flex-1"
                    >
                        {createMutation.isPending ? (
                            <>
                                <Loader2 className="animate-spin mr-2" size={16} />
                                Menyimpan...
                            </>
                        ) : (
                            "Buat Paket Soal"
                        )}
                    </Button>
                </div>
            </form>
        </div>
    );
}
