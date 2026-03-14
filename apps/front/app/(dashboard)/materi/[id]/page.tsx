"use client";
import { API_URL } from "@/lib/api";

import { useState, useEffect } from "react";
import { useParams, useRouter } from "next/navigation";
import { ArrowLeft, BookOpen, Calendar, Clock, Download, Share2, User } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { materiApi } from "@/lib/api";
import { useToast } from "@/hooks/use-toast";

export default function MateriDetailPage() {
    const params = useParams();
    const router = useRouter();
    const { toast } = useToast();
    const [materi, setMateri] = useState<any>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        if (params.id) {
            loadMateri(params.id as string);
        }
    }, [params.id]);

    const loadMateri = async (id: string) => {
        try {
            setLoading(true);
            const response = await materiApi.getOne(id, false) as any;
            setMateri(response);
        } catch (error) {
            console.error("Error loading materi:", error);
            toast({ title: "Error", description: "Gagal memuat materi", variant: "destructive" });
        } finally {
            setLoading(false);
        }
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <p className="text-muted-foreground">Loading...</p>
            </div>
        );
    }

    if (!materi) {
        return (
            <div className="flex flex-col items-center justify-center min-h-screen gap-4">
                <p className="text-muted-foreground">Materi tidak ditemukan</p>
                <Button onClick={() => router.back()}>
                    <ArrowLeft className="mr-2 h-4 w-4" />
                    Kembali
                </Button>
            </div>
        );
    }

    return (
        <div className="container mx-auto py-4 sm:py-8 px-4 max-w-4xl">
            {/* Header */}
            <div className="mb-4 sm:mb-6">
                <div className="flex items-start gap-3 sm:gap-4 mb-3">
                    <Button variant="ghost" size="icon" className="shrink-0 mt-1" onClick={() => router.back()}>
                        <ArrowLeft className="h-5 w-5" />
                    </Button>
                    <div className="flex-1 min-w-0">
                        <div className="flex items-start justify-between gap-2 mb-2">
                            <h1 className="text-xl sm:text-2xl md:text-3xl font-bold leading-tight break-words">
                                {materi.judul}
                            </h1>
                            <Badge tone="info" className="text-xs sm:text-sm shrink-0">
                                {materi.tipe}
                            </Badge>
                        </div>
                        <p className="text-sm sm:text-base text-muted-foreground">
                            {materi.mataPelajaran?.nama || "N/A"}
                        </p>
                    </div>
                </div>
            </div>

            {/* Metadata Card */}
            <Card className="mb-4 sm:mb-6">
                <CardContent className="pt-4 sm:pt-6">
                    <div className="grid grid-cols-2 gap-3 sm:gap-4 text-sm">
                        <div className="flex items-start gap-2">
                            <BookOpen className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                            <div className="min-w-0">
                                <p className="text-muted-foreground text-xs">Mata Pelajaran</p>
                                <p className="font-medium text-xs sm:text-sm truncate">{materi.mataPelajaran?.nama || "N/A"}</p>
                            </div>
                        </div>
                        <div className="flex items-start gap-2">
                            <User className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                            <div className="min-w-0">
                                <p className="text-muted-foreground text-xs">Pengampu</p>
                                <p className="font-medium text-xs sm:text-sm truncate">{materi.guru?.user?.name || materi.guru?.nama || "N/A"}</p>
                            </div>
                        </div>
                        <div className="flex items-start gap-2">
                            <Calendar className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                            <div className="min-w-0">
                                <p className="text-muted-foreground text-xs">Dibuat</p>
                                <p className="font-medium text-xs sm:text-sm">{new Date(materi.createdAt).toLocaleDateString("id-ID")}</p>
                            </div>
                        </div>
                        <div className="flex items-start gap-2">
                            <Clock className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                            <div className="min-w-0">
                                <p className="text-muted-foreground text-xs">Update</p>
                                <p className="font-medium text-xs sm:text-sm">{new Date(materi.updatedAt).toLocaleDateString("id-ID")}</p>
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Description */}
            {materi.deskripsi && (
                <Card className="mb-4 sm:mb-6">
                    <CardHeader className="pb-3 sm:pb-4">
                        <CardTitle className="text-base sm:text-lg">Deskripsi</CardTitle>
                    </CardHeader>
                    <CardContent className="pt-0">
                        <p className="text-sm sm:text-base text-muted-foreground whitespace-pre-wrap">{materi.deskripsi}</p>
                    </CardContent>
                </Card>
            )}

            {/* Content */}
            {materi.konten && (
                <Card className="mb-4 sm:mb-6">
                    <CardHeader className="pb-3 sm:pb-4">
                        <CardTitle className="text-base sm:text-lg">Konten Materi</CardTitle>
                    </CardHeader>
                    <CardContent className="pt-0">
                        {materi.konten.startsWith('file://') ? (
                            // Uploaded file
                            <div className="space-y-3 sm:space-y-4">
                                <p className="text-xs sm:text-sm text-muted-foreground">File materi yang diupload:</p>
                                {materi.konten.endsWith('.html') ? (
                                    // Render HTML in iframe with fullscreen option
                                    <div className="space-y-3">
                                        <div className="flex items-center justify-end">
                                            <Button
                                                variant="outline"
                                                size="sm"
                                                onClick={() => {
                                                    const iframe = document.getElementById('materi-iframe') as HTMLIFrameElement;
                                                    if (iframe) {
                                                        if (document.fullscreenElement) {
                                                            document.exitFullscreen();
                                                        } else {
                                                            iframe.requestFullscreen();
                                                        }
                                                    }
                                                }}
                                            >
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16"
                                                    height="16"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    strokeWidth="2"
                                                    strokeLinecap="round"
                                                    strokeLinejoin="round"
                                                    className="mr-2"
                                                >
                                                    <path d="M8 3H5a2 2 0 0 0-2 2v3m18 0V5a2 2 0 0 0-2-2h-3m0 18h3a2 2 0 0 0 2-2v-3M3 16v3a2 2 0 0 0 2 2h3" />
                                                </svg>
                                                Fullscreen
                                            </Button>
                                        </div>
                                        <iframe
                                            id="materi-iframe"
                                            src={`${API_URL}/uploads/materi/${materi.konten.replace('file://', '')}`}
                                            className="w-full h-[600px] border rounded-lg"
                                            title="Materi Content"
                                            allowFullScreen
                                        />
                                    </div>
                                ) : materi.konten.endsWith('.pdf') ? (
                                    // PDF - show file info and button to open in new tab
                                    <div className="rounded-lg border bg-muted/50">
                                        <div className="flex flex-col sm:flex-row items-start sm:items-center gap-3 sm:gap-4 p-4 sm:p-6">
                                            <div className="flex h-12 w-12 sm:h-16 sm:w-16 items-center justify-center rounded-lg bg-red-100 dark:bg-red-900/20 shrink-0">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    strokeWidth="2"
                                                    strokeLinecap="round"
                                                    strokeLinejoin="round"
                                                    className="text-red-600 dark:text-red-400 sm:w-8 sm:h-8"
                                                >
                                                    <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z" />
                                                    <polyline points="14 2 14 8 20 8" />
                                                </svg>
                                            </div>
                                            <div className="flex-1 min-w-0">
                                                <p className="font-medium text-sm sm:text-base break-words">
                                                    {materi.originalFileName || materi.konten.replace('file://', '')}
                                                </p>
                                                <p className="text-xs text-muted-foreground">PDF Document</p>
                                            </div>
                                            <div className="flex gap-2 w-full sm:w-auto">
                                                <Button className="flex-1 sm:flex-initial" asChild>
                                                    <a
                                                        href={`${API_URL}/uploads/materi/${materi.konten.replace('file://', '')}`}
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                    >
                                                        <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            width="16"
                                                            height="16"
                                                            viewBox="0 0 24 24"
                                                            fill="none"
                                                            stroke="currentColor"
                                                            strokeWidth="2"
                                                            strokeLinecap="round"
                                                            strokeLinejoin="round"
                                                            className="mr-2"
                                                        >
                                                            <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6" />
                                                            <polyline points="15 3 21 3 21 9" />
                                                            <line x1="10" x2="21" y1="14" y2="3" />
                                                        </svg>
                                                        Buka
                                                    </a>
                                                </Button>
                                                <Button variant="outline" className="flex-1 sm:flex-initial" asChild>
                                                    <a
                                                        href={`${API_URL}/uploads/materi/${materi.konten.replace('file://', '')}`}
                                                        download
                                                    >
                                                        <Download className="mr-2 h-4 w-4" />
                                                        Download
                                                    </a>
                                                </Button>
                                            </div>
                                        </div>
                                    </div>
                                ) : (
                                    // Other docs - provide download link
                                    <div className="flex flex-col sm:flex-row items-start sm:items-center gap-3 sm:gap-4 p-4 rounded-lg border bg-muted/50">
                                        <div className="flex-1 min-w-0">
                                            <p className="font-medium text-sm sm:text-base break-words">
                                                {materi.originalFileName || materi.konten.replace('file://', '')}
                                            </p>
                                            <p className="text-xs text-muted-foreground">
                                                {materi.konten.endsWith('.docx') ? 'Word Document' :
                                                    materi.konten.endsWith('.pptx') ? 'PowerPoint Document' :
                                                        'Document'}
                                            </p>
                                        </div>
                                        <Button className="w-full sm:w-auto" asChild>
                                            <a
                                                href={`${API_URL}/uploads/materi/${materi.konten.replace('file://', '')}`}
                                                target="_blank"
                                                rel="noopener noreferrer"
                                                download
                                            >
                                                <Download className="mr-2 h-4 w-4" />
                                                Download
                                            </a>
                                        </Button>
                                    </div>
                                )}
                            </div>
                        ) : materi.konten.startsWith('http') ? (
                            // External URL link
                            <div className="space-y-4">
                                <p className="text-sm text-muted-foreground">Link eksternal:</p>
                                <Button asChild className="w-full">
                                    <a href={materi.konten} target="_blank" rel="noopener noreferrer">
                                        Buka Link
                                        <Share2 className="ml-2 h-4 w-4" />
                                    </a>
                                </Button>
                            </div>
                        ) : (
                            // Text content - render as HTML if it contains HTML tags, otherwise as plain text
                            <div className="prose prose-sm max-w-none dark:prose-invert prose-p:text-left">
                                {materi.konten.includes('<') && materi.konten.includes('>') ? (
                                    <div 
                                        className="[&_*]:max-w-full [&_*]:text-left"
                                        style={{ 
                                            textAlign: 'left',
                                            wordBreak: 'normal',
                                            overflowWrap: 'break-word',
                                            hyphens: 'none'
                                        }}
                                        dangerouslySetInnerHTML={{ __html: materi.konten }} 
                                    />
                                ) : (
                                    <p 
                                        className="whitespace-pre-wrap text-left"
                                        style={{ 
                                            textAlign: 'left',
                                            wordBreak: 'normal',
                                            overflowWrap: 'break-word'
                                        }}
                                    >
                                        {materi.konten}
                                    </p>
                                )}
                            </div>
                        )}
                    </CardContent>
                </Card>
            )}

            {/* Attachments */}
            {materi.attachments && materi.attachments.length > 0 && (
                <Card className="mb-6">
                    <CardHeader className="pb-3 sm:pb-4">
                        <CardTitle className="text-base sm:text-lg">File Lampiran</CardTitle>
                        <CardDescription className="text-xs sm:text-sm">{materi.attachments.length} file tersedia</CardDescription>
                    </CardHeader>
                    <CardContent className="pt-0">
                        <div className="space-y-2 sm:space-y-3">
                            {materi.attachments.map((file: any, index: number) => (
                                <div
                                    key={index}
                                    className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-2 sm:gap-3 p-3 sm:p-4 rounded-lg border bg-muted/50"
                                >
                                    <div className="flex items-start gap-2 sm:gap-3 min-w-0 flex-1">
                                        <Download className="h-4 w-4 sm:h-5 sm:w-5 text-muted-foreground mt-0.5 shrink-0" />
                                        <div className="min-w-0">
                                            <p className="font-medium text-sm sm:text-base break-words">{file.namaFile}</p>
                                            <p className="text-xs text-muted-foreground">
                                                {(file.ukuranFile / 1024 / 1024).toFixed(2)} MB
                                            </p>
                                        </div>
                                    </div>
                                    <Button size="sm" variant="outline" className="w-full sm:w-auto shrink-0">
                                        <Download className="h-4 w-4 mr-2" />
                                        Download
                                    </Button>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>
            )}
        </div>
    );
}
