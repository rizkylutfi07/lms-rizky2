"use client";

import { useState, useMemo } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import {
    ChevronLeft,
    ChevronRight,
    Plus,
    X,
    Loader2,
    Calendar,
    Pencil,
    Trash2,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { useRole } from "../role-context";
import { useToast } from "@/hooks/use-toast";
import { API_URL } from "@/lib/api";

// ── Types ────────────────────────────────────────────────────────────────────
type TipeKalender =
    | "LIBUR_NASIONAL"
    | "LIBUR_SEKOLAH"
    | "UJIAN"
    | "ULANGAN"
    | "KEGIATAN"
    | "RAPAT"
    | "LAINNYA";

interface KalenderEvent {
    id: string;
    judul: string;
    deskripsi?: string;
    tanggalMulai: string;
    tanggalSelesai: string;
    tipe: TipeKalender;
    warna: string;
    isAllDay: boolean;
}

// ── Constants ─────────────────────────────────────────────────────────────────
const TIPE_OPTIONS: { value: TipeKalender; label: string; color: string }[] = [
    { value: "LIBUR_NASIONAL", label: "Libur Nasional", color: "#ef4444" },
    { value: "LIBUR_SEKOLAH", label: "Libur Sekolah", color: "#f97316" },
    { value: "UJIAN", label: "Ujian", color: "#8b5cf6" },
    { value: "ULANGAN", label: "Ulangan", color: "#6366f1" },
    { value: "KEGIATAN", label: "Kegiatan", color: "#10b981" },
    { value: "RAPAT", label: "Rapat", color: "#0ea5e9" },
    { value: "LAINNYA", label: "Lainnya", color: "#6b7280" },
];

const TIPE_MAP = Object.fromEntries(TIPE_OPTIONS.map((t) => [t.value, t]));

const DAY_NAMES = ["Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"];
const MONTH_NAMES = [
    "Januari", "Februari", "Maret", "April", "Mei", "Juni",
    "Juli", "Agustus", "September", "Oktober", "November", "Desember",
];

// ── Helpers ───────────────────────────────────────────────────────────────────
function toDateStr(d: Date) {
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}`;
}

function parseLocalDate(iso: string) {
    // Parse ISO date without timezone shift
    const [y, m, d] = iso.substring(0, 10).split("-").map(Number);
    return new Date(y!, m! - 1, d!);
}

// ── Main Component ────────────────────────────────────────────────────────────
export default function KalenderAkademikPage() {
    const { token, role } = useRole();
    const queryClient = useQueryClient();
    const { toast } = useToast();
    const isAdmin = role === "ADMIN";

    const today = new Date();
    const [viewYear, setViewYear] = useState(today.getFullYear());
    const [viewMonth, setViewMonth] = useState(today.getMonth()); // 0-based
    const [selectedDate, setSelectedDate] = useState<string | null>(null);
    const [modalOpen, setModalOpen] = useState(false);
    const [editingEvent, setEditingEvent] = useState<KalenderEvent | null>(null);
    const [detailEvent, setDetailEvent] = useState<KalenderEvent | null>(null);

    // ── Query ──────────────────────────────────────────────────────────────────
    const { data: events = [], isLoading } = useQuery<KalenderEvent[]>({
        queryKey: ["kalender-akademik", viewYear, viewMonth + 1],
        queryFn: async () => {
            const res = await fetch(
                `${API_URL}/kalender-akademik?bulan=${viewMonth + 1}&tahun=${viewYear}`,
                { headers: { Authorization: `Bearer ${token}` } },
            );
            const data = await res.json();
            return Array.isArray(data) ? data : [];
        },
        enabled: !!token,
    });

    // ── Mutations ──────────────────────────────────────────────────────────────
    const createMutation = useMutation({
        mutationFn: async (body: Omit<KalenderEvent, "id">) => {
            const res = await fetch(`${API_URL}/kalender-akademik`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`,
                },
                body: JSON.stringify(body),
            });
            if (!res.ok) throw new Error((await res.json()).message || "Gagal menyimpan");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kalender-akademik"] });
            closeModal();
            toast({ title: "Kegiatan ditambahkan" });
        },
        onError: (e: any) => toast({ title: "Gagal", description: e.message, variant: "destructive" }),
    });

    const updateMutation = useMutation({
        mutationFn: async ({ id, body }: { id: string; body: Partial<KalenderEvent> }) => {
            const res = await fetch(`${API_URL}/kalender-akademik/${id}`, {
                method: "PATCH",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`,
                },
                body: JSON.stringify(body),
            });
            if (!res.ok) throw new Error((await res.json()).message || "Gagal menyimpan");
            return res.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kalender-akademik"] });
            closeModal();
            toast({ title: "Kegiatan diperbarui" });
        },
        onError: (e: any) => toast({ title: "Gagal", description: e.message, variant: "destructive" }),
    });

    const deleteMutation = useMutation({
        mutationFn: async (id: string) => {
            const res = await fetch(`${API_URL}/kalender-akademik/${id}`, {
                method: "DELETE",
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error("Gagal menghapus");
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ["kalender-akademik"] });
            setDetailEvent(null);
            toast({ title: "Kegiatan dihapus" });
        },
        onError: (e: any) => toast({ title: "Gagal", description: e.message, variant: "destructive" }),
    });

    // ── Calendar Grid ──────────────────────────────────────────────────────────
    const calendarDays = useMemo(() => {
        const firstDay = new Date(viewYear, viewMonth, 1).getDay(); // 0=Sun
        const daysInMonth = new Date(viewYear, viewMonth + 1, 0).getDate();
        const prevMonthDays = new Date(viewYear, viewMonth, 0).getDate();

        const cells: { date: Date; isCurrentMonth: boolean }[] = [];

        // Leading days from previous month
        for (let i = firstDay - 1; i >= 0; i--) {
            cells.push({
                date: new Date(viewYear, viewMonth - 1, prevMonthDays - i),
                isCurrentMonth: false,
            });
        }
        // Current month
        for (let d = 1; d <= daysInMonth; d++) {
            cells.push({ date: new Date(viewYear, viewMonth, d), isCurrentMonth: true });
        }
        // Trailing days
        const remaining = 42 - cells.length;
        for (let d = 1; d <= remaining; d++) {
            cells.push({ date: new Date(viewYear, viewMonth + 1, d), isCurrentMonth: false });
        }

        return cells;
    }, [viewYear, viewMonth]);

    // Map dateStr -> events
    const eventsByDate = useMemo(() => {
        const map: Record<string, KalenderEvent[]> = {};
        events.forEach((ev) => {
            const start = parseLocalDate(ev.tanggalMulai);
            const end = parseLocalDate(ev.tanggalSelesai);
            const cur = new Date(start);
            while (cur <= end) {
                const key = toDateStr(cur);
                if (!map[key]) map[key] = [];
                map[key]!.push(ev);
                cur.setDate(cur.getDate() + 1);
            }
        });
        return map;
    }, [events]);

    // ── Nav Helpers ────────────────────────────────────────────────────────────
    function prevMonth() {
        if (viewMonth === 0) { setViewMonth(11); setViewYear(y => y - 1); }
        else setViewMonth(m => m - 1);
    }
    function nextMonth() {
        if (viewMonth === 11) { setViewMonth(0); setViewYear(y => y + 1); }
        else setViewMonth(m => m + 1);
    }

    function openCreate(dateStr?: string) {
        setEditingEvent(null);
        setSelectedDate(dateStr ?? toDateStr(today));
        setModalOpen(true);
    }
    function openEdit(ev: KalenderEvent) {
        setDetailEvent(null);
        setEditingEvent(ev);
        setModalOpen(true);
    }
    function closeModal() {
        setModalOpen(false);
        setEditingEvent(null);
        setSelectedDate(null);
    }

    const todayStr = toDateStr(today);

    return (
        <div className="space-y-4 p-4 md:p-6">
            {/* Header */}
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-bold flex items-center gap-2">
                        <Calendar className="text-primary" size={24} />
                        Kalender Akademik
                    </h1>
                    <p className="text-sm text-muted-foreground mt-0.5">
                        Jadwal kegiatan & hari penting sekolah
                    </p>
                </div>
                {isAdmin && (
                    <Button onClick={() => openCreate()} className="gap-2">
                        <Plus size={16} />
                        <span className="hidden sm:inline">Tambah Kegiatan</span>
                    </Button>
                )}
            </div>

            <div className="grid gap-4 lg:grid-cols-[1fr_280px]">
                {/* Calendar */}
                <Card>
                    <CardHeader className="pb-3">
                        <div className="flex items-center justify-between">
                            <Button variant="ghost" size="icon" onClick={prevMonth}>
                                <ChevronLeft size={18} />
                            </Button>
                            <CardTitle className="text-lg">
                                {MONTH_NAMES[viewMonth]} {viewYear}
                            </CardTitle>
                            <Button variant="ghost" size="icon" onClick={nextMonth}>
                                <ChevronRight size={18} />
                            </Button>
                        </div>
                    </CardHeader>
                    <CardContent className="p-2 md:p-4">
                        {/* Day names */}
                        <div className="grid grid-cols-7 mb-1">
                            {DAY_NAMES.map((d) => (
                                <div key={d} className="text-center text-xs font-semibold text-muted-foreground py-1">
                                    {d}
                                </div>
                            ))}
                        </div>
                        {/* Day cells */}
                        {isLoading ? (
                            <div className="flex items-center justify-center h-64">
                                <Loader2 className="animate-spin text-primary" size={28} />
                            </div>
                        ) : (
                            <div className="grid grid-cols-7 gap-0.5">
                                {calendarDays.map(({ date, isCurrentMonth }, idx) => {
                                    const dStr = toDateStr(date);
                                    const dayEvents = eventsByDate[dStr] ?? [];
                                    const isToday = dStr === todayStr;
                                    const isSunday = date.getDay() === 0;
                                    const isSaturday = date.getDay() === 6;

                                    return (
                                        <div
                                            key={idx}
                                            onClick={() => {
                                                if (isAdmin) openCreate(dStr);
                                            }}
                                            className={`min-h-[70px] md:min-h-[90px] rounded-lg p-1 border transition cursor-default
                                                ${isAdmin ? "cursor-pointer hover:border-primary/40 hover:bg-muted/30" : ""}
                                                ${isCurrentMonth ? "border-border" : "border-transparent bg-muted/10"}
                                                ${isToday ? "border-primary/60 bg-primary/5 ring-1 ring-primary/20" : ""}
                                            `}
                                        >
                                            <div className={`text-xs font-semibold w-6 h-6 flex items-center justify-center rounded-full mb-1
                                                ${isToday ? "bg-primary text-primary-foreground" : ""}
                                                ${!isCurrentMonth ? "text-muted-foreground/40" : isSunday ? "text-red-500" : isSaturday ? "text-blue-500" : ""}
                                            `}>
                                                {date.getDate()}
                                            </div>
                                            <div className="space-y-0.5">
                                                {dayEvents.slice(0, 3).map((ev) => (
                                                    <div
                                                        key={ev.id}
                                                        onClick={(e) => { e.stopPropagation(); setDetailEvent(ev); }}
                                                        className="text-[10px] md:text-xs px-1.5 py-0.5 rounded truncate font-medium cursor-pointer hover:opacity-80 transition"
                                                        style={{
                                                            backgroundColor: ev.warna + "25",
                                                            color: ev.warna,
                                                            borderLeft: `2px solid ${ev.warna}`,
                                                        }}
                                                    >
                                                        {ev.judul}
                                                    </div>
                                                ))}
                                                {dayEvents.length > 3 && (
                                                    <div className="text-[9px] text-muted-foreground px-1">
                                                        +{dayEvents.length - 3} lagi
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                    );
                                })}
                            </div>
                        )}
                    </CardContent>
                </Card>

                {/* Sidebar: upcoming events this month */}
                <div className="space-y-3">
                    <Card>
                        <CardHeader className="pb-2">
                            <CardTitle className="text-sm">Legend</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-1.5 pt-0">
                            {TIPE_OPTIONS.map((t) => (
                                <div key={t.value} className="flex items-center gap-2 text-xs">
                                    <div className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: t.color }} />
                                    <span>{t.label}</span>
                                </div>
                            ))}
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader className="pb-2">
                            <CardTitle className="text-sm">
                                Kegiatan {MONTH_NAMES[viewMonth]}
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="pt-0 space-y-2 max-h-80 overflow-y-auto">
                            {events.length === 0 ? (
                                <p className="text-xs text-muted-foreground py-2">Tidak ada kegiatan</p>
                            ) : (
                                events.map((ev) => (
                                    <div
                                        key={ev.id}
                                        onClick={() => setDetailEvent(ev)}
                                        className="rounded-lg border p-2.5 cursor-pointer hover:bg-muted/30 transition"
                                        style={{ borderLeftColor: ev.warna, borderLeftWidth: 3 }}
                                    >
                                        <p className="text-xs font-semibold truncate">{ev.judul}</p>
                                        <p className="text-[10px] text-muted-foreground mt-0.5">
                                            {parseLocalDate(ev.tanggalMulai).toLocaleDateString("id-ID", { day: "numeric", month: "short" })}
                                            {ev.tanggalMulai !== ev.tanggalSelesai &&
                                                ` – ${parseLocalDate(ev.tanggalSelesai).toLocaleDateString("id-ID", { day: "numeric", month: "short" })}`}
                                        </p>
                                        <span
                                            className="text-[9px] px-1.5 py-0.5 rounded-full font-medium"
                                            style={{ backgroundColor: ev.warna + "20", color: ev.warna }}
                                        >
                                            {TIPE_MAP[ev.tipe]?.label}
                                        </span>
                                    </div>
                                ))
                            )}
                        </CardContent>
                    </Card>
                </div>
            </div>

            {/* Event Detail Modal */}
            {detailEvent && (
                <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm" onClick={() => setDetailEvent(null)}>
                    <Card className="w-full max-w-sm" onClick={(e) => e.stopPropagation()}>
                        <CardHeader>
                            <div className="flex items-start justify-between gap-3">
                                <div className="flex items-center gap-2 min-w-0">
                                    <div className="w-3 h-3 rounded-full shrink-0 mt-0.5" style={{ backgroundColor: detailEvent.warna }} />
                                    <CardTitle className="text-base leading-snug">{detailEvent.judul}</CardTitle>
                                </div>
                                <Button variant="ghost" size="icon" className="shrink-0 -mt-1 -mr-2" onClick={() => setDetailEvent(null)}>
                                    <X size={16} />
                                </Button>
                            </div>
                        </CardHeader>
                        <CardContent className="space-y-3">
                            <div className="text-sm space-y-1">
                                <p className="text-muted-foreground text-xs">Tanggal</p>
                                <p className="font-medium">
                                    {parseLocalDate(detailEvent.tanggalMulai).toLocaleDateString("id-ID", { weekday: "long", day: "numeric", month: "long", year: "numeric" })}
                                    {detailEvent.tanggalMulai !== detailEvent.tanggalSelesai &&
                                        ` – ${parseLocalDate(detailEvent.tanggalSelesai).toLocaleDateString("id-ID", { weekday: "long", day: "numeric", month: "long", year: "numeric" })}`}
                                </p>
                            </div>
                            <div>
                                <p className="text-muted-foreground text-xs mb-1">Tipe</p>
                                <span
                                    className="text-xs px-2 py-1 rounded-full font-medium"
                                    style={{ backgroundColor: detailEvent.warna + "20", color: detailEvent.warna }}
                                >
                                    {TIPE_MAP[detailEvent.tipe]?.label}
                                </span>
                            </div>
                            {detailEvent.deskripsi && (
                                <div>
                                    <p className="text-muted-foreground text-xs mb-1">Deskripsi</p>
                                    <p className="text-sm">{detailEvent.deskripsi}</p>
                                </div>
                            )}
                            {isAdmin && (
                                <div className="flex gap-2 pt-2">
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        className="flex-1 gap-1"
                                        onClick={() => openEdit(detailEvent)}
                                    >
                                        <Pencil size={14} /> Edit
                                    </Button>
                                    <Button
                                        variant="destructive"
                                        size="sm"
                                        className="flex-1 gap-1"
                                        disabled={deleteMutation.isPending}
                                        onClick={() => deleteMutation.mutate(detailEvent.id)}
                                    >
                                        {deleteMutation.isPending ? <Loader2 size={14} className="animate-spin" /> : <Trash2 size={14} />}
                                        Hapus
                                    </Button>
                                </div>
                            )}
                        </CardContent>
                    </Card>
                </div>
            )}

            {/* Add / Edit Modal */}
            {modalOpen && (
                <EventModal
                    defaultDate={selectedDate ?? todayStr}
                    event={editingEvent}
                    isLoading={createMutation.isPending || updateMutation.isPending}
                    onClose={closeModal}
                    onSubmit={(body) => {
                        if (editingEvent) {
                            updateMutation.mutate({ id: editingEvent.id, body });
                        } else {
                            createMutation.mutate(body as Omit<KalenderEvent, "id">);
                        }
                    }}
                />
            )}
        </div>
    );
}

// ── Event Modal ───────────────────────────────────────────────────────────────
function EventModal({
    defaultDate,
    event,
    isLoading,
    onClose,
    onSubmit,
}: {
    defaultDate: string;
    event: KalenderEvent | null;
    isLoading: boolean;
    onClose: () => void;
    onSubmit: (body: Partial<KalenderEvent>) => void;
}) {
    const [judul, setJudul] = useState(event?.judul ?? "");
    const [deskripsi, setDeskripsi] = useState(event?.deskripsi ?? "");
    const [tanggalMulai, setTanggalMulai] = useState(
        event ? event.tanggalMulai.substring(0, 10) : defaultDate
    );
    const [tanggalSelesai, setTanggalSelesai] = useState(
        event ? event.tanggalSelesai.substring(0, 10) : defaultDate
    );
    const [tipe, setTipe] = useState<TipeKalender>(event?.tipe ?? "LAINNYA");
    const [warna, setWarna] = useState(event?.warna ?? TIPE_MAP["LAINNYA"]!.color);
    const { toast } = useToast();

    // Auto-update warna when tipe changes
    function handleTipeChange(val: TipeKalender) {
        setTipe(val);
        setWarna(TIPE_MAP[val]?.color ?? "#6b7280");
    }

    function handleSubmit(e: React.FormEvent) {
        e.preventDefault();
        if (!judul.trim()) { toast({ title: "Judul wajib diisi", variant: "destructive" }); return; }
        if (tanggalSelesai < tanggalMulai) { toast({ title: "Tanggal selesai tidak boleh sebelum tanggal mulai", variant: "destructive" }); return; }
        onSubmit({ judul, deskripsi: deskripsi || undefined, tanggalMulai, tanggalSelesai, tipe, warna, isAllDay: true });
    }

    return (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm">
            <Card className="w-full max-w-lg max-h-[90vh] overflow-y-auto shadow-2xl bg-background">
                {/* Modal Header with colored accent */}
                <div
                    className="px-6 pt-6 pb-4 border-b flex items-center justify-between gap-3"
                    style={{ borderBottomColor: warna + "40" }}
                >
                    <div className="flex items-center gap-3 min-w-0">
                        <div
                            className="w-4 h-4 rounded-full shrink-0"
                            style={{ backgroundColor: warna }}
                        />
                        <h2 className="text-lg font-bold truncate">
                            {event ? "Edit Kegiatan" : "Tambah Kegiatan Baru"}
                        </h2>
                    </div>
                    <Button variant="ghost" size="icon" onClick={onClose} className="shrink-0">
                        <X size={18} />
                    </Button>
                </div>

                <form onSubmit={handleSubmit} className="px-6 py-5 space-y-5">
                    {/* Judul */}
                    <div className="space-y-1.5">
                        <label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                            Nama Kegiatan <span className="text-red-500">*</span>
                        </label>
                        <Input
                            value={judul}
                            onChange={(e) => setJudul(e.target.value)}
                            placeholder="Contoh: Ujian Semester Ganjil"
                            className="h-11 text-base"
                            required
                            autoFocus
                        />
                    </div>

                    {/* Tanggal */}
                    <div className="space-y-1.5">
                        <label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                            Periode <span className="text-red-500">*</span>
                        </label>
                        <div className="grid grid-cols-2 gap-3">
                            <div>
                                <p className="text-xs text-muted-foreground mb-1">Mulai</p>
                                <Input
                                    type="date"
                                    value={tanggalMulai}
                                    onChange={(e) => {
                                        setTanggalMulai(e.target.value);
                                        if (e.target.value > tanggalSelesai) setTanggalSelesai(e.target.value);
                                    }}
                                    className="h-11"
                                    required
                                />
                            </div>
                            <div>
                                <p className="text-xs text-muted-foreground mb-1">Selesai</p>
                                <Input
                                    type="date"
                                    value={tanggalSelesai}
                                    min={tanggalMulai}
                                    onChange={(e) => setTanggalSelesai(e.target.value)}
                                    className="h-11"
                                    required
                                />
                            </div>
                        </div>
                    </div>

                    {/* Tipe */}
                    <div className="space-y-1.5">
                        <label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                            Tipe Kegiatan
                        </label>
                        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                            {TIPE_OPTIONS.map((t) => {
                                const isSelected = tipe === t.value;
                                return (
                                    <button
                                        key={t.value}
                                        type="button"
                                        onClick={() => handleTipeChange(t.value)}
                                        className="flex flex-col items-center gap-1.5 px-2 py-3 rounded-xl border-2 text-xs font-semibold transition-all"
                                        style={
                                            isSelected
                                                ? {
                                                    borderColor: t.color,
                                                    backgroundColor: t.color + "18",
                                                    color: t.color,
                                                }
                                                : {
                                                    borderColor: "transparent",
                                                    backgroundColor: "var(--muted)",
                                                    color: "var(--muted-foreground)",
                                                }
                                        }
                                    >
                                        <div
                                            className="w-4 h-4 rounded-full"
                                            style={{ backgroundColor: t.color }}
                                        />
                                        <span className="leading-tight text-center">{t.label}</span>
                                    </button>
                                );
                            })}
                        </div>
                    </div>

                    {/* Deskripsi */}
                    <div className="space-y-1.5">
                        <label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                            Deskripsi <span className="text-muted-foreground font-normal normal-case">(opsional)</span>
                        </label>
                        <textarea
                            value={deskripsi}
                            onChange={(e) => setDeskripsi(e.target.value)}
                            placeholder="Keterangan tambahan tentang kegiatan ini..."
                            rows={3}
                            className="w-full rounded-lg border border-input bg-background px-3 py-2.5 text-sm resize-none focus:outline-none focus:ring-2 focus:ring-ring transition"
                        />
                    </div>

                    {/* Actions */}
                    <div className="flex gap-3 pt-1 border-t">
                        <Button type="button" variant="outline" className="flex-1 h-11" onClick={onClose}>
                            Batal
                        </Button>
                        <Button
                            type="submit"
                            className="flex-1 h-11 font-semibold"
                            disabled={isLoading}
                            style={{ backgroundColor: warna }}
                        >
                            {isLoading && <Loader2 size={16} className="animate-spin mr-2" />}
                            {event ? "Simpan Perubahan" : "Tambah Kegiatan"}
                        </Button>
                    </div>
                </form>
            </Card>
        </div>
    );
}
