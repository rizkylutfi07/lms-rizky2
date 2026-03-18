"use client";
import { API_URL } from "@/lib/api";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { Download, Upload, Loader2, X, Database, AlertTriangle, Trash2, FileDown } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { useRole } from "../role-context";
import { useToast } from "@/hooks/use-toast";

export default function DatabasePage() {
    const { token, role } = useRole();
    const { toast } = useToast();
    const queryClient = useQueryClient();
    const [isImportModalOpen, setIsImportModalOpen] = useState(false);
    const [deleteBackupName, setDeleteBackupName] = useState<string | null>(null);

    // Check if user is admin
    if (role !== 'ADMIN') {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <Card className="w-full max-w-md">
                    <CardHeader>
                        <CardTitle>Access Denied</CardTitle>
                        <CardDescription>Only administrators can access database management.</CardDescription>
                    </CardHeader>
                </Card>
            </div>
        );
    }

    const { data: backups, isLoading } = useQuery({
        queryKey: ["database-backups"],
        queryFn: async () => {
            const res = await fetch(`${API_URL}/database/backups`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) return [];
            const data = await res.json();
            return Array.isArray(data) ? data : [];
        },
    });

    const handleExport = async (type: 'full' | 'data-only') => {
        const label = type === 'data-only' ? 'data-only' : 'full';
        const res = await fetch(`${API_URL}/database/export?type=${type}`, {
            headers: { Authorization: `Bearer ${token}` },
        });
        if (!res.ok) {
            toast({ title: "Error", description: "Gagal mengexport database", variant: "destructive" });
            return;
        }
        const blob = await res.blob();
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `database_backup_${label}_${new Date().toISOString().split('T')[0]}.sql`;
        a.click();
        window.URL.revokeObjectURL(url);
    };

    const deleteMutation = useMutation({
        mutationFn: async (filename: string) => {
            const res = await fetch(`${API_URL}/database/backups/${filename}`, {
                method: 'DELETE',
                headers: { Authorization: `Bearer ${token}` },
            });
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["database-backups"] });
            setDeleteBackupName(null);
        },
    });

    const handleDownloadBackup = async (filename: string) => {
        const res = await fetch(`${API_URL}/database/backups/${filename}`, {
            headers: { Authorization: `Bearer ${token}` },
        });
        const blob = await res.blob();
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    };

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold">Database Management</h1>
                    <p className="text-muted-foreground">Backup and restore database</p>
                </div>
            </div>

            {/* Export Section */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Download size={20} />
                        Export / Backup Database
                    </CardTitle>
                    <CardDescription>
                        Download backup database dalam format SQL
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
                        {/* Full Backup */}
                        <div className="rounded-lg border border-border p-4 space-y-2">
                            <div className="flex items-center gap-2">
                                <Database size={18} className="text-primary" />
                                <p className="font-medium">Full Backup</p>
                            </div>
                            <p className="text-sm text-muted-foreground">
                                Backup lengkap — schema (struktur tabel) + seluruh data. Cocok untuk migrasi server atau disaster recovery.
                            </p>
                            <Button onClick={() => handleExport('full')} className="w-full">
                                <Download size={16} className="mr-2" />
                                Download Full Backup
                            </Button>
                        </div>

                        {/* Data Only Backup */}
                        <div className="rounded-lg border border-border p-4 space-y-2">
                            <div className="flex items-center gap-2">
                                <FileDown size={18} className="text-blue-500" />
                                <p className="font-medium">Data Only</p>
                            </div>
                            <p className="text-sm text-muted-foreground">
                                Hanya data (tanpa schema). Cocok untuk import ke database yang sudah memiliki struktur tabel.
                            </p>
                            <Button onClick={() => handleExport('data-only')} variant="outline" className="w-full">
                                <Download size={16} className="mr-2" />
                                Download Data Only
                            </Button>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Import Section */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Upload size={20} />
                        Import Database
                    </CardTitle>
                    <CardDescription>
                        Restore database from SQL backup file
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="rounded-lg border border-yellow-500/50 bg-yellow-500/10 p-4 mb-4">
                        <div className="flex gap-2">
                            <AlertTriangle className="text-yellow-500" size={20} />
                            <div className="text-sm">
                                <p className="font-medium text-yellow-500">Warning</p>
                                <p className="text-muted-foreground">
                                    Importing will overwrite existing database data. An automatic backup will be created before import.
                                </p>
                            </div>
                        </div>
                    </div>
                    <Button onClick={() => setIsImportModalOpen(true)} variant="outline">
                        <Upload size={16} />
                        Import Database
                    </Button>
                </CardContent>
            </Card>

            {/* Backup History */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Database size={20} />
                        Backup History
                    </CardTitle>
                    <CardDescription>
                        List of automatic and manual backups
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    {isLoading ? (
                        <div className="flex items-center justify-center py-8">
                            <Loader2 className="animate-spin text-muted-foreground" size={32} />
                        </div>
                    ) : backups?.length === 0 ? (
                        <p className="text-center text-muted-foreground py-8">No backups available</p>
                    ) : (
                        <div className="space-y-2">
                            {backups?.map((backup: any) => (
                                <div
                                    key={backup.filename}
                                    className="flex items-center justify-between p-3 rounded-lg border border-border hover:bg-muted/30 transition"
                                >
                                    <div>
                                        <p className="font-medium">{backup.filename}</p>
                                        <p className="text-sm text-muted-foreground">
                                            {new Date(backup.created).toLocaleString()} • {(backup.size / 1024 / 1024).toFixed(2)} MB
                                        </p>
                                    </div>
                                    <div className="flex gap-2">
                                        <Button
                                            variant="ghost"
                                            size="sm"
                                            onClick={() => handleDownloadBackup(backup.filename)}
                                        >
                                            <FileDown size={16} />
                                        </Button>
                                        <Button
                                            variant="ghost"
                                            size="sm"
                                            onClick={() => setDeleteBackupName(backup.filename)}
                                        >
                                            <Trash2 size={16} />
                                        </Button>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </CardContent>
            </Card>

            {deleteBackupName && (
                <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm">
                    <Card className="w-full max-w-md">
                        <CardHeader>
                            <CardTitle>Konfirmasi Hapus Backup</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <p className="text-sm text-muted-foreground">
                                Apakah Anda yakin ingin menghapus backup <strong>{deleteBackupName}</strong>?
                            </p>
                            <div className="flex gap-2">
                                <Button variant="outline" onClick={() => setDeleteBackupName(null)} className="flex-1">
                                    Batal
                                </Button>
                                <Button
                                    variant="destructive"
                                    onClick={() => deleteMutation.mutate(deleteBackupName)}
                                    disabled={deleteMutation.isPending}
                                    className="flex-1"
                                >
                                    {deleteMutation.isPending ? <Loader2 className="animate-spin" size={16} /> : "Hapus"}
                                </Button>
                            </div>
                        </CardContent>
                    </Card>
                </div>
            )}

            {isImportModalOpen && (
                <ImportModal
                    onClose={() => setIsImportModalOpen(false)}
                    onSuccess={() => {
                        queryClient.invalidateQueries({ queryKey: ["database-backups"] });
                        setIsImportModalOpen(false);
                    }}
                    token={token}
                />
            )}
        </div>
    );
}

function ImportModal({ onClose, onSuccess, token }: { onClose: () => void; onSuccess: () => void; token: string | null }) {
    const { toast } = useToast();
    const [file, setFile] = useState<File | null>(null);
    const [importType, setImportType] = useState<'full' | 'data-only'>('full');
    const [createBackup, setCreateBackup] = useState(true);
    const [isLoading, setIsLoading] = useState(false);
    const [showConfirm, setShowConfirm] = useState(false);

    const handleSubmit = async () => {
        if (!file) return;

        setIsLoading(true);
        const formData = new FormData();
        formData.append('file', file);

        try {
            const res = await fetch(`${API_URL}/database/import?createBackup=${createBackup}&type=${importType}`, {
                method: 'POST',
                headers: { Authorization: `Bearer ${token}` },
                body: formData,
            });

            if (!res.ok) {
                const error = await res.json();
                throw new Error(error.message || 'Import failed');
            }

            const data = await res.json();
            toast({ title: "Sukses", description: `Database berhasil diimport! ${data.backupFile ? `Backup: ${data.backupFile}` : ''}` });
            onSuccess();
        } catch (error: any) {
            toast({ title: "Error", description: error.message, variant: "destructive" });
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/60 p-4 backdrop-blur-md">
            <Card className="w-full max-w-lg">
                <CardHeader>
                    <div className="flex items-center justify-between">
                        <CardTitle>Import Database</CardTitle>
                        <Button variant="ghost" size="icon" onClick={onClose}>
                            <X size={18} />
                        </Button>
                    </div>
                    <CardDescription>
                        Upload SQL backup file to restore database
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    {!showConfirm ? (
                        <div className="space-y-4">
                            {/* Import type selector */}
                            <div className="grid grid-cols-2 gap-2">
                                <button
                                    type="button"
                                    onClick={() => setImportType('full')}
                                    className={`rounded-lg border p-3 text-left transition ${
                                        importType === 'full'
                                            ? 'border-primary bg-primary/10 text-primary'
                                            : 'border-border hover:bg-muted/30'
                                    }`}
                                >
                                    <p className="font-medium text-sm">Full Backup</p>
                                    <p className="text-xs text-muted-foreground mt-1">Schema + data. Reset seluruh database.</p>
                                </button>
                                <button
                                    type="button"
                                    onClick={() => setImportType('data-only')}
                                    className={`rounded-lg border p-3 text-left transition ${
                                        importType === 'data-only'
                                            ? 'border-blue-500 bg-blue-500/10 text-blue-500'
                                            : 'border-border hover:bg-muted/30'
                                    }`}
                                >
                                    <p className="font-medium text-sm">Data Only</p>
                                    <p className="text-xs text-muted-foreground mt-1">Hanya data. Schema tetap, tidak ada tabel yang dihapus.</p>
                                </button>
                            </div>

                            <div className={`rounded-lg border p-4 ${
                                importType === 'full'
                                    ? 'border-red-500/50 bg-red-500/10'
                                    : 'border-yellow-500/50 bg-yellow-500/10'
                            }`}>
                                <div className="flex gap-2">
                                    <AlertTriangle className={importType === 'full' ? 'text-red-500' : 'text-yellow-500'} size={20} />
                                    <div className="text-sm">
                                        <p className={`font-medium ${importType === 'full' ? 'text-red-500' : 'text-yellow-500'}`}>
                                            {importType === 'full' ? 'Critical Warning' : 'Peringatan'}
                                        </p>
                                        <p className="text-muted-foreground">
                                            {importType === 'full'
                                                ? 'Seluruh database (schema + data) akan dihapus dan diganti. Tidak bisa di-undo tanpa backup.'
                                                : 'Data yang ada akan ditimpa. Schema/struktur tabel tidak berubah.'}
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <input
                                    type="file"
                                    accept=".sql"
                                    onChange={(e) => setFile(e.target.files?.[0] || null)}
                                    className="w-full rounded-lg border border-border bg-background px-4 py-2 outline-none"
                                />
                                {file && (
                                    <p className="mt-2 text-sm text-muted-foreground">
                                        Selected: {file.name} ({(file.size / 1024 / 1024).toFixed(2)} MB)
                                    </p>
                                )}
                            </div>

                            <label className="flex items-center gap-2 cursor-pointer">
                                <input
                                    type="checkbox"
                                    checked={createBackup}
                                    onChange={(e) => setCreateBackup(e.target.checked)}
                                    className="rounded border-white/20"
                                />
                                <span className="text-sm">Buat backup otomatis sebelum import (direkomendasikan)</span>
                            </label>

                            <div className="flex gap-2">
                                <Button type="button" variant="outline" onClick={onClose} className="flex-1">
                                    Batal
                                </Button>
                                <Button
                                    onClick={() => setShowConfirm(true)}
                                    disabled={!file}
                                    className={`flex-1 ${
                                        importType === 'full'
                                            ? 'bg-red-600 hover:bg-red-700'
                                            : 'bg-yellow-600 hover:bg-yellow-700'
                                    }`}
                                >
                                    Lanjutkan
                                </Button>
                            </div>
                        </div>
                    ) : (
                        <div className="space-y-4">
                            <div className="rounded-lg border border-yellow-500/50 bg-yellow-500/10 p-4">
                                <p className="font-medium text-yellow-500 mb-2">Konfirmasi Akhir</p>
                                <p className="text-sm text-muted-foreground">
                                    {importType === 'full'
                                        ? 'Seluruh schema dan data akan dihapus lalu diganti dengan isi file backup.'
                                        : 'Data yang ada akan ditimpa dengan isi file backup. Schema tidak berubah.'}
                                </p>
                                <p className="text-sm mt-2 font-medium">
                                    Tipe: <span className={importType === 'full' ? 'text-red-400' : 'text-blue-400'}>
                                        {importType === 'full' ? 'Full Backup' : 'Data Only'}
                                    </span>
                                </p>
                                {createBackup && (
                                    <p className="text-sm text-green-500 mt-2">
                                        ✓ Backup otomatis akan dibuat sebelum import
                                    </p>
                                )}
                            </div>

                            <div className="flex gap-2">
                                <Button type="button" variant="outline" onClick={() => setShowConfirm(false)} className="flex-1">
                                    Kembali
                                </Button>
                                <Button
                                    onClick={handleSubmit}
                                    disabled={isLoading}
                                    className="flex-1 bg-red-600 hover:bg-red-700"
                                >
                                    {isLoading ? <Loader2 className="animate-spin" size={16} /> : "Import Now"}
                                </Button>
                            </div>
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
