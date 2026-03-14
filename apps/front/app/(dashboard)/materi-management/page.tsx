"use client";

import { useState, useEffect } from "react";
import Link from "next/link";

import { useForm } from "react-hook-form";
import { BookOpen, Plus, Pencil, Trash2, Eye, Download, Loader2, Sparkles, Wand2 } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog";
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
import {
    Form,
    FormControl,
    FormDescription,
    FormField,
    FormItem,
    FormLabel,
    FormMessage,
} from "@/components/ui/form";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { materiApi, mataPelajaranApi, kelasApi, guruApi } from "@/lib/api";
import { useRole } from "../role-context";
import { useToast } from "@/hooks/use-toast";
import { useAiMateriGenerator } from "@/hooks/use-ai-materi-generator";
import RichTextEditor from "@/components/ui/rich-text-editor";

const TIPE_MATERI = [
    { value: "DOKUMEN", label: "Dokumen", icon: "📄" },
    { value: "VIDEO", label: "Video", icon: "🎥" },
    { value: "LINK", label: "Link/URL", icon: "🔗" },
    { value: "GAMBAR", label: "Gambar", icon: "🖼️" },
    { value: "TEKS", label: "Teks", icon: "📝" },
];

export default function MateriManagementPage() {
    const { user, role, ready } = useRole();
    const { toast } = useToast();
    const [materiList, setMateriList] = useState<any[]>([]);
    const [mataPelajaranList, setMataPelajaranList] = useState<any[]>([]);
    const [kelasList, setKelasList] = useState<any[]>([]);
    const [guruList, setGuruList] = useState<any[]>([]);
    const [filteredGuruList, setFilteredGuruList] = useState<any[]>([]);
    const [guruSearch, setGuruSearch] = useState("");
    const [mapelSearch, setMapelSearch] = useState("");
    const [selectedFile, setSelectedFile] = useState<File | null>(null);
    const [loading, setLoading] = useState(true);
    const [isSaving, setIsSaving] = useState(false);
    const [dialogOpen, setDialogOpen] = useState(false);
    const [editingId, setEditingId] = useState<string | null>(null);
    const [editingMateri, setEditingMateri] = useState<any | null>(null);
    const [deleteDialogOpen, setDeleteDialogOpen] = useState(false);
    const [deletingId, setDeletingId] = useState<string | null>(null);


    // AI Generation state
    const { generateMateri, isGenerating, error: aiError } = useAiMateriGenerator();
    const [showAiForm, setShowAiForm] = useState(false);
    const [aiTopik, setAiTopik] = useState("");
    const [aiTingkat, setAiTingkat] = useState("Kelas 10");

    const form = useForm({
        defaultValues: {
            judul: "",
            deskripsi: "",
            tipe: "DOKUMEN",
            konten: "",
            mataPelajaranId: "",
            kelasId: "",
            guruId: "", // For ADMIN to select
            isPublished: true,
        },
    });



    const watchTipe = form.watch("tipe");

    // Load initial data
    useEffect(() => {
        if (ready && user) {
            loadData();
        }
    }, [ready, user]);

    const loadData = async () => {
        try {
            setLoading(true);

            console.log("Starting to load data in parallel...");

            // Run all API calls in parallel for faster loading
            const [materiResponse, mapelResponse, kelasResponse, guruResponse] = await Promise.all([
                // Load materi
                materiApi.getAll().catch(err => {
                    console.error("Materi API error:", err);
                    return [];
                }),

                // Load mata pelajaran
                mataPelajaranApi.getAll({ limit: 1000 }),

                // Load kelas
                kelasApi.getAll({ limit: 1000 }),

                // Load guru (only for ADMIN)
                role === "ADMIN"
                    ? guruApi.getAll({ limit: 1000 }).catch(err => {
                        console.error("Guru API error:", err);
                        return { data: [] };
                    })
                    : Promise.resolve({ data: [] }),
            ]);

            // Extract data from paginated response
            const materiArray = Array.isArray(materiResponse) ? materiResponse : ((materiResponse as any).data || []);
            const mapelArray = Array.isArray(mapelResponse) ? mapelResponse : ((mapelResponse as any).data || []);
            const kelasArray = Array.isArray(kelasResponse) ? kelasResponse : ((kelasResponse as any).data || []);
            const guruArray = Array.isArray(guruResponse) ? guruResponse : ((guruResponse as any).data || []);

            console.log("Data loaded:", {
                materi: materiArray.length,
                mapel: mapelArray.length,
                kelas: kelasArray.length,
                guru: guruArray.length,
            });

            setMateriList(materiArray);
            setMataPelajaranList(mapelArray);
            setKelasList(kelasArray);
            setGuruList(guruArray);

            console.log("Data loaded successfully!");
        } catch (error: any) {
            console.error("Error loading data:", error);
            toast({
                title: "Error",
                description: "Gagal memuat data: " + error.message,
                variant: "destructive",
            });
        } finally {
            setLoading(false);
        }
    };

    // Filter guru list when mata pelajaran or search changes
    useEffect(() => {
        const selectedMapelId = form.watch("mataPelajaranId");
        const searchQuery = guruSearch.toLowerCase();

        let filtered = guruList;

        // Filter by mata pelajaran if selected
        if (selectedMapelId) {
            filtered = filtered.filter((guru) =>
                guru.mataPelajaran?.some((mp: any) => mp.id === selectedMapelId)
            );
        }

        // Filter by search query
        if (searchQuery) {
            filtered = filtered.filter((guru) =>
                guru.user?.name?.toLowerCase().includes(searchQuery) ||
                guru.nip?.toLowerCase().includes(searchQuery)
            );
        }

        setFilteredGuruList(filtered);
    }, [form.watch("mataPelajaranId"), guruSearch, guruList]);

    const onSubmit = async (data: any) => {
        try {
            setIsSaving(true);
            if (editingId && editingId.trim() !== "") {
                // Edit mode: check if file uploaded
                if (selectedFile) {
                    const formData = new FormData();
                    formData.append('file', selectedFile);
                    formData.append('judul', data.judul);
                    formData.append('deskripsi', data.deskripsi || '');
                    formData.append('tipe', data.tipe);
                    formData.append('konten', data.konten || '');
                    formData.append('mataPelajaranId', data.mataPelajaranId);
                    if (data.kelasId) formData.append('kelasId', data.kelasId);
                    if (data.guruId) formData.append('guruId', data.guruId);
                    formData.append('isPublished', String(data.isPublished ?? true));

                    await materiApi.updateWithFile(editingId, formData);
                } else {
                    // No file: use regular JSON
                    await materiApi.update(editingId, data);
                }
                toast({
                    title: "Berhasil!",
                    description: "Materi berhasil diupdate",
                });
            } else {
                // Create mode: use FormData if file uploaded
                if (selectedFile) {
                    const formData = new FormData();
                    formData.append('file', selectedFile);
                    formData.append('judul', data.judul);
                    formData.append('deskripsi', data.deskripsi || '');
                    formData.append('tipe', data.tipe);
                    formData.append('konten', data.konten || '');
                    formData.append('mataPelajaranId', data.mataPelajaranId);
                    if (data.kelasId) formData.append('kelasId', data.kelasId);
                    if (data.guruId) formData.append('guruId', data.guruId);
                    formData.append('isPublished', String(data.isPublished ?? true));

                    await materiApi.createWithFile(formData);
                } else {
                    // No file: use regular JSON
                    await materiApi.create(data);
                }
                toast({
                    title: "Berhasil!",
                    description: "Materi berhasil dibuat",
                });
            }
            setDialogOpen(false);
            setSelectedFile(null);
            form.reset();
            setEditingId(null);
            setEditingMateri(null);
            loadData();
        } catch (error: any) {
            console.error("Error saving materi:", error);
            toast({
                title: "Error",
                description: "Gagal menyimpan materi: " + error.message,
                variant: "destructive",
            });
        } finally {
            setIsSaving(false);
        }
    };

    const handleEdit = (materi: any) => {
        setEditingId(materi.id);
        setEditingMateri(materi);
        setSelectedFile(null); // Reset selected file when editing
        form.reset({
            judul: materi.judul,
            deskripsi: materi.deskripsi || "",
            tipe: materi.tipe,
            mataPelajaranId: materi.mataPelajaranId,
            konten: materi.konten || "",
            kelasId: materi.kelasId || "",
            isPublished: materi.isPublished,
        });
        setDialogOpen(true);
    };

    const handleDelete = async () => {
        if (!deletingId) return;

        try {
            await materiApi.delete(deletingId);
            toast({
                title: "Berhasil!",
                description: "Materi berhasil dihapus",
            });
            setDeleteDialogOpen(false);
            setDeletingId(null);
            loadData();
        } catch (error: any) {
            console.error("Error deleting materi:", error);
            toast({
                title: "Error",
                description: "Gagal menghapus materi: " + error.message,
                variant: "destructive",
            });
        }
    };

    const openDeleteDialog = (id: string) => {
        setDeletingId(id);
        setDeleteDialogOpen(true);
    };

    const handleNewMateri = () => {
        setEditingId(null);
        setEditingMateri(null);
        setSelectedFile(null);
        form.reset();
        setShowAiForm(false);
        setAiTopik("");
        setDialogOpen(true);
    };

    const handleAiGenerate = async () => {
        const selectedMapelId = form.watch("mataPelajaranId");
        const selectedMapel = mataPelajaranList.find(m => m.id === selectedMapelId);
        const tipe = form.watch("tipe") as 'DOKUMEN' | 'VIDEO' | 'LINK' | 'GAMBAR' | 'TEKS';

        if (!aiTopik.trim()) {
            toast({
                title: "Perhatian",
                description: "Masukkan topik materi yang ingin digenerate",
                variant: "destructive",
            });
            return;
        }

        const result = await generateMateri({
            mataPelajaran: selectedMapel?.nama || "Umum",
            topik: aiTopik,
            tingkat: aiTingkat,
            tipeMateri: tipe || "TEKS",
        });

        if (result) {
            // Populate form with AI-generated content
            form.setValue("judul", result.judul);
            form.setValue("deskripsi", result.deskripsi);

            // Build konten from AI result
            let kontenText = result.konten;

            if (result.tujuanPembelajaran?.length) {
                kontenText += "\n\n=== TUJUAN PEMBELAJARAN ===\n";
                result.tujuanPembelajaran.forEach((t, i) => {
                    kontenText += `${i + 1}. ${t}\n`;
                });
            }

            if (result.materiPokok?.length) {
                kontenText += "\n=== MATERI POKOK ===\n";
                result.materiPokok.forEach((m, i) => {
                    kontenText += `${i + 1}. ${m}\n`;
                });
            }

            if (result.latihan?.length) {
                kontenText += "\n=== LATIHAN ===\n";
                result.latihan.forEach((l, i) => {
                    kontenText += `${i + 1}. ${l}\n`;
                });
            }

            if (result.ringkasan) {
                kontenText += "\n=== RINGKASAN ===\n" + result.ringkasan;
            }

            form.setValue("konten", kontenText);
            setShowAiForm(false);

            toast({
                title: "Berhasil!",
                description: "Materi berhasil digenerate dengan AI. Silakan review dan simpan.",
            });
        } else if (aiError) {
            toast({
                title: "Gagal Generate",
                description: aiError,
                variant: "destructive",
            });
        }
    };

    if (!ready) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <Loader2 className="h-8 w-8 animate-spin" />
            </div>
        );
    }

    if (loading) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
                <span className="ml-2">Memuat data...</span>
            </div>
        );
    }

    return (
        <div className="space-y-6">
            {/* Header */}
            <Card className="border-primary/30 bg-gradient-to-br from-primary/10 via-card/60 to-background/80">
                <CardHeader>
                    <div className="flex flex-wrap items-center justify-between gap-3">
                        <div>
                            <div className="flex items-center gap-3 mb-2">
                                <Badge tone="info" className="gap-2">
                                    <BookOpen size={14} />
                                    Kelola Materi
                                </Badge>
                                <Badge tone="success">{materiList.length} materi</Badge>
                            </div>
                            <CardTitle className="text-3xl">Manajemen Materi Pelajaran</CardTitle>
                            <CardDescription className="text-base">
                                Kelola dan upload materi pembelajaran untuk siswa
                            </CardDescription>
                        </div>
                        <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
                            <DialogTrigger asChild>
                                <Button size="lg" className="gap-2" onClick={handleNewMateri}>
                                    <Plus size={18} />
                                    Upload Materi Baru
                                </Button>
                            </DialogTrigger>
                            <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
                                <DialogHeader>
                                    <DialogTitle>{editingId ? "Edit Materi" : "Upload Materi Baru"}</DialogTitle>
                                    <DialogDescription>
                                        Isi form di bawah ini untuk {editingId ? "mengupdate" : "menambahkan"} materi pembelajaran
                                    </DialogDescription>
                                </DialogHeader>

                                {/* AI Generate Section */}
                                {!editingId && (
                                    <div className="rounded-lg border border-primary/30 bg-primary/5 p-4 space-y-3">
                                        <div className="flex items-center justify-between">
                                            <div className="flex items-center gap-2">
                                                <Sparkles size={18} className="text-primary" />
                                                <span className="font-medium text-sm">Generate dengan AI</span>
                                            </div>
                                            <Button
                                                type="button"
                                                variant={showAiForm ? "outline" : "default"}
                                                size="sm"
                                                onClick={() => setShowAiForm(!showAiForm)}
                                                className="gap-1"
                                            >
                                                <Wand2 size={14} />
                                                {showAiForm ? "Tutup" : "Gunakan AI"}
                                            </Button>
                                        </div>

                                        {showAiForm && (
                                            <div className="space-y-3 pt-2 border-t border-primary/20">
                                                <div>
                                                    <label className="text-xs font-medium mb-1 block">Topik Materi *</label>
                                                    <Input
                                                        placeholder="Contoh: Hukum Newton, Fotosintesis, Persamaan Kuadrat"
                                                        value={aiTopik}
                                                        onChange={(e) => setAiTopik(e.target.value)}
                                                    />
                                                </div>
                                                <div className="grid grid-cols-2 gap-3">
                                                    <div>
                                                        <label className="text-xs font-medium mb-1 block">Tingkat/Kelas</label>
                                                        <select
                                                            value={aiTingkat}
                                                            onChange={(e) => setAiTingkat(e.target.value)}
                                                            className="w-full h-9 rounded-md border border-input bg-background px-3 text-sm"
                                                        >
                                                            <option value="Kelas 7">Kelas 7 SMP</option>
                                                            <option value="Kelas 8">Kelas 8 SMP</option>
                                                            <option value="Kelas 9">Kelas 9 SMP</option>
                                                            <option value="Kelas 10">Kelas 10 SMA/SMK</option>
                                                            <option value="Kelas 11">Kelas 11 SMA/SMK</option>
                                                            <option value="Kelas 12">Kelas 12 SMA/SMK</option>
                                                        </select>
                                                    </div>
                                                    <div className="flex items-end">
                                                        <Button
                                                            type="button"
                                                            onClick={handleAiGenerate}
                                                            disabled={isGenerating || !aiTopik.trim()}
                                                            className="w-full gap-2"
                                                        >
                                                            {isGenerating ? (
                                                                <>
                                                                    <Loader2 size={14} className="animate-spin" />
                                                                    Generating...
                                                                </>
                                                            ) : (
                                                                <>
                                                                    <Sparkles size={14} />
                                                                    Generate
                                                                </>
                                                            )}
                                                        </Button>
                                                    </div>
                                                </div>
                                                <p className="text-[10px] text-muted-foreground">
                                                    AI akan generate judul, deskripsi, dan konten materi berdasarkan topik yang Anda masukkan
                                                </p>
                                            </div>
                                        )}
                                    </div>
                                )}

                                <Form {...form}>
                                    <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
                                        <FormField
                                            control={form.control}
                                            name="judul"
                                            rules={{ required: "Judul harus diisi" }}
                                            render={({ field }) => (
                                                <FormItem>
                                                    <FormLabel>Judul Materi *</FormLabel>
                                                    <FormControl>
                                                        <Input placeholder="Contoh: Pengantar Pemrograman Python" {...field} />
                                                    </FormControl>
                                                    <FormMessage />
                                                </FormItem>
                                            )}
                                        />

                                        <FormField
                                            control={form.control}
                                            name="deskripsi"
                                            render={({ field }) => (
                                                <FormItem>
                                                    <FormLabel>Deskripsi</FormLabel>
                                                    <FormControl>
                                                        <Textarea
                                                            placeholder="Jelaskan isi materi secara singkat..."
                                                            className="min-h-[100px]"
                                                            {...field}
                                                        />
                                                    </FormControl>
                                                    <FormMessage />
                                                </FormItem>
                                            )}
                                        />

                                        <FormField
                                            control={form.control}
                                            name="konten"
                                            render={({ field }) => (
                                                <FormItem>
                                                    <FormLabel>
                                                        {watchTipe === 'TEKS' ? "Konten Materi (Rich Text)" : "Konten Materi (URL atau Deskripsi)"}
                                                    </FormLabel>
                                                    <FormControl>
                                                        {watchTipe === 'TEKS' ? (
                                                            <RichTextEditor
                                                                value={field.value}
                                                                onChange={field.onChange}
                                                                placeholder="Tulis materi lengkap di sini..."
                                                                className="min-h-[200px]"
                                                            />
                                                        ) : (
                                                            <Textarea
                                                                placeholder="Isi link URL (YouTube, Google Drive, dll.) atau tulis deskripsi materi"
                                                                className="min-h-[120px]"
                                                                {...field}
                                                            />
                                                        )}
                                                    </FormControl>
                                                    <FormDescription>
                                                        {watchTipe === 'TEKS'
                                                            ? "Gunakan editor untuk memformat teks, menambahkan gambar, dan list."
                                                            : "Isi dengan URL link atau deskripsi singkat materi."
                                                        }
                                                    </FormDescription>
                                                    <FormMessage />
                                                </FormItem>
                                            )}
                                        />

                                        {/* File Upload untuk HTML/documents */}
                                        <div className="space-y-2">
                                            <label className="text-sm font-medium">Upload File Materi (HTML/PDF/DOCX)</label>
                                            
                                            {/* Show existing file info when editing */}
                                            {editingId && editingMateri?.konten?.startsWith('file://') && !selectedFile && (
                                                <div className="p-3 rounded-lg bg-blue-50 dark:bg-blue-950/20 border border-blue-200 dark:border-blue-800">
                                                    <p className="text-xs font-medium text-blue-700 dark:text-blue-300 mb-1">File saat ini:</p>
                                                    <p className="text-sm text-blue-600 dark:text-blue-400">{editingMateri.konten.replace('file://', '')}</p>
                                                    <p className="text-xs text-muted-foreground mt-1">Upload file baru untuk mengganti file ini</p>
                                                </div>
                                            )}
                                            
                                            <Input
                                                type="file"
                                                accept=".html,.pdf,.docx,.pptx"
                                                onChange={(e) => {
                                                    const file = e.target.files?.[0];
                                                    if (file) {
                                                        setSelectedFile(file);
                                                        // Clear konten field when file selected
                                                        form.setValue('konten', '');
                                                    }
                                                }}
                                            />
                                            {selectedFile && (
                                                <p className="text-xs text-green-600">
                                                    File selected: {selectedFile.name} ({(selectedFile.size / 1024 / 1024).toFixed(2)} MB)
                                                </p>
                                            )}
                                            <p className="text-xs text-muted-foreground">
                                                Upload file HTML, PDF, DOCX, atau PPTX sebagai konten materi
                                            </p>
                                        </div>

                                        <div className="grid grid-cols-2 gap-4">
                                            <FormField
                                                control={form.control}
                                                name="tipe"
                                                rules={{ required: "Tipe materi harus dipilih" }}
                                                render={({ field }) => (
                                                    <FormItem>
                                                        <FormLabel>Tipe Materi *</FormLabel>
                                                        <Select onValueChange={field.onChange} value={field.value}>
                                                            <FormControl>
                                                                <SelectTrigger>
                                                                    <SelectValue placeholder="Pilih tipe" />
                                                                </SelectTrigger>
                                                            </FormControl>
                                                            <SelectContent>
                                                                {TIPE_MATERI.map((tipe) => (
                                                                    <SelectItem key={tipe.value} value={tipe.value}>
                                                                        {tipe.icon} {tipe.label}
                                                                    </SelectItem>
                                                                ))}
                                                            </SelectContent>
                                                        </Select>
                                                        <FormMessage />
                                                    </FormItem>
                                                )}
                                            />

                                            <FormField
                                                control={form.control}
                                                name="mataPelajaranId"
                                                rules={{ required: "Mata pelajaran harus dipilih" }}
                                                render={({ field }) => (
                                                    <FormItem>
                                                        <FormLabel>Mata Pelajaran *</FormLabel>
                                                        <Select onValueChange={field.onChange} value={field.value}>
                                                            <FormControl>
                                                                <SelectTrigger>
                                                                    <SelectValue placeholder="Pilih mata pelajaran" />
                                                                </SelectTrigger>
                                                            </FormControl>
                                                            <SelectContent>
                                                                {/* Search input */}
                                                                <div className="px-2 py-1.5 sticky top-0 bg-card z-10 border-b">
                                                                    <Input
                                                                        placeholder="Cari mata pelajaran..."
                                                                        value={mapelSearch}
                                                                        onChange={(e) => setMapelSearch(e.target.value)}
                                                                        className="h-8"
                                                                    />
                                                                </div>

                                                                {mataPelajaranList
                                                                    .filter((mapel) =>
                                                                        mapel.nama?.toLowerCase().includes(mapelSearch.toLowerCase()) ||
                                                                        mapel.kode?.toLowerCase().includes(mapelSearch.toLowerCase())
                                                                    )
                                                                    .map((mapel) => (
                                                                        <SelectItem key={mapel.id} value={mapel.id}>
                                                                            {mapel.nama}
                                                                        </SelectItem>
                                                                    ))}
                                                            </SelectContent>
                                                        </Select>
                                                        <FormMessage />
                                                    </FormItem>
                                                )}
                                            />
                                        </div>

                                        {/* Guru selection (ADMIN only) */}
                                        {role === "ADMIN" && (
                                            <FormField
                                                control={form.control}
                                                name="guruId"
                                                rules={{ required: "Guru pengampu harus dipilih" }}
                                                render={({ field }) => (
                                                    <FormItem>
                                                        <FormLabel>Guru Pengampu *</FormLabel>
                                                        <Select onValueChange={field.onChange} value={field.value}>
                                                            <FormControl>
                                                                <SelectTrigger>
                                                                    <SelectValue placeholder="Pilih guru" />
                                                                </SelectTrigger>
                                                            </FormControl>
                                                            <SelectContent>
                                                                {/* Search input */}
                                                                <div className="px-2 py-1.5 sticky top-0 bg-card z-10 border-b">
                                                                    <Input
                                                                        placeholder="Cari guru..."
                                                                        value={guruSearch}
                                                                        onChange={(e) => setGuruSearch(e.target.value)}
                                                                        className="h-8"
                                                                    />
                                                                </div>

                                                                {filteredGuruList.length === 0 ? (
                                                                    <div className="px-8 py-6 text-center text-sm text-muted-foreground">
                                                                        {form.watch("mataPelajaranId")
                                                                            ? "Tidak ada guru untuk mata pelajaran ini"
                                                                            : "Pilih mata pelajaran terlebih dahulu"}
                                                                    </div>
                                                                ) : (
                                                                    filteredGuruList.map((guru) => (
                                                                        <SelectItem key={guru.id} value={guru.id}>
                                                                            <div className="flex flex-col gap-0.5">
                                                                                <span>{guru.user?.name || guru.nip}</span>
                                                                                <div className="flex gap-1 flex-wrap">
                                                                                    {guru.mataPelajaran?.map((mp: any) => (
                                                                                        <span key={mp.id} className="text-xs text-muted-foreground bg-muted px-1.5 py-0.5 rounded">
                                                                                            {mp.kode}
                                                                                        </span>
                                                                                    ))}
                                                                                </div>
                                                                            </div>
                                                                        </SelectItem>
                                                                    ))
                                                                )}
                                                            </SelectContent>
                                                        </Select>
                                                        <FormDescription>
                                                            {form.watch("mataPelajaranId")
                                                                ? "Guru yang ditampilkan sesuai mata pelajaran yang dipilih"
                                                                : "Pilih mata pelajaran terlebih dahulu untuk melihat guru"}
                                                        </FormDescription>
                                                        <FormMessage />
                                                    </FormItem>
                                                )}
                                            />
                                        )}

                                        <FormField
                                            control={form.control}
                                            name="kelasId"
                                            render={({ field }) => (
                                                <FormItem>
                                                    <FormLabel>Kelas (Opsional)</FormLabel>
                                                    <Select onValueChange={field.onChange} value={field.value}>
                                                        <FormControl>
                                                            <SelectTrigger>
                                                                <SelectValue placeholder="Semua kelas" />
                                                            </SelectTrigger>
                                                        </FormControl>
                                                        <SelectContent>
                                                            {kelasList.map((kelas) => (
                                                                <SelectItem key={kelas.id} value={kelas.id}>
                                                                    {kelas.nama}
                                                                </SelectItem>
                                                            ))}
                                                        </SelectContent>
                                                    </Select>
                                                    <FormDescription>
                                                        Kosongkan jika materi untuk semua kelas
                                                    </FormDescription>
                                                    <FormMessage />
                                                </FormItem>
                                            )}
                                        />

                                        <DialogFooter>
                                            <Button type="button" variant="outline" onClick={() => setDialogOpen(false)} disabled={isSaving}>
                                                Batal
                                            </Button>
                                            <Button type="submit" disabled={isSaving}>
                                                {isSaving ? (
                                                    <>
                                                        <svg className="animate-spin -ml-1 mr-2 h-4 w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                                            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                                                            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                                        </svg>
                                                        {selectedFile ? 'Mengupload...' : 'Menyimpan...'}
                                                    </>
                                                ) : (
                                                    editingId ? "Update Materi" : "Simpan Materi"
                                                )}
                                            </Button>
                                        </DialogFooter>
                                    </form>
                                </Form>
                            </DialogContent>
                        </Dialog>
                    </div>
                </CardHeader>
            </Card>

            {/* Materi List */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                {materiList.length === 0 ? (
                    <Card className="col-span-full">
                        <CardContent className="flex flex-col items-center justify-center py-12 text-center">
                            <BookOpen className="h-12 w-12 text-muted-foreground mb-4" />
                            <p className="text-lg font-semibold mb-2">Belum ada materi</p>
                            <p className="text-sm text-muted-foreground mb-4">
                                Klik tombol "Upload Materi Baru" untuk menambahkan materi pertama Anda
                            </p>
                        </CardContent>
                    </Card>
                ) : (
                    materiList.map((materi) => {
                        const tipeInfo = TIPE_MATERI.find((t) => t.value === materi.tipe);
                        return (
                            <Card key={materi.id} className="group hover:shadow-lg transition-all">
                                <CardHeader>
                                    <div className="flex items-start justify-between gap-2">
                                        <div className="flex items-center gap-2">
                                            <span className="text-2xl">{tipeInfo?.icon}</span>
                                            <Badge tone="info" className="text-xs">
                                                {tipeInfo?.label}
                                            </Badge>
                                        </div>
                                        {!materi.isPublished && (
                                            <Badge tone="warning" className="text-xs">Draft</Badge>
                                        )}
                                    </div>
                                    <CardTitle className="line-clamp-2">{materi.judul}</CardTitle>
                                    <CardDescription className="line-clamp-2">
                                        {materi.deskripsi || "Tidak ada deskripsi"}
                                    </CardDescription>
                                </CardHeader>
                                <CardContent className="space-y-4">
                                    <div className="text-sm space-y-1">
                                        <p className="text-muted-foreground">
                                            <strong>Mapel:</strong> {materi.mataPelajaran?.nama || "N/A"}
                                        </p>
                                        <p className="text-muted-foreground">
                                            <strong>Kelas:</strong> {materi.kelas?.nama || "Semua kelas"}
                                        </p>
                                        <p className="text-muted-foreground">
                                            <strong>Views:</strong> {materi.viewCount || 0} views
                                        </p>
                                    </div>

                                    <div className="flex gap-2">
                                        <Button
                                            size="sm"
                                            variant="outline"
                                            className="px-3"
                                            asChild
                                            title="Lihat Detail"
                                        >
                                            <Link href={`/materi-management/preview/${materi.id}`}>
                                                <Eye size={16} />
                                            </Link>
                                        </Button>
                                        <Button
                                            size="sm"
                                            variant="outline"
                                            className="flex-1 gap-2"
                                            onClick={() => handleEdit(materi)}
                                        >
                                            <Pencil size={14} />
                                            Edit
                                        </Button>
                                        <Button
                                            size="sm"
                                            variant="outline"
                                            className="gap-2 text-destructive hover:bg-destructive/10 hover:text-destructive border-destructive/20"
                                            onClick={() => openDeleteDialog(materi.id)}
                                        >
                                            <Trash2 size={14} />
                                        </Button>
                                    </div>
                                </CardContent>
                            </Card>
                        );
                    })
                )}
            </div>

            {/* Delete Confirmation Dialog */}
            <AlertDialog open={deleteDialogOpen} onOpenChange={setDeleteDialogOpen}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>Hapus Materi?</AlertDialogTitle>
                        <AlertDialogDescription>
                            Apakah Anda yakin ingin menghapus materi ini? Tindakan ini tidak dapat dibatalkan.
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel onClick={() => setDeletingId(null)}>
                            Batal
                        </AlertDialogCancel>
                        <AlertDialogAction onClick={handleDelete}>
                            Hapus
                        </AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>


        </div >
    );
}
