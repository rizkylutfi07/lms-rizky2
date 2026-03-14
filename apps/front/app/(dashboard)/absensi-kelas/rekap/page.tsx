"use client";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import Link from "next/link";
import {
    ArrowLeft,
    BarChart3,
    Download,
    Users
} from "lucide-react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { SearchableSelect } from "@/components/ui/searchable-select";
import { API_URL } from "@/lib/api";
import { useRole } from "../../role-context";

export default function AbsensiKelasRekapPage() {
    const { token, role } = useRole();
    const [kelasId, setKelasId] = useState<string>("");
    const [mataPelajaranId, setMataPelajaranId] = useState<string>("");

    // Get date range (last 30 days default)
    const endDate = new Date().toISOString().split("T")[0];
    const startDate = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split("T")[0];
    const [dateRange, setDateRange] = useState({ startDate, endDate });

    // Fetch kelas list
    const { data: kelasList } = useQuery({
        queryKey: ["kelas-list"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/kelas?limit=100`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    // Fetch mata pelajaran list
    const { data: mapelList } = useQuery({
        queryKey: ["mapel-list"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/mata-pelajaran?limit=100`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        enabled: !!token,
    });

    // Fetch rekap data
    const { data: rekapData, isLoading } = useQuery({
        queryKey: ["absensi-kelas-rekap", kelasId, mataPelajaranId, dateRange],
        queryFn: async () => {
            const params = new URLSearchParams();
            if (kelasId) params.append("kelasId", kelasId);
            if (mataPelajaranId) params.append("mataPelajaranId", mataPelajaranId);
            if (dateRange.startDate) params.append("startDate", dateRange.startDate);
            if (dateRange.endDate) params.append("endDate", dateRange.endDate);

            const res = await fetch(`${API_URL}/absensi-kelas/rekap?${params.toString()}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Failed to fetch");
            return res.json();
        },
        enabled: !!token && (role === "GURU" || role === "ADMIN"),
    });

    const kelasOptions = (kelasList?.data || []).map((k: any) => ({
        value: k.id,
        label: `${k.tingkat} - ${k.nama}`,
    }));

    const mapelOptions = (mapelList?.data || []).map((m: any) => ({
        value: m.id,
        label: m.nama,
    }));

    const rekapList = Array.isArray(rekapData) ? rekapData : [];

    return (
        <div className="space-y-6 p-6">
            {/* Header */}
            <div className="flex items-center gap-4">
                <Link href="/absensi-kelas">
                    <Button variant="ghost" size="icon">
                        <ArrowLeft size={20} />
                    </Button>
                </Link>
                <div className="flex-1">
                    <h1 className="text-2xl font-bold flex items-center gap-2">
                        <BarChart3 className="text-primary" />
                        Rekap Absensi Kelas
                    </h1>
                    <p className="text-muted-foreground">
                        Rekapitulasi kehadiran siswa per mata pelajaran
                    </p>
                </div>
            </div>

            {/* Filters */}
            <Card>
                <CardHeader>
                    <CardTitle>Filter</CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                        <div>
                            <label className="block text-sm font-medium mb-2">Kelas</label>
                            <SearchableSelect
                                options={[{ value: "", label: "Semua Kelas" }, ...kelasOptions]}
                                value={kelasId}
                                onChange={setKelasId}
                                placeholder="Pilih kelas..."
                            />
                        </div>
                        <div>
                            <label className="block text-sm font-medium mb-2">Mata Pelajaran</label>
                            <SearchableSelect
                                options={[{ value: "", label: "Semua Mapel" }, ...mapelOptions]}
                                value={mataPelajaranId}
                                onChange={setMataPelajaranId}
                                placeholder="Pilih mapel..."
                            />
                        </div>
                        <div>
                            <label className="block text-sm font-medium mb-2">Dari Tanggal</label>
                            <input
                                type="date"
                                value={dateRange.startDate}
                                onChange={(e) => setDateRange(prev => ({ ...prev, startDate: e.target.value }))}
                                className="w-full rounded-lg border border-border bg-background px-3 py-2 text-sm"
                            />
                        </div>
                        <div>
                            <label className="block text-sm font-medium mb-2">Sampai Tanggal</label>
                            <input
                                type="date"
                                value={dateRange.endDate}
                                onChange={(e) => setDateRange(prev => ({ ...prev, endDate: e.target.value }))}
                                className="w-full rounded-lg border border-border bg-background px-3 py-2 text-sm"
                            />
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Rekap Table */}
            <Card>
                <CardHeader>
                    <div className="flex items-center justify-between">
                        <div>
                            <CardTitle className="flex items-center gap-2">
                                <Users size={20} />
                                Rekapitulasi Per Siswa
                            </CardTitle>
                            <CardDescription>
                                {rekapList.length} siswa ditemukan
                            </CardDescription>
                        </div>
                    </div>
                </CardHeader>
                <CardContent>
                    {isLoading ? (
                        <div className="text-center py-8 text-muted-foreground">
                            Memuat data...
                        </div>
                    ) : rekapList.length === 0 ? (
                        <div className="text-center py-8 text-muted-foreground">
                            Tidak ada data absensi untuk filter yang dipilih
                        </div>
                    ) : (
                        <div className="overflow-x-auto">
                            <table className="w-full">
                                <thead>
                                    <tr className="border-b">
                                        <th className="text-left p-3 font-medium">No</th>
                                        <th className="text-left p-3 font-medium">Nama Siswa</th>
                                        <th className="text-left p-3 font-medium">Kelas</th>
                                        <th className="text-center p-3 font-medium">Hadir</th>
                                        <th className="text-center p-3 font-medium">Izin</th>
                                        <th className="text-center p-3 font-medium">Sakit</th>
                                        <th className="text-center p-3 font-medium">Alpha</th>
                                        <th className="text-center p-3 font-medium">Total</th>
                                        <th className="text-center p-3 font-medium">% Hadir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {rekapList.map((item: any, index: number) => (
                                        <tr key={item.siswa?.id} className="border-b hover:bg-muted/50">
                                            <td className="p-3 text-muted-foreground">{index + 1}</td>
                                            <td className="p-3 font-medium">{item.siswa?.nama}</td>
                                            <td className="p-3">{item.siswa?.kelas?.tingkat} - {item.siswa?.kelas?.nama}</td>
                                            <td className="p-3 text-center text-green-600 font-medium">{item.hadir}</td>
                                            <td className="p-3 text-center text-blue-600">{item.izin}</td>
                                            <td className="p-3 text-center text-amber-600">{item.sakit}</td>
                                            <td className="p-3 text-center text-red-600">{item.alpha}</td>
                                            <td className="p-3 text-center font-medium">{item.total}</td>
                                            <td className="p-3 text-center">
                                                <span className={`px-2 py-1 rounded text-sm font-medium ${parseFloat(item.persentaseHadir) >= 80
                                                    ? "bg-green-500/10 text-green-600"
                                                    : parseFloat(item.persentaseHadir) >= 60
                                                        ? "bg-amber-500/10 text-amber-600"
                                                        : "bg-red-500/10 text-red-600"
                                                    }`}>
                                                    {item.persentaseHadir}%
                                                </span>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
