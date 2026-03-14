"use client";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import Link from "next/link";
import {
    ClipboardCheck,
    Clock,
    BookOpen,
    Users,
    CheckCircle2,
    AlertCircle,
    FileText,
    ChevronRight
} from "lucide-react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { API_URL } from "@/lib/api";
import { useRole } from "../role-context";

// Helper function to format date to Indonesian format
function formatTanggalIndonesia(dateStr: string | undefined): string {
    if (!dateStr) return "-";
    const months = [
        "Januari", "Februari", "Maret", "April", "Mei", "Juni",
        "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    const parts = dateStr.split("-");
    if (parts.length < 3) return dateStr;
    const [year, month, day] = parts as [string, string, string];
    const monthIndex = parseInt(month, 10) - 1;
    return `${parseInt(day, 10)} ${months[monthIndex]} ${year}`;
}

const HARI_LABEL: Record<string, string> = {
    SENIN: "Senin",
    SELASA: "Selasa",
    RABU: "Rabu",
    KAMIS: "Kamis",
    JUMAT: "Jumat",
    SABTU: "Sabtu",
};

export default function AbsensiKelasPage() {
    const { token, role } = useRole();
    const [showAllHistory, setShowAllHistory] = useState(false);

    // Fetch today's jadwal with absensi status
    const { data: jadwalToday, isLoading } = useQuery({
        queryKey: ["absensi-kelas-my-today"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/absensi-kelas/my-today`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Failed to fetch");
            return res.json();
        },
        enabled: !!token && role === "GURU",
    });

    // Fetch absensi history 
    const { data: absensiHistory } = useQuery({
        queryKey: ["absensi-kelas-history"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/absensi-kelas`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Failed to fetch");
            return res.json();
        },
        enabled: !!token && role === "GURU",
    });

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
                            Halaman ini hanya dapat diakses oleh guru. Silakan login dengan akun guru.
                        </p>
                    </CardContent>
                </Card>
            </div>
        );
    }

    const todayDate = new Date().toLocaleDateString("id-ID", {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
    });

    const jadwalList = Array.isArray(jadwalToday) ? jadwalToday : [];
    const sudahAbsen = jadwalList.filter((j: any) => j.sudahAbsen).length;
    const belumAbsen = jadwalList.filter((j: any) => !j.sudahAbsen).length;

    return (
        <div className="space-y-4 sm:space-y-6 p-3 sm:p-6">
            {/* Header - More compact on mobile */}
            <div>
                <h1 className="text-xl sm:text-3xl font-bold flex items-center gap-2 sm:gap-3">
                    <ClipboardCheck className="text-primary shrink-0" size={24} />
                    Absensi Kelas
                </h1>
                <p className="text-sm text-muted-foreground mt-1">
                    Absensi siswa dan jurnal mengajar
                </p>
            </div>

            {/* Today's Date - Improved mobile layout */}
            <Card className="bg-gradient-to-r from-primary/10 to-primary/5 border-primary/20">
                <CardHeader className="pb-2 px-3 sm:px-6">
                    <CardTitle className="text-base sm:text-lg">Hari Ini</CardTitle>
                    <CardDescription className="text-base sm:text-lg font-medium text-foreground">
                        {todayDate}
                    </CardDescription>
                </CardHeader>
                <CardContent className="px-3 sm:px-6">
                    <div className="flex gap-4 sm:gap-6">
                        <div className="flex items-center gap-2">
                            <CheckCircle2 className="text-green-500 shrink-0" size={18} />
                            <span className="text-xs sm:text-sm">
                                <strong>{sudahAbsen}</strong> sudah diisi
                            </span>
                        </div>
                        <div className="flex items-center gap-2">
                            <AlertCircle className="text-amber-500 shrink-0" size={18} />
                            <span className="text-xs sm:text-sm">
                                <strong>{belumAbsen}</strong> belum diisi
                            </span>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Today's Schedule - Mobile optimized cards */}
            <Card>
                <CardHeader className="px-3 sm:px-6">
                    <CardTitle className="flex items-center gap-2 text-base sm:text-lg">
                        <Clock size={18} />
                        Jadwal Mengajar Hari Ini
                    </CardTitle>
                </CardHeader>
                <CardContent className="px-3 sm:px-6">
                    {isLoading ? (
                        <div className="text-center py-8 text-muted-foreground text-sm">
                            Memuat jadwal...
                        </div>
                    ) : jadwalList.length === 0 ? (
                        <div className="text-center py-8 text-muted-foreground text-sm">
                            Tidak ada jadwal mengajar hari ini
                        </div>
                    ) : (
                        <div className="space-y-3">
                            {jadwalList.map((jadwal: any) => (
                                <div
                                    key={jadwal.id}
                                    className={`p-3 sm:p-4 rounded-lg border transition ${jadwal.sudahAbsen
                                        ? "bg-green-500/5 border-green-500/30"
                                        : "bg-amber-500/5 border-amber-500/30"
                                        }`}
                                >
                                    {/* Mobile: Stacked layout, Desktop: Flex row */}
                                    <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                                        {/* Top row on mobile: Time + Subject info */}
                                        <div className="flex items-start gap-3">
                                            {/* Time block */}
                                            <div className="text-center min-w-[60px] sm:min-w-[80px] shrink-0 bg-background/50 rounded-lg p-2">
                                                <p className="text-base sm:text-lg font-bold">{jadwal.jamMulai}</p>
                                                <p className="text-[10px] sm:text-xs text-muted-foreground">
                                                    - {jadwal.jamSelesai}
                                                </p>
                                                {jadwal.jumlahJP > 1 && (
                                                    <span className="inline-block mt-1 text-[9px] sm:text-[10px] font-bold bg-primary/20 text-primary px-1.5 py-0.5 rounded">
                                                        {jadwal.jumlahJP} JP
                                                    </span>
                                                )}
                                            </div>
                                            {/* Subject & Class info */}
                                            <div className="flex-1 min-w-0">
                                                <p className="font-semibold text-sm sm:text-base flex items-center gap-1.5 truncate">
                                                    <BookOpen size={14} className="text-primary shrink-0" />
                                                    <span className="truncate">{jadwal.mataPelajaran?.nama}</span>
                                                </p>
                                                <p className="text-xs sm:text-sm text-muted-foreground flex items-center gap-1.5 mt-0.5">
                                                    <Users size={12} className="shrink-0" />
                                                    {jadwal.kelas?.tingkat} - {jadwal.kelas?.nama}
                                                </p>
                                                {/* Status indicator on mobile only */}
                                                {jadwal.sudahAbsen && (
                                                    <div className="mt-2 sm:hidden">
                                                        <p className="text-green-600 font-medium text-xs flex items-center gap-1">
                                                            <CheckCircle2 size={12} />
                                                            Sudah Diisi • {jadwal.absensi?.jumlahSiswa} siswa
                                                            {jadwal.absensi?.hasJurnal && (
                                                                <span className="ml-1">
                                                                    <FileText size={10} className="inline" /> Jurnal ✓
                                                                </span>
                                                            )}
                                                        </p>
                                                    </div>
                                                )}
                                            </div>
                                        </div>

                                        {/* Actions */}
                                        <div className="flex items-center justify-end gap-2 sm:gap-3">
                                            {jadwal.sudahAbsen ? (
                                                <>
                                                    {/* Desktop only: Status text */}
                                                    <div className="hidden sm:block text-right text-sm">
                                                        <p className="text-green-600 font-medium flex items-center gap-1">
                                                            <CheckCircle2 size={14} />
                                                            Sudah Diisi
                                                        </p>
                                                        <p className="text-xs text-muted-foreground">
                                                            {jadwal.absensi?.jumlahSiswa} siswa
                                                            {jadwal.absensi?.hasJurnal && (
                                                                <span className="ml-2">
                                                                    <FileText size={12} className="inline" /> Jurnal ✓
                                                                </span>
                                                            )}
                                                        </p>
                                                    </div>
                                                    <Link href={`/absensi-kelas/${jadwal.id}?edit=true&absensiId=${jadwal.absensi?.id}`} className="flex-1 sm:flex-none">
                                                        <Button variant="outline" size="sm" className="w-full sm:w-auto">
                                                            Edit
                                                        </Button>
                                                    </Link>
                                                </>
                                            ) : (
                                                <Link href={`/absensi-kelas/${jadwal.id}`} className="flex-1 sm:flex-none">
                                                    <Button size="sm" className="w-full sm:w-auto">
                                                        Isi Absensi
                                                    </Button>
                                                </Link>
                                            )}
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Recent History - Mobile optimized */}
            <Card>
                <CardHeader className="px-3 sm:px-6">
                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
                        <CardTitle className="flex items-center gap-2 text-base sm:text-lg">
                            <FileText size={18} />
                            <span className="hidden sm:inline">Semua Riwayat Absensi</span>
                            <span className="sm:hidden">Semua Riwayat</span>
                        </CardTitle>
                        <Link href="/absensi-kelas/rekap">
                            <Button variant="outline" size="sm" className="text-xs sm:text-sm">
                                Lihat Rekap
                            </Button>
                        </Link>
                    </div>
                </CardHeader>
                <CardContent className="px-3 sm:px-6">
                    {!absensiHistory || absensiHistory.length === 0 ? (
                        <div className="text-center py-8 text-muted-foreground text-sm">
                            Belum ada riwayat absensi
                        </div>
                    ) : (
                        <div className="space-y-2">
                            {absensiHistory.slice(0, showAllHistory ? undefined : 5).map((absensi: any) => (
                                <div
                                    key={absensi.id}
                                    className="p-3 rounded-lg border hover:bg-muted/50 transition"
                                >
                                    <div className="flex items-start sm:items-center justify-between gap-2">
                                        <div className="flex-1 min-w-0">
                                            <p className="font-medium text-sm truncate">
                                                {absensi.mataPelajaran?.nama} - {absensi.kelas?.tingkat} {absensi.kelas?.nama}
                                            </p>
                                            <p className="text-xs text-muted-foreground mt-0.5">
                                                {formatTanggalIndonesia(absensi.tanggal)} • {absensi._count?.detailAbsensi || 0} siswa
                                            </p>
                                        </div>
                                        <div className="flex items-center gap-1.5 sm:gap-2 shrink-0">
                                            {absensi.jurnalMengajar && (
                                                <span className="text-[10px] sm:text-xs bg-primary/10 text-primary px-1.5 sm:px-2 py-0.5 sm:py-1 rounded">
                                                    <FileText size={10} className="inline mr-0.5 sm:mr-1" />
                                                    <span className="hidden sm:inline">Jurnal</span>
                                                </span>
                                            )}
                                            <Link href={`/absensi-kelas/${absensi.jadwalPelajaranId}?edit=true&absensiId=${absensi.id}`}>
                                                <Button variant="outline" size="sm" className="h-7 px-2 sm:h-8 sm:px-3 text-xs">
                                                    Detail
                                                    <ChevronRight size={14} className="ml-0.5" />
                                                </Button>
                                            </Link>
                                        </div>
                                    </div>
                                </div>
                            ))}

                            {absensiHistory.length > 5 && (
                                <div className="pt-2 flex justify-center">
                                    <Button
                                        variant="ghost"
                                        size="sm"
                                        className="text-muted-foreground hover:text-primary w-full sm:w-auto"
                                        onClick={() => setShowAllHistory(!showAllHistory)}
                                    >
                                        {showAllHistory ? "Tampilkan Lebih Sedikit" : `Tampilkan Semua (${absensiHistory.length})`}
                                    </Button>
                                </div>
                            )}
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
