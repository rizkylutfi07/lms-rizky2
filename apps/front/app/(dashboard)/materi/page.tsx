"use client";

import { useState, useEffect } from "react";
import { BookOpen, Calendar, Download, FileText, Video, Link2, Image, Search, Filter, User } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { cn } from "@/lib/utils";
import { useRole } from "../role-context";
import { materiApi } from "@/lib/api";

const tipeIcons = {
    DOKUMEN: FileText,
    VIDEO: Video,
    LINK: Link2,
    GAMBAR: Image,
    TEKS: FileText,
};

const tipeColors = {
    DOKUMEN: "from-blue-500/20 to-cyan-500/10",
    VIDEO: "from-pink-500/20 to-rose-500/10",
    LINK: "from-purple-500/20 to-indigo-500/10",
    GAMBAR: "from-green-500/20 to-emerald-500/10",
    TEKS: "from-amber-500/20 to-yellow-500/10",
};

export default function MateriPage() {
    const { role, ready } = useRole();
    const [materiList, setMateriList] = useState<any[]>([]);
    const [filteredMateri, setFilteredMateri] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchQuery, setSearchQuery] = useState("");
    const [selectedMapel, setSelectedMapel] = useState<string>("all");
    const [selectedGuru, setSelectedGuru] = useState<string>("all");
    const [selectedTipe, setSelectedTipe] = useState<string>("all");
    const [mataPelajaranList, setMataPelajaranList] = useState<any[]>([]);
    const [guruList, setGuruList] = useState<any[]>([]);

    useEffect(() => {
        loadMateri();
    }, []);

    useEffect(() => {
        filterMateri();
    }, [materiList, searchQuery, selectedMapel, selectedGuru, selectedTipe]);

    const loadMateri = async () => {
        try {
            setLoading(true);
            const response = await materiApi.getAll({});
            const data = Array.isArray(response) ? response : ((response as any).data || []);
            setMateriList(data);
            
            // Extract unique mata pelajaran and guru from materi data
            const uniqueMapel = Array.from(
                new Map(data.filter((m: any) => m.mataPelajaran).map((m: any) => [m.mataPelajaran.id, m.mataPelajaran])).values()
            );
            const uniqueGuru = Array.from(
                new Map(data.filter((m: any) => m.guru).map((m: any) => [m.guru.id, m.guru])).values()
            );
            
            setMataPelajaranList(uniqueMapel as any[]);
            setGuruList(uniqueGuru as any[]);
        } catch (error) {
            console.error("Error loading materi:", error);
        } finally {
            setLoading(false);
        }
    };

    const filterMateri = () => {
        let filtered = [...materiList];

        // Filter by search query
        if (searchQuery) {
            filtered = filtered.filter((m) =>
                m.judul?.toLowerCase().includes(searchQuery.toLowerCase()) ||
                m.deskripsi?.toLowerCase().includes(searchQuery.toLowerCase())
            );
        }

        // Filter by mata pelajaran
        if (selectedMapel && selectedMapel !== "all") {
            filtered = filtered.filter((m) => m.mataPelajaranId === selectedMapel);
        }

        // Filter by guru
        if (selectedGuru && selectedGuru !== "all") {
            filtered = filtered.filter((m) => m.guruId === selectedGuru);
        }

        // Filter by tipe
        if (selectedTipe && selectedTipe !== "all") {
            filtered = filtered.filter((m) => m.tipe === selectedTipe);
        }

        setFilteredMateri(filtered);
    };

    // Wait for auth to be ready
    if (!ready || loading) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <p className="text-muted-foreground">Loading...</p>
            </div>
        );
    }

    // For GURU and ADMIN, show management interface placeholder
    if (role === "GURU" || role === "ADMIN") {
        return (
            <div className="space-y-6">
                <Card className="border-primary/30 bg-gradient-to-br from-primary/10 via-card/60 to-background/80">
                    <CardHeader>
                        <div className="flex flex-wrap items-center gap-3">
                            <Badge tone="info" className="gap-2">
                                <BookOpen size={14} />
                                Kelola Materi
                            </Badge>
                        </div>
                        <CardTitle className="text-3xl">Manajemen Materi Pelajaran</CardTitle>
                        <CardDescription className="text-base">
                            Kelola dan upload materi pembelajaran untuk siswa
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="rounded-lg border border-primary/20 bg-primary/5 p-6 text-center">
                            <BookOpen className="mx-auto h-12 w-12 text-primary mb-4" />
                            <p className="text-lg font-semibold mb-2">Halaman Manajemen Materi</p>
                            <p className="text-sm text-muted-foreground mb-4">
                                Interface untuk guru mengelola materi sedang dalam pengembangan.
                                <br />
                                Sementara ini, Anda dapat menggunakan API endpoint untuk mengelola materi.
                            </p>
                            <div className="flex flex-wrap gap-2 justify-center">
                                <Button>Upload Materi Baru</Button>
                                <Button variant="outline">Lihat Semua Materi</Button>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>
        );
    }

    // Student view
    return (
        <div className="space-y-6">
            {/* Header */}
            <Card className="border-primary/30 bg-gradient-to-br from-primary/10 via-card/60 to-background/80">
                <CardHeader>
                    <div className="flex flex-wrap items-center gap-3">
                        <Badge tone="info" className="gap-2">
                            <BookOpen size={14} />
                            Materi Pelajaran
                        </Badge>
                        <Badge tone="success">{filteredMateri.length} materi tersedia</Badge>
                    </div>
                    <CardTitle className="text-3xl">Bank Materi Pembelajaran</CardTitle>
                    <CardDescription className="text-base">
                        Akses semua materi pembelajaran dari berbagai mata pelajaran
                    </CardDescription>
                </CardHeader>
            </Card>

            {/* Search and Filters */}
            <Card>
                <CardHeader>
                    <CardTitle className="text-lg flex items-center gap-2">
                        <Filter size={20} />
                        Pencarian & Filter
                    </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                    {/* Search Bar */}
                    <div className="relative">
                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                        <Input
                            placeholder="Cari materi berdasarkan judul atau deskripsi..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="pl-10"
                        />
                    </div>

                    {/* Filters */}
                    <div className="grid gap-4 sm:grid-cols-3">
                        <div className="space-y-2">
                            <label className="text-sm font-medium flex items-center gap-2">
                                <BookOpen size={14} />
                                Mata Pelajaran
                            </label>
                            <Select value={selectedMapel} onValueChange={setSelectedMapel}>
                                <SelectTrigger>
                                    <SelectValue placeholder="Semua Mapel" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">Semua Mapel</SelectItem>
                                    {mataPelajaranList.map((mapel) => (
                                        <SelectItem key={mapel.id} value={mapel.id}>
                                            {mapel.nama}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium flex items-center gap-2">
                                <User size={14} />
                                Guru Pengampu
                            </label>
                            <Select value={selectedGuru} onValueChange={setSelectedGuru}>
                                <SelectTrigger>
                                    <SelectValue placeholder="Semua Guru" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">Semua Guru</SelectItem>
                                    {guruList.map((guru) => (
                                        <SelectItem key={guru.id} value={guru.id}>
                                            {guru.nama}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <label className="text-sm font-medium flex items-center gap-2">
                                <FileText size={14} />
                                Tipe Materi
                            </label>
                            <Select value={selectedTipe} onValueChange={setSelectedTipe}>
                                <SelectTrigger>
                                    <SelectValue placeholder="Semua Tipe" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">Semua Tipe</SelectItem>
                                    <SelectItem value="DOKUMEN">Dokumen</SelectItem>
                                    <SelectItem value="VIDEO">Video</SelectItem>
                                    <SelectItem value="LINK">Link</SelectItem>
                                    <SelectItem value="TEKS">Teks</SelectItem>
                                    <SelectItem value="GAMBAR">Gambar</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                    </div>

                    {/* Active Filters Summary */}
                    {(searchQuery || selectedMapel !== "all" || selectedGuru !== "all" || selectedTipe !== "all") && (
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <span>Filter aktif:</span>
                            {searchQuery && <Badge>"{searchQuery}"</Badge>}
                            {selectedMapel !== "all" && (
                                <Badge>
                                    {mataPelajaranList.find(m => m.id === selectedMapel)?.nama}
                                </Badge>
                            )}
                            {selectedGuru !== "all" && (
                                <Badge>
                                    {guruList.find(g => g.id === selectedGuru)?.nama}
                                </Badge>
                            )}
                            {selectedTipe !== "all" && <Badge>{selectedTipe}</Badge>}
                            <Button
                                variant="ghost"
                                size="sm"
                                onClick={() => {
                                    setSearchQuery("");
                                    setSelectedMapel("all");
                                    setSelectedGuru("all");
                                    setSelectedTipe("all");
                                }}
                            >
                                Reset Filter
                            </Button>
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Stats Cards */}
            <div className="grid gap-4 sm:grid-cols-3">
                <Card className="bg-gradient-to-br from-blue-500/10 to-cyan-500/5">
                    <CardContent className="pt-6">
                        <div className="flex items-center gap-3">
                            <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-blue-500/20">
                                <BookOpen className="h-6 w-6 text-blue-500" />
                            </div>
                            <div>
                                <p className="text-2xl font-bold">{materiList.length}</p>
                                <p className="text-sm text-muted-foreground">Total Materi</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-purple-500/10 to-indigo-500/5">
                    <CardContent className="pt-6">
                        <div className="flex items-center gap-3">
                            <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-purple-500/20">
                                <Filter className="h-6 w-6 text-purple-500" />
                            </div>
                            <div>
                                <p className="text-2xl font-bold">{filteredMateri.length}</p>
                                <p className="text-sm text-muted-foreground">Hasil Filter</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-green-500/10 to-emerald-500/5">
                    <CardContent className="pt-6">
                        <div className="flex items-center gap-3">
                            <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-green-500/20">
                                <User className="h-6 w-6 text-green-500" />
                            </div>
                            <div>
                                <p className="text-2xl font-bold">{mataPelajaranList.length}</p>
                                <p className="text-sm text-muted-foreground">Mata Pelajaran</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Materi List */}
            {filteredMateri.length === 0 ? (
                <Card>
                    <CardContent className="pt-6 text-center py-12">
                        <BookOpen className="mx-auto h-12 w-12 text-muted-foreground mb-4" />
                        <p className="text-lg font-semibold mb-2">Tidak ada materi ditemukan</p>
                        <p className="text-sm text-muted-foreground">
                            {searchQuery || selectedMapel !== "all" || selectedGuru !== "all" || selectedTipe !== "all"
                                ? "Coba ubah filter pencarian Anda"
                                : "Belum ada materi yang tersedia"}
                        </p>
                    </CardContent>
                </Card>
            ) : (
                <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                    {filteredMateri.map((materi) => {
                        const TipeIcon = tipeIcons[materi.tipe as keyof typeof tipeIcons];
                        const gradientClass = tipeColors[materi.tipe as keyof typeof tipeColors];

                        return (
                            <Card
                                key={materi.id}
                                className="group relative overflow-hidden transition-all hover:shadow-lg hover:shadow-primary/10"
                            >
                                {/* Gradient Background */}
                                <div
                                    className={cn(
                                        "absolute inset-0 bg-gradient-to-br opacity-50 transition-opacity group-hover:opacity-70",
                                        gradientClass
                                    )}
                                />

                                <CardHeader className="relative">
                                    <div className="flex items-start justify-between gap-2">
                                        <div className="flex items-center gap-2">
                                            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/15">
                                                <TipeIcon size={20} className="text-primary" />
                                            </div>
                                            <Badge tone="info" className="text-xs">
                                                {materi.tipe}
                                            </Badge>
                                        </div>
                                    </div>
                                    <CardTitle className="mt-2 line-clamp-2">{materi.judul}</CardTitle>
                                    <CardDescription className="line-clamp-2">
                                        {materi.deskripsi || "Tidak ada deskripsi"}
                                    </CardDescription>
                                </CardHeader>

                                <CardContent className="relative space-y-4">
                                    <div className="space-y-2 text-sm">
                                        <div className="flex items-center gap-2 text-muted-foreground">
                                            <BookOpen size={14} />
                                            <span className="truncate">{materi.mataPelajaran?.nama || "N/A"}</span>
                                        </div>
                                        <div className="flex items-center gap-2 text-muted-foreground">
                                            <User size={14} />
                                            <span className="truncate">{materi.guru?.nama || "N/A"}</span>
                                        </div>
                                        <div className="flex items-center gap-2 text-muted-foreground">
                                            <Calendar size={14} />
                                            <span>{new Date(materi.createdAt).toLocaleDateString("id-ID")}</span>
                                        </div>
                                    </div>

                                    <div className="flex flex-wrap gap-2">
                                        <Button
                                            size="sm"
                                            className="flex-1 gap-2"
                                            onClick={() => window.location.href = `/materi/${materi.id}`}
                                        >
                                            <BookOpen size={16} />
                                            Buka Materi
                                        </Button>
                                        {materi.attachments && materi.attachments.length > 0 && (
                                            <Button size="sm" variant="outline" className="gap-2">
                                                <Download size={16} />
                                                {materi.attachments.length}
                                            </Button>
                                        )}
                                    </div>

                                    {materi.attachments && materi.attachments.length > 0 && (
                                        <div className="rounded-lg border border-white/10 bg-muted/30 p-2">
                                            <p className="text-xs text-muted-foreground truncate">
                                                📎 {materi.attachments[0].namaFile}
                                            </p>
                                        </div>
                                    )}
                                </CardContent>
                            </Card>
                        );
                    })}
                </div>
            )}
        </div>
    );
}
