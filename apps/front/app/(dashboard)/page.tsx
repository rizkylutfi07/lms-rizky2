"use client";

import {
  Activity,
  BarChart3,
  BookOpen,
  CalendarRange,
  CheckCircle2,
  Circle,
  ClipboardCheck,
  Clock,
  FileCheck,
  Globe2,
  Layers,
  MessageSquare,
  ShieldCheck,
  Sparkles,
  Star,
  Timer,
  Users2,
} from "lucide-react";

import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { cn } from "@/lib/utils";
import { useRole } from "./role-context";
import StudentDashboard from "@/components/student-dashboard";
import { AnnouncementWidget } from "@/components/announcement-widget";
import { useEffect, useState } from "react";
import { analyticsApi } from "@/lib/api";
import { apiFetch } from "@/lib/api-client";
import Link from "next/link";





export default function HomePage() {
  const { role } = useRole();
  const [dashboardData, setDashboardData] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  // Show student dashboard for SISWA role
  if (role === "SISWA") {
    return <StudentDashboard />;
  }

  useEffect(() => {
    async function fetchData() {
      try {
        setLoading(true);
        if (role === "ADMIN") {
          const data = await analyticsApi.getAdminDashboard();
          setDashboardData(data);
        } else if (role === "GURU") {
          const data = await analyticsApi.getGuruDashboard();
          setDashboardData(data);
        }
      } catch (error) {
        console.error("Failed to fetch dashboard data:", error);
      } finally {
        setLoading(false);
      }
    }

    if (role) {
      fetchData();
    }
  }, [role]);

  const roleHeadline =
    role === "ADMIN"
      ? "Ruang kontrol sekolah"
      : role === "GURU"
        ? "Workspace mengajar & laporan"
        : "Dashboard belajar siswa";

  const roleSubtitle =
    role === "ADMIN"
      ? "Kelola operasional, data akademik, CBT, dan analitik."
      : role === "GURU"
        ? "Atur kelas, materi, ujian, dan rekap nilai."
        : "Lihat jadwal, materi, CBT, dan pengumuman terbaru.";

  const showManagement = role === "ADMIN";
  const showGuruTasks = true; // Since SISWA returns early, this is always true for remaining roles (ADMIN, GURU, etc) unless intended otherwise.

  // ADMIN HIGHLIGHTS
  const adminHighlights = [
    {
      title: "Total Siswa",
      value: loading ? "..." : `${dashboardData?.siswaCount || 0} siswa`,
      trend: "Data aktif",
      accent: "from-cyan-400/30 to-sky-500/20",
    },
    {
      title: "Total Guru",
      value: loading ? "..." : `${dashboardData?.guruCount || 0} guru`,
      trend: "Data aktif",
      accent: "from-emerald-400/25 to-teal-500/15",
    },
    {
      title: "Ujian Berjalan",
      value: loading ? "..." : `${dashboardData?.activeExams || 0} sesi`,
      trend: "Realtime monitoring",
      accent: "from-purple-400/30 to-indigo-500/10",
    },
  ];

  // GURU HIGHLIGHTS
  const guruHighlights = [
    {
      title: "Kelas Saya",
      value: loading ? "..." : `${dashboardData?.stats?.totalClasses || 0} kelas`,
      trend: "Diampu saat ini",
      accent: "from-cyan-400/30 to-sky-500/20",
    },
    {
      title: "Total Siswa",
      value: loading ? "..." : `${dashboardData?.stats?.totalStudents || 0} siswa`,
      trend: "Dalam jangkauan",
      accent: "from-emerald-400/25 to-teal-500/15",
    },
    {
      title: "Perlu Dinilai",
      value: loading ? "..." : `${dashboardData?.stats?.tasksToGrade || 0} tugas`,
      trend: "Menunggu review",
      accent: "from-purple-400/30 to-indigo-500/10",
    },
  ];

  const highlights = role === "ADMIN" ? adminHighlights : guruHighlights;

  // GURU SCHEDULE
  const schedule = role === "GURU" && dashboardData?.todaySchedule ? dashboardData.todaySchedule.map((s: any) => ({
    time: s.time,
    title: s.className, // Fallback reuse UI field
    mentor: s.subject,
    room: s.room,
    mode: "On-site"
  })) : [];

  // CBT ITEMS - Dynamic based on real data
  const cbtItems = [
    {
      title: "Data Soal",
      detail: "Bank soal adaptif dengan tagging kompetensi dan tingkat kesulitan.",
      stat: loading ? "..." : `${dashboardData?.totalSoal || 0} soal aktif`,
      icon: Layers,
      badge: "Bank Soal",
    },
    {
      title: "Data Ujian",
      detail: "Template ujian, mata pelajaran, dan aturan kelulusan.",
      stat: loading ? "..." : `${dashboardData?.totalUjian || 0} ujian terdaftar`,
      icon: FileCheck,
      badge: "Ujian",
    },
    {
      title: "Data Paket Soal",
      detail: "Kelola paket soal yang siap untuk ujian.",
      stat: loading ? "..." : `${dashboardData?.totalPaketSoal || 0} paket`,
      icon: Timer,
      badge: "Paket",
    },
    {
      title: "Tugas Dikumpulkan",
      detail: "Tugas siswa yang menunggu penilaian.",
      stat: loading ? "..." : `${dashboardData?.tugasDikumpulkan || 0} tugas`,
      icon: Activity,
      badge: "Menunggu",
    },
    {
      title: "Penilaian",
      detail: "Tugas yang telah dinilai.",
      stat: loading ? "..." : `${dashboardData?.tugasDinilai || 0} sudah dinilai`,
      icon: Star,
      badge: "Nilai",
    },
  ];

  // ESSENTIAL DATA - Dynamic based on real data
  const essentialData = [
    {
      title: "Data Siswa",
      detail: "Profil, kehadiran, dan histori kelas.",
      stat: loading ? "..." : `${dashboardData?.siswaCount || 0} siswa aktif`,
      action: "Kelola siswa",
      href: "/siswa",
      icon: Users2,
    },
    {
      title: "Data Guru",
      detail: "Penugasan, beban mengajar, dan sertifikasi.",
      stat: loading ? "..." : `${dashboardData?.guruCount || 0} guru`,
      action: "Kelola guru",
      href: "/guru",
      icon: Users2,
    },
    {
      title: "Data Kelas",
      detail: "Struktur kelas, wali, dan kapasitas.",
      stat: loading ? "..." : `${dashboardData?.kelasCount || 0} kelas`,
      action: "Kelola kelas",
      href: "/kelas",
      icon: Layers,
    },
    {
      title: "Tahun Ajaran Aktif",
      detail: "Periode berjalan, kalender akademik, dan status aktif.",
      stat: loading ? "..." : dashboardData?.tahunAjaranAktif || "N/A",
      action: "Setel tahun ajaran",
      href: "/tahun-ajaran",
      icon: CalendarRange,
    },
    {
      title: "Mata Pelajaran",
      detail: "Silabus, pemetaan kompetensi, dan penanggung jawab.",
      stat: loading ? "..." : `${dashboardData?.mapelCount || 0} mapel`,
      action: "Kelola mapel",
      href: "/mata-pelajaran",
      icon: BookOpen,
    },
  ];

  // Get today's date formatted
  const todayDate = new Date().toLocaleDateString("id-ID", {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  });

  // For GURU: Show simplified, focused dashboard
  if (role === "GURU") {
    const userName = dashboardData?.name || "Guru";
    const greeting = new Date().getHours() < 12 ? "Selamat Pagi" : new Date().getHours() < 15 ? "Selamat Siang" : new Date().getHours() < 18 ? "Selamat Sore" : "Selamat Malam";

    return (
      <div className="space-y-4 sm:space-y-6 p-1 sm:p-0">
        {/* Hero Greeting Card */}
        <Card className="overflow-hidden border-0 bg-gradient-to-br from-primary via-primary/90 to-primary/70 text-primary-foreground shadow-xl">
          <CardContent className="p-4 sm:p-6">
            <div className="flex items-center justify-between">
              <div className="space-y-1">
                <p className="text-primary-foreground/80 text-xs sm:text-sm">{todayDate}</p>
                <h1 className="text-xl sm:text-2xl font-bold">{greeting}! 👋</h1>
                <p className="text-primary-foreground/90 text-sm">Semoga hari Anda menyenangkan</p>
              </div>
              <div className="hidden sm:block">
                <div className="h-16 w-16 rounded-full bg-white/20 backdrop-blur flex items-center justify-center">
                  <Sparkles size={32} className="text-white" />
                </div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Quick Stats Row - Enhanced with icons */}
        <div className="grid grid-cols-3 gap-2 sm:gap-3">
          <Card className="bg-gradient-to-br from-blue-500/20 via-blue-500/10 to-transparent border-blue-500/30 hover:shadow-lg hover:shadow-blue-500/10 transition-all">
            <CardContent className="p-3 sm:p-4">
              <div className="flex items-center justify-center sm:justify-start gap-2 sm:gap-3">
                <div className="hidden sm:flex h-10 w-10 rounded-lg bg-blue-500/20 items-center justify-center">
                  <Users2 size={20} className="text-blue-600" />
                </div>
                <div className="text-center sm:text-left">
                  <p className="text-2xl sm:text-3xl font-bold text-blue-600">
                    {loading ? "..." : dashboardData?.stats?.totalClasses || 0}
                  </p>
                  <p className="text-[10px] sm:text-xs text-muted-foreground">Kelas</p>
                </div>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-gradient-to-br from-emerald-500/20 via-emerald-500/10 to-transparent border-emerald-500/30 hover:shadow-lg hover:shadow-emerald-500/10 transition-all">
            <CardContent className="p-3 sm:p-4">
              <div className="flex items-center justify-center sm:justify-start gap-2 sm:gap-3">
                <div className="hidden sm:flex h-10 w-10 rounded-lg bg-emerald-500/20 items-center justify-center">
                  <Users2 size={20} className="text-emerald-600" />
                </div>
                <div className="text-center sm:text-left">
                  <p className="text-2xl sm:text-3xl font-bold text-emerald-600">
                    {loading ? "..." : dashboardData?.stats?.totalStudents || 0}
                  </p>
                  <p className="text-[10px] sm:text-xs text-muted-foreground">Siswa</p>
                </div>
              </div>
            </CardContent>
          </Card>
          <Card className="bg-gradient-to-br from-amber-500/20 via-amber-500/10 to-transparent border-amber-500/30 hover:shadow-lg hover:shadow-amber-500/10 transition-all">
            <CardContent className="p-3 sm:p-4">
              <div className="flex items-center justify-center sm:justify-start gap-2 sm:gap-3">
                <div className="hidden sm:flex h-10 w-10 rounded-lg bg-amber-500/20 items-center justify-center">
                  <FileCheck size={20} className="text-amber-600" />
                </div>
                <div className="text-center sm:text-left">
                  <p className="text-2xl sm:text-3xl font-bold text-amber-600">
                    {loading ? "..." : dashboardData?.stats?.tasksToGrade || 0}
                  </p>
                  <p className="text-[10px] sm:text-xs text-muted-foreground">Dinilai</p>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Today's Schedule - Enhanced */}
        <Card className="border-border/50 bg-gradient-to-br from-card to-card/50">
          <CardHeader className="pb-2 px-3 sm:px-6">
            <div className="flex items-center justify-between">
              <CardTitle className="flex items-center gap-2 text-base sm:text-lg">
                <div className="h-8 w-8 rounded-lg bg-primary/10 flex items-center justify-center">
                  <CalendarRange size={16} className="text-primary" />
                </div>
                Jadwal Hari Ini
              </CardTitle>
              <Link href="/jadwal-pelajaran">
                <Button variant="outline" size="sm" className="text-xs h-7">
                  Lihat Semua
                </Button>
              </Link>
            </div>
          </CardHeader>
          <CardContent className="px-3 sm:px-6">
            {loading ? (
              <div className="flex items-center justify-center py-8">
                <div className="animate-pulse flex items-center gap-2 text-muted-foreground">
                  <Clock size={16} className="animate-spin" />
                  <span className="text-sm">Memuat jadwal...</span>
                </div>
              </div>
            ) : schedule.length > 0 ? (
              <div className="space-y-2">
                {schedule.slice(0, 4).map((item: any, idx: number) => {
                  const colorStyles = [
                    { bg: "from-blue-500/10", border: "border-blue-500/20", text: "text-blue-600" },
                    { bg: "from-purple-500/10", border: "border-purple-500/20", text: "text-purple-600" },
                    { bg: "from-emerald-500/10", border: "border-emerald-500/20", text: "text-emerald-600" },
                    { bg: "from-orange-500/10", border: "border-orange-500/20", text: "text-orange-600" },
                  ] as const;
                  const style = colorStyles[idx % colorStyles.length]!

                  return (
                    <div
                      key={idx}
                      className={`flex items-center gap-3 p-3 rounded-xl border bg-gradient-to-r ${style.bg} to-transparent hover:shadow-md transition-all`}
                    >
                      <div className={`flex h-12 w-12 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br ${style.bg} ${style.border}`}>
                        <div className="text-center">
                          <p className={`text-xs font-bold ${style.text}`}>{item.time?.split(':')[0] || ''}</p>
                          <p className={`text-[10px] ${style.text}`}>{item.time?.split(':')[1] ? `:${item.time.split(':')[1]}` : ''}</p>
                        </div>
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="font-semibold text-sm truncate">{item.mentor}</p>
                        <p className="text-xs text-muted-foreground truncate">
                          {item.title} • {item.room}
                        </p>
                      </div>
                      <Badge tone="info" className="shrink-0 text-[10px]">
                        {item.time} WIB
                      </Badge>
                    </div>
                  );
                })}
              </div>
            ) : (
              <div className="text-center py-8">
                <div className="h-16 w-16 rounded-full bg-muted/50 flex items-center justify-center mx-auto mb-3">
                  <CalendarRange size={28} className="text-muted-foreground/50" />
                </div>
                <p className="text-sm text-muted-foreground">Tidak ada jadwal mengajar hari ini</p>
                <p className="text-xs text-muted-foreground/70 mt-1">Nikmati waktu luang Anda! 🎉</p>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Quick Actions Grid - Enhanced */}
        <div className="grid grid-cols-2 gap-3">
          {/* Absensi Kelas */}
          <Link href="/absensi-kelas">
            <Card className="h-full group hover:shadow-lg hover:shadow-emerald-500/10 hover:border-emerald-500/50 transition-all cursor-pointer overflow-hidden">
              <CardContent className="p-4 flex flex-col items-center text-center gap-3 relative">
                <div className="absolute inset-0 bg-gradient-to-br from-emerald-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                <div className="h-14 w-14 rounded-2xl bg-gradient-to-br from-emerald-500/20 to-emerald-600/10 flex items-center justify-center group-hover:scale-110 transition-transform">
                  <ClipboardCheck size={28} className="text-emerald-600" />
                </div>
                <div>
                  <p className="font-semibold text-sm">Absensi Kelas</p>
                  <p className="text-[10px] text-muted-foreground">Isi kehadiran siswa</p>
                </div>
              </CardContent>
            </Card>
          </Link>

          {/* Tugas */}
          <Link href="/tugas-management">
            <Card className="h-full group hover:shadow-lg hover:shadow-purple-500/10 hover:border-purple-500/50 transition-all cursor-pointer overflow-hidden">
              <CardContent className="p-4 flex flex-col items-center text-center gap-3 relative">
                <div className="absolute inset-0 bg-gradient-to-br from-purple-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                <div className="h-14 w-14 rounded-2xl bg-gradient-to-br from-purple-500/20 to-purple-600/10 flex items-center justify-center group-hover:scale-110 transition-transform relative">
                  <FileCheck size={28} className="text-purple-600" />
                  {!loading && (dashboardData?.stats?.tasksToGrade || 0) > 0 && (
                    <span className="absolute -top-1 -right-1 h-5 w-5 bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center animate-pulse">
                      {dashboardData?.stats?.tasksToGrade}
                    </span>
                  )}
                </div>
                <div>
                  <p className="font-semibold text-sm">Tugas Siswa</p>
                  <p className="text-[10px] text-muted-foreground">Review & nilai tugas</p>
                </div>
              </CardContent>
            </Card>
          </Link>

          {/* Materi */}
          <Link href="/materi-management">
            <Card className="h-full group hover:shadow-lg hover:shadow-blue-500/10 hover:border-blue-500/50 transition-all cursor-pointer overflow-hidden">
              <CardContent className="p-4 flex flex-col items-center text-center gap-3 relative">
                <div className="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                <div className="h-14 w-14 rounded-2xl bg-gradient-to-br from-blue-500/20 to-blue-600/10 flex items-center justify-center group-hover:scale-110 transition-transform">
                  <BookOpen size={28} className="text-blue-600" />
                </div>
                <div>
                  <p className="font-semibold text-sm">Materi Ajar</p>
                  <p className="text-[10px] text-muted-foreground">Kelola materi pelajaran</p>
                </div>
              </CardContent>
            </Card>
          </Link>

          {/* Ujian */}
          <Link href="/ujian">
            <Card className="h-full group hover:shadow-lg hover:shadow-orange-500/10 hover:border-orange-500/50 transition-all cursor-pointer overflow-hidden">
              <CardContent className="p-4 flex flex-col items-center text-center gap-3 relative">
                <div className="absolute inset-0 bg-gradient-to-br from-orange-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                <div className="h-14 w-14 rounded-2xl bg-gradient-to-br from-orange-500/20 to-orange-600/10 flex items-center justify-center group-hover:scale-110 transition-transform">
                  <Timer size={28} className="text-orange-600" />
                </div>
                <div>
                  <p className="font-semibold text-sm">Ujian & CBT</p>
                  <p className="text-[10px] text-muted-foreground">Kelola ujian online</p>
                </div>
              </CardContent>
            </Card>
          </Link>
        </div>

        {/* Announcements */}
        <AnnouncementWidget role={role} />
      </div>
    );
  }

  // ADMIN Dashboard (original layout)
  return (
    <div className="space-y-6">
      <div className="grid gap-6 xl:grid-cols-[1.1fr_0.9fr]">
        <Card className="overflow-hidden border-primary/40 bg-gradient-to-br from-primary/10 via-card/60 to-background/80">
          <CardHeader className="gap-4 pb-4">
            <div className="flex flex-wrap items-center gap-3">
              <Badge tone="info" className="uppercase tracking-[0.18em]">
                LMS Modern
              </Badge>
              <Badge tone="success" className="gap-2">
                <CheckCircle2 size={14} />
                Terhubung SIS
              </Badge>
            </div>
            <CardTitle className="text-3xl md:text-4xl">
              {roleHeadline}
            </CardTitle>
            <CardDescription className="text-base text-muted-foreground md:max-w-3xl">
              {roleSubtitle}
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="grid gap-4 sm:grid-cols-3">
              {highlights.map((item) => (
                <div
                  key={item.title}
                  className={cn(
                    "rounded-xl border border-border p-4 shadow-lg shadow-black/10",
                    "bg-gradient-to-br",
                    item.accent,
                  )}
                >
                  <p className="text-xs uppercase tracking-[0.16em] text-muted-foreground">
                    {item.title}
                  </p>
                  <p className="mt-2 text-2xl font-semibold">{item.value}</p>
                  <p className="text-xs text-primary">{item.trend}</p>
                </div>
              ))}
            </div>
            <div className="flex flex-wrap items-center gap-2">
              <Button size="sm" variant="secondary" className="gap-2">
                <ClipboardCheck size={16} />
                Tinjau performa
              </Button>
              <Button size="sm" variant="outline" className="gap-2" asChild>
                <Link href="/pengumuman">
                  <MessageSquare size={16} />
                  Kirim pengumuman
                </Link>
              </Button>
              <Button size="sm" variant="ghost" className="gap-2 text-muted-foreground">
                <Globe2 size={16} />
                Lihat portal siswa
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>

      <Card className="border-primary/30 bg-card/70">
        <CardHeader className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
          <div>
            <CardTitle className="flex items-center gap-2">
              <ClipboardCheck size={18} />
              CBT & Ujian Digital
            </CardTitle>
            <CardDescription>
              Kelola seluruh siklus CBT: Data Soal, Data Ujian, Data Sesi, Monitoring, Penilaian.
            </CardDescription>
          </div>
          <div className="flex flex-wrap gap-2">
            <Badge tone="info">Terintegrasi</Badge>
            <Badge tone="success">Anti-cheat</Badge>
          </div>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
            {cbtItems.map((item) => {
              const Icon = item.icon;
              return (
                <div
                  key={item.title}
                  className="flex flex-col gap-3 rounded-xl border border-white/8 bg-muted/40 p-4 transition hover:border-primary/40 hover:shadow-lg hover:shadow-primary/15"
                >
                  <div className="flex items-center gap-3">
                    <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/15 text-primary">
                      <Icon size={18} />
                    </div>
                    <div>
                      <p className="text-sm font-semibold">{item.title}</p>
                      <p className="text-xs text-muted-foreground">{item.stat}</p>
                    </div>
                    <Badge tone="warning" className="ml-auto text-[11px]">
                      {item.badge}
                    </Badge>
                  </div>
                  <p className="text-sm text-muted-foreground">{item.detail}</p>
                </div>
              );
            })}
          </div>
          <div className="flex flex-wrap items-center gap-2">
            <Button size="sm" className="gap-2">
              <ClipboardCheck size={16} />
              Masuk ke menu CBT
            </Button>
            <Button size="sm" variant="outline" className="gap-2">
              <Activity size={16} />
              Pantau ujian live
            </Button>
            <Button size="sm" variant="ghost" className="gap-2 text-muted-foreground">
              <FileCheck size={16} />
              Lihat template ujian
            </Button>
          </div>
        </CardContent>
      </Card>

      {showManagement && (
        <Card className="border-border bg-card/70">
          <CardHeader className="flex flex-col gap-2 md:flex-row md:items-center md:justify-between">
            <div>
              <CardTitle>Data akademik esensial</CardTitle>
              <CardDescription>Kelola data dasar sekolah sebelum fitur lanjut.</CardDescription>
            </div>
            <Badge tone="info">Sinkron SIS</Badge>
          </CardHeader>
          <CardContent className="grid gap-3 lg:grid-cols-2 xl:grid-cols-3">
            {essentialData.map((item) => {
              const Icon = item.icon;
              return (
                <div
                  key={item.title}
                  className="flex flex-col gap-3 rounded-xl border border-white/8 bg-muted/40 p-4 transition hover:border-primary/40 hover:shadow-lg hover:shadow-primary/15"
                >
                  <div className="flex items-start gap-3">
                    <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/15 text-primary">
                      <Icon size={18} />
                    </div>
                    <div className="flex-1 space-y-1">
                      <p className="text-sm font-semibold">{item.title}</p>
                      <p className="text-xs text-muted-foreground">{item.detail}</p>
                      <p className="text-xs text-primary">{item.stat}</p>
                    </div>
                  </div>
                  <Button size="sm" variant="outline" className="w-fit gap-2" asChild>
                    <a href={item.href}>
                      <Sparkles size={14} />
                      {item.action}
                    </a>
                  </Button>
                </div>
              );
            })}
          </CardContent>
        </Card>
      )}

      {/* Announcements Widget */}
      <div className="md:col-span-1 xl:col-span-1">
        <AnnouncementWidget role={role} />
      </div>
    </div>
  );
}



