"use client";

import { useState, useEffect, use } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { useRouter, useSearchParams } from "next/navigation";
import {
    ArrowLeft,
    ClipboardCheck,
    BookOpen,
    Users,
    Save,
    FileText,
    CheckCircle2,
    XCircle,
    Clock,
    AlertCircle
} from "lucide-react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { API_URL } from "@/lib/api";
import { useRole } from "../../role-context";
import { useToast } from "@/hooks/use-toast";
import Link from "next/link";

const STATUS_OPTIONS = [
    { value: "HADIR", label: "Hadir", color: "text-green-600 bg-green-500/10 border-green-500/30" },
    { value: "IZIN", label: "Izin", color: "text-blue-600 bg-blue-500/10 border-blue-500/30" },
    { value: "SAKIT", label: "Sakit", color: "text-amber-600 bg-amber-500/10 border-amber-500/30" },
    { value: "ALPHA", label: "Alpha", color: "text-red-600 bg-red-500/10 border-red-500/30" },
];

export default function AbsensiKelasFormPage({ params }: { params: Promise<{ jadwalId: string }> }) {
    const resolvedParams = use(params);
    const jadwalId = resolvedParams.jadwalId;
    const { token, role } = useRole();
    const router = useRouter();
    const searchParams = useSearchParams();
    const queryClient = useQueryClient();
    const { toast } = useToast();

    const isEdit = searchParams.get("edit") === "true";
    const absensiIdFromQuery = searchParams.get("absensiId");

    // State for attendance data
    const [detailAbsensi, setDetailAbsensi] = useState<Record<string, { status: string; keterangan: string }>>({});
    const [jurnal, setJurnal] = useState({
        materiPembelajaran: "",
        kegiatanPembelajaran: "",
        catatan: "",
    });

    // Fetch jadwal and students
    const { data: jadwalData, isLoading: isLoadingJadwal } = useQuery({
        queryKey: ["absensi-kelas-jadwal", jadwalId],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/absensi-kelas/jadwal/${jadwalId}/students`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Failed to fetch");
            return res.json();
        },
        enabled: !!token && !!jadwalId,
    });

    // Fetch existing absensi if editing
    const { data: existingAbsensi, isLoading: isLoadingExisting } = useQuery({
        queryKey: ["absensi-kelas-existing", jadwalId, absensiIdFromQuery],
        queryFn: async () => {
            if (absensiIdFromQuery) {
                const res = await fetch(`${API_URL}/absensi-kelas/${absensiIdFromQuery}`, {
                    headers: { Authorization: `Bearer ${token}` },
                });
                if (!res.ok) return null;
                return res.json();
            }

            // Get today's date in Jakarta timezone
            const today = new Date();
            today.setHours(today.getHours() + 7); // Adjust to WIB
            const dateStr = today.toISOString().split("T")[0];

            const res = await fetch(`${API_URL}/absensi-kelas?jadwalId=${jadwalId}&startDate=${dateStr}&endDate=${dateStr}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) return null;
            const data = await res.json();
            if (data && data.length > 0) {
                 // Fetch the complete detail using the ID
                 const detailRes = await fetch(`${API_URL}/absensi-kelas/${data[0].id}`, {
                    headers: { Authorization: `Bearer ${token}` },
                 });
                 if (!detailRes.ok) return null;
                 return detailRes.json();
            }
            return null;
        },
        enabled: !!token && !!jadwalId && isEdit,
    });

    // Initialize state with students
    // For edit mode: wait for existingAbsensi first, then fill in missing students as HADIR
    // For create mode: set all students to HADIR immediately
    useEffect(() => {
        if (!jadwalData?.students) return;

        if (isEdit) {
            // In edit mode: only run after existingAbsensi has loaded (or confirmed null)
            if (isLoadingExisting) return; // wait for existing data

            if (existingAbsensi?.detailAbsensi) {
                // Load existing data
                const loadedAbsensi: Record<string, { status: string; keterangan: string }> = {};
                existingAbsensi.detailAbsensi.forEach((detail: any) => {
                    loadedAbsensi[detail.siswaId] = {
                        status: detail.status,
                        keterangan: detail.keterangan || "",
                    };
                });
                // Fill in any students not in existing data with HADIR (in case new students added)
                jadwalData.students.forEach((siswa: any) => {
                    if (!loadedAbsensi[siswa.id]) {
                        loadedAbsensi[siswa.id] = { status: "HADIR", keterangan: "" };
                    }
                });
                setDetailAbsensi(loadedAbsensi);

                // Load existing journal
                if (existingAbsensi.jurnalMengajar) {
                    setJurnal({
                        materiPembelajaran: existingAbsensi.jurnalMengajar.materiPembelajaran || "",
                        kegiatanPembelajaran: existingAbsensi.jurnalMengajar.kegiatanPembelajaran || "",
                        catatan: existingAbsensi.jurnalMengajar.catatan || "",
                    });
                }
            } else {
                // No existing data found despite edit mode — initialize all to HADIR
                const initialAbsensi: Record<string, { status: string; keterangan: string }> = {};
                jadwalData.students.forEach((siswa: any) => {
                    initialAbsensi[siswa.id] = { status: "HADIR", keterangan: "" };
                });
                setDetailAbsensi(initialAbsensi);
            }
        } else {
            // Create mode: initialize all to HADIR
            const initialAbsensi: Record<string, { status: string; keterangan: string }> = {};
            jadwalData.students.forEach((siswa: any) => {
                initialAbsensi[siswa.id] = { status: "HADIR", keterangan: "" };
            });
            setDetailAbsensi(initialAbsensi);
        }
    }, [jadwalData, existingAbsensi, isEdit, isLoadingExisting]);


    // Save mutation
    const saveMutation = useMutation({
        mutationFn: async (data: any) => {
            const method = isEdit && existingAbsensi?.id ? "PUT" : "POST";
            const url = isEdit && existingAbsensi?.id
                ? `${API_URL}/absensi-kelas/${existingAbsensi.id}`
                : `${API_URL}/absensi-kelas`;

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
                throw new Error(err.message || "Gagal menyimpan");
            }
            return res.json();
        },
        onSuccess: () => {
            toast({
                title: "Berhasil!",
                description: isEdit ? "Absensi berhasil diperbarui" : "Absensi berhasil disimpan",
            });
            queryClient.invalidateQueries({ queryKey: ["absensi-kelas"] });
            router.push("/absensi-kelas");
        },
        onError: (error: Error) => {
            toast({
                title: "Gagal",
                description: error.message,
                variant: "destructive",
            });
        },
    });

    const handleStatusChange = (siswaId: string, status: string) => {
        setDetailAbsensi(prev => ({
            ...prev,
            [siswaId]: { status, keterangan: prev[siswaId]?.keterangan || "" },
        }));
    };

    const handleKeteranganChange = (siswaId: string, keterangan: string) => {
        setDetailAbsensi(prev => ({
            ...prev,
            [siswaId]: { status: prev[siswaId]?.status || "HADIR", keterangan },
        }));
    };

    const handleSave = () => {
        // Validate jurnal
        if (!jurnal.materiPembelajaran.trim() || !jurnal.kegiatanPembelajaran.trim()) {
            toast({
                title: "Perhatian",
                description: "Harap isi Materi dan Kegiatan Pembelajaran",
                variant: "destructive",
            });
            return;
        }

        const today = new Date();
        const dateStr = today.toISOString().split("T")[0];

        const payload = {
            tanggal: dateStr,
            jadwalPelajaranId: jadwalId,
            detailAbsensi: Object.entries(detailAbsensi).map(([siswaId, data]) => ({
                siswaId,
                status: data.status,
                keterangan: data.keterangan || undefined,
            })),
            jurnalMengajar: jurnal,
        };

        saveMutation.mutate(payload);
    };

    const setAllStatus = (status: string) => {
        setDetailAbsensi(prev => {
            const updated: Record<string, { status: string; keterangan: string }> = {};
            Object.keys(prev).forEach(key => {
                updated[key] = { status, keterangan: prev[key]?.keterangan || "" };
            });
            return updated;
        });
    };

    // Count status
    const statusCounts = Object.values(detailAbsensi).reduce((acc, val) => {
        acc[val.status] = (acc[val.status] || 0) + 1;
        return acc;
    }, {} as Record<string, number>);

    if (role !== "GURU") {
        return (
            <div className="flex items-center justify-center min-h-[400px]">
                <Card className="max-w-md">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2 text-amber-600">
                            <AlertCircle />
                            Akses Terbatas
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <p className="text-muted-foreground">
                            Halaman ini hanya dapat diakses oleh guru.
                        </p>
                    </CardContent>
                </Card>
            </div>
        );
    }

    if (isLoadingJadwal) {
        return (
            <div className="flex items-center justify-center min-h-[400px]">
                <p className="text-muted-foreground">Memuat data...</p>
            </div>
        );
    }

    const jadwal = jadwalData?.jadwal;
    const students = jadwalData?.students || [];

    return (
        <div className="space-y-4 sm:space-y-6 p-3 sm:p-6 pb-36 sm:pb-6">
            {/* Header - More compact on mobile */}
            <div className="flex items-start gap-3 sm:gap-4">
                <Link href="/absensi-kelas">
                    <Button variant="ghost" size="icon" className="shrink-0 mt-1">
                        <ArrowLeft size={20} />
                    </Button>
                </Link>
                <div className="flex-1 min-w-0">
                    <h1 className="text-xl sm:text-2xl font-bold flex items-center gap-2">
                        <ClipboardCheck className="text-primary shrink-0" size={22} />
                        <span className="truncate">{isEdit ? "Edit Absensi" : "Input Absensi"}</span>
                    </h1>
                    <p className="text-sm text-muted-foreground truncate">
                        {jadwal?.kelas?.tingkat}-{jadwal?.kelas?.nama} • {jadwal?.mataPelajaran?.nama}
                    </p>
                </div>
            </div>

            {/* Jadwal Info - Single column on mobile */}
            <Card>
                <CardContent className="pt-4 sm:pt-6">
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-4">
                        <div className="flex items-center gap-3 p-2 rounded-lg bg-muted/50">
                            <Clock className="text-primary shrink-0" size={18} />
                            <div className="min-w-0">
                                <p className="text-xs text-muted-foreground">Jam Pelajaran</p>
                                <p className="font-medium text-sm">{jadwal?.jamMulai} - {jadwal?.jamSelesai}</p>
                            </div>
                        </div>
                        <div className="flex items-center gap-3 p-2 rounded-lg bg-muted/50">
                            <BookOpen className="text-primary shrink-0" size={18} />
                            <div className="min-w-0">
                                <p className="text-xs text-muted-foreground">Mata Pelajaran</p>
                                <p className="font-medium text-sm truncate">{jadwal?.mataPelajaran?.nama}</p>
                            </div>
                        </div>
                        <div className="flex items-center gap-3 p-2 rounded-lg bg-muted/50">
                            <Users className="text-primary shrink-0" size={18} />
                            <div className="min-w-0">
                                <p className="text-xs text-muted-foreground">Kelas</p>
                                <p className="font-medium text-sm">{jadwal?.kelas?.tingkat} - {jadwal?.kelas?.nama}</p>
                            </div>
                        </div>
                        <div className="flex items-center gap-3 p-2 rounded-lg bg-muted/50">
                            <Users className="text-primary shrink-0" size={18} />
                            <div className="min-w-0">
                                <p className="text-xs text-muted-foreground">Jumlah Siswa</p>
                                <p className="font-medium text-sm">{students.length} siswa</p>
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Status Summary - Better grid on mobile */}
            <Card>
                <CardHeader className="pb-2 px-3 sm:px-6">
                    <CardTitle className="text-base sm:text-lg">Ringkasan Status</CardTitle>
                </CardHeader>
                <CardContent className="px-3 sm:px-6">
                    <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 sm:gap-4">
                        {STATUS_OPTIONS.map((opt) => (
                            <div
                                key={opt.value}
                                className={`px-3 py-2 rounded-lg border text-center ${opt.color}`}
                            >
                                <span className="font-bold text-lg">{statusCounts[opt.value] || 0}</span>
                                <span className="ml-1 text-xs sm:text-sm">{opt.label}</span>
                            </div>
                        ))}
                    </div>
                    <div className="mt-4">
                        <p className="text-xs sm:text-sm text-muted-foreground mb-2">Set semua siswa:</p>
                        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                            {STATUS_OPTIONS.map((opt) => (
                                <Button
                                    key={opt.value}
                                    variant="outline"
                                    size="sm"
                                    onClick={() => setAllStatus(opt.value)}
                                    className="w-full text-xs sm:text-sm"
                                >
                                    {opt.label}
                                </Button>
                            ))}
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Student List - Mobile optimized cards */}
            <Card>
                <CardHeader className="px-3 sm:px-6">
                    <CardTitle className="flex items-center gap-2 text-base sm:text-lg">
                        <Users size={20} />
                        Daftar Siswa
                    </CardTitle>
                </CardHeader>
                <CardContent className="px-3 sm:px-6">
                    <div className="space-y-3">
                        {students.map((siswa: any, index: number) => (
                            <div
                                key={siswa.id}
                                className="p-3 rounded-lg border bg-card hover:bg-muted/50 transition"
                            >
                                {/* Student info row */}
                                <div className="flex items-center gap-2 mb-3">
                                    <span className="text-xs font-medium text-muted-foreground bg-muted rounded-full w-6 h-6 flex items-center justify-center shrink-0">
                                        {index + 1}
                                    </span>
                                    <div className="min-w-0 flex-1">
                                        <p className="font-medium text-sm truncate">{siswa.nama}</p>
                                        <p className="text-xs text-muted-foreground">{siswa.nisn}</p>
                                    </div>
                                </div>
                                {/* Status buttons - 2x2 grid on mobile, row on desktop */}
                                <div className="grid grid-cols-4 sm:flex sm:flex-wrap gap-1.5 sm:gap-2">
                                    {STATUS_OPTIONS.map((opt) => {
                                        const isSelected = detailAbsensi[siswa.id]?.status === opt.value;
                                        return (
                                            <Button
                                                key={opt.value}
                                                variant={isSelected ? "default" : "outline"}
                                                size="sm"
                                                onClick={() => handleStatusChange(siswa.id, opt.value)}
                                                className={`text-xs px-2 py-1.5 h-auto flex-1 sm:flex-none ${isSelected ? "" : "hover:bg-muted"}`}
                                            >
                                                {opt.value === "HADIR" && <CheckCircle2 size={12} className="mr-0.5 sm:mr-1 shrink-0" />}
                                                {opt.value === "ALPHA" && <XCircle size={12} className="mr-0.5 sm:mr-1 shrink-0" />}
                                                <span className="truncate">{opt.label}</span>
                                            </Button>
                                        );
                                    })}
                                </div>
                            </div>
                        ))}
                    </div>
                </CardContent>
            </Card>

            {/* Jurnal Mengajar */}
            <Card>
                <CardHeader className="px-3 sm:px-6">
                    <CardTitle className="flex items-center gap-2 text-base sm:text-lg">
                        <FileText size={20} />
                        Jurnal Mengajar
                    </CardTitle>
                    <CardDescription className="text-xs sm:text-sm">
                        Dokumentasi kegiatan pembelajaran hari ini
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4 px-3 sm:px-6">
                    <div>
                        <label className="block text-sm font-medium mb-2">
                            Materi Pembelajaran <span className="text-red-500">*</span>
                        </label>
                        <Textarea
                            placeholder="Tuliskan materi yang diajarkan hari ini..."
                            value={jurnal.materiPembelajaran}
                            onChange={(e) => setJurnal(prev => ({ ...prev, materiPembelajaran: e.target.value }))}
                            rows={3}
                            className="text-sm"
                        />
                    </div>
                    <div>
                        <label className="block text-sm font-medium mb-2">
                            Kegiatan Pembelajaran <span className="text-red-500">*</span>
                        </label>
                        <Textarea
                            placeholder="Tuliskan kegiatan pembelajaran yang dilakukan..."
                            value={jurnal.kegiatanPembelajaran}
                            onChange={(e) => setJurnal(prev => ({ ...prev, kegiatanPembelajaran: e.target.value }))}
                            rows={3}
                            className="text-sm"
                        />
                    </div>
                    <div>
                        <label className="block text-sm font-medium mb-2">
                            Catatan / Evaluasi (Opsional)
                        </label>
                        <Textarea
                            placeholder="Catatan tambahan atau evaluasi pembelajaran..."
                            value={jurnal.catatan}
                            onChange={(e) => setJurnal(prev => ({ ...prev, catatan: e.target.value }))}
                            rows={2}
                            className="text-sm"
                        />
                    </div>
                </CardContent>
            </Card>

            {/* Desktop Action Buttons */}
            <div className="hidden sm:flex gap-4 justify-end">
                <Link href="/absensi-kelas">
                    <Button variant="outline">Batal</Button>
                </Link>
                <Button onClick={handleSave} disabled={saveMutation.isPending}>
                    <Save size={16} className="mr-2" />
                    {saveMutation.isPending ? "Menyimpan..." : "Simpan Absensi & Jurnal"}
                </Button>
            </div>

            {/* Mobile Fixed Bottom Action Bar - positioned above MobileBottomNav */}
            <div className="fixed bottom-16 left-0 right-0 p-3 bg-background/95 backdrop-blur border-t sm:hidden z-[60]">
                <div className="flex gap-2 max-w-lg mx-auto">
                    <Link href="/absensi-kelas" className="flex-1">
                        <Button variant="outline" className="w-full">Batal</Button>
                    </Link>
                    <Button
                        onClick={handleSave}
                        disabled={saveMutation.isPending}
                        className="flex-[2]"
                    >
                        <Save size={16} className="mr-2" />
                        {saveMutation.isPending ? "Menyimpan..." : "Simpan"}
                    </Button>
                </div>
            </div>
        </div>
    );
}
