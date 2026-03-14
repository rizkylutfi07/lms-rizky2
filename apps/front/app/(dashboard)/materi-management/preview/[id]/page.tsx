"use client";

import { useEffect, useState } from "react";
import { useParams, useRouter } from "next/navigation";
import { materiApi } from "@/lib/api";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import {
    ChevronLeft,
    Download,
    FileText,
    Link as LinkIcon,
    Video,
    Calendar,
    User,
    GraduationCap,
    Loader2,
    AlertCircle,
    ExternalLink,
    Sparkles
} from "lucide-react";
import { useToast } from "@/hooks/use-toast";
import Link from "next/link";

// Helper to get icon based on type
const getMateriIcon = (type: string) => {
    switch (type) {
        case 'TEKS': return <FileText className="h-6 w-6" />;
        case 'VIDEO': return <Video className="h-6 w-6" />;
        case 'DOKUMEN': return <FileText className="h-6 w-6" />;
        case 'LINK': return <LinkIcon className="h-6 w-6" />;
        default: return <FileText className="h-6 w-6" />;
    }
};

export default function MateriPreviewPage() {
    const params = useParams();
    const router = useRouter();
    const { toast } = useToast();
    const [materi, setMateri] = useState<any | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const fetchMateri = async () => {
            try {
                setLoading(true);
                const id = params?.id as string;
                if (!id) return;

                const data = await materiApi.getOne(id);
                setMateri(data);
            } catch (err: any) {
                console.error("Failed to fetch materi:", err);
                setError(err.message || "Gagal memuat materi");
                toast({
                    variant: "destructive",
                    title: "Error",
                    description: "Gagal memuat data materi"
                });
            } finally {
                setLoading(false);
            }
        };

        fetchMateri();
    }, [params?.id, toast]);

    if (loading) {
        return (
            <div className="flex flex-col items-center justify-center min-h-[60vh] gap-4">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
                <p className="text-muted-foreground">Memuat materi...</p>
            </div>
        );
    }

    if (error || !materi) {
        return (
            <div className="flex flex-col items-center justify-center min-h-[60vh] gap-4">
                <div className="h-12 w-12 rounded-full bg-destructive/10 flex items-center justify-center text-destructive">
                    <AlertCircle className="h-6 w-6" />
                </div>
                <h3 className="text-lg font-semibold">Materi Tidak Ditemukan</h3>
                <p className="text-muted-foreground">{error || "Data materi tidak dapat ditemukan."}</p>
                <Button onClick={() => router.back()} variant="outline" className="mt-4">
                    <ChevronLeft className="mr-2 h-4 w-4" />
                    Kembali
                </Button>
            </div>
        );
    }

    return (
        <div className="space-y-6 container mx-auto px-4 py-6 max-w-5xl">
            {/* Navigation & Header */}
            <div className="flex flex-col gap-4">
                <Button
                    variant="ghost"
                    className="w-fit pl-0 hover:bg-transparent hover:text-primary"
                    onClick={() => router.back()}
                >
                    <ChevronLeft className="mr-2 h-4 w-4" />
                    Kembali ke Daftar Materi
                </Button>

                <div className="flex flex-col md:flex-row gap-6 items-start justify-between bg-card p-6 rounded-xl border shadow-sm">
                    <div className="flex gap-4 items-start w-full">
                        <div className="hidden sm:flex h-14 w-14 rounded-xl bg-primary/10 items-center justify-center shrink-0 text-primary border border-primary/10">
                            {getMateriIcon(materi.tipe)}
                        </div>
                        <div className="space-y-2 flex-1">
                            <div className="flex flex-wrap items-center gap-2">
                                <Badge tone="info" className="bg-primary/5 border-primary/20 text-primary">
                                    {materi.tipe}
                                </Badge>
                                {materi.mataPelajaran && (
                                    <Badge tone="info" className="font-normal text-muted-foreground bg-secondary/50">
                                        {materi.mataPelajaran.nama}
                                    </Badge>
                                )}
                                {!materi.isPublished && (
                                    <Badge tone="warning" className="font-normal">
                                        Draft
                                    </Badge>
                                )}
                            </div>
                            <h1 className="text-3xl font-bold tracking-tight text-foreground">{materi.judul}</h1>

                            <div className="flex flex-wrap gap-x-6 gap-y-2 text-sm text-muted-foreground mt-2">
                                <div className="flex items-center gap-2">
                                    <User className="h-4 w-4" />
                                    <span>{materi.guru?.user?.name || "Guru"}</span>
                                </div>
                                <div className="flex items-center gap-2">
                                    <GraduationCap className="h-4 w-4" />
                                    <span>{materi.kelas?.nama || "Semua Kelas"}</span>
                                </div>
                                <div className="flex items-center gap-2">
                                    <Calendar className="h-4 w-4" />
                                    <span>
                                        {materi.createdAt && new Date(materi.createdAt).toLocaleDateString("id-ID", {
                                            weekday: 'long', day: 'numeric', month: 'long', year: 'numeric'
                                        })}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {/* Main Content */}
            <Card className="min-h-[500px] shadow-sm border-border/50 bg-slate-50/50 dark:bg-slate-950/20 min-w-0">
                <div className="p-6 md:p-10">
                    {materi.tipe === 'TEKS' ? (
                        <div
                            className="prose prose-slate dark:prose-invert w-full max-w-none prose-lg prose-headings:font-bold prose-p:leading-relaxed prose-li:marker:text-primary bg-background p-8 rounded-xl border shadow-sm break-words overflow-hidden"
                            dangerouslySetInnerHTML={{ __html: materi.konten || '<p className="text-muted-foreground italic">Tidak ada konten teks.</p>' }}
                        />
                    ) : materi.tipe === 'VIDEO' ? (
                        <div className="max-w-4xl mx-auto space-y-8">
                            <div className="aspect-video w-full rounded-2xl overflow-hidden shadow-xl border bg-black">
                                <iframe
                                    src={materi.konten?.includes('watch?v=')
                                        ? materi.konten.replace('watch?v=', 'embed/')
                                        : materi.konten}
                                    className="w-full h-full"
                                    allowFullScreen
                                    title={materi.judul}
                                />
                            </div>
                            {materi.deskripsi && (
                                <div className="bg-background p-6 rounded-xl border shadow-sm">
                                    <h3 className="font-semibold text-lg mb-3">Deskripsi Video</h3>
                                    <p className="whitespace-pre-wrap leading-relaxed text-muted-foreground">{materi.deskripsi}</p>
                                </div>
                            )}
                        </div>
                    ) : (materi.tipe === 'LINK' || materi.tipe === 'DOKUMEN') ? (
                        <div className="max-w-3xl mx-auto space-y-8">
                            <div className="bg-background border rounded-2xl p-8 shadow-sm flex flex-col items-center text-center gap-6 group hover:border-primary/50 transition-all hover:shadow-md">
                                <div className="h-24 w-24 rounded-full bg-primary/10 flex items-center justify-center shrink-0 group-hover:scale-110 transition-transform duration-300">
                                    {materi.tipe === 'LINK' ? <LinkIcon className="h-10 w-10 text-primary" /> : <FileText className="h-10 w-10 text-primary" />}
                                </div>
                                <div className="space-y-2 w-full">
                                    <h3 className="font-bold text-2xl">Sumber Materi / Dokumen</h3>
                                    <p className="text-muted-foreground">Silakan akses materi melalui tautan di bawah ini</p>
                                </div>

                                <div className="w-full max-w-xl bg-muted/50 p-4 rounded-lg flex items-center gap-3 border">
                                    <LinkIcon className="h-4 w-4 text-muted-foreground shrink-0" />
                                    <a
                                        href={materi.konten}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="text-primary hover:underline font-medium truncate flex-1 text-left"
                                    >
                                        {materi.konten}
                                    </a>
                                    <Button asChild size="sm" variant="secondary" className="shrink-0">
                                        <a href={materi.konten} target="_blank" rel="noopener noreferrer">
                                            <ExternalLink className="h-4 w-4" />
                                        </a>
                                    </Button>
                                </div>

                                <Button asChild size="lg" className="w-full sm:w-auto min-w-[200px] h-12 text-base shadow-lg shadow-primary/20">
                                    <a href={materi.konten} target="_blank" rel="noopener noreferrer">
                                        Buka {materi.tipe === 'LINK' ? 'Tautan' : 'Dokumen'} <ExternalLink className="ml-2 h-4 w-4" />
                                    </a>
                                </Button>
                            </div>

                            {materi.deskripsi && (
                                <div className="bg-background p-8 rounded-2xl border shadow-sm relative overflow-hidden">
                                    <div className="absolute top-0 left-0 w-1.5 h-full bg-primary/60"></div>
                                    <h3 className="font-semibold text-lg mb-4 flex items-center gap-2">
                                        <Sparkles className="h-5 w-5 text-primary" />
                                        Keterangan Tambahan
                                    </h3>
                                    <p className="whitespace-pre-wrap leading-relaxed text-muted-foreground text-lg">{materi.deskripsi}</p>
                                </div>
                            )}
                        </div>
                    ) : (
                        <div className="text-center py-20 text-muted-foreground bg-background border rounded-xl border-dashed">
                            <Sparkles className="h-16 w-16 mx-auto mb-6 text-muted-foreground/20" />
                            <h3 className="text-xl font-medium mb-2">Konten Materi</h3>
                            <p className="whitespace-pre-wrap leading-relaxed max-w-2xl mx-auto px-4">{materi.deskripsi}</p>
                            {materi.konten && (
                                <div className="mt-8 p-4 bg-muted inline-block rounded-lg font-mono text-sm border">
                                    {materi.konten}
                                </div>
                            )}
                        </div>
                    )}

                    {materi.fileUrl && (
                        <div className="mt-12 pt-8 border-t flex flex-col sm:flex-row items-center justify-between gap-6">
                            <div className="flex items-center gap-4">
                                <div className="bg-primary/10 p-3 rounded-xl text-primary">
                                    <Download className="h-6 w-6" />
                                </div>
                                <div className="text-left">
                                    <p className="font-semibold text-foreground">File Lampiran Tersedia</p>
                                    <p className="text-sm text-muted-foreground">Unduh materi pembelajaran ini untuk akses offline</p>
                                </div>
                            </div>
                            <Button asChild variant="outline" size="lg" className="border-primary/20 hover:bg-primary/5 hover:text-primary w-full sm:w-auto h-12">
                                <a href={materi.fileUrl} target="_blank" rel="noopener noreferrer" className="gap-2">
                                    <Download className="h-5 w-5" />
                                    Download File
                                </a>
                            </Button>
                        </div>
                    )}
                </div>
            </Card>
        </div>
    );
}
