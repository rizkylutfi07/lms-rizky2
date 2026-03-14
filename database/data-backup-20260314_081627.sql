--
-- PostgreSQL database dump
--

\restrict hEFuwH2iSCutVjOVSTJmY3pDtGjNFdMHYuYxaGNzmQbQ4q7G1N2qXQSHzyOfw4P

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public."_GuruMataPelajaran" DROP CONSTRAINT IF EXISTS "_GuruMataPelajaran_B_fkey";
ALTER TABLE IF EXISTS ONLY public."_GuruMataPelajaran" DROP CONSTRAINT IF EXISTS "_GuruMataPelajaran_A_fkey";
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_paketSoalId_fkey";
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_jenisUjianId_fkey";
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."UjianSoal" DROP CONSTRAINT IF EXISTS "UjianSoal_ujianId_fkey";
ALTER TABLE IF EXISTS ONLY public."UjianSoal" DROP CONSTRAINT IF EXISTS "UjianSoal_bankSoalId_fkey";
ALTER TABLE IF EXISTS ONLY public."UjianSiswa" DROP CONSTRAINT IF EXISTS "UjianSiswa_ujianId_fkey";
ALTER TABLE IF EXISTS ONLY public."UjianSiswa" DROP CONSTRAINT IF EXISTS "UjianSiswa_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."UjianKelas" DROP CONSTRAINT IF EXISTS "UjianKelas_ujianId_fkey";
ALTER TABLE IF EXISTS ONLY public."UjianKelas" DROP CONSTRAINT IF EXISTS "UjianKelas_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Tugas" DROP CONSTRAINT IF EXISTS "Tugas_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Tugas" DROP CONSTRAINT IF EXISTS "Tugas_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Tugas" DROP CONSTRAINT IF EXISTS "Tugas_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."TugasSiswa" DROP CONSTRAINT IF EXISTS "TugasSiswa_tugasId_fkey";
ALTER TABLE IF EXISTS ONLY public."TugasSiswa" DROP CONSTRAINT IF EXISTS "TugasSiswa_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."TugasSiswaFile" DROP CONSTRAINT IF EXISTS "TugasSiswaFile_tugasSiswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."TugasAttachment" DROP CONSTRAINT IF EXISTS "TugasAttachment_tugasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Siswa" DROP CONSTRAINT IF EXISTS "Siswa_userId_fkey";
ALTER TABLE IF EXISTS ONLY public."Siswa" DROP CONSTRAINT IF EXISTS "Siswa_tahunAjaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Siswa" DROP CONSTRAINT IF EXISTS "Siswa_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."SiswaKelasHistory" DROP CONSTRAINT IF EXISTS "SiswaKelasHistory_tahunAjaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."SiswaKelasHistory" DROP CONSTRAINT IF EXISTS "SiswaKelasHistory_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."SiswaKelasHistory" DROP CONSTRAINT IF EXISTS "SiswaKelasHistory_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."RPP" DROP CONSTRAINT IF EXISTS "RPP_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."RPP" DROP CONSTRAINT IF EXISTS "RPP_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."RPPKelas" DROP CONSTRAINT IF EXISTS "RPPKelas_rppId_fkey";
ALTER TABLE IF EXISTS ONLY public."RPPKelas" DROP CONSTRAINT IF EXISTS "RPPKelas_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProgressSiswa" DROP CONSTRAINT IF EXISTS "ProgressSiswa_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProgressSiswa" DROP CONSTRAINT IF EXISTS "ProgressSiswa_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Pengumuman" DROP CONSTRAINT IF EXISTS "Pengumuman_authorId_fkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoal" DROP CONSTRAINT IF EXISTS "PaketSoal_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoal" DROP CONSTRAINT IF EXISTS "PaketSoal_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoalKelas" DROP CONSTRAINT IF EXISTS "PaketSoalKelas_paketSoalId_fkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoalKelas" DROP CONSTRAINT IF EXISTS "PaketSoalKelas_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoalItem" DROP CONSTRAINT IF EXISTS "PaketSoalItem_paketSoalId_fkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoalItem" DROP CONSTRAINT IF EXISTS "PaketSoalItem_bankSoalId_fkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."MateriBookmark" DROP CONSTRAINT IF EXISTS "MateriBookmark_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."MateriBookmark" DROP CONSTRAINT IF EXISTS "MateriBookmark_materiId_fkey";
ALTER TABLE IF EXISTS ONLY public."MateriAttachment" DROP CONSTRAINT IF EXISTS "MateriAttachment_materiId_fkey";
ALTER TABLE IF EXISTS ONLY public."Kelas" DROP CONSTRAINT IF EXISTS "Kelas_waliKelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Kelas" DROP CONSTRAINT IF EXISTS "Kelas_jurusanId_fkey";
ALTER TABLE IF EXISTS ONLY public."JurnalMengajar" DROP CONSTRAINT IF EXISTS "JurnalMengajar_absensiKelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."JadwalPelajaran" DROP CONSTRAINT IF EXISTS "JadwalPelajaran_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."JadwalPelajaran" DROP CONSTRAINT IF EXISTS "JadwalPelajaran_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."JadwalPelajaran" DROP CONSTRAINT IF EXISTS "JadwalPelajaran_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."Guru" DROP CONSTRAINT IF EXISTS "Guru_userId_fkey";
ALTER TABLE IF EXISTS ONLY public."ForumThread" DROP CONSTRAINT IF EXISTS "ForumThread_kategoriId_fkey";
ALTER TABLE IF EXISTS ONLY public."ForumReaction" DROP CONSTRAINT IF EXISTS "ForumReaction_postId_fkey";
ALTER TABLE IF EXISTS ONLY public."ForumPost" DROP CONSTRAINT IF EXISTS "ForumPost_threadId_fkey";
ALTER TABLE IF EXISTS ONLY public."ForumPost" DROP CONSTRAINT IF EXISTS "ForumPost_parentId_fkey";
ALTER TABLE IF EXISTS ONLY public."ForumKategori" DROP CONSTRAINT IF EXISTS "ForumKategori_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."ForumKategori" DROP CONSTRAINT IF EXISTS "ForumKategori_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."Attendance" DROP CONSTRAINT IF EXISTS "Attendance_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_jadwalPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelasDetail" DROP CONSTRAINT IF EXISTS "AbsensiKelasDetail_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelasDetail" DROP CONSTRAINT IF EXISTS "AbsensiKelasDetail_absensiKelasId_fkey";
DROP INDEX IF EXISTS public."_GuruMataPelajaran_B_index";
DROP INDEX IF EXISTS public."User_email_key";
DROP INDEX IF EXISTS public."Ujian_tanggalMulai_idx";
DROP INDEX IF EXISTS public."Ujian_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."Ujian_kode_key";
DROP INDEX IF EXISTS public."Ujian_kelasId_idx";
DROP INDEX IF EXISTS public."Ujian_jenisUjianId_idx";
DROP INDEX IF EXISTS public."Ujian_guruId_idx";
DROP INDEX IF EXISTS public."UjianSoal_ujianId_idx";
DROP INDEX IF EXISTS public."UjianSoal_ujianId_bankSoalId_key";
DROP INDEX IF EXISTS public."UjianSiswa_ujianId_siswaId_key";
DROP INDEX IF EXISTS public."UjianSiswa_ujianId_idx";
DROP INDEX IF EXISTS public."UjianSiswa_tokenAkses_key";
DROP INDEX IF EXISTS public."UjianSiswa_siswaId_idx";
DROP INDEX IF EXISTS public."UjianKelas_ujianId_kelasId_key";
DROP INDEX IF EXISTS public."UjianKelas_ujianId_idx";
DROP INDEX IF EXISTS public."UjianKelas_kelasId_idx";
DROP INDEX IF EXISTS public."Tugas_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."Tugas_kelasId_idx";
DROP INDEX IF EXISTS public."Tugas_guruId_idx";
DROP INDEX IF EXISTS public."Tugas_deadline_idx";
DROP INDEX IF EXISTS public."TugasSiswa_tugasId_siswaId_key";
DROP INDEX IF EXISTS public."TugasSiswa_tugasId_idx";
DROP INDEX IF EXISTS public."TugasSiswa_status_idx";
DROP INDEX IF EXISTS public."TugasSiswa_siswaId_idx";
DROP INDEX IF EXISTS public."TugasSiswaFile_tugasSiswaId_idx";
DROP INDEX IF EXISTS public."TugasAttachment_tugasId_idx";
DROP INDEX IF EXISTS public."TahunAjaran_tahun_key";
DROP INDEX IF EXISTS public."Siswa_userId_key";
DROP INDEX IF EXISTS public."Siswa_nisn_key";
DROP INDEX IF EXISTS public."SiswaKelasHistory_siswaId_idx";
DROP INDEX IF EXISTS public."SiswaKelasHistory_kelasId_tahunAjaranId_idx";
DROP INDEX IF EXISTS public."Settings_key_key";
DROP INDEX IF EXISTS public."RPP_status_idx";
DROP INDEX IF EXISTS public."RPP_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."RPP_kode_key";
DROP INDEX IF EXISTS public."RPP_isPublished_idx";
DROP INDEX IF EXISTS public."RPP_guruId_idx";
DROP INDEX IF EXISTS public."RPPKelas_rppId_kelasId_key";
DROP INDEX IF EXISTS public."RPPKelas_rppId_idx";
DROP INDEX IF EXISTS public."RPPKelas_kelasId_idx";
DROP INDEX IF EXISTS public."ProgressSiswa_siswaId_mataPelajaranId_key";
DROP INDEX IF EXISTS public."ProgressSiswa_siswaId_idx";
DROP INDEX IF EXISTS public."ProgressSiswa_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."PaketSoal_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."PaketSoal_kode_key";
DROP INDEX IF EXISTS public."PaketSoal_guruId_idx";
DROP INDEX IF EXISTS public."PaketSoalKelas_paketSoalId_kelasId_key";
DROP INDEX IF EXISTS public."PaketSoalKelas_paketSoalId_idx";
DROP INDEX IF EXISTS public."PaketSoalKelas_kelasId_idx";
DROP INDEX IF EXISTS public."PaketSoalItem_paketSoalId_idx";
DROP INDEX IF EXISTS public."PaketSoalItem_paketSoalId_bankSoalId_key";
DROP INDEX IF EXISTS public."Notifikasi_userId_idx";
DROP INDEX IF EXISTS public."Notifikasi_isRead_idx";
DROP INDEX IF EXISTS public."Notifikasi_createdAt_idx";
DROP INDEX IF EXISTS public."Materi_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."Materi_kelasId_idx";
DROP INDEX IF EXISTS public."Materi_isPublished_idx";
DROP INDEX IF EXISTS public."Materi_guruId_idx";
DROP INDEX IF EXISTS public."MateriBookmark_siswaId_idx";
DROP INDEX IF EXISTS public."MateriBookmark_materiId_siswaId_key";
DROP INDEX IF EXISTS public."MateriAttachment_materiId_idx";
DROP INDEX IF EXISTS public."MataPelajaran_kode_key";
DROP INDEX IF EXISTS public."Jurusan_kode_key";
DROP INDEX IF EXISTS public."JurnalMengajar_absensiKelasId_key";
DROP INDEX IF EXISTS public."JurnalMengajar_absensiKelasId_idx";
DROP INDEX IF EXISTS public."JenisUjian_urutan_idx";
DROP INDEX IF EXISTS public."JenisUjian_nama_key";
DROP INDEX IF EXISTS public."JenisUjian_kode_key";
DROP INDEX IF EXISTS public."JenisUjian_aktif_idx";
DROP INDEX IF EXISTS public."JadwalPelajaran_kelasId_idx";
DROP INDEX IF EXISTS public."JadwalPelajaran_hari_idx";
DROP INDEX IF EXISTS public."Guru_userId_key";
DROP INDEX IF EXISTS public."Guru_nip_key";
DROP INDEX IF EXISTS public."Guru_email_key";
DROP INDEX IF EXISTS public."ForumThread_kategoriId_idx";
DROP INDEX IF EXISTS public."ForumThread_createdAt_idx";
DROP INDEX IF EXISTS public."ForumThread_authorId_idx";
DROP INDEX IF EXISTS public."ForumReaction_userId_idx";
DROP INDEX IF EXISTS public."ForumReaction_postId_userId_tipe_key";
DROP INDEX IF EXISTS public."ForumReaction_postId_idx";
DROP INDEX IF EXISTS public."ForumPost_threadId_idx";
DROP INDEX IF EXISTS public."ForumPost_parentId_idx";
DROP INDEX IF EXISTS public."ForumPost_authorId_idx";
DROP INDEX IF EXISTS public."ForumKategori_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."ForumKategori_kelasId_idx";
DROP INDEX IF EXISTS public."BankSoal_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."BankSoal_kode_key";
DROP INDEX IF EXISTS public."BankSoal_kelasId_idx";
DROP INDEX IF EXISTS public."BankSoal_guruId_idx";
DROP INDEX IF EXISTS public."Attendance_tanggal_idx";
DROP INDEX IF EXISTS public."Attendance_siswaId_tanggal_key";
DROP INDEX IF EXISTS public."Attendance_siswaId_tanggal_idx";
DROP INDEX IF EXISTS public."AbsensiKelas_tanggal_jadwalPelajaranId_key";
DROP INDEX IF EXISTS public."AbsensiKelas_tanggal_idx";
DROP INDEX IF EXISTS public."AbsensiKelas_kelasId_idx";
DROP INDEX IF EXISTS public."AbsensiKelas_guruId_idx";
DROP INDEX IF EXISTS public."AbsensiKelasDetail_siswaId_idx";
DROP INDEX IF EXISTS public."AbsensiKelasDetail_absensiKelasId_siswaId_key";
DROP INDEX IF EXISTS public."AbsensiKelasDetail_absensiKelasId_idx";
ALTER TABLE IF EXISTS ONLY public._prisma_migrations DROP CONSTRAINT IF EXISTS _prisma_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public."_GuruMataPelajaran" DROP CONSTRAINT IF EXISTS "_GuruMataPelajaran_AB_pkey";
ALTER TABLE IF EXISTS ONLY public."User" DROP CONSTRAINT IF EXISTS "User_pkey";
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_pkey";
ALTER TABLE IF EXISTS ONLY public."UjianSoal" DROP CONSTRAINT IF EXISTS "UjianSoal_pkey";
ALTER TABLE IF EXISTS ONLY public."UjianSiswa" DROP CONSTRAINT IF EXISTS "UjianSiswa_pkey";
ALTER TABLE IF EXISTS ONLY public."UjianKelas" DROP CONSTRAINT IF EXISTS "UjianKelas_pkey";
ALTER TABLE IF EXISTS ONLY public."Tugas" DROP CONSTRAINT IF EXISTS "Tugas_pkey";
ALTER TABLE IF EXISTS ONLY public."TugasSiswa" DROP CONSTRAINT IF EXISTS "TugasSiswa_pkey";
ALTER TABLE IF EXISTS ONLY public."TugasSiswaFile" DROP CONSTRAINT IF EXISTS "TugasSiswaFile_pkey";
ALTER TABLE IF EXISTS ONLY public."TugasAttachment" DROP CONSTRAINT IF EXISTS "TugasAttachment_pkey";
ALTER TABLE IF EXISTS ONLY public."TahunAjaran" DROP CONSTRAINT IF EXISTS "TahunAjaran_pkey";
ALTER TABLE IF EXISTS ONLY public."Siswa" DROP CONSTRAINT IF EXISTS "Siswa_pkey";
ALTER TABLE IF EXISTS ONLY public."SiswaKelasHistory" DROP CONSTRAINT IF EXISTS "SiswaKelasHistory_pkey";
ALTER TABLE IF EXISTS ONLY public."Settings" DROP CONSTRAINT IF EXISTS "Settings_pkey";
ALTER TABLE IF EXISTS ONLY public."RPP" DROP CONSTRAINT IF EXISTS "RPP_pkey";
ALTER TABLE IF EXISTS ONLY public."RPPKelas" DROP CONSTRAINT IF EXISTS "RPPKelas_pkey";
ALTER TABLE IF EXISTS ONLY public."ProgressSiswa" DROP CONSTRAINT IF EXISTS "ProgressSiswa_pkey";
ALTER TABLE IF EXISTS ONLY public."Pengumuman" DROP CONSTRAINT IF EXISTS "Pengumuman_pkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoal" DROP CONSTRAINT IF EXISTS "PaketSoal_pkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoalKelas" DROP CONSTRAINT IF EXISTS "PaketSoalKelas_pkey";
ALTER TABLE IF EXISTS ONLY public."PaketSoalItem" DROP CONSTRAINT IF EXISTS "PaketSoalItem_pkey";
ALTER TABLE IF EXISTS ONLY public."Notifikasi" DROP CONSTRAINT IF EXISTS "Notifikasi_pkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_pkey";
ALTER TABLE IF EXISTS ONLY public."MateriBookmark" DROP CONSTRAINT IF EXISTS "MateriBookmark_pkey";
ALTER TABLE IF EXISTS ONLY public."MateriAttachment" DROP CONSTRAINT IF EXISTS "MateriAttachment_pkey";
ALTER TABLE IF EXISTS ONLY public."MataPelajaran" DROP CONSTRAINT IF EXISTS "MataPelajaran_pkey";
ALTER TABLE IF EXISTS ONLY public."Kelas" DROP CONSTRAINT IF EXISTS "Kelas_pkey";
ALTER TABLE IF EXISTS ONLY public."Jurusan" DROP CONSTRAINT IF EXISTS "Jurusan_pkey";
ALTER TABLE IF EXISTS ONLY public."JurnalMengajar" DROP CONSTRAINT IF EXISTS "JurnalMengajar_pkey";
ALTER TABLE IF EXISTS ONLY public."JenisUjian" DROP CONSTRAINT IF EXISTS "JenisUjian_pkey";
ALTER TABLE IF EXISTS ONLY public."JadwalPelajaran" DROP CONSTRAINT IF EXISTS "JadwalPelajaran_pkey";
ALTER TABLE IF EXISTS ONLY public."Guru" DROP CONSTRAINT IF EXISTS "Guru_pkey";
ALTER TABLE IF EXISTS ONLY public."ForumThread" DROP CONSTRAINT IF EXISTS "ForumThread_pkey";
ALTER TABLE IF EXISTS ONLY public."ForumReaction" DROP CONSTRAINT IF EXISTS "ForumReaction_pkey";
ALTER TABLE IF EXISTS ONLY public."ForumPost" DROP CONSTRAINT IF EXISTS "ForumPost_pkey";
ALTER TABLE IF EXISTS ONLY public."ForumKategori" DROP CONSTRAINT IF EXISTS "ForumKategori_pkey";
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_pkey";
ALTER TABLE IF EXISTS ONLY public."Attendance" DROP CONSTRAINT IF EXISTS "Attendance_pkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_pkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelasDetail" DROP CONSTRAINT IF EXISTS "AbsensiKelasDetail_pkey";
DROP TABLE IF EXISTS public._prisma_migrations;
DROP TABLE IF EXISTS public."_GuruMataPelajaran";
DROP TABLE IF EXISTS public."User";
DROP TABLE IF EXISTS public."UjianSoal";
DROP TABLE IF EXISTS public."UjianSiswa";
DROP TABLE IF EXISTS public."UjianKelas";
DROP TABLE IF EXISTS public."Ujian";
DROP TABLE IF EXISTS public."TugasSiswaFile";
DROP TABLE IF EXISTS public."TugasSiswa";
DROP TABLE IF EXISTS public."TugasAttachment";
DROP TABLE IF EXISTS public."Tugas";
DROP TABLE IF EXISTS public."TahunAjaran";
DROP TABLE IF EXISTS public."SiswaKelasHistory";
DROP TABLE IF EXISTS public."Siswa";
DROP TABLE IF EXISTS public."Settings";
DROP TABLE IF EXISTS public."RPPKelas";
DROP TABLE IF EXISTS public."RPP";
DROP TABLE IF EXISTS public."ProgressSiswa";
DROP TABLE IF EXISTS public."Pengumuman";
DROP TABLE IF EXISTS public."PaketSoalKelas";
DROP TABLE IF EXISTS public."PaketSoalItem";
DROP TABLE IF EXISTS public."PaketSoal";
DROP TABLE IF EXISTS public."Notifikasi";
DROP TABLE IF EXISTS public."MateriBookmark";
DROP TABLE IF EXISTS public."MateriAttachment";
DROP TABLE IF EXISTS public."Materi";
DROP TABLE IF EXISTS public."MataPelajaran";
DROP TABLE IF EXISTS public."Kelas";
DROP TABLE IF EXISTS public."Jurusan";
DROP TABLE IF EXISTS public."JurnalMengajar";
DROP TABLE IF EXISTS public."JenisUjian";
DROP TABLE IF EXISTS public."JadwalPelajaran";
DROP TABLE IF EXISTS public."Guru";
DROP TABLE IF EXISTS public."ForumThread";
DROP TABLE IF EXISTS public."ForumReaction";
DROP TABLE IF EXISTS public."ForumPost";
DROP TABLE IF EXISTS public."ForumKategori";
DROP TABLE IF EXISTS public."BankSoal";
DROP TABLE IF EXISTS public."Attendance";
DROP TABLE IF EXISTS public."AbsensiKelasDetail";
DROP TABLE IF EXISTS public."AbsensiKelas";
DROP TYPE IF EXISTS public."TipeSoal";
DROP TYPE IF EXISTS public."TipePenilaian";
DROP TYPE IF EXISTS public."TipeNotifikasi";
DROP TYPE IF EXISTS public."TipeMateri";
DROP TYPE IF EXISTS public."StatusUjian";
DROP TYPE IF EXISTS public."StatusTahunAjaran";
DROP TYPE IF EXISTS public."StatusSiswa";
DROP TYPE IF EXISTS public."StatusRPP";
DROP TYPE IF EXISTS public."StatusPengumpulan";
DROP TYPE IF EXISTS public."StatusPengerjaan";
DROP TYPE IF EXISTS public."StatusGuru";
DROP TYPE IF EXISTS public."Role";
DROP TYPE IF EXISTS public."Hari";
DROP TYPE IF EXISTS public."DimensiProfilLulusan";
DROP TYPE IF EXISTS public."AttendanceStatus";
DROP TYPE IF EXISTS public."AbsensiKelasStatus";
--
-- Name: AbsensiKelasStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."AbsensiKelasStatus" AS ENUM (
    'HADIR',
    'IZIN',
    'SAKIT',
    'ALPHA'
);


ALTER TYPE public."AbsensiKelasStatus" OWNER TO postgres;

--
-- Name: AttendanceStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."AttendanceStatus" AS ENUM (
    'HADIR',
    'IZIN',
    'SAKIT',
    'ALPHA',
    'TERLAMBAT'
);


ALTER TYPE public."AttendanceStatus" OWNER TO postgres;

--
-- Name: DimensiProfilLulusan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DimensiProfilLulusan" AS ENUM (
    'KEIMANAN_KETAQWAAN',
    'KEWARGAAN',
    'PENALARAN_KRITIS',
    'KREATIFITAS',
    'KOLABORASI',
    'KEMANDIRIAN',
    'KESEHATAN',
    'KOMUNIKASI'
);


ALTER TYPE public."DimensiProfilLulusan" OWNER TO postgres;

--
-- Name: Hari; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Hari" AS ENUM (
    'SENIN',
    'SELASA',
    'RABU',
    'KAMIS',
    'JUMAT',
    'SABTU'
);


ALTER TYPE public."Hari" OWNER TO postgres;

--
-- Name: Role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Role" AS ENUM (
    'ADMIN',
    'GURU',
    'SISWA',
    'PETUGAS_ABSENSI'
);


ALTER TYPE public."Role" OWNER TO postgres;

--
-- Name: StatusGuru; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusGuru" AS ENUM (
    'AKTIF',
    'CUTI',
    'PENSIUN'
);


ALTER TYPE public."StatusGuru" OWNER TO postgres;

--
-- Name: StatusPengerjaan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusPengerjaan" AS ENUM (
    'BELUM_MULAI',
    'SEDANG_MENGERJAKAN',
    'SELESAI',
    'TIDAK_HADIR',
    'DIBLOKIR'
);


ALTER TYPE public."StatusPengerjaan" OWNER TO postgres;

--
-- Name: StatusPengumpulan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusPengumpulan" AS ENUM (
    'BELUM_DIKUMPULKAN',
    'DIKUMPULKAN',
    'TERLAMBAT',
    'DINILAI'
);


ALTER TYPE public."StatusPengumpulan" OWNER TO postgres;

--
-- Name: StatusRPP; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusRPP" AS ENUM (
    'DRAFT',
    'PUBLISHED',
    'ARCHIVED'
);


ALTER TYPE public."StatusRPP" OWNER TO postgres;

--
-- Name: StatusSiswa; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusSiswa" AS ENUM (
    'AKTIF',
    'PKL',
    'LULUS',
    'PINDAH',
    'KELUAR'
);


ALTER TYPE public."StatusSiswa" OWNER TO postgres;

--
-- Name: StatusTahunAjaran; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusTahunAjaran" AS ENUM (
    'AKTIF',
    'SELESAI',
    'AKAN_DATANG'
);


ALTER TYPE public."StatusTahunAjaran" OWNER TO postgres;

--
-- Name: StatusUjian; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."StatusUjian" AS ENUM (
    'DRAFT',
    'PUBLISHED',
    'ONGOING',
    'SELESAI',
    'DIBATALKAN'
);


ALTER TYPE public."StatusUjian" OWNER TO postgres;

--
-- Name: TipeMateri; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TipeMateri" AS ENUM (
    'DOKUMEN',
    'VIDEO',
    'LINK',
    'TEKS',
    'GAMBAR'
);


ALTER TYPE public."TipeMateri" OWNER TO postgres;

--
-- Name: TipeNotifikasi; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TipeNotifikasi" AS ENUM (
    'MATERI_BARU',
    'TUGAS_BARU',
    'DEADLINE_REMINDER',
    'TUGAS_DINILAI',
    'FORUM_REPLY',
    'PENGUMUMAN',
    'SISTEM'
);


ALTER TYPE public."TipeNotifikasi" OWNER TO postgres;

--
-- Name: TipePenilaian; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TipePenilaian" AS ENUM (
    'MANUAL',
    'AUTO',
    'PEER_REVIEW'
);


ALTER TYPE public."TipePenilaian" OWNER TO postgres;

--
-- Name: TipeSoal; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TipeSoal" AS ENUM (
    'PILIHAN_GANDA',
    'ESSAY',
    'BENAR_SALAH',
    'ISIAN_SINGKAT'
);


ALTER TYPE public."TipeSoal" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AbsensiKelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AbsensiKelas" (
    id text NOT NULL,
    tanggal date NOT NULL,
    "jadwalPelajaranId" text NOT NULL,
    "guruId" text NOT NULL,
    "kelasId" text NOT NULL,
    "mataPelajaranId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."AbsensiKelas" OWNER TO postgres;

--
-- Name: AbsensiKelasDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AbsensiKelasDetail" (
    id text NOT NULL,
    "absensiKelasId" text NOT NULL,
    "siswaId" text NOT NULL,
    status public."AbsensiKelasStatus" DEFAULT 'HADIR'::public."AbsensiKelasStatus" NOT NULL,
    keterangan text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."AbsensiKelasDetail" OWNER TO postgres;

--
-- Name: Attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Attendance" (
    id text NOT NULL,
    "siswaId" text NOT NULL,
    tanggal date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "jamMasuk" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "jamKeluar" timestamp(3) without time zone,
    status public."AttendanceStatus" DEFAULT 'HADIR'::public."AttendanceStatus" NOT NULL,
    keterangan text,
    "scanBy" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Attendance" OWNER TO postgres;

--
-- Name: BankSoal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BankSoal" (
    id text NOT NULL,
    kode text NOT NULL,
    pertanyaan text NOT NULL,
    tipe public."TipeSoal" DEFAULT 'PILIHAN_GANDA'::public."TipeSoal" NOT NULL,
    "mataPelajaranId" text,
    "pilihanJawaban" jsonb,
    "jawabanBenar" text,
    bobot integer DEFAULT 1 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "guruId" text,
    "kelasId" text
);


ALTER TABLE public."BankSoal" OWNER TO postgres;

--
-- Name: ForumKategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ForumKategori" (
    id text NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    icon text,
    warna text,
    "mataPelajaranId" text,
    "kelasId" text,
    urutan integer DEFAULT 0 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ForumKategori" OWNER TO postgres;

--
-- Name: ForumPost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ForumPost" (
    id text NOT NULL,
    "threadId" text NOT NULL,
    "parentId" text,
    "authorId" text NOT NULL,
    "authorType" text NOT NULL,
    konten text NOT NULL,
    "isEdited" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."ForumPost" OWNER TO postgres;

--
-- Name: ForumReaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ForumReaction" (
    id text NOT NULL,
    "postId" text NOT NULL,
    "userId" text NOT NULL,
    tipe text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ForumReaction" OWNER TO postgres;

--
-- Name: ForumThread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ForumThread" (
    id text NOT NULL,
    judul text NOT NULL,
    "isPinned" boolean DEFAULT false NOT NULL,
    "isLocked" boolean DEFAULT false NOT NULL,
    "kategoriId" text NOT NULL,
    "authorId" text NOT NULL,
    "authorType" text NOT NULL,
    "viewCount" integer DEFAULT 0 NOT NULL,
    "replyCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."ForumThread" OWNER TO postgres;

--
-- Name: Guru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Guru" (
    id text NOT NULL,
    nip text NOT NULL,
    nama text NOT NULL,
    email text NOT NULL,
    "nomorTelepon" text,
    status public."StatusGuru" DEFAULT 'AKTIF'::public."StatusGuru" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "userId" text
);


ALTER TABLE public."Guru" OWNER TO postgres;

--
-- Name: JadwalPelajaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."JadwalPelajaran" (
    id text NOT NULL,
    hari public."Hari" NOT NULL,
    "jamMulai" text NOT NULL,
    "jamSelesai" text NOT NULL,
    "kelasId" text NOT NULL,
    "mataPelajaranId" text NOT NULL,
    "guruId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."JadwalPelajaran" OWNER TO postgres;

--
-- Name: JenisUjian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."JenisUjian" (
    id text NOT NULL,
    nama text NOT NULL,
    kode text,
    deskripsi text,
    aktif boolean DEFAULT true NOT NULL,
    urutan integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."JenisUjian" OWNER TO postgres;

--
-- Name: JurnalMengajar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."JurnalMengajar" (
    id text NOT NULL,
    "absensiKelasId" text NOT NULL,
    "materiPembelajaran" text NOT NULL,
    "kegiatanPembelajaran" text NOT NULL,
    catatan text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."JurnalMengajar" OWNER TO postgres;

--
-- Name: Jurusan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Jurusan" (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Jurusan" OWNER TO postgres;

--
-- Name: Kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kelas" (
    id text NOT NULL,
    nama text NOT NULL,
    tingkat text NOT NULL,
    kapasitas integer DEFAULT 32 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "waliKelasId" text,
    "jurusanId" text
);


ALTER TABLE public."Kelas" OWNER TO postgres;

--
-- Name: MataPelajaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MataPelajaran" (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    "jamPelajaran" integer NOT NULL,
    deskripsi text,
    tingkat text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."MataPelajaran" OWNER TO postgres;

--
-- Name: Materi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Materi" (
    id text NOT NULL,
    judul text NOT NULL,
    deskripsi text,
    tipe public."TipeMateri" DEFAULT 'DOKUMEN'::public."TipeMateri" NOT NULL,
    konten text,
    "mataPelajaranId" text NOT NULL,
    "guruId" text NOT NULL,
    "kelasId" text,
    "isPinned" boolean DEFAULT false NOT NULL,
    "isPublished" boolean DEFAULT true NOT NULL,
    "viewCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "originalFileName" text
);


ALTER TABLE public."Materi" OWNER TO postgres;

--
-- Name: MateriAttachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MateriAttachment" (
    id text NOT NULL,
    "materiId" text NOT NULL,
    "namaFile" text NOT NULL,
    "ukuranFile" integer NOT NULL,
    "tipeFile" text NOT NULL,
    "urlFile" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."MateriAttachment" OWNER TO postgres;

--
-- Name: MateriBookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MateriBookmark" (
    id text NOT NULL,
    "materiId" text NOT NULL,
    "siswaId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."MateriBookmark" OWNER TO postgres;

--
-- Name: Notifikasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notifikasi" (
    id text NOT NULL,
    "userId" text NOT NULL,
    tipe public."TipeNotifikasi" NOT NULL,
    judul text NOT NULL,
    pesan text NOT NULL,
    "linkUrl" text,
    "isRead" boolean DEFAULT false NOT NULL,
    "readAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Notifikasi" OWNER TO postgres;

--
-- Name: PaketSoal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaketSoal" (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    "mataPelajaranId" text,
    "totalSoal" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "guruId" text
);


ALTER TABLE public."PaketSoal" OWNER TO postgres;

--
-- Name: PaketSoalItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaketSoalItem" (
    id text NOT NULL,
    "paketSoalId" text NOT NULL,
    "bankSoalId" text NOT NULL,
    urutan integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PaketSoalItem" OWNER TO postgres;

--
-- Name: PaketSoalKelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaketSoalKelas" (
    id text NOT NULL,
    "paketSoalId" text NOT NULL,
    "kelasId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PaketSoalKelas" OWNER TO postgres;

--
-- Name: Pengumuman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pengumuman" (
    id text NOT NULL,
    judul text NOT NULL,
    konten text NOT NULL,
    "targetRoles" public."Role"[] DEFAULT ARRAY[]::public."Role"[],
    "authorId" text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Pengumuman" OWNER TO postgres;

--
-- Name: ProgressSiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProgressSiswa" (
    id text NOT NULL,
    "siswaId" text NOT NULL,
    "mataPelajaranId" text NOT NULL,
    "materiDibaca" integer DEFAULT 0 NOT NULL,
    "tugasSelesai" integer DEFAULT 0 NOT NULL,
    "forumPosts" integer DEFAULT 0 NOT NULL,
    "totalScore" double precision DEFAULT 0 NOT NULL,
    "lastActivity" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ProgressSiswa" OWNER TO postgres;

--
-- Name: RPP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RPP" (
    id text NOT NULL,
    kode text NOT NULL,
    "mataPelajaranId" text NOT NULL,
    "guruId" text NOT NULL,
    "capaianPembelajaran" text NOT NULL,
    "tujuanPembelajaran" jsonb NOT NULL,
    status public."StatusRPP" DEFAULT 'DRAFT'::public."StatusRPP" NOT NULL,
    "isPublished" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "alokasiWaktu" integer NOT NULL,
    "asesmenAkhir" text,
    "asesmenAwal" text,
    "asesmenProses" text,
    "dimensiProfilLulusan" jsonb,
    fase text,
    "identifikasiMateri" text,
    "identifikasiPesertaDidik" text,
    "kegiatanAwal" jsonb,
    "kegiatanMemahami" jsonb,
    "kegiatanMengaplikasi" jsonb,
    "kegiatanMerefleksi" jsonb,
    "kegiatanPenutup" jsonb,
    "kemitraanPembelajaran" text,
    "lingkunganPembelajaran" text,
    "lintasDisiplinIlmu" text,
    materi text NOT NULL,
    "namaGuru" text,
    "pemanfaatanDigital" text,
    "praktikPedagogik" text,
    "tahunAjaran" text,
    "topikPembelajaran" text NOT NULL
);


ALTER TABLE public."RPP" OWNER TO postgres;

--
-- Name: RPPKelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RPPKelas" (
    id text NOT NULL,
    "rppId" text NOT NULL,
    "kelasId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RPPKelas" OWNER TO postgres;

--
-- Name: Settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Settings" (
    id text NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Settings" OWNER TO postgres;

--
-- Name: Siswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Siswa" (
    id text NOT NULL,
    nisn text NOT NULL,
    nama text NOT NULL,
    "tanggalLahir" timestamp(3) without time zone NOT NULL,
    alamat text,
    "nomorTelepon" text,
    email text,
    status public."StatusSiswa" DEFAULT 'AKTIF'::public."StatusSiswa" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "kelasId" text,
    "userId" text,
    "tahunAjaranId" text,
    agama text
);


ALTER TABLE public."Siswa" OWNER TO postgres;

--
-- Name: SiswaKelasHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SiswaKelasHistory" (
    id text NOT NULL,
    "siswaId" text NOT NULL,
    "kelasId" text NOT NULL,
    "tahunAjaranId" text NOT NULL,
    "tanggalMulai" timestamp(3) without time zone NOT NULL,
    "tanggalSelesai" timestamp(3) without time zone,
    status text NOT NULL,
    catatan text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SiswaKelasHistory" OWNER TO postgres;

--
-- Name: TahunAjaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TahunAjaran" (
    id text NOT NULL,
    tahun text NOT NULL,
    "tanggalMulai" timestamp(3) without time zone NOT NULL,
    "tanggalSelesai" timestamp(3) without time zone NOT NULL,
    status public."StatusTahunAjaran" DEFAULT 'AKAN_DATANG'::public."StatusTahunAjaran" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."TahunAjaran" OWNER TO postgres;

--
-- Name: Tugas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tugas" (
    id text NOT NULL,
    judul text NOT NULL,
    deskripsi text NOT NULL,
    instruksi text,
    "mataPelajaranId" text NOT NULL,
    "guruId" text NOT NULL,
    "kelasId" text,
    deadline timestamp(3) without time zone NOT NULL,
    "maxScore" integer DEFAULT 100 NOT NULL,
    "tipePenilaian" public."TipePenilaian" DEFAULT 'MANUAL'::public."TipePenilaian" NOT NULL,
    "allowLateSubmit" boolean DEFAULT false NOT NULL,
    "isPublished" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Tugas" OWNER TO postgres;

--
-- Name: TugasAttachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TugasAttachment" (
    id text NOT NULL,
    "tugasId" text NOT NULL,
    "namaFile" text NOT NULL,
    "ukuranFile" integer NOT NULL,
    "tipeFile" text NOT NULL,
    "urlFile" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TugasAttachment" OWNER TO postgres;

--
-- Name: TugasSiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TugasSiswa" (
    id text NOT NULL,
    "tugasId" text NOT NULL,
    "siswaId" text NOT NULL,
    status public."StatusPengumpulan" DEFAULT 'BELUM_DIKUMPULKAN'::public."StatusPengumpulan" NOT NULL,
    "submittedAt" timestamp(3) without time zone,
    "gradedAt" timestamp(3) without time zone,
    konten text,
    score double precision,
    feedback text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TugasSiswa" OWNER TO postgres;

--
-- Name: TugasSiswaFile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TugasSiswaFile" (
    id text NOT NULL,
    "tugasSiswaId" text NOT NULL,
    "namaFile" text NOT NULL,
    "ukuranFile" integer NOT NULL,
    "tipeFile" text NOT NULL,
    "urlFile" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TugasSiswaFile" OWNER TO postgres;

--
-- Name: Ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ujian" (
    id text NOT NULL,
    kode text NOT NULL,
    judul text NOT NULL,
    deskripsi text,
    "mataPelajaranId" text,
    "kelasId" text,
    durasi integer NOT NULL,
    "tanggalMulai" timestamp(3) without time zone NOT NULL,
    "tanggalSelesai" timestamp(3) without time zone NOT NULL,
    "nilaiMinimal" integer,
    "acakSoal" boolean DEFAULT true NOT NULL,
    "tampilkanNilai" boolean DEFAULT false NOT NULL,
    status public."StatusUjian" DEFAULT 'DRAFT'::public."StatusUjian" NOT NULL,
    "createdBy" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "paketSoalId" text,
    "guruId" text,
    "deteksiKecurangan" boolean DEFAULT true NOT NULL,
    "jenisUjianId" text
);


ALTER TABLE public."Ujian" OWNER TO postgres;

--
-- Name: UjianKelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UjianKelas" (
    id text NOT NULL,
    "ujianId" text NOT NULL,
    "kelasId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."UjianKelas" OWNER TO postgres;

--
-- Name: UjianSiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UjianSiswa" (
    id text NOT NULL,
    "ujianId" text NOT NULL,
    "siswaId" text NOT NULL,
    "tokenAkses" text,
    "waktuMulai" timestamp(3) without time zone,
    "waktuSelesai" timestamp(3) without time zone,
    durasi integer,
    status public."StatusPengerjaan" DEFAULT 'BELUM_MULAI'::public."StatusPengerjaan" NOT NULL,
    "nilaiTotal" double precision,
    "isPassed" boolean,
    jawaban jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "manualGrades" jsonb,
    "violationCount" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."UjianSiswa" OWNER TO postgres;

--
-- Name: UjianSoal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UjianSoal" (
    id text NOT NULL,
    "ujianId" text NOT NULL,
    "bankSoalId" text NOT NULL,
    "nomorUrut" integer NOT NULL,
    bobot integer DEFAULT 1 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."UjianSoal" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    name text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    password text NOT NULL,
    role public."Role" DEFAULT 'SISWA'::public."Role" NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: _GuruMataPelajaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_GuruMataPelajaran" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_GuruMataPelajaran" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Data for Name: AbsensiKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AbsensiKelas" (id, tanggal, "jadwalPelajaranId", "guruId", "kelasId", "mataPelajaranId", "createdAt", "updatedAt") FROM stdin;
cmkknts3y000l8xpvs2jzr3os	2026-01-19	cmjr7spee000nlaudxqbumeko	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	2026-01-19 04:23:20.974	2026-01-19 04:23:20.974
cmkm0m3nf0000vkpvs2ie9t6q	2026-01-20	cmjs6w9ox001955udh6ywaowz	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-01-20 03:09:03.867	2026-01-20 03:09:03.867
cmkvvx48b001h9tpvzmrpgtn4	2026-01-27	cmjs6w9ox001955udh6ywaowz	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-01-27 00:55:21.515	2026-01-27 00:55:21.515
cmkz0n4di0000xypvlnj539ad	2026-01-29	cmkop3eio0000tfpvy4yk1hn2	cmj9z8yem002u5dudolwskcz4	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	2026-01-29 05:30:51.75	2026-01-29 05:30:51.75
cml1r63by0000qzpvez87rajo	2026-01-31	cmkop4eg20004tfpvwhj9aqjh	cmj9z8yem002u5dudolwskcz4	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	2026-01-31 03:28:59.229	2026-01-31 03:28:59.229
cml1r8tmy000fqzpvtw5cqrhn	2026-01-31	cmkop4q6h0005tfpvtjdljtyh	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-01-31 03:31:06.634	2026-01-31 03:31:06.634
cml5vm4gm0002qvpvccl8kyl6	2026-02-03	cmjs6w9ox001955udh6ywaowz	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-02-03 00:44:30.358	2026-02-03 00:44:30.358
cmlbskyh00000qkpvd07gnrsn	2026-02-07	cmkop4eg20004tfpvwhj9aqjh	cmj9z8yem002u5dudolwskcz4	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	2026-02-07 04:06:14.148	2026-02-07 04:06:14.148
cmlbsllcv000fqkpv1ghfd2qa	2026-02-07	cmkop4q6h0005tfpvtjdljtyh	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-02-07 04:06:43.807	2026-02-07 04:06:43.807
cmlfvngyv000brapvt2zop64f	2026-02-10	cmjs6w9ox001955udh6ywaowz	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-02-10 00:43:14.983	2026-02-10 00:43:14.983
cmlg2vnmp001yrapv0g0exppc	2026-02-10	cmjs6oif5000l55ud996qsgxn	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	2026-02-10 04:05:34.177	2026-02-10 04:05:34.177
cmm9womr10000r6pvucxvb9qt	2026-03-03	cmjs6w9ox001955udh6ywaowz	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-03-03 01:05:14.029	2026-03-03 01:05:14.029
cmmcrhm3c0000r0pv1udwb7uf	2026-03-05	cmkop3eio0000tfpvy4yk1hn2	cmj9z8yem002u5dudolwskcz4	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	2026-03-05 01:03:07.031	2026-03-05 01:03:07.031
cmmcrjl3p000fr0pvtbu34ajd	2026-03-05	cmjs6w9ox001955udh6ywaowz	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-03-05 01:04:39.061	2026-03-05 01:04:39.061
cmmcwk0aa001yr0pvln5u5euu	2026-03-05	cmmcwggkh001ur0pv6mt0ngwl	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	2026-03-05 03:24:56.818	2026-03-05 03:24:56.818
cmmfqpvm1000mqrpvd3yydlbz	2026-03-07	cmkop4q6h0005tfpvtjdljtyh	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-03-07 03:04:51.529	2026-03-07 03:04:51.529
cmmmu06xv000tqrpvvo6pirm5	2026-03-12	cmkop3eio0000tfpvy4yk1hn2	cmj9z8yem002u5dudolwskcz4	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	2026-03-12 02:11:14.851	2026-03-12 02:11:14.851
cmmo9x392001chgpvfkr97d45	2026-03-13	cmmo9vvdl001ahgpvmjjxy9oq	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	2026-03-13 02:24:30.134	2026-03-13 02:24:30.134
cmmoa6mur0027hgpvbct0r0ri	2026-03-13	cmkop4q6h0005tfpvtjdljtyh	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	2026-03-13 02:31:55.443	2026-03-13 02:31:55.443
\.


--
-- Data for Name: AbsensiKelasDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AbsensiKelasDetail" (id, "absensiKelasId", "siswaId", status, keterangan, "createdAt", "updatedAt") FROM stdin;
cmkknts41000m8xpvte04e8bx	cmkknts3y000l8xpvs2jzr3os	cmj5gwyx9000935ud28f9ggyr	HADIR	\N	2026-01-19 04:23:20.977	2026-01-19 04:23:20.977
cmkknts44000n8xpvtz7kml0h	cmkknts3y000l8xpvs2jzr3os	cmj5gwzeh000v35udwd1xnzk8	HADIR	\N	2026-01-19 04:23:20.98	2026-01-19 04:23:20.98
cmkknts45000o8xpvl2403fwv	cmkknts3y000l8xpvs2jzr3os	cmj5gwztr001f35udgp2iqne6	HADIR	\N	2026-01-19 04:23:20.981	2026-01-19 04:23:20.981
cmkknts47000p8xpvx42wibgh	cmkknts3y000l8xpvs2jzr3os	cmj5gx0c0002335udrmwctcnm	HADIR	\N	2026-01-19 04:23:20.983	2026-01-19 04:23:20.983
cmkknts48000q8xpv7yep94qq	cmkknts3y000l8xpvs2jzr3os	cmj5gx0o3002j35uda0ok0i4j	HADIR	\N	2026-01-19 04:23:20.984	2026-01-19 04:23:20.984
cmkknts4a000r8xpvs2awj2qo	cmkknts3y000l8xpvs2jzr3os	cmj5gx17k003935udaewx76ro	HADIR	\N	2026-01-19 04:23:20.986	2026-01-19 04:23:20.986
cmkknts4b000s8xpv6q6jxtec	cmkknts3y000l8xpvs2jzr3os	cmj5gx1o2003v35udzn7dj9ls	HADIR	\N	2026-01-19 04:23:20.987	2026-01-19 04:23:20.987
cmkknts4c000t8xpv39anig3c	cmkknts3y000l8xpvs2jzr3os	cmj5gx206004b35uduf215trn	HADIR	\N	2026-01-19 04:23:20.988	2026-01-19 04:23:20.988
cmkknts4e000u8xpvio7e4od1	cmkknts3y000l8xpvs2jzr3os	cmj5gx21o004d35udxjptvn08	HADIR	\N	2026-01-19 04:23:20.99	2026-01-19 04:23:20.99
cmkknts4f000v8xpv1bsgoxul	cmkknts3y000l8xpvs2jzr3os	cmj5gx264004j35ud8hnkcdnj	HADIR	\N	2026-01-19 04:23:20.991	2026-01-19 04:23:20.991
cmkknts4g000w8xpv5kixpj3g	cmkknts3y000l8xpvs2jzr3os	cmj5gx2i0004z35udecgz1nlq	HADIR	\N	2026-01-19 04:23:20.992	2026-01-19 04:23:20.992
cmkknts4i000x8xpv11mnjkqg	cmkknts3y000l8xpvs2jzr3os	cmj5gx2ny005735udgqgfno56	IZIN	\N	2026-01-19 04:23:20.994	2026-01-19 04:23:20.994
cmkknts4j000y8xpvvx8i7811	cmkknts3y000l8xpvs2jzr3os	cmj5gx2qz005b35ud4370ott0	HADIR	\N	2026-01-19 04:23:20.995	2026-01-19 04:23:20.995
cmkm0m3nl0001vkpv3klhgwq1	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-01-20 03:09:03.873	2026-01-20 03:09:03.873
cmkm0m3np0002vkpvcevjz274	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-01-20 03:09:03.877	2026-01-20 03:09:03.877
cmkm0m3nq0003vkpvv9sk7aol	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-01-20 03:09:03.878	2026-01-20 03:09:03.878
cmkm0m3ns0004vkpvu5idew23	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-01-20 03:09:03.88	2026-01-20 03:09:03.88
cmkm0m3nt0005vkpv554b7tq4	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-01-20 03:09:03.881	2026-01-20 03:09:03.881
cmkm0m3nv0006vkpv8euka15w	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-01-20 03:09:03.883	2026-01-20 03:09:03.883
cmkm0m3nx0007vkpvn2anirz6	cmkm0m3nf0000vkpvs2ie9t6q	cmj5gx2kx005335udc4757qsp	HADIR	\N	2026-01-20 03:09:03.885	2026-01-20 03:09:03.885
cmkvvx48i001i9tpvnjq5ktmg	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-01-27 00:55:21.522	2026-01-27 00:55:21.522
cmkvvx48q001j9tpvyf1b2ufk	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-01-27 00:55:21.53	2026-01-27 00:55:21.53
cmkvvx48v001k9tpva17kzmej	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-01-27 00:55:21.535	2026-01-27 00:55:21.535
cmkvvx48z001l9tpvemr4i8e1	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-01-27 00:55:21.539	2026-01-27 00:55:21.539
cmkvvx494001m9tpvvdyscv9q	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-01-27 00:55:21.544	2026-01-27 00:55:21.544
cmkvvx498001n9tpvy4diwioy	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-01-27 00:55:21.548	2026-01-27 00:55:21.548
cmkvvx49d001o9tpvy05v8ul0	cmkvvx48b001h9tpvzmrpgtn4	cmj5gx2kx005335udc4757qsp	HADIR	\N	2026-01-27 00:55:21.553	2026-01-27 00:55:21.553
cmkz0n4dn0001xypvp3g5qj1a	cmkz0n4di0000xypvlnj539ad	cmj5gwyvo000735udytelfevq	ALPHA	\N	2026-01-29 05:30:51.755	2026-01-29 05:30:51.755
cmkz0n4dq0002xypvjlf43217	cmkz0n4di0000xypvlnj539ad	cmj5gwz23000f35udoygf650d	ALPHA	\N	2026-01-29 05:30:51.758	2026-01-29 05:30:51.758
cmkz0n4ds0003xypvpn6a8mr2	cmkz0n4di0000xypvlnj539ad	cmj5gwz9u000p35uddazsd00z	HADIR	\N	2026-01-29 05:30:51.76	2026-01-29 05:30:51.76
cmkz0n4dw0004xypv7wtvfkns	cmkz0n4di0000xypvlnj539ad	cmj5gx01e001p35udcjqmly7n	HADIR	\N	2026-01-29 05:30:51.763	2026-01-29 05:30:51.763
cmkz0n4dz0005xypvh2odfwxr	cmkz0n4di0000xypvlnj539ad	cmj5gx05x001v35udwd5nk8nj	HADIR	\N	2026-01-29 05:30:51.766	2026-01-29 05:30:51.766
cmkz0n4e20006xypv7p8tdpsh	cmkz0n4di0000xypvlnj539ad	cmj5gx0di002535ud32uasdbw	HADIR	\N	2026-01-29 05:30:51.77	2026-01-29 05:30:51.77
cmkz0n4e50007xypv66u3u3c2	cmkz0n4di0000xypvlnj539ad	cmj5gx0gi002935udl20nfbog	HADIR	\N	2026-01-29 05:30:51.773	2026-01-29 05:30:51.773
cmkz0n4e80008xypvoy95hzfi	cmkz0n4di0000xypvlnj539ad	cmj5gx0i0002b35ud19a6xd7r	ALPHA	\N	2026-01-29 05:30:51.776	2026-01-29 05:30:51.776
cmkz0n4ea0009xypv8a86x5vc	cmkz0n4di0000xypvlnj539ad	cmj5gx162003735ud5de1cxbc	HADIR	\N	2026-01-29 05:30:51.778	2026-01-29 05:30:51.778
cmkz0n4ed000axypv5da8djgw	cmkz0n4di0000xypvlnj539ad	cmj5gx1c3003f35udp6zso1o3	ALPHA	\N	2026-01-29 05:30:51.781	2026-01-29 05:30:51.781
cmkz0n4eg000bxypvxrbwyqxt	cmkz0n4di0000xypvlnj539ad	cmj5gx1r2003z35udbet34tx1	HADIR	\N	2026-01-29 05:30:51.784	2026-01-29 05:30:51.784
cmkz0n4ei000cxypvpaxug72r	cmkz0n4di0000xypvlnj539ad	cmj5gx1sk004135udexpydl8s	HADIR	\N	2026-01-29 05:30:51.786	2026-01-29 05:30:51.786
cmkz0n4el000dxypvxb8p6ztc	cmkz0n4di0000xypvlnj539ad	cmj5gx2wz005j35ud2ivwa2j0	HADIR	\N	2026-01-29 05:30:51.789	2026-01-29 05:30:51.789
cml1r63c40001qzpvfm9lix91	cml1r63by0000qzpvez87rajo	cmj5gwyvo000735udytelfevq	ALPHA	\N	2026-01-31 03:28:59.236	2026-01-31 03:28:59.236
cml1r63c70002qzpvjmerzqif	cml1r63by0000qzpvez87rajo	cmj5gwz23000f35udoygf650d	ALPHA	\N	2026-01-31 03:28:59.239	2026-01-31 03:28:59.239
cml1r63c90003qzpv8fisvij7	cml1r63by0000qzpvez87rajo	cmj5gwz9u000p35uddazsd00z	HADIR	\N	2026-01-31 03:28:59.241	2026-01-31 03:28:59.241
cml1r63cb0004qzpvq2l0shi6	cml1r63by0000qzpvez87rajo	cmj5gx01e001p35udcjqmly7n	HADIR	\N	2026-01-31 03:28:59.243	2026-01-31 03:28:59.243
cml1r63cd0005qzpvfy0xxde8	cml1r63by0000qzpvez87rajo	cmj5gx05x001v35udwd5nk8nj	HADIR	\N	2026-01-31 03:28:59.245	2026-01-31 03:28:59.245
cml1r63cf0006qzpv0xxzuuz7	cml1r63by0000qzpvez87rajo	cmj5gx0di002535ud32uasdbw	HADIR	\N	2026-01-31 03:28:59.247	2026-01-31 03:28:59.247
cml1r63ch0007qzpvdvgy9966	cml1r63by0000qzpvez87rajo	cmj5gx0gi002935udl20nfbog	ALPHA	\N	2026-01-31 03:28:59.249	2026-01-31 03:28:59.249
cml1r63ci0008qzpvwdshhlz5	cml1r63by0000qzpvez87rajo	cmj5gx0i0002b35ud19a6xd7r	ALPHA	\N	2026-01-31 03:28:59.25	2026-01-31 03:28:59.25
cml1r63ck0009qzpv3f24egzg	cml1r63by0000qzpvez87rajo	cmj5gx162003735ud5de1cxbc	ALPHA	\N	2026-01-31 03:28:59.252	2026-01-31 03:28:59.252
cml1r63cm000aqzpvg9t6rw3s	cml1r63by0000qzpvez87rajo	cmj5gx1c3003f35udp6zso1o3	ALPHA	\N	2026-01-31 03:28:59.254	2026-01-31 03:28:59.254
cml1r63co000bqzpvvr7gg34p	cml1r63by0000qzpvez87rajo	cmj5gx1r2003z35udbet34tx1	HADIR	\N	2026-01-31 03:28:59.256	2026-01-31 03:28:59.256
cml1r63cp000cqzpv7rx3otto	cml1r63by0000qzpvez87rajo	cmj5gx1sk004135udexpydl8s	HADIR	\N	2026-01-31 03:28:59.257	2026-01-31 03:28:59.257
cml1r63cr000dqzpv2y5sxkbc	cml1r63by0000qzpvez87rajo	cmj5gx2wz005j35ud2ivwa2j0	HADIR	\N	2026-01-31 03:28:59.259	2026-01-31 03:28:59.259
cml1r8tn1000gqzpv315q5gtv	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-01-31 03:31:06.637	2026-01-31 03:31:06.637
cml1r8tn4000hqzpvg77vatkr	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-01-31 03:31:06.64	2026-01-31 03:31:06.64
cml1r8tn6000iqzpv0ry1dmfw	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-01-31 03:31:06.641	2026-01-31 03:31:06.641
cml1r8tn7000jqzpvmj5s7hjy	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-01-31 03:31:06.643	2026-01-31 03:31:06.643
cml1r8tn9000kqzpvdm71dyci	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-01-31 03:31:06.645	2026-01-31 03:31:06.645
cml1r8tna000lqzpv4shhum0h	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-01-31 03:31:06.646	2026-01-31 03:31:06.646
cml1r8tnc000mqzpv6loasezp	cml1r8tmy000fqzpvtw5cqrhn	cmj5gx2kx005335udc4757qsp	HADIR	\N	2026-01-31 03:31:06.648	2026-01-31 03:31:06.648
cml5vm4go0003qvpv2tf7duqh	cml5vm4gm0002qvpvccl8kyl6	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-02-03 00:44:30.36	2026-02-03 00:44:30.36
cml5vm4gr0004qvpv6ld0z4lr	cml5vm4gm0002qvpvccl8kyl6	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-02-03 00:44:30.363	2026-02-03 00:44:30.363
cml5vm4gt0005qvpvha9g15i0	cml5vm4gm0002qvpvccl8kyl6	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-02-03 00:44:30.365	2026-02-03 00:44:30.365
cml5vm4gu0006qvpv54ogydpq	cml5vm4gm0002qvpvccl8kyl6	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-02-03 00:44:30.366	2026-02-03 00:44:30.366
cml5vm4gw0007qvpvjagnyll2	cml5vm4gm0002qvpvccl8kyl6	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-02-03 00:44:30.368	2026-02-03 00:44:30.368
cml5vm4gy0008qvpvkhmhg2ow	cml5vm4gm0002qvpvccl8kyl6	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-02-03 00:44:30.37	2026-02-03 00:44:30.37
cml5vm4gz0009qvpvkdkl8iuc	cml5vm4gm0002qvpvccl8kyl6	cmj5gx2kx005335udc4757qsp	SAKIT	\N	2026-02-03 00:44:30.371	2026-02-03 00:44:30.371
cmlbskyh50001qkpvsat1uh5t	cmlbskyh00000qkpvd07gnrsn	cmj5gwyvo000735udytelfevq	HADIR	\N	2026-02-07 04:06:14.153	2026-02-07 04:06:14.153
cmlbskyh90002qkpv5039xnn8	cmlbskyh00000qkpvd07gnrsn	cmj5gwz23000f35udoygf650d	HADIR	\N	2026-02-07 04:06:14.157	2026-02-07 04:06:14.157
cmlbskyhb0003qkpvca2ne9zg	cmlbskyh00000qkpvd07gnrsn	cmj5gwz9u000p35uddazsd00z	ALPHA	\N	2026-02-07 04:06:14.159	2026-02-07 04:06:14.159
cmlbskyhd0004qkpvt5n6nyeh	cmlbskyh00000qkpvd07gnrsn	cmj5gx01e001p35udcjqmly7n	ALPHA	\N	2026-02-07 04:06:14.161	2026-02-07 04:06:14.161
cmlbskyhe0005qkpvs5dyxcrh	cmlbskyh00000qkpvd07gnrsn	cmj5gx05x001v35udwd5nk8nj	HADIR	\N	2026-02-07 04:06:14.162	2026-02-07 04:06:14.162
cmlbskyhh0006qkpvg60cy5nz	cmlbskyh00000qkpvd07gnrsn	cmj5gx0di002535ud32uasdbw	HADIR	\N	2026-02-07 04:06:14.165	2026-02-07 04:06:14.165
cmlbskyhj0007qkpvw11t9b4l	cmlbskyh00000qkpvd07gnrsn	cmj5gx0gi002935udl20nfbog	HADIR	\N	2026-02-07 04:06:14.167	2026-02-07 04:06:14.167
cmlbskyhl0008qkpv4czolkps	cmlbskyh00000qkpvd07gnrsn	cmj5gx0i0002b35ud19a6xd7r	HADIR	\N	2026-02-07 04:06:14.169	2026-02-07 04:06:14.169
cmlbskyhm0009qkpvthc1j9z4	cmlbskyh00000qkpvd07gnrsn	cmj5gx162003735ud5de1cxbc	HADIR	\N	2026-02-07 04:06:14.17	2026-02-07 04:06:14.17
cmlbskyho000aqkpvdt38uuhz	cmlbskyh00000qkpvd07gnrsn	cmj5gx1c3003f35udp6zso1o3	ALPHA	\N	2026-02-07 04:06:14.172	2026-02-07 04:06:14.172
cmlbskyhp000bqkpvtqoeqjm2	cmlbskyh00000qkpvd07gnrsn	cmj5gx1r2003z35udbet34tx1	HADIR	\N	2026-02-07 04:06:14.173	2026-02-07 04:06:14.173
cmlbskyhr000cqkpv5syjt6mn	cmlbskyh00000qkpvd07gnrsn	cmj5gx1sk004135udexpydl8s	HADIR	\N	2026-02-07 04:06:14.175	2026-02-07 04:06:14.175
cmlbskyhs000dqkpvmpwy602w	cmlbskyh00000qkpvd07gnrsn	cmj5gx2wz005j35ud2ivwa2j0	HADIR	\N	2026-02-07 04:06:14.176	2026-02-07 04:06:14.176
cmlbsllcy000gqkpvry55bf32	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-02-07 04:06:43.81	2026-02-07 04:06:43.81
cmlbslld1000hqkpvgpttp334	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-02-07 04:06:43.813	2026-02-07 04:06:43.813
cmlbslld3000iqkpv4mfa05y1	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-02-07 04:06:43.815	2026-02-07 04:06:43.815
cmlbslld4000jqkpvcs3zxqox	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-02-07 04:06:43.816	2026-02-07 04:06:43.816
cmlbslld6000kqkpvhajxc0qi	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-02-07 04:06:43.818	2026-02-07 04:06:43.818
cmlbslld8000lqkpvakpslp15	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-02-07 04:06:43.82	2026-02-07 04:06:43.82
cmlbslld9000mqkpv3ziv1xm5	cmlbsllcv000fqkpv1ghfd2qa	cmj5gx2kx005335udc4757qsp	SAKIT	\N	2026-02-07 04:06:43.821	2026-02-07 04:06:43.821
cmlfvngyy000crapvo6jmkeri	cmlfvngyv000brapvt2zop64f	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-02-10 00:43:14.986	2026-02-10 00:43:14.986
cmlfvngz2000drapvnfctu104	cmlfvngyv000brapvt2zop64f	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-02-10 00:43:14.99	2026-02-10 00:43:14.99
cmlfvngz5000erapvhnx63mex	cmlfvngyv000brapvt2zop64f	cmj5gx0r4002n35ud6i7qxccl	ALPHA	\N	2026-02-10 00:43:14.993	2026-02-10 00:43:14.993
cmlfvngz7000frapv9lwiqb2w	cmlfvngyv000brapvt2zop64f	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-02-10 00:43:14.995	2026-02-10 00:43:14.995
cmlfvngza000grapvsjcmr4km	cmlfvngyv000brapvt2zop64f	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-02-10 00:43:14.998	2026-02-10 00:43:14.998
cmlfvngzd000hrapv0l76j06z	cmlfvngyv000brapvt2zop64f	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-02-10 00:43:15.001	2026-02-10 00:43:15.001
cmlfvngzf000irapv0urnz1ur	cmlfvngyv000brapvt2zop64f	cmj5gx2kx005335udc4757qsp	SAKIT	\N	2026-02-10 00:43:15.003	2026-02-10 00:43:15.003
cmlg2vnms001zrapvp850d287	cmlg2vnmp001yrapv0g0exppc	cmj5gwyx9000935ud28f9ggyr	HADIR	\N	2026-02-10 04:05:34.18	2026-02-10 04:05:34.18
cmlg2vnmv0020rapvta7qka8n	cmlg2vnmp001yrapv0g0exppc	cmj5gwzeh000v35udwd1xnzk8	HADIR	\N	2026-02-10 04:05:34.183	2026-02-10 04:05:34.183
cmlg2vnmx0021rapvv8u14sr6	cmlg2vnmp001yrapv0g0exppc	cml4n1odj005nrgpvbubg8thz	HADIR	\N	2026-02-10 04:05:34.185	2026-02-10 04:05:34.185
cmlg2vnmz0022rapvy3z52shy	cmlg2vnmp001yrapv0g0exppc	cmj5gwztr001f35udgp2iqne6	HADIR	\N	2026-02-10 04:05:34.187	2026-02-10 04:05:34.187
cmlg2vnn00023rapv4os4uoei	cmlg2vnmp001yrapv0g0exppc	cmj5gx0c0002335udrmwctcnm	HADIR	\N	2026-02-10 04:05:34.188	2026-02-10 04:05:34.188
cmlg2vnn20024rapvppwkh1k4	cmlg2vnmp001yrapv0g0exppc	cmj5gx0o3002j35uda0ok0i4j	HADIR	\N	2026-02-10 04:05:34.19	2026-02-10 04:05:34.19
cmlg2vnn40025rapvhf5chwzp	cmlg2vnmp001yrapv0g0exppc	cmj5gx17k003935udaewx76ro	HADIR	\N	2026-02-10 04:05:34.192	2026-02-10 04:05:34.192
cmlg2vnn50026rapvidf6y0f3	cmlg2vnmp001yrapv0g0exppc	cmj5gx1o2003v35udzn7dj9ls	HADIR	\N	2026-02-10 04:05:34.193	2026-02-10 04:05:34.193
cmlg2vnn70027rapvdu7a02er	cmlg2vnmp001yrapv0g0exppc	cmj5gx206004b35uduf215trn	HADIR	\N	2026-02-10 04:05:34.195	2026-02-10 04:05:34.195
cmlg2vnna0028rapv3gozj1x0	cmlg2vnmp001yrapv0g0exppc	cmj5gx21o004d35udxjptvn08	HADIR	\N	2026-02-10 04:05:34.198	2026-02-10 04:05:34.198
cmlg2vnne0029rapv9rc9cxwn	cmlg2vnmp001yrapv0g0exppc	cmj5gx264004j35ud8hnkcdnj	HADIR	\N	2026-02-10 04:05:34.202	2026-02-10 04:05:34.202
cmlg2vnnh002arapvoj6fow56	cmlg2vnmp001yrapv0g0exppc	cmj5gx2i0004z35udecgz1nlq	HADIR	\N	2026-02-10 04:05:34.205	2026-02-10 04:05:34.205
cmlg2vnnl002brapv2t5yhysn	cmlg2vnmp001yrapv0g0exppc	cmj5gx2ny005735udgqgfno56	IZIN	\N	2026-02-10 04:05:34.209	2026-02-10 04:05:34.209
cmlg2vnnp002crapv4it84w84	cmlg2vnmp001yrapv0g0exppc	cmj5gx2qz005b35ud4370ott0	HADIR	\N	2026-02-10 04:05:34.213	2026-02-10 04:05:34.213
cmm9womr60001r6pv7egdr3ew	cmm9womr10000r6pvucxvb9qt	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-03-03 01:05:14.034	2026-03-03 01:05:14.034
cmm9womrb0002r6pvax7hmgl5	cmm9womr10000r6pvucxvb9qt	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-03-03 01:05:14.039	2026-03-03 01:05:14.039
cmm9womrc0003r6pvfytd19o1	cmm9womr10000r6pvucxvb9qt	cmj5gx0r4002n35ud6i7qxccl	ALPHA	\N	2026-03-03 01:05:14.04	2026-03-03 01:05:14.04
cmm9womre0004r6pvxoziqucn	cmm9womr10000r6pvucxvb9qt	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-03-03 01:05:14.042	2026-03-03 01:05:14.042
cmm9womrf0005r6pvyp3mih3t	cmm9womr10000r6pvucxvb9qt	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-03-03 01:05:14.043	2026-03-03 01:05:14.043
cmm9womrh0006r6pvsnp33vth	cmm9womr10000r6pvucxvb9qt	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-03-03 01:05:14.045	2026-03-03 01:05:14.045
cmm9womri0007r6pvz7uu9yqs	cmm9womr10000r6pvucxvb9qt	cmj5gx2kx005335udc4757qsp	HADIR	\N	2026-03-03 01:05:14.046	2026-03-03 01:05:14.046
cmmcrhm3i0001r0pvfvix1p5m	cmmcrhm3c0000r0pv1udwb7uf	cmj5gwyvo000735udytelfevq	ALPHA	\N	2026-03-05 01:03:07.038	2026-03-05 01:03:07.038
cmmcrhm3m0002r0pvrbqkoars	cmmcrhm3c0000r0pv1udwb7uf	cmj5gwz23000f35udoygf650d	ALPHA	\N	2026-03-05 01:03:07.042	2026-03-05 01:03:07.042
cmmcrhm3n0003r0pv5np24ow3	cmmcrhm3c0000r0pv1udwb7uf	cmj5gwz9u000p35uddazsd00z	ALPHA	\N	2026-03-05 01:03:07.043	2026-03-05 01:03:07.043
cmmcrhm3p0004r0pvcw7o951e	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx01e001p35udcjqmly7n	ALPHA	\N	2026-03-05 01:03:07.045	2026-03-05 01:03:07.045
cmmcrhm3r0005r0pvdkfkmnda	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx05x001v35udwd5nk8nj	HADIR	\N	2026-03-05 01:03:07.047	2026-03-05 01:03:07.047
cmmcrhm3t0006r0pvt2qko9jy	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx0di002535ud32uasdbw	HADIR	\N	2026-03-05 01:03:07.049	2026-03-05 01:03:07.049
cmmcrhm3v0007r0pvq1xg2mfr	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx0gi002935udl20nfbog	ALPHA	\N	2026-03-05 01:03:07.051	2026-03-05 01:03:07.051
cmmcrhm3x0008r0pvw7p3bqvy	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx0i0002b35ud19a6xd7r	ALPHA	\N	2026-03-05 01:03:07.053	2026-03-05 01:03:07.053
cmmcrhm3z0009r0pvecadwy11	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx162003735ud5de1cxbc	HADIR	\N	2026-03-05 01:03:07.055	2026-03-05 01:03:07.055
cmmcrhm41000ar0pvg5yxbbq8	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx1c3003f35udp6zso1o3	ALPHA	\N	2026-03-05 01:03:07.057	2026-03-05 01:03:07.057
cmmcrhm42000br0pve0fu2g5p	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx1r2003z35udbet34tx1	ALPHA	\N	2026-03-05 01:03:07.058	2026-03-05 01:03:07.058
cmmcrhm44000cr0pvf7j7121n	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx1sk004135udexpydl8s	ALPHA	\N	2026-03-05 01:03:07.06	2026-03-05 01:03:07.06
cmmcrhm46000dr0pvt5xy9sj0	cmmcrhm3c0000r0pv1udwb7uf	cmj5gx2wz005j35ud2ivwa2j0	HADIR	\N	2026-03-05 01:03:07.062	2026-03-05 01:03:07.062
cmmcrjl3s000gr0pvlrg91a3p	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-03-05 01:04:39.064	2026-03-05 01:04:39.064
cmmcrjl3v000hr0pvbb76hlwr	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-03-05 01:04:39.067	2026-03-05 01:04:39.067
cmmcrjl3w000ir0pv365i5avz	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx0r4002n35ud6i7qxccl	ALPHA	\N	2026-03-05 01:04:39.068	2026-03-05 01:04:39.068
cmmcrjl3y000jr0pvax9adwtc	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-03-05 01:04:39.07	2026-03-05 01:04:39.07
cmmcrjl3z000kr0pvodjxc39r	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-03-05 01:04:39.071	2026-03-05 01:04:39.071
cmmcrjl41000lr0pvi3tq8ueu	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-03-05 01:04:39.073	2026-03-05 01:04:39.073
cmmcrjl43000mr0pv3bo71ocw	cmmcrjl3p000fr0pvtbu34ajd	cmj5gx2kx005335udc4757qsp	HADIR	\N	2026-03-05 01:04:39.075	2026-03-05 01:04:39.075
cmmcwk0ad001zr0pv4adnutkf	cmmcwk0aa001yr0pvln5u5euu	cmj5gwyx9000935ud28f9ggyr	HADIR	\N	2026-03-05 03:24:56.821	2026-03-05 03:24:56.821
cmmcwk0ag0020r0pv0lcp138i	cmmcwk0aa001yr0pvln5u5euu	cmj5gwzeh000v35udwd1xnzk8	HADIR	\N	2026-03-05 03:24:56.824	2026-03-05 03:24:56.824
cmmcwk0ah0021r0pvmk0bvx2d	cmmcwk0aa001yr0pvln5u5euu	cml4n1odj005nrgpvbubg8thz	HADIR	\N	2026-03-05 03:24:56.825	2026-03-05 03:24:56.825
cmmcwk0aj0022r0pvkimpt6xy	cmmcwk0aa001yr0pvln5u5euu	cmj5gwztr001f35udgp2iqne6	HADIR	\N	2026-03-05 03:24:56.827	2026-03-05 03:24:56.827
cmmcwk0ak0023r0pv0belty7h	cmmcwk0aa001yr0pvln5u5euu	cmj5gx0c0002335udrmwctcnm	HADIR	\N	2026-03-05 03:24:56.828	2026-03-05 03:24:56.828
cmmcwk0al0024r0pvknrxc1fu	cmmcwk0aa001yr0pvln5u5euu	cmj5gx0o3002j35uda0ok0i4j	HADIR	\N	2026-03-05 03:24:56.829	2026-03-05 03:24:56.829
cmmcwk0am0025r0pvqhhu4iiz	cmmcwk0aa001yr0pvln5u5euu	cmj5gx17k003935udaewx76ro	IZIN	\N	2026-03-05 03:24:56.83	2026-03-05 03:24:56.83
cmmcwk0ao0026r0pv1dlzm4q2	cmmcwk0aa001yr0pvln5u5euu	cmj5gx1o2003v35udzn7dj9ls	ALPHA	\N	2026-03-05 03:24:56.832	2026-03-05 03:24:56.832
cmmcwk0ap0027r0pvpbsqrp1i	cmmcwk0aa001yr0pvln5u5euu	cmj5gx206004b35uduf215trn	ALPHA	\N	2026-03-05 03:24:56.833	2026-03-05 03:24:56.833
cmmcwk0aq0028r0pv8va31x18	cmmcwk0aa001yr0pvln5u5euu	cmj5gx21o004d35udxjptvn08	IZIN	\N	2026-03-05 03:24:56.834	2026-03-05 03:24:56.834
cmmcwk0ar0029r0pvx1cx7drd	cmmcwk0aa001yr0pvln5u5euu	cmj5gx264004j35ud8hnkcdnj	HADIR	\N	2026-03-05 03:24:56.835	2026-03-05 03:24:56.835
cmmcwk0as002ar0pvyigunvl2	cmmcwk0aa001yr0pvln5u5euu	cmj5gx2i0004z35udecgz1nlq	ALPHA	\N	2026-03-05 03:24:56.836	2026-03-05 03:24:56.836
cmmcwk0au002br0pvcrah3rb6	cmmcwk0aa001yr0pvln5u5euu	cmj5gx2ny005735udgqgfno56	ALPHA	\N	2026-03-05 03:24:56.838	2026-03-05 03:24:56.838
cmmcwk0av002cr0pv5scgwe5p	cmmcwk0aa001yr0pvln5u5euu	cmj5gx2qz005b35ud4370ott0	ALPHA	\N	2026-03-05 03:24:56.839	2026-03-05 03:24:56.839
cmmfqpvm4000nqrpv30r4glpw	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-03-07 03:04:51.532	2026-03-07 03:04:51.532
cmmfqpvm9000oqrpv21z30nu0	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-03-07 03:04:51.537	2026-03-07 03:04:51.537
cmmfqpvma000pqrpvblxd3bbi	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-03-07 03:04:51.538	2026-03-07 03:04:51.538
cmmfqpvmc000qqrpvxhij69ks	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-03-07 03:04:51.539	2026-03-07 03:04:51.539
cmmfqpvmd000rqrpvulskbknv	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-03-07 03:04:51.541	2026-03-07 03:04:51.541
cmmfqpvme000sqrpvizmohsr1	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-03-07 03:04:51.542	2026-03-07 03:04:51.542
cmmfqpvmg000tqrpvbaw6aks3	cmmfqpvm1000mqrpvd3yydlbz	cmj5gx2kx005335udc4757qsp	ALPHA	\N	2026-03-07 03:04:51.544	2026-03-07 03:04:51.544
cmmmu06y3000uqrpvou8pfpig	cmmmu06xv000tqrpvvo6pirm5	cmj5gwyvo000735udytelfevq	HADIR	\N	2026-03-12 02:11:14.859	2026-03-12 02:11:14.859
cmmmu06yc000vqrpvrpke3kt1	cmmmu06xv000tqrpvvo6pirm5	cmj5gwz23000f35udoygf650d	HADIR	\N	2026-03-12 02:11:14.868	2026-03-12 02:11:14.868
cmmmu06yg000wqrpvis5mc6kq	cmmmu06xv000tqrpvvo6pirm5	cmj5gwz9u000p35uddazsd00z	HADIR	\N	2026-03-12 02:11:14.872	2026-03-12 02:11:14.872
cmmmu06yl000xqrpv4tvw6xhk	cmmmu06xv000tqrpvvo6pirm5	cmj5gx01e001p35udcjqmly7n	HADIR	\N	2026-03-12 02:11:14.876	2026-03-12 02:11:14.876
cmmmu06yp000yqrpvi1qrcq0l	cmmmu06xv000tqrpvvo6pirm5	cmj5gx05x001v35udwd5nk8nj	HADIR	\N	2026-03-12 02:11:14.881	2026-03-12 02:11:14.881
cmmmu06yt000zqrpvr9g2f14m	cmmmu06xv000tqrpvvo6pirm5	cmj5gx0di002535ud32uasdbw	HADIR	\N	2026-03-12 02:11:14.885	2026-03-12 02:11:14.885
cmmmu06yx0010qrpvfwujt8mv	cmmmu06xv000tqrpvvo6pirm5	cmj5gx0gi002935udl20nfbog	HADIR	\N	2026-03-12 02:11:14.889	2026-03-12 02:11:14.889
cmmmu06z10011qrpvi2k2r0q9	cmmmu06xv000tqrpvvo6pirm5	cmj5gx0i0002b35ud19a6xd7r	HADIR	\N	2026-03-12 02:11:14.893	2026-03-12 02:11:14.893
cmmmu06z50012qrpvv0g1a6k4	cmmmu06xv000tqrpvvo6pirm5	cmj5gx162003735ud5de1cxbc	HADIR	\N	2026-03-12 02:11:14.897	2026-03-12 02:11:14.897
cmmmu06z80013qrpvc5h1u1fr	cmmmu06xv000tqrpvvo6pirm5	cmj5gx1c3003f35udp6zso1o3	HADIR	\N	2026-03-12 02:11:14.9	2026-03-12 02:11:14.9
cmmmu06zc0014qrpvbuso8ask	cmmmu06xv000tqrpvvo6pirm5	cmj5gx1r2003z35udbet34tx1	HADIR	\N	2026-03-12 02:11:14.904	2026-03-12 02:11:14.904
cmmmu06zg0015qrpvuak0ry91	cmmmu06xv000tqrpvvo6pirm5	cmj5gx1sk004135udexpydl8s	HADIR	\N	2026-03-12 02:11:14.908	2026-03-12 02:11:14.908
cmmmu06zk0016qrpv58yfncch	cmmmu06xv000tqrpvvo6pirm5	cmj5gx2wz005j35ud2ivwa2j0	HADIR	\N	2026-03-12 02:11:14.912	2026-03-12 02:11:14.912
cmmoa0y3z001shgpv750ej8bx	cmmo9x392001chgpvfkr97d45	cmj5gwyx9000935ud28f9ggyr	IZIN	\N	2026-03-13 02:27:30.095	2026-03-13 02:27:30.095
cmmoa0y43001thgpv5mzsajja	cmmo9x392001chgpvfkr97d45	cmj5gwzeh000v35udwd1xnzk8	IZIN	\N	2026-03-13 02:27:30.099	2026-03-13 02:27:30.099
cmmoa0y44001uhgpvf58b8zqb	cmmo9x392001chgpvfkr97d45	cml4n1odj005nrgpvbubg8thz	HADIR	\N	2026-03-13 02:27:30.1	2026-03-13 02:27:30.1
cmmoa0y46001vhgpvefcvkbta	cmmo9x392001chgpvfkr97d45	cmj5gwztr001f35udgp2iqne6	HADIR	\N	2026-03-13 02:27:30.102	2026-03-13 02:27:30.102
cmmoa0y47001whgpvnjxfdn7i	cmmo9x392001chgpvfkr97d45	cmj5gx0c0002335udrmwctcnm	HADIR	\N	2026-03-13 02:27:30.103	2026-03-13 02:27:30.103
cmmoa0y49001xhgpvief62444	cmmo9x392001chgpvfkr97d45	cmj5gx0o3002j35uda0ok0i4j	HADIR	\N	2026-03-13 02:27:30.105	2026-03-13 02:27:30.105
cmmoa0y4a001yhgpvqzwbklxn	cmmo9x392001chgpvfkr97d45	cmj5gx17k003935udaewx76ro	HADIR	\N	2026-03-13 02:27:30.106	2026-03-13 02:27:30.106
cmmoa0y4b001zhgpvmupkmpnh	cmmo9x392001chgpvfkr97d45	cmj5gx1o2003v35udzn7dj9ls	HADIR	\N	2026-03-13 02:27:30.107	2026-03-13 02:27:30.107
cmmoa0y4d0020hgpv387354sa	cmmo9x392001chgpvfkr97d45	cmj5gx21o004d35udxjptvn08	HADIR	\N	2026-03-13 02:27:30.109	2026-03-13 02:27:30.109
cmmoa0y4e0021hgpvg9prb4e2	cmmo9x392001chgpvfkr97d45	cmj5gx206004b35uduf215trn	HADIR	\N	2026-03-13 02:27:30.11	2026-03-13 02:27:30.11
cmmoa0y4f0022hgpvz4jpm88d	cmmo9x392001chgpvfkr97d45	cmj5gx264004j35ud8hnkcdnj	HADIR	\N	2026-03-13 02:27:30.111	2026-03-13 02:27:30.111
cmmoa0y4g0023hgpvxbta78ad	cmmo9x392001chgpvfkr97d45	cmj5gx2i0004z35udecgz1nlq	HADIR	\N	2026-03-13 02:27:30.112	2026-03-13 02:27:30.112
cmmoa0y4h0024hgpvbcs5dxtu	cmmo9x392001chgpvfkr97d45	cmj5gx2ny005735udgqgfno56	HADIR	\N	2026-03-13 02:27:30.113	2026-03-13 02:27:30.113
cmmoa0y4i0025hgpv36w2gz2b	cmmo9x392001chgpvfkr97d45	cmj5gx2qz005b35ud4370ott0	HADIR	\N	2026-03-13 02:27:30.114	2026-03-13 02:27:30.114
cmmoa6mut0028hgpvw6297p8e	cmmoa6mur0027hgpvbct0r0ri	cmj5gx08y001z35udsqo698l8	HADIR	\N	2026-03-13 02:31:55.445	2026-03-13 02:31:55.445
cmmoa6muv0029hgpvicxbfdyp	cmmoa6mur0027hgpvbct0r0ri	cmj5gx0ml002h35udvjc8yzeb	HADIR	\N	2026-03-13 02:31:55.447	2026-03-13 02:31:55.447
cmmoa6mux002ahgpv2jpg42gb	cmmoa6mur0027hgpvbct0r0ri	cmj5gx0r4002n35ud6i7qxccl	HADIR	\N	2026-03-13 02:31:55.449	2026-03-13 02:31:55.449
cmmoa6muy002bhgpv23hr3qye	cmmoa6mur0027hgpvbct0r0ri	cmj5gx0x4002v35udz7qohe6d	HADIR	\N	2026-03-13 02:31:55.45	2026-03-13 02:31:55.45
cmmoa6muz002chgpvravqmohl	cmmoa6mur0027hgpvbct0r0ri	cmj5gx103002z35udn2m30zv3	HADIR	\N	2026-03-13 02:31:55.451	2026-03-13 02:31:55.451
cmmoa6mv0002dhgpvd6boqj7c	cmmoa6mur0027hgpvbct0r0ri	cmj5gx1vm004535udc4l2kzg5	HADIR	\N	2026-03-13 02:31:55.452	2026-03-13 02:31:55.452
cmmoa6mv1002ehgpvh05w1n29	cmmoa6mur0027hgpvbct0r0ri	cmj5gx2kx005335udc4757qsp	ALPHA	\N	2026-03-13 02:31:55.453	2026-03-13 02:31:55.453
\.


--
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Attendance" (id, "siswaId", tanggal, "jamMasuk", "jamKeluar", status, keterangan, "scanBy", "createdAt", "updatedAt", "deletedAt") FROM stdin;
cmkm6gmzl000svkpv8u9mkzf2	cmj5gx2zz005n35udbo6v7qv9	2026-01-20	2026-01-20 05:52:46.683	2026-01-20 05:52:51.541	TERLAMBAT	\N	cmj5cw3cn00004iud971p5w0w	2026-01-20 05:52:46.687	2026-01-20 05:52:51.545	\N
cmkm6ge53000rvkpvziye6c0p	cmj5gx2c1004r35udtqywx9eq	2026-01-20	2026-01-20 05:52:35.217	2026-01-20 05:52:53.995	TERLAMBAT	\N	cmj5cw3cn00004iud971p5w0w	2026-01-20 05:52:35.221	2026-01-20 05:52:53.999	\N
cmkm0wlhm000nvkpvst1lewaj	cmj5gx04g001t35udknq3yqoe	2026-01-20	2026-01-20 03:17:13.54	2026-01-20 05:52:55.346	TERLAMBAT	\N	cmj5cw3cn00004iud971p5w0w	2026-01-20 03:17:13.545	2026-01-20 05:52:55.35	\N
cmkm0wlaa000mvkpvqw9rzh1o	cmj5gwzqp001b35udoas61cxe	2026-01-20	2026-01-20 03:17:13.276	2026-01-20 05:52:56.492	TERLAMBAT	\N	cmj5cw3cn00004iud971p5w0w	2026-01-20 03:17:13.281	2026-01-20 05:53:04.685	\N
cmkm6h7xy000tvkpvxh5hbjlc	cmj5gx206004b35uduf215trn	2026-01-20	2026-01-20 05:53:13.839	\N	TERLAMBAT	\N	cmj5cw3cn00004iud971p5w0w	2026-01-20 05:53:13.843	2026-01-20 05:53:15.84	\N
cmkp0zql80008tfpvriki42lk	cmj5gwzqp001b35udoas61cxe	2026-01-22	2026-01-22 05:42:58.645	\N	TERLAMBAT	\N	cmj8hh49m0000oaudjfiw6g8c	2026-01-22 05:42:58.65	2026-01-22 05:42:58.65	\N
cmkp0zrph0009tfpvdqycy7cp	cmj5gx04g001t35udknq3yqoe	2026-01-22	2026-01-22 05:43:00.095	\N	TERLAMBAT	\N	cmj8hh49m0000oaudjfiw6g8c	2026-01-22 05:43:00.099	2026-01-22 05:43:00.099	\N
cmkp0zxfj000atfpvc4qarbd9	cmj5gx2c1004r35udtqywx9eq	2026-01-22	2026-01-22 05:43:07.517	\N	TERLAMBAT	\N	cmj8hh49m0000oaudjfiw6g8c	2026-01-22 05:43:07.518	2026-01-22 05:43:07.518	\N
\.


--
-- Data for Name: BankSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BankSoal" (id, kode, pertanyaan, tipe, "mataPelajaranId", "pilihanJawaban", "jawabanBenar", bobot, "createdAt", "updatedAt", "deletedAt", "guruId", "kelasId") FROM stdin;
cmkvugtq700029tpvbd2p7jaf	SOAL-00001	Alamat IP Kelas C dimulai dari 192.0.0.0 sampai 223.255.255.0. Subnet Mask default untuk Kelas C adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "255.0.0.0", "isCorrect": false}, {"id": "B", "text": "255.255.0.0", "isCorrect": false}, {"id": "C", "text": "255.255.255.0", "isCorrect": true}, {"id": "D", "text": "255.255.255.192", "isCorrect": false}, {"id": "E", "text": "255.255.255.255", "isCorrect": false}]	C	5	2026-01-27 00:14:41.79	2026-01-27 00:14:41.79	\N	\N	\N
cmkvugtqf00039tpvianx6e0u	SOAL-00002	Bandwidth adalah kapasitas maksimum transfer data yang dapat dilakukan melalui suatu jaringan dalam satuan waktu tertentu. Satuan yang umum digunakan untuk menyatakan bandwidth adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Hertz (Hz)", "isCorrect": false}, {"id": "B", "text": "Byte per detik (Bps)", "isCorrect": false}, {"id": "C", "text": "Watt (W)", "isCorrect": false}, {"id": "D", "text": "Volt (V)", "isCorrect": false}, {"id": "E", "text": "Bit per detik (bps), seperti Kbps, Mbps, atau Gbps.", "isCorrect": true}]	E	5	2026-01-27 00:14:41.798	2026-01-27 00:14:41.798	\N	\N	\N
cmkvugtqk00049tpvovqw9v22	SOAL-00003	Alat yang digunakan untuk mengukur kecepatan unduhan dan unggahan bandwidth, seperti Ookla Speedtest atau Fast.com, dikenal sebagai...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "B", "text": "Speed Test Tools", "isCorrect": true}, {"id": "C", "text": "Pengaturan QoS", "isCorrect": false}, {"id": "D", "text": "New Terminal", "isCorrect": false}, {"id": "E", "text": "RouterOS", "isCorrect": false}]	B	5	2026-01-27 00:14:41.803	2026-01-27 00:14:41.803	\N	\N	\N
cmkvugtqp00059tpvzxxb7qry	SOAL-00004	Untuk mendapatkan IP otomatis, Default Route otomatis, dan DNS otomatis dari Router ISP, pada MikroTik yang terhubung ke ISP (WAN), kita harus membuat...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": true}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "NAT", "isCorrect": false}, {"id": "D", "text": "User Login", "isCorrect": false}, {"id": "E", "text": "IP Pool", "isCorrect": false}]	A	5	2026-01-27 00:14:41.809	2026-01-27 00:14:41.809	\N	\N	\N
cmkvugtqu00069tpvih5v2r9k	SOAL-00005	Setelah router MikroTik bisa terhubung ke internet, langkah selanjutnya untuk memastikan laptop atau PC client bisa mendapatkan IP otomatis adalah dengan membuat...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": false}, {"id": "B", "text": "NAT", "isCorrect": false}, {"id": "C", "text": "New Terminal", "isCorrect": false}, {"id": "D", "text": "DHCP Server untuk ke jaringan LAN", "isCorrect": true}, {"id": "E", "text": "IP Address WAN", "isCorrect": false}]	D	5	2026-01-27 00:14:41.813	2026-01-27 00:14:41.813	\N	\N	\N
cmkvugtqy00079tpv1z5c50b3	SOAL-00006	Sebelum memulai konfigurasi dasar MikroTik dari awal, langkah pertama yang disarankan ketika login menggunakan Winbox adalah memilih opsi...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "New Terminal", "isCorrect": false}, {"id": "B", "text": "System - Reboot", "isCorrect": false}, {"id": "C", "text": "Upgrade RouterOS", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Download &amp; Install", "isCorrect": false}]	D	5	2026-01-27 00:14:41.818	2026-01-27 00:14:41.818	\N	\N	\N
cmkvugtr300089tpv56fp4fqn	SOAL-00007	Subnetting adalah teknik untuk membagi jaringan IP menjadi beberapa sub-jaringan kecil agar penggunaan IP lebih efisien dan meminimalkan konflik jaringan. Subnetting membantu dalam peningkatan...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jarak pengiriman data.", "isCorrect": false}, {"id": "B", "text": "Jumlah bit yang dipinjam.", "isCorrect": false}, {"id": "C", "text": "Lease Time IP.", "isCorrect": false}, {"id": "D", "text": "Keamanan serta performa jaringan.", "isCorrect": true}, {"id": "E", "text": "Versi RouterOS.", "isCorrect": false}]	D	5	2026-01-27 00:14:41.823	2026-01-27 00:14:41.823	\N	\N	\N
cmkvugtr800099tpvg0ds82y6	SOAL-00008	Perangkat lunak apa yang digunakan untuk mengkonfigurasi perangkat MikroTik, dan dapat diunduh dari mikrotik.com?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "RouterOS", "isCorrect": false}, {"id": "B", "text": "New Terminal", "isCorrect": false}, {"id": "C", "text": "Speed Test Tools", "isCorrect": false}, {"id": "D", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "E", "text": "Winbox", "isCorrect": true}]	E	5	2026-01-27 00:14:41.827	2026-01-27 00:14:41.827	\N	\N	\N
cmkvugtrd000a9tpvt0gbc167	SOAL-00009	Semakin besar bandwidth yang dimiliki oleh suatu "jalur," maka...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Latency akan selalu berkurang.", "isCorrect": false}, {"id": "B", "text": "Jumlah pengguna harus dibatasi.", "isCorrect": false}, {"id": "C", "text": "Semakin banyak data yang dapat ditransmisikan dalam waktu yang sama.", "isCorrect": true}, {"id": "D", "text": "Jarak pengiriman harus dipersingkat.", "isCorrect": false}, {"id": "E", "text": "Koneksi harus menggunakan kabel tembaga.", "isCorrect": false}]	C	5	2026-01-27 00:14:41.832	2026-01-27 00:14:41.832	\N	\N	\N
cmkvugtrh000b9tpvffymrb7r	SOAL-00010	Setelah konfigurasi dasar berhasil, disarankan untuk mengganti nama interface (misalnya dari ether1 menjadi ether1-INDIHOME) dengan tujuan agar...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Mengurangi latency.", "isCorrect": false}, {"id": "B", "text": "Mempercepat koneksi ke ISP.", "isCorrect": false}, {"id": "C", "text": "Lebih mudah memonitor dan mengidentifikasi port tersebut.", "isCorrect": true}, {"id": "D", "text": "Mengaktifkan DHCP Server.", "isCorrect": false}, {"id": "E", "text": "Membatasi traffic broadcast.", "isCorrect": false}]	C	5	2026-01-27 00:14:41.837	2026-01-27 00:14:41.837	\N	\N	\N
cmkvugtrl000c9tpv8undkp3n	SOAL-00011	Dalam konfigurasi dasar MikroTik, mengapa penting untuk membuat DHCP Client pada interface WAN (ether1) yang menuju ke ISP?	ESSAY	cmj9z7q9n001s5dudxr525koc	\N	Fungsi DHCP Client di MikroTik WAN: Penting untuk membuat DHCP Client pada interface WAN MikroTik karena ISP (seperti Indihome, Biznet, dll.) umumnya sudah memiliki DHCP Server pada port LAN-nya. Dengan menjadi DHCP Client, MikroTik dapat secara otomatis mendapatkan IP otomatis, Default Route otomatis, dan DNS otomatis dari ISP.	11	2026-01-27 00:14:41.841	2026-01-27 00:14:41.841	\N	\N	\N
cmkvugtrq000d9tpvloy2r3xs	SOAL-00012	Jika Laptop/PC client di jaringan LAN sudah bisa ping ke router MikroTik tetapi belum bisa mengakses internet, konfigurasi dasar apa yang perlu ditambahkan dan apa fungsinya?	ESSAY	cmj9z7q9n001s5dudxr525koc	\N	Konfigurasi NAT pada MikroTik: Jika client sudah bisa ping router tetapi belum bisa akses internet, konfigurasi yang perlu ditambahkan adalah NAT (Network Address Translation). ◦ Fungsinya adalah merubah IP LAN client menjadi IP WAN, sehingga client di jaringan internal bisa terhubung ke internet	11	2026-01-27 00:14:41.846	2026-01-27 00:14:41.846	\N	\N	\N
cmkvugtrv000e9tpv0zusqhwy	SOAL-00013	Sebutkan minimal empat (4) parameter/informasi yang perlu diperhatikan dalam proses pembuatan DHCP Server pada MikroTik!	ESSAY	cmj9z7q9n001s5dudxr525koc	\N	Parameter DHCP Server pada MikroTik: Empat parameter penting yang perlu diperhatikan saat pembuatan DHCP Server: 1. Network Address (DHCP Address Space). 2. Gateway for DHCP Network (IP Router). 3. IP Pool (Addresses to Give Out), yaitu Range IP yang akan diberikan oleh client. 4. DNS Servers . 5. Lease Time (Waktu "sewa" yang akan diberikan oleh client). (Sebutkan empat dari lima poin ini).	13	2026-01-27 00:14:41.85	2026-01-27 00:14:41.85	\N	\N	\N
cml4m97d20002rgpvrkvuggpu	SOAL-00014	Seorang profesional yang bertugas merancang, membangun, dan memelihara infrastruktur jaringan komunikasi dalam sebuah organisasi disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Graphic Designer", "isCorrect": false}, {"id": "B", "text": "Web Developer", "isCorrect": false}, {"id": "C", "text": "Database Administrator", "isCorrect": false}, {"id": "D", "text": "System Analyst", "isCorrect": false}, {"id": "E", "text": "Network Engineer", "isCorrect": true}]	E	3	2026-02-02 03:34:44.868	2026-02-02 03:34:44.868	\N	\N	\N
cml4m97d80003rgpvf8bnizox	SOAL-00015	Profesi di bidang TJKT yang memiliki tanggung jawab khusus untuk melindungi sistem jaringan dari serangan siber dan akses yang tidak sah adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Computer Technician", "isCorrect": false}, {"id": "B", "text": "Cable Installer", "isCorrect": false}, {"id": "C", "text": "Cyber Security Specialist", "isCorrect": true}, {"id": "D", "text": "Data Entry Operator", "isCorrect": false}, {"id": "E", "text": "Support Engineer", "isCorrect": false}]	C	3	2026-02-02 03:34:44.876	2026-02-02 03:34:44.876	\N	\N	\N
cml4m97dd0004rgpvg5js9ln2	SOAL-00016	Salah satu peluang usaha di bidang TJKT yang menyediakan layanan akses internet kepada masyarakat umum atau perusahaan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Software House", "isCorrect": false}, {"id": "B", "text": "Graphic House", "isCorrect": false}, {"id": "C", "text": "ISP (Internet Service Provider)", "isCorrect": true}, {"id": "D", "text": "Content Creator", "isCorrect": false}, {"id": "E", "text": "Hardware Supplier", "isCorrect": false}]	C	3	2026-02-02 03:34:44.881	2026-02-02 03:34:44.881	\N	\N	\N
cml4m97di0005rgpvt53dhc7n	SOAL-00017	Karakteristik seorang wirausahawan yang mampu bangkit kembali setelah mengalami kegagalan dalam usahanya disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Kreatif", "isCorrect": false}, {"id": "B", "text": "Inovatif", "isCorrect": false}, {"id": "C", "text": "Resilien (Tangguh)", "isCorrect": true}, {"id": "D", "text": "Konsumtif", "isCorrect": false}, {"id": "E", "text": "Subjektif", "isCorrect": false}]	C	3	2026-02-02 03:34:44.886	2026-02-02 03:34:44.886	\N	\N	\N
cml4m97dn0006rgpvv4hujm8o	SOAL-00018	Jenis peluang usaha di bidang TJKT yang menawarkan jasa perbaikan perangkat keras jaringan atau komputer pelanggan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "IT Consultant", "isCorrect": false}, {"id": "B", "text": "Maintenance &amp; Repair Service", "isCorrect": true}, {"id": "C", "text": "Digital Marketer", "isCorrect": false}, {"id": "D", "text": "Web Designer", "isCorrect": false}, {"id": "E", "text": "Cloud Architect", "isCorrect": false}]	B	3	2026-02-02 03:34:44.891	2026-02-02 03:34:44.891	\N	\N	\N
cml4m97dr0007rgpvui4uzvdn	SOAL-00019	Mengapa seorang teknisi TJKT perlu memiliki etika profesi yang baik?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Agar bisa menjual perangkat dengan harga yang sangat mahal", "isCorrect": false}, {"id": "B", "text": "Agar dapat mengakses data pribadi pelanggan secara bebas", "isCorrect": false}, {"id": "C", "text": "Untuk membangun kepercayaan pelanggan dan menjaga kerahasiaan data", "isCorrect": true}, {"id": "D", "text": "Supaya tidak perlu mengikuti perkembangan teknologi terbaru", "isCorrect": false}, {"id": "E", "text": "Hanya sekadar formalitas untuk mendapatkan sertifikat", "isCorrect": false}]	C	3	2026-02-02 03:34:44.895	2026-02-02 03:34:44.895	\N	\N	\N
cml4m97dw0008rgpvlnwt30ft	SOAL-00020	Berikut yang merupakan tahapan awal dalam memulai sebuah usaha (start-up) di bidang teknologi adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Langsung menyewa gedung kantor yang mewah", "isCorrect": false}, {"id": "B", "text": "Melakukan riset pasar dan identifikasi masalah", "isCorrect": true}, {"id": "C", "text": "Mempekerjakan karyawan sebanyak mungkin", "isCorrect": false}, {"id": "D", "text": "Mengabaikan masukan dari calon pelanggan", "isCorrect": false}, {"id": "E", "text": "Menutup diri dari persaingan usaha", "isCorrect": false}]	B	3	2026-02-02 03:34:44.899	2026-02-02 03:34:44.899	\N	\N	\N
cml4m97e00009rgpvfbxjc81w	SOAL-00021	Kemampuan untuk melihat peluang, berani mengambil risiko, dan menciptakan inovasi baru merupakan definisi dari...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Pekerja kantor", "isCorrect": false}, {"id": "B", "text": "Buruh pabrik", "isCorrect": false}, {"id": "C", "text": "Entrepreneurship (Kewirausahaan)", "isCorrect": true}, {"id": "D", "text": "Freelancer", "isCorrect": false}, {"id": "E", "text": "Pegawai Negeri Sipil", "isCorrect": false}]	C	3	2026-02-02 03:34:44.904	2026-02-02 03:34:44.904	\N	\N	\N
cml4m97e4000argpvlq5ic118	SOAL-00022	Seorang teknisi yang khusus menangani masalah pada kabel fiber optic termasuk dalam kategori pekerjaan...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Software Engineering", "isCorrect": false}, {"id": "B", "text": "Data Scientist", "isCorrect": false}, {"id": "C", "text": "Fiber Optic Technician", "isCorrect": true}, {"id": "D", "text": "Mobile App Developer", "isCorrect": false}, {"id": "E", "text": "User Experience Designer", "isCorrect": false}]	C	3	2026-02-02 03:34:44.908	2026-02-02 03:34:44.908	\N	\N	\N
cml4m97e9000brgpvkiqybw99	SOAL-00023	Layanan 'Cloud Computing' yang menyediakan infrastruktur seperti server virtual dan penyimpanan data merupakan peluang bisnis di bidang...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hardware Assembly", "isCorrect": false}, {"id": "B", "text": "Infrastructure as a Service (IaaS)", "isCorrect": true}, {"id": "C", "text": "Social Media Marketing", "isCorrect": false}, {"id": "D", "text": "SEO Optimization", "isCorrect": false}, {"id": "E", "text": "Game Development", "isCorrect": false}]	B	3	2026-02-02 03:34:44.912	2026-02-02 03:34:44.912	\N	\N	\N
cml4m97ed000crgpvrdn4qznk	SOAL-00024	Sikap yang harus dihindari oleh seorang calon wirausahawan di bidang teknologi adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Terbuka terhadap kritik", "isCorrect": false}, {"id": "B", "text": "Selalu belajar hal baru", "isCorrect": false}, {"id": "C", "text": "Mudah menyerah saat menghadapi kendala teknis", "isCorrect": true}, {"id": "D", "text": "Berani mengambil risiko yang terukur", "isCorrect": false}, {"id": "E", "text": "Mampu bekerja dalam tim", "isCorrect": false}]	C	3	2026-02-02 03:34:44.917	2026-02-02 03:34:44.917	\N	\N	\N
cml4m97ei000drgpv6a6s8obt	SOAL-00025	Dalam dunia kerja TJKT, sertifikasi kompetensi (seperti Mikrotik MTCNA atau Cisco CCNA) sangat penting karena...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hanya sebagai pajangan di dinding kantor", "isCorrect": false}, {"id": "B", "text": "Memberikan bukti pengakuan keahlian secara internasional", "isCorrect": true}, {"id": "C", "text": "Dapat digunakan untuk menggantikan ijazah sekolah", "isCorrect": false}, {"id": "D", "text": "Agar bisa mendapatkan diskon saat membeli perangkat", "isCorrect": false}, {"id": "E", "text": "Supaya tidak perlu bekerja keras lagi", "isCorrect": false}]	B	3	2026-02-02 03:34:44.921	2026-02-02 03:34:44.921	\N	\N	\N
cml4m97em000ergpv14th1zp7	SOAL-00026	Seorang 'System Administrator' memiliki tugas utama untuk...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuat desain grafis untuk iklan perusahaan", "isCorrect": false}, {"id": "B", "text": "Mengelola dan menjaga operasional server serta sistem komputer", "isCorrect": true}, {"id": "C", "text": "Menjual perangkat keras di toko komputer", "isCorrect": false}, {"id": "D", "text": "Menulis artikel berita teknologi di blog", "isCorrect": false}, {"id": "E", "text": "Melakukan survei kepuasan pelanggan", "isCorrect": false}]	B	3	2026-02-02 03:34:44.925	2026-02-02 03:34:44.925	\N	\N	\N
cml4m97eq000frgpvrqknploa	SOAL-00027	Layanan jasa yang membantu perusahaan untuk menganalisis dan memberikan solusi atas masalah IT yang dihadapi disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Dropshipper", "isCorrect": false}, {"id": "B", "text": "Reseller perangkat IT", "isCorrect": false}, {"id": "C", "text": "IT Consultant (Konsultan IT)", "isCorrect": true}, {"id": "D", "text": "Data Miner", "isCorrect": false}, {"id": "E", "text": "Video Editor", "isCorrect": false}]	C	3	2026-02-02 03:34:44.93	2026-02-02 03:34:44.93	\N	\N	\N
cml4m97eu000grgpvgb9y0qbq	SOAL-00028	Manakah yang merupakan pemanfaatan teknologi Internet of Things (IoT) sebagai peluang usaha di masa depan?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuka kursus mengetik cepat 10 jari", "isCorrect": false}, {"id": "B", "text": "Layanan instalasi rumah pintar (Smart Home) berbasis sensor", "isCorrect": true}, {"id": "C", "text": "Jasa fotokopi dan penjilidan dokumen", "isCorrect": false}, {"id": "D", "text": "Menjual pulsa elektrik secara manual", "isCorrect": false}, {"id": "E", "text": "Jasa pembuatan spanduk kain", "isCorrect": false}]	B	3	2026-02-02 03:34:44.934	2026-02-02 03:34:44.934	\N	\N	\N
cml4m97ez000hrgpvh0mzdz0i	SOAL-00029	Seorang profesional yang bertanggung jawab untuk memastikan server, database, dan aplikasi jaringan tetap berjalan optimal di sisi belakang layar disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Frontend Developer", "isCorrect": false}, {"id": "B", "text": "UI/UX Designer", "isCorrect": false}, {"id": "C", "text": "Backend Engineer", "isCorrect": true}, {"id": "D", "text": "Social Media Specialist", "isCorrect": false}, {"id": "E", "text": "Content Writer", "isCorrect": false}]	C	3	2026-02-02 03:34:44.938	2026-02-02 03:34:44.938	\N	\N	\N
cml4m97f3000irgpvybj6etjk	SOAL-00030	Di bawah ini yang merupakan keuntungan utama dari model bisnis SaaS (Software as a Service) bagi pelanggan perusahaan adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Harus membeli lisensi fisik yang mahal", "isCorrect": false}, {"id": "B", "text": "Akses aplikasi melalui internet tanpa instalasi server mandiri", "isCorrect": true}, {"id": "C", "text": "Pelanggan harus mengelola pemeliharaan hardware sendiri", "isCorrect": false}, {"id": "D", "text": "Keamanan data sepenuhnya dikelola secara manual oleh user", "isCorrect": false}, {"id": "E", "text": "Membatasi jumlah pengguna secara permanen", "isCorrect": false}]	B	3	2026-02-02 03:34:44.942	2026-02-02 03:34:44.942	\N	\N	\N
cml4m97f7000jrgpvkqezt4ev	SOAL-00031	Dalam etika profesi TJKT, tindakan memantau atau menyadap lalu lintas data orang lain tanpa izin di sebuah jaringan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Troubleshooting", "isCorrect": false}, {"id": "B", "text": "Sniffing", "isCorrect": true}, {"id": "C", "text": "Backing up", "isCorrect": false}, {"id": "D", "text": "Updating", "isCorrect": false}, {"id": "E", "text": "Filtering", "isCorrect": false}]	B	3	2026-02-02 03:34:44.946	2026-02-02 03:34:44.946	\N	\N	\N
cml4m97fb000krgpvjxws7q78	SOAL-00032	Peluang usaha TJKT yang menawarkan jasa perakitan komputer spesifikasi khusus untuk kebutuhan gaming atau server disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Digital Agency", "isCorrect": false}, {"id": "B", "text": "Hardware Custom Assembly", "isCorrect": true}, {"id": "C", "text": "Copywriting", "isCorrect": false}, {"id": "D", "text": "Data Entry", "isCorrect": false}, {"id": "E", "text": "Public Relation", "isCorrect": false}]	B	3	2026-02-02 03:34:44.951	2026-02-02 03:34:44.951	\N	\N	\N
cml4m97ff000lrgpvwbojttd8	SOAL-00033	Apa peran utama dari seorang 'Data Center Technician'?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuat desain banner iklan", "isCorrect": false}, {"id": "B", "text": "Menjaga dan memperbaiki perangkat keras di ruang server pusat data", "isCorrect": true}, {"id": "C", "text": "Menulis artikel blog perusahaan", "isCorrect": false}, {"id": "D", "text": "Melakukan promosi produk di media sosial", "isCorrect": false}, {"id": "E", "text": "Mengelola penggajian karyawan", "isCorrect": false}]	B	3	2026-02-02 03:34:44.955	2026-02-02 03:34:44.955	\N	\N	\N
cml4m97fj000mrgpvolqpih62	SOAL-00034	Strategi pengembangan startup yang fokus pada pembuatan produk minimal untuk diuji ke pasar dengan cepat dikenal dengan istilah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Massive Production", "isCorrect": false}, {"id": "B", "text": "Lean Startup (MVP)", "isCorrect": true}, {"id": "C", "text": "Traditional Planning", "isCorrect": false}, {"id": "D", "text": "Monopoly Strategy", "isCorrect": false}, {"id": "E", "text": "Slow Growth", "isCorrect": false}]	B	2	2026-02-02 03:34:44.959	2026-02-02 03:34:44.959	\N	\N	\N
cml4m97fo000nrgpv2yv7ixgf	SOAL-00035	Manakah dari berikut ini yang merupakan contoh peluang usaha di bidang infrastruktur telekomunikasi?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Toko roti online", "isCorrect": false}, {"id": "B", "text": "Jasa instalasi Tower BTS (Base Transceiver Station)", "isCorrect": true}, {"id": "C", "text": "Penyewaan alat berat konstruksi", "isCorrect": false}, {"id": "D", "text": "Penulisan skenario film", "isCorrect": false}, {"id": "E", "text": "Jasa laundry sepatu", "isCorrect": false}]	B	2	2026-02-02 03:34:44.964	2026-02-02 03:34:44.964	\N	\N	\N
cml4m97fs000orgpvh42hbtho	SOAL-00036	Mengapa seorang teknisi jaringan harus memahami standar pengabelan internasional (seperti T568A/T568B)?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Agar kabel terlihat lebih berwarna-warni", "isCorrect": false}, {"id": "B", "text": "Supaya biaya pemasangan menjadi sangat murah", "isCorrect": false}, {"id": "C", "text": "Agar instalasi kompatibel dan mudah dikelola teknisi lain", "isCorrect": true}, {"id": "D", "text": "Hanya untuk memenuhi syarat hobi", "isCorrect": false}, {"id": "E", "text": "Agar tidak perlu menggunakan konektor RJ45", "isCorrect": false}]	C	2	2026-02-02 03:34:44.968	2026-02-02 03:34:44.968	\N	\N	\N
cml4m97fx000prgpvs6i0bh7m	SOAL-00037	Kemampuan untuk terus belajar dan menyesuaikan diri dengan perubahan teknologi yang sangat cepat di bidang TJKT disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Statis", "isCorrect": false}, {"id": "B", "text": "Konservatif", "isCorrect": false}, {"id": "C", "text": "Adaptabilitas", "isCorrect": true}, {"id": "D", "text": "Subjektif", "isCorrect": false}, {"id": "E", "text": "Pasif", "isCorrect": false}]	C	2	2026-02-02 03:34:44.973	2026-02-02 03:34:44.973	\N	\N	\N
cmmjwdrre000fr4pvs4rhtp8u	SOAL-00099	Dalam menu Queues, langkah selanjutnya untuk mengatur bandwidth adalah dengan membuat:	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Simple Queue", "isCorrect": true}, {"id": "B", "text": "Address List", "isCorrect": false}, {"id": "C", "text": "Filter Rule", "isCorrect": false}, {"id": "D", "text": "NAT Rule", "isCorrect": false}, {"id": "E", "text": "Mangle Rule", "isCorrect": false}]	A	5	2026-03-10 00:54:29.066	2026-03-10 00:54:29.066	\N	\N	\N
cml4m97g3000qrgpvpygwh87h	SOAL-00038	Dalam analisis SWOT untuk memulai usaha IT, huruf 'T' merupakan singkatan dari 'Threats' yang berarti...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Target pasar yang luas", "isCorrect": false}, {"id": "B", "text": "Teknologi yang digunakan", "isCorrect": false}, {"id": "C", "text": "Ancaman atau tantangan dari faktor eksternal", "isCorrect": true}, {"id": "D", "text": "Tujuan jangka panjang perusahaan", "isCorrect": false}, {"id": "E", "text": "Tenaga kerja yang ahli", "isCorrect": false}]	C	2	2026-02-02 03:34:44.978	2026-02-02 03:34:44.978	\N	\N	\N
cml4m97g8000rrgpv8ybj426q	SOAL-00039	Layanan jasa yang fokus pada perlindungan data dari serangan ransomware dan penyediaan sistem cadangan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "SEO Agency", "isCorrect": false}, {"id": "B", "text": "Cyber Security &amp; Disaster Recovery", "isCorrect": true}, {"id": "C", "text": "Graphic Design Studio", "isCorrect": false}, {"id": "D", "text": "Event Organizer", "isCorrect": false}, {"id": "E", "text": "Office Administration", "isCorrect": false}]	B	2	2026-02-02 03:34:44.984	2026-02-02 03:34:44.984	\N	\N	\N
cml4m97gc000srgpvau5246di	SOAL-00040	Usaha yang membantu toko fisik tradisional bertransformasi menjadi toko online (digitalisasi) disebut sebagai...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hardware Wholesaler", "isCorrect": false}, {"id": "B", "text": "E-commerce Enabler", "isCorrect": true}, {"id": "C", "text": "Manual Data Entry", "isCorrect": false}, {"id": "D", "text": "Broadcasting Service", "isCorrect": false}, {"id": "E", "text": "Courier Service", "isCorrect": false}]	B	2	2026-02-02 03:34:44.988	2026-02-02 03:34:44.988	\N	\N	\N
cml4m97gh000trgpvnix1zyf7	SOAL-00041	Profesi yang bertugas merancang skema jaringan (topologi) berskala besar untuk area perkotaan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Web Programmer", "isCorrect": false}, {"id": "B", "text": "Network Architect", "isCorrect": true}, {"id": "C", "text": "Helpdesk Support", "isCorrect": false}, {"id": "D", "text": "Content Editor", "isCorrect": false}, {"id": "E", "text": "Store Keeper", "isCorrect": false}]	B	2	2026-02-02 03:34:44.993	2026-02-02 03:34:44.993	\N	\N	\N
cml4m97gm000urgpvbaqidhpj	SOAL-00042	Sikap jujur dan konsisten dalam menjalankan tugas serta menjaga rahasia data klien bagi seorang teknisi IT disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Ambisius", "isCorrect": false}, {"id": "B", "text": "Integritas", "isCorrect": true}, {"id": "C", "text": "Otoriter", "isCorrect": false}, {"id": "D", "text": "Egois", "isCorrect": false}, {"id": "E", "text": "Individualis", "isCorrect": false}]	B	2	2026-02-02 03:34:44.998	2026-02-02 03:34:44.998	\N	\N	\N
cml4m97gr000vrgpva0cdhgvy	SOAL-00043	Peluang usaha TJKT yang menyediakan platform pelatihan keterampilan teknologi secara digital disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Jasa antar jemput", "isCorrect": false}, {"id": "B", "text": "Platform Kursus Online (LMS) khusus IT", "isCorrect": true}, {"id": "C", "text": "Toko buku konvensional", "isCorrect": false}, {"id": "D", "text": "Produksi seragam sekolah", "isCorrect": false}, {"id": "E", "text": "Layanan katering kantor", "isCorrect": false}]	B	2	2026-02-02 03:34:45.003	2026-02-02 03:34:45.003	\N	\N	\N
cml4mci84001srgpvp3hrwrmq	SOAL-00044	Seorang profesional yang bertugas merancang, membangun, dan memelihara infrastruktur jaringan komunikasi dalam sebuah organisasi disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Graphic Designer", "isCorrect": false}, {"id": "B", "text": "Web Developer", "isCorrect": false}, {"id": "C", "text": "Database Administrator", "isCorrect": false}, {"id": "D", "text": "System Analyst", "isCorrect": false}, {"id": "E", "text": "Network Engineer", "isCorrect": true}]	E	4	2026-02-02 03:37:18.915	2026-02-02 03:37:18.915	\N	\N	\N
cml4mci89001trgpvyrtyw8sl	SOAL-00045	Profesi di bidang TJKT yang memiliki tanggung jawab khusus untuk melindungi sistem jaringan dari serangan siber dan akses yang tidak sah adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Computer Technician", "isCorrect": false}, {"id": "B", "text": "Cable Installer", "isCorrect": false}, {"id": "C", "text": "Cyber Security Specialist", "isCorrect": true}, {"id": "D", "text": "Data Entry Operator", "isCorrect": false}, {"id": "E", "text": "Support Engineer", "isCorrect": false}]	C	4	2026-02-02 03:37:18.92	2026-02-02 03:37:18.92	\N	\N	\N
cml4mci8d001urgpv1k6y1h8z	SOAL-00046	Salah satu peluang usaha di bidang TJKT yang menyediakan layanan akses internet kepada masyarakat umum atau perusahaan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Software House", "isCorrect": false}, {"id": "B", "text": "Graphic House", "isCorrect": false}, {"id": "C", "text": "ISP (Internet Service Provider)", "isCorrect": true}, {"id": "D", "text": "Content Creator", "isCorrect": false}, {"id": "E", "text": "Hardware Supplier", "isCorrect": false}]	C	4	2026-02-02 03:37:18.925	2026-02-02 03:37:18.925	\N	\N	\N
cml4mci8h001vrgpvbn5v3szn	SOAL-00047	Karakteristik seorang wirausahawan yang mampu bangkit kembali setelah mengalami kegagalan dalam usahanya disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Kreatif", "isCorrect": false}, {"id": "B", "text": "Inovatif", "isCorrect": false}, {"id": "C", "text": "Resilien (Tangguh)", "isCorrect": true}, {"id": "D", "text": "Konsumtif", "isCorrect": false}, {"id": "E", "text": "Subjektif", "isCorrect": false}]	C	4	2026-02-02 03:37:18.929	2026-02-02 03:37:18.929	\N	\N	\N
cml4mci8m001wrgpv6hzvzmw0	SOAL-00048	Jenis peluang usaha di bidang TJKT yang menawarkan jasa perbaikan perangkat keras jaringan atau komputer pelanggan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "IT Consultant", "isCorrect": false}, {"id": "B", "text": "Maintenance &amp; Repair Service", "isCorrect": true}, {"id": "C", "text": "Digital Marketer", "isCorrect": false}, {"id": "D", "text": "Web Designer", "isCorrect": false}, {"id": "E", "text": "Cloud Architect", "isCorrect": false}]	B	4	2026-02-02 03:37:18.934	2026-02-02 03:37:18.934	\N	\N	\N
cml4mci8q001xrgpvkhyvra67	SOAL-00049	Mengapa seorang teknisi TJKT perlu memiliki etika profesi yang baik?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Agar bisa menjual perangkat dengan harga yang sangat mahal", "isCorrect": false}, {"id": "B", "text": "Agar dapat mengakses data pribadi pelanggan secara bebas", "isCorrect": false}, {"id": "C", "text": "Untuk membangun kepercayaan pelanggan dan menjaga kerahasiaan data", "isCorrect": true}, {"id": "D", "text": "Supaya tidak perlu mengikuti perkembangan teknologi terbaru", "isCorrect": false}, {"id": "E", "text": "Hanya sekadar formalitas untuk mendapatkan sertifikat", "isCorrect": false}]	C	4	2026-02-02 03:37:18.938	2026-02-02 03:37:18.938	\N	\N	\N
cml4mci8v001yrgpvlrrubb6v	SOAL-00050	Berikut yang merupakan tahapan awal dalam memulai sebuah usaha (start-up) di bidang teknologi adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Langsung menyewa gedung kantor yang mewah", "isCorrect": false}, {"id": "B", "text": "Melakukan riset pasar dan identifikasi masalah", "isCorrect": true}, {"id": "C", "text": "Mempekerjakan karyawan sebanyak mungkin", "isCorrect": false}, {"id": "D", "text": "Mengabaikan masukan dari calon pelanggan", "isCorrect": false}, {"id": "E", "text": "Menutup diri dari persaingan usaha", "isCorrect": false}]	B	4	2026-02-02 03:37:18.942	2026-02-02 03:37:18.942	\N	\N	\N
cml4mci8z001zrgpvkuhii72a	SOAL-00051	Kemampuan untuk melihat peluang, berani mengambil risiko, dan menciptakan inovasi baru merupakan definisi dari...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Pekerja kantor", "isCorrect": false}, {"id": "B", "text": "Buruh pabrik", "isCorrect": false}, {"id": "C", "text": "Entrepreneurship (Kewirausahaan)", "isCorrect": true}, {"id": "D", "text": "Freelancer", "isCorrect": false}, {"id": "E", "text": "Pegawai Negeri Sipil", "isCorrect": false}]	C	4	2026-02-02 03:37:18.947	2026-02-02 03:37:18.947	\N	\N	\N
cml4mci930020rgpv71dlgdwf	SOAL-00052	Seorang teknisi yang khusus menangani masalah pada kabel fiber optic termasuk dalam kategori pekerjaan...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Software Engineering", "isCorrect": false}, {"id": "B", "text": "Data Scientist", "isCorrect": false}, {"id": "C", "text": "Fiber Optic Technician", "isCorrect": true}, {"id": "D", "text": "Mobile App Developer", "isCorrect": false}, {"id": "E", "text": "User Experience Designer", "isCorrect": false}]	C	4	2026-02-02 03:37:18.951	2026-02-02 03:37:18.951	\N	\N	\N
cml4mci980021rgpvygkrq73g	SOAL-00053	Layanan 'Cloud Computing' yang menyediakan infrastruktur seperti server virtual dan penyimpanan data merupakan peluang bisnis di bidang...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hardware Assembly", "isCorrect": false}, {"id": "B", "text": "Infrastructure as a Service (IaaS)", "isCorrect": true}, {"id": "C", "text": "Social Media Marketing", "isCorrect": false}, {"id": "D", "text": "SEO Optimization", "isCorrect": false}, {"id": "E", "text": "Game Development", "isCorrect": false}]	B	4	2026-02-02 03:37:18.955	2026-02-02 03:37:18.955	\N	\N	\N
cml4mci9c0022rgpvyy4h4xbu	SOAL-00054	Sikap yang harus dihindari oleh seorang calon wirausahawan di bidang teknologi adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Terbuka terhadap kritik", "isCorrect": false}, {"id": "B", "text": "Selalu belajar hal baru", "isCorrect": false}, {"id": "C", "text": "Mudah menyerah saat menghadapi kendala teknis", "isCorrect": true}, {"id": "D", "text": "Berani mengambil risiko yang terukur", "isCorrect": false}, {"id": "E", "text": "Mampu bekerja dalam tim", "isCorrect": false}]	C	4	2026-02-02 03:37:18.96	2026-02-02 03:37:18.96	\N	\N	\N
cml4mci9g0023rgpvc1iujwzo	SOAL-00055	Dalam dunia kerja TJKT, sertifikasi kompetensi (seperti Mikrotik MTCNA atau Cisco CCNA) sangat penting karena...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hanya sebagai pajangan di dinding kantor", "isCorrect": false}, {"id": "B", "text": "Memberikan bukti pengakuan keahlian secara internasional", "isCorrect": true}, {"id": "C", "text": "Dapat digunakan untuk menggantikan ijazah sekolah", "isCorrect": false}, {"id": "D", "text": "Agar bisa mendapatkan diskon saat membeli perangkat", "isCorrect": false}, {"id": "E", "text": "Supaya tidak perlu bekerja keras lagi", "isCorrect": false}]	B	4	2026-02-02 03:37:18.964	2026-02-02 03:37:18.964	\N	\N	\N
cml4mci9k0024rgpv0ktf8och	SOAL-00056	Seorang 'System Administrator' memiliki tugas utama untuk...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuat desain grafis untuk iklan perusahaan", "isCorrect": false}, {"id": "B", "text": "Mengelola dan menjaga operasional server serta sistem komputer", "isCorrect": true}, {"id": "C", "text": "Menjual perangkat keras di toko komputer", "isCorrect": false}, {"id": "D", "text": "Menulis artikel berita teknologi di blog", "isCorrect": false}, {"id": "E", "text": "Melakukan survei kepuasan pelanggan", "isCorrect": false}]	B	4	2026-02-02 03:37:18.968	2026-02-02 03:37:18.968	\N	\N	\N
cml4mci9p0025rgpvrxib62sx	SOAL-00057	Layanan jasa yang membantu perusahaan untuk menganalisis dan memberikan solusi atas masalah IT yang dihadapi disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Dropshipper", "isCorrect": false}, {"id": "B", "text": "Reseller perangkat IT", "isCorrect": false}, {"id": "C", "text": "IT Consultant (Konsultan IT)", "isCorrect": true}, {"id": "D", "text": "Data Miner", "isCorrect": false}, {"id": "E", "text": "Video Editor", "isCorrect": false}]	C	4	2026-02-02 03:37:18.972	2026-02-02 03:37:18.972	\N	\N	\N
cml4mci9u0026rgpv6z79hyp2	SOAL-00058	Manakah yang merupakan pemanfaatan teknologi Internet of Things (IoT) sebagai peluang usaha di masa depan?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuka kursus mengetik cepat 10 jari", "isCorrect": false}, {"id": "B", "text": "Layanan instalasi rumah pintar (Smart Home) berbasis sensor", "isCorrect": true}, {"id": "C", "text": "Jasa fotokopi dan penjilidan dokumen", "isCorrect": false}, {"id": "D", "text": "Menjual pulsa elektrik secara manual", "isCorrect": false}, {"id": "E", "text": "Jasa pembuatan spanduk kain", "isCorrect": false}]	B	4	2026-02-02 03:37:18.977	2026-02-02 03:37:18.977	\N	\N	\N
cml4mci9z0027rgpv3hqw3s43	SOAL-00059	Seorang profesional yang bertanggung jawab untuk memastikan server, database, dan aplikasi jaringan tetap berjalan optimal di sisi belakang layar disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Frontend Developer", "isCorrect": false}, {"id": "B", "text": "UI/UX Designer", "isCorrect": false}, {"id": "C", "text": "Backend Engineer", "isCorrect": true}, {"id": "D", "text": "Social Media Specialist", "isCorrect": false}, {"id": "E", "text": "Content Writer", "isCorrect": false}]	C	4	2026-02-02 03:37:18.983	2026-02-02 03:37:18.983	\N	\N	\N
cml4mcia40028rgpv0hjvbqmd	SOAL-00060	Di bawah ini yang merupakan keuntungan utama dari model bisnis SaaS (Software as a Service) bagi pelanggan perusahaan adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Harus membeli lisensi fisik yang mahal", "isCorrect": false}, {"id": "B", "text": "Akses aplikasi melalui internet tanpa instalasi server mandiri", "isCorrect": true}, {"id": "C", "text": "Pelanggan harus mengelola pemeliharaan hardware sendiri", "isCorrect": false}, {"id": "D", "text": "Keamanan data sepenuhnya dikelola secara manual oleh user", "isCorrect": false}, {"id": "E", "text": "Membatasi jumlah pengguna secara permanen", "isCorrect": false}]	B	4	2026-02-02 03:37:18.988	2026-02-02 03:37:18.988	\N	\N	\N
cml4mcia90029rgpvu5bfgrct	SOAL-00061	Dalam etika profesi TJKT, tindakan memantau atau menyadap lalu lintas data orang lain tanpa izin di sebuah jaringan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Troubleshooting", "isCorrect": false}, {"id": "B", "text": "Sniffing", "isCorrect": true}, {"id": "C", "text": "Backing up", "isCorrect": false}, {"id": "D", "text": "Updating", "isCorrect": false}, {"id": "E", "text": "Filtering", "isCorrect": false}]	B	4	2026-02-02 03:37:18.993	2026-02-02 03:37:18.993	\N	\N	\N
cml4mciaf002argpvdccm9nof	SOAL-00062	Peluang usaha TJKT yang menawarkan jasa perakitan komputer spesifikasi khusus untuk kebutuhan gaming atau server disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Digital Agency", "isCorrect": false}, {"id": "B", "text": "Hardware Custom Assembly", "isCorrect": true}, {"id": "C", "text": "Copywriting", "isCorrect": false}, {"id": "D", "text": "Data Entry", "isCorrect": false}, {"id": "E", "text": "Public Relation", "isCorrect": false}]	B	4	2026-02-02 03:37:18.998	2026-02-02 03:37:18.998	\N	\N	\N
cml4mciak002brgpvgqkzu3as	SOAL-00063	Apa peran utama dari seorang 'Data Center Technician'?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuat desain banner iklan", "isCorrect": false}, {"id": "B", "text": "Menjaga dan memperbaiki perangkat keras di ruang server pusat data", "isCorrect": true}, {"id": "C", "text": "Menulis artikel blog perusahaan", "isCorrect": false}, {"id": "D", "text": "Melakukan promosi produk di media sosial", "isCorrect": false}, {"id": "E", "text": "Mengelola penggajian karyawan", "isCorrect": false}]	B	4	2026-02-02 03:37:19.004	2026-02-02 03:37:19.004	\N	\N	\N
cml4mciaq002crgpvfaszib5t	SOAL-00064	Strategi pengembangan startup yang fokus pada pembuatan produk minimal untuk diuji ke pasar dengan cepat dikenal dengan istilah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Massive Production", "isCorrect": false}, {"id": "B", "text": "Lean Startup (MVP)", "isCorrect": true}, {"id": "C", "text": "Traditional Planning", "isCorrect": false}, {"id": "D", "text": "Monopoly Strategy", "isCorrect": false}, {"id": "E", "text": "Slow Growth", "isCorrect": false}]	B	2	2026-02-02 03:37:19.009	2026-02-02 03:37:19.009	\N	\N	\N
cml4mciav002drgpvau6f2jib	SOAL-00065	Manakah dari berikut ini yang merupakan contoh peluang usaha di bidang infrastruktur telekomunikasi?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Toko roti online", "isCorrect": false}, {"id": "B", "text": "Jasa instalasi Tower BTS (Base Transceiver Station)", "isCorrect": true}, {"id": "C", "text": "Penyewaan alat berat konstruksi", "isCorrect": false}, {"id": "D", "text": "Penulisan skenario film", "isCorrect": false}, {"id": "E", "text": "Jasa laundry sepatu", "isCorrect": false}]	B	2	2026-02-02 03:37:19.014	2026-02-02 03:37:19.014	\N	\N	\N
cml4mcib0002ergpvhsb8ywhv	SOAL-00066	Mengapa seorang teknisi jaringan harus memahami standar pengabelan internasional (seperti T568A/T568B)?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Agar kabel terlihat lebih berwarna-warni", "isCorrect": false}, {"id": "B", "text": "Supaya biaya pemasangan menjadi sangat murah", "isCorrect": false}, {"id": "C", "text": "Agar instalasi kompatibel dan mudah dikelola teknisi lain", "isCorrect": true}, {"id": "D", "text": "Hanya untuk memenuhi syarat hobi", "isCorrect": false}, {"id": "E", "text": "Agar tidak perlu menggunakan konektor RJ45", "isCorrect": false}]	C	2	2026-02-02 03:37:19.02	2026-02-02 03:37:19.02	\N	\N	\N
cml4mcib5002frgpv76r2bjsi	SOAL-00067	Kemampuan untuk terus belajar dan menyesuaikan diri dengan perubahan teknologi yang sangat cepat di bidang TJKT disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Statis", "isCorrect": false}, {"id": "B", "text": "Konservatif", "isCorrect": false}, {"id": "C", "text": "Adaptabilitas", "isCorrect": true}, {"id": "D", "text": "Subjektif", "isCorrect": false}, {"id": "E", "text": "Pasif", "isCorrect": false}]	C	2	2026-02-02 03:37:19.025	2026-02-02 03:37:19.025	\N	\N	\N
cml4mciba002grgpvgdr5lxlu	SOAL-00068	Dalam analisis SWOT untuk memulai usaha IT, huruf 'T' merupakan singkatan dari 'Threats' yang berarti...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Target pasar yang luas", "isCorrect": false}, {"id": "B", "text": "Teknologi yang digunakan", "isCorrect": false}, {"id": "C", "text": "Ancaman atau tantangan dari faktor eksternal", "isCorrect": true}, {"id": "D", "text": "Tujuan jangka panjang perusahaan", "isCorrect": false}, {"id": "E", "text": "Tenaga kerja yang ahli", "isCorrect": false}]	C	2	2026-02-02 03:37:19.03	2026-02-02 03:37:19.03	\N	\N	\N
cml4mcibg002hrgpvp3obcvd1	SOAL-00069	Layanan jasa yang fokus pada perlindungan data dari serangan ransomware dan penyediaan sistem cadangan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "SEO Agency", "isCorrect": false}, {"id": "B", "text": "Cyber Security &amp; Disaster Recovery", "isCorrect": true}, {"id": "C", "text": "Graphic Design Studio", "isCorrect": false}, {"id": "D", "text": "Event Organizer", "isCorrect": false}, {"id": "E", "text": "Office Administration", "isCorrect": false}]	B	2	2026-02-02 03:37:19.035	2026-02-02 03:37:19.035	\N	\N	\N
cml4mcibl002irgpv4oib878b	SOAL-00070	Usaha yang membantu toko fisik tradisional bertransformasi menjadi toko online (digitalisasi) disebut sebagai...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hardware Wholesaler", "isCorrect": false}, {"id": "B", "text": "E-commerce Enabler", "isCorrect": true}, {"id": "C", "text": "Manual Data Entry", "isCorrect": false}, {"id": "D", "text": "Broadcasting Service", "isCorrect": false}, {"id": "E", "text": "Courier Service", "isCorrect": false}]	B	2	2026-02-02 03:37:19.041	2026-02-02 03:37:19.041	\N	\N	\N
cml4mcibr002jrgpvd7mntrmy	SOAL-00071	Profesi yang bertugas merancang skema jaringan (topologi) berskala besar untuk area perkotaan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Web Programmer", "isCorrect": false}, {"id": "B", "text": "Network Architect", "isCorrect": true}, {"id": "C", "text": "Helpdesk Support", "isCorrect": false}, {"id": "D", "text": "Content Editor", "isCorrect": false}, {"id": "E", "text": "Store Keeper", "isCorrect": false}]	B	2	2026-02-02 03:37:19.046	2026-02-02 03:37:19.046	\N	\N	\N
cml4mcibx002krgpvs0hnsuzy	SOAL-00072	Sikap jujur dan konsisten dalam menjalankan tugas serta menjaga rahasia data klien bagi seorang teknisi IT disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Ambisius", "isCorrect": false}, {"id": "B", "text": "Integritas", "isCorrect": true}, {"id": "C", "text": "Otoriter", "isCorrect": false}, {"id": "D", "text": "Egois", "isCorrect": false}, {"id": "E", "text": "Individualis", "isCorrect": false}]	B	2	2026-02-02 03:37:19.052	2026-02-02 03:37:19.052	\N	\N	\N
cml4mcic3002lrgpv00zoz162	SOAL-00073	Peluang usaha TJKT yang menyediakan platform pelatihan keterampilan teknologi secara digital disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Jasa antar jemput", "isCorrect": false}, {"id": "B", "text": "Platform Kursus Online (LMS) khusus IT", "isCorrect": true}, {"id": "C", "text": "Toko buku konvensional", "isCorrect": false}, {"id": "D", "text": "Produksi seragam sekolah", "isCorrect": false}, {"id": "E", "text": "Layanan katering kantor", "isCorrect": false}]	B	2	2026-02-02 03:37:19.058	2026-02-02 03:37:19.058	\N	\N	\N
cmlfwnsb5000mrapvfh5b0twr	SOAL-00074	Apakah pengertian dari IP Address?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Protokol yang mengatur pengiriman data", "isCorrect": false}, {"id": "B", "text": "Alamat logis yang digunakan untuk mengidentifikasi perangkat dalam jaringan", "isCorrect": true}, {"id": "C", "text": "Alat untuk menghubungkan perangkat ke internet", "isCorrect": false}, {"id": "D", "text": "Media transmisi data", "isCorrect": false}, {"id": "E", "text": "Proses pengkodean data", "isCorrect": false}]	B	3	2026-02-10 01:11:29.296	2026-02-10 01:11:29.296	\N	\N	\N
cmlfwnsbb000nrapvneybpkec	SOAL-00075	Berikut adalah contoh IP Address versi 4, kecuali...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "192.168.0.1", "isCorrect": false}, {"id": "B", "text": "10.0.0.1", "isCorrect": false}, {"id": "C", "text": "255.255.255.0", "isCorrect": false}, {"id": "D", "text": "300.0.0.1", "isCorrect": true}, {"id": "E", "text": "172.16.254.1", "isCorrect": false}]	D	3	2026-02-10 01:11:29.303	2026-02-10 01:11:29.303	\N	\N	\N
cmlfwnsbg000orapv1elijm56	SOAL-00076	Media transmisi yang menggunakan serat optik memiliki keuntungan berupa...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Biaya rendah", "isCorrect": false}, {"id": "B", "text": "Kecepatan transmisi tinggi", "isCorrect": true}, {"id": "C", "text": "Mudah dikelola", "isCorrect": false}, {"id": "D", "text": "Tidak tahan terhadap gangguan elektromagnetik", "isCorrect": false}, {"id": "E", "text": "Lebih berat dibanding kabel tembaga", "isCorrect": false}]	B	3	2026-02-10 01:11:29.307	2026-02-10 01:11:29.307	\N	\N	\N
cmlfwnsbk000prapvdj1thluw	SOAL-00077	Salah satu kelebihan serat optik dibandingkan kabel tembaga adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Daya hantar arus yang lebih besar", "isCorrect": false}, {"id": "B", "text": "Tahan terhadap panas", "isCorrect": false}, {"id": "C", "text": "Tidak dipengaruhi oleh interferensi elektromagnetik", "isCorrect": true}, {"id": "D", "text": "Fleksibilitas pemasangan", "isCorrect": false}, {"id": "E", "text": "Keamanan lebih rendah", "isCorrect": false}]	C	3	2026-02-10 01:11:29.312	2026-02-10 01:11:29.312	\N	\N	\N
cmlfwnsbp000qrapv2b1p87qc	SOAL-00078	Perangkat Jaringan Antar-Segmen Perangkat yang sering disebut gateway atau pintu gerbang karena fungsinya menyediakan sarana untuk menghubungkan segmen jaringan yang berbeda adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Switch Ethernet", "isCorrect": false}, {"id": "B", "text": "Hub", "isCorrect": false}, {"id": "C", "text": "NIC", "isCorrect": false}, {"id": "D", "text": "Bridge", "isCorrect": false}, {"id": "E", "text": "Router", "isCorrect": true}]	E	3	2026-02-10 01:11:29.317	2026-02-10 01:11:29.317	\N	\N	\N
cmlfwnsbv000rrapv5js2epw3	SOAL-00079	Bagian dari kabel fiber optic yang memandu cahaya disebut...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Core", "isCorrect": true}, {"id": "B", "text": "Cladding", "isCorrect": false}, {"id": "C", "text": "Coating", "isCorrect": false}, {"id": "D", "text": "Strength member", "isCorrect": false}, {"id": "E", "text": "Jacket", "isCorrect": false}]	A	3	2026-02-10 01:11:29.322	2026-02-10 01:11:29.322	\N	\N	\N
cmlfwnsc0000srapvubpk1hoj	SOAL-00080	Perkembangan Pengalamatan Jaringan Perkembangan teknologi alamat IP saat ini mulai mengimplementasikan IPv6. Perbedaan mendasar antara IPv4 dan IPv6 dalam hal panjang bit pengalamatan adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "IPv4 menggunakan 64 bit, IPv6 menggunakan 128 bit.", "isCorrect": false}, {"id": "B", "text": "IPv4 menggunakan 32 bit, IPv6 menggunakan 64 bit.", "isCorrect": false}, {"id": "C", "text": "IPv4 menggunakan 128 bit, IPv6 menggunakan 32 bit.", "isCorrect": false}, {"id": "D", "text": "IPv4 menggunakan 32 bit, IPv6 menggunakan 128 bit.", "isCorrect": true}, {"id": "E", "text": "IPv4 menggunakan 48 bit, IPv6 menggunakan 128 bit.", "isCorrect": false}]	D	3	2026-02-10 01:11:29.327	2026-02-10 01:11:29.327	\N	\N	\N
cmlfwnsc5000trapv57y1fw8n	SOAL-00081	Grup Kerja dalam ISP (Proses Bisnis) Dalam proses bisnis perusahaan penyedia layanan internet (Internet Service Provider - ISP), terdapat grup kerja yang bertugas khusus merencanakan desain jaringan lokal pada sebuah perusahaan pelanggan agar jaringan dapat berjalan dengan baik guna meningkatkan kinerja perusahaan tersebut. Grup kerja ini adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Grup kerja Marketing/Sales.", "isCorrect": false}, {"id": "B", "text": "Grup kerja Customer Service.", "isCorrect": false}, {"id": "C", "text": "Grup kerja Administrator.", "isCorrect": false}, {"id": "D", "text": "Grup kerja Accounting.", "isCorrect": false}, {"id": "E", "text": "Grup kerja Networking Design.", "isCorrect": true}]	E	3	2026-02-10 01:11:29.332	2026-02-10 01:11:29.332	\N	\N	\N
cmlfwnsca000urapvtftpnh44	SOAL-00082	Tren Teknologi Masa Depan Teknologi layanan jaringan yang memungkinkan penyimpanan dan pemrosesan data dilakukan di server yang jauh, menawarkan fleksibilitas dan skalabilitas bisnis tanpa perlu memiliki fisik server itu sendiri, disebut teknologi...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Edge Computing.", "isCorrect": false}, {"id": "B", "text": "Internet of Things (IoT).", "isCorrect": false}, {"id": "C", "text": "Software-Defined Networking (SDN).", "isCorrect": false}, {"id": "D", "text": "Cloud Computing.", "isCorrect": true}, {"id": "E", "text": "Information Security.", "isCorrect": false}]	D	3	2026-02-10 01:11:29.338	2026-02-10 01:11:29.338	\N	\N	\N
cmlfwnscf000vrapvpo0rcsxc	SOAL-00083	Perangkat jaringan yang digunakan untuk menghubungkan beberapa komputer dalam satu jaringan lokal dan mendistribusikan paket data ke dalam jaringan yang memiliki alamat network atau segmen yang sama adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Router", "isCorrect": false}, {"id": "B", "text": "Access Point", "isCorrect": false}, {"id": "C", "text": "Hub", "isCorrect": false}, {"id": "D", "text": "Server", "isCorrect": false}, {"id": "E", "text": "Switch", "isCorrect": true}]	E	3	2026-02-10 01:11:29.343	2026-02-10 01:11:29.343	\N	\N	\N
cmlfwnscl000wrapvsitl1k1e	SOAL-00084	Proses Bisnis dalam ISP Jelaskan peran utama dari dua kelompok kerja berikut dalam struktur proses bisnis perusahaan penyedia layanan internet (ISP): a. Grup Kerja Marketing/Sales b. Grup Kerja Networking Design	ESSAY	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Grup kerja Marketing/Sales bertugas memasarkan layanan kepada calon pelanggan, baik pelanggan pribadi/perumahan maupun pelanggan perusahaan/korporasi.", "isCorrect": false}, {"id": "B", "text": "Grup kerja Networking Design bertugas merencanakan desain jaringan lokal pada sebuah perusahaan agar jaringan dapat berjalan dengan baik guna meningkatkan kinerja perusahaan tersebut", "isCorrect": false}]	a. Grup kerja Marketing/Sales bertugas memasarkan layanan kepada calon pelanggan, baik pelanggan pribadi/perumahan maupun pelanggan perusahaan/korporasi. b. Grup kerja Networking Design bertugas merencanakan desain jaringan lokal pada sebuah perusahaan agar jaringan dapat berjalan dengan baik guna meningkatkan kinerja perusahaan tersebut	8	2026-02-10 01:11:29.348	2026-02-10 01:11:29.348	\N	\N	\N
cmlfwnscq000xrapv055oieom	SOAL-00085	Sebutkan dua perbedaan format penulisan dan jumlah bit pengalamatan antara Internet Protocol versi 4 (IPv4) dan Internet Protocol versi 6 (IPv6) …	ESSAY	cmj9z7q9n001s5dudxr525koc	\N	1. Jumlah Bit Pengalamatan: IPv4 menggunakan 32 bit, sedangkan IPv6 menggunakan 128 bit. 2. Format Penulisan: IPv4 dituliskan dalam empat kelompok angka desimal yang dipisahkan oleh titik (misalnya: 192.168.10.1), sedangkan IPv6 dituliskan dalam heksadesimal (8 grup 16-bit) dan dipisahkan oleh tanda titik dua (misalnya: 2001:DA8:E800:0:260:3EFF:FE47:1).	8	2026-02-10 01:11:29.354	2026-02-10 01:11:29.354	\N	\N	\N
cmmjwdrpe0002r4pvgwgvzpj0	SOAL-00086	Alamat IP Kelas C dimulai dari 192.0.0.0 sampai 223.255.255.0. Subnet Mask default untuk Kelas C adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "255.0.0.0", "isCorrect": false}, {"id": "B", "text": "255.255.0.0", "isCorrect": false}, {"id": "C", "text": "255.255.255.0", "isCorrect": true}, {"id": "D", "text": "255.255.255.192", "isCorrect": false}, {"id": "E", "text": "255.255.255.255", "isCorrect": false}]	C	5	2026-03-10 00:54:28.994	2026-03-10 00:54:28.994	\N	\N	\N
cmmjwdrpl0003r4pvy6or8pr3	SOAL-00087	Bandwidth adalah kapasitas maksimum transfer data yang dapat dilakukan melalui suatu jaringan dalam satuan waktu tertentu. Satuan yang umum digunakan untuk menyatakan bandwidth adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Hertz (Hz)", "isCorrect": false}, {"id": "B", "text": "Byte per detik (Bps)", "isCorrect": false}, {"id": "C", "text": "Watt (W)", "isCorrect": false}, {"id": "D", "text": "Volt (V)", "isCorrect": false}, {"id": "E", "text": "Bit per detik (bps), seperti Kbps, Mbps, atau Gbps.", "isCorrect": true}]	E	5	2026-03-10 00:54:29.001	2026-03-10 00:54:29.001	\N	\N	\N
cmmjwdrpr0004r4pvuzz7o7cd	SOAL-00088	Alat yang digunakan untuk mengukur kecepatan unduhan dan unggahan bandwidth, seperti Ookla Speedtest atau Fast.com, dikenal sebagai...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "B", "text": "Speed Test Tools", "isCorrect": true}, {"id": "C", "text": "Pengaturan QoS", "isCorrect": false}, {"id": "D", "text": "New Terminal", "isCorrect": false}, {"id": "E", "text": "RouterOS", "isCorrect": false}]	B	5	2026-03-10 00:54:29.007	2026-03-10 00:54:29.007	\N	\N	\N
cmmjwdrpw0005r4pvqnldjecp	SOAL-00089	Untuk mendapatkan IP otomatis, Default Route otomatis, dan DNS otomatis dari Router ISP, pada MikroTik yang terhubung ke ISP (WAN), kita harus membuat...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": true}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "NAT", "isCorrect": false}, {"id": "D", "text": "User Login", "isCorrect": false}, {"id": "E", "text": "IP Pool", "isCorrect": false}]	A	5	2026-03-10 00:54:29.012	2026-03-10 00:54:29.012	\N	\N	\N
cmmjwdrq10006r4pvjsvncl0w	SOAL-00090	Setelah router MikroTik bisa terhubung ke internet, langkah selanjutnya untuk memastikan laptop atau PC client bisa mendapatkan IP otomatis adalah dengan membuat...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": false}, {"id": "B", "text": "NAT", "isCorrect": false}, {"id": "C", "text": "New Terminal", "isCorrect": false}, {"id": "D", "text": "DHCP Server untuk ke jaringan LAN", "isCorrect": true}, {"id": "E", "text": "IP Address WAN", "isCorrect": false}]	D	5	2026-03-10 00:54:29.017	2026-03-10 00:54:29.017	\N	\N	\N
cmmjwdrq70007r4pv1dmy29pd	SOAL-00091	Sebelum memulai konfigurasi dasar MikroTik dari awal, langkah pertama yang disarankan ketika login menggunakan Winbox adalah memilih opsi...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "New Terminal", "isCorrect": false}, {"id": "B", "text": "System - Reboot", "isCorrect": false}, {"id": "C", "text": "Upgrade RouterOS", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Download &amp; Install", "isCorrect": false}]	D	5	2026-03-10 00:54:29.022	2026-03-10 00:54:29.022	\N	\N	\N
cmmjwdrqc0008r4pv5cfupl05	SOAL-00092	Subnetting adalah teknik untuk membagi jaringan IP menjadi beberapa sub-jaringan kecil agar penggunaan IP lebih efisien dan meminimalkan konflik jaringan. Subnetting membantu dalam peningkatan...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jarak pengiriman data.", "isCorrect": false}, {"id": "B", "text": "Jumlah bit yang dipinjam.", "isCorrect": false}, {"id": "C", "text": "Lease Time IP.", "isCorrect": false}, {"id": "D", "text": "Keamanan serta performa jaringan.", "isCorrect": true}, {"id": "E", "text": "Versi RouterOS.", "isCorrect": false}]	D	5	2026-03-10 00:54:29.028	2026-03-10 00:54:29.028	\N	\N	\N
cmmjwdrqi0009r4pvhcx3nvhb	SOAL-00093	Perangkat lunak apa yang digunakan untuk mengkonfigurasi perangkat MikroTik, dan dapat diunduh dari mikrotik.com?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "RouterOS", "isCorrect": false}, {"id": "B", "text": "New Terminal", "isCorrect": false}, {"id": "C", "text": "Speed Test Tools", "isCorrect": false}, {"id": "D", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "E", "text": "Winbox", "isCorrect": true}]	E	5	2026-03-10 00:54:29.033	2026-03-10 00:54:29.033	\N	\N	\N
cmmjwdrqn000ar4pvic8pj2us	SOAL-00094	Semakin besar bandwidth yang dimiliki oleh suatu "jalur," maka...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Latency akan selalu berkurang.", "isCorrect": false}, {"id": "B", "text": "Jumlah pengguna harus dibatasi.", "isCorrect": false}, {"id": "C", "text": "Semakin banyak data yang dapat ditransmisikan dalam waktu yang sama.", "isCorrect": true}, {"id": "D", "text": "Jarak pengiriman harus dipersingkat.", "isCorrect": false}, {"id": "E", "text": "Koneksi harus menggunakan kabel tembaga.", "isCorrect": false}]	C	5	2026-03-10 00:54:29.039	2026-03-10 00:54:29.039	\N	\N	\N
cmmjwdrqt000br4pvnfl4gq1p	SOAL-00095	Setelah konfigurasi dasar berhasil, disarankan untuk mengganti nama interface (misalnya dari ether1 menjadi ether1-INDIHOME) dengan tujuan agar...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Mengurangi latency.", "isCorrect": false}, {"id": "B", "text": "Mempercepat koneksi ke ISP.", "isCorrect": false}, {"id": "C", "text": "Lebih mudah memonitor dan mengidentifikasi port tersebut.", "isCorrect": true}, {"id": "D", "text": "Mengaktifkan DHCP Server.", "isCorrect": false}, {"id": "E", "text": "Membatasi traffic broadcast.", "isCorrect": false}]	C	5	2026-03-10 00:54:29.044	2026-03-10 00:54:29.044	\N	\N	\N
cmmjwdrqy000cr4pvljwuekwm	SOAL-00096	Login winbox, secara default router Mikrotik memiliki default konfigurasi bawaan pabrik, tentunya untuk memudahkan user yang tidak ingin melakukan konfigurasi secara basic atau advance. Karena kita akan melakukan konfigurasi router dari 0 jadi kita akan menghapus konfigurasi bawaan router ini semua konfigurasi dasar akan dihapus dan memulainya kembali dari awal.……	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": false}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "Mac Address", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Action", "isCorrect": false}]	D	5	2026-03-10 00:54:29.05	2026-03-10 00:54:29.05	\N	\N	\N
cmmjwdrr3000dr4pv7ez9kvy9	SOAL-00097	Pada menu ini yang berfungsi sangat banyak yang dapat kita lakukan yaitu seperti : Melakukan blok pada content atau IP melalui Filter relus, Melakukan NAT di menu NAT, Melakukan mangle yaitu melakukan penandaan pada sebuat trafik lalu diproses sesuai kebutuhan, Service port, Address List (pengelompokan IP) untuk kebutuhan yg lebih advanced, Dan Layer7 Protocol, Pernyataan diatas termasuk fungsi dari fitur-fitur network….	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System", "isCorrect": false}, {"id": "B", "text": "IP-Firewall", "isCorrect": true}, {"id": "C", "text": "IP-DHCPServer", "isCorrect": false}, {"id": "D", "text": "Files", "isCorrect": false}, {"id": "E", "text": "Log", "isCorrect": false}]	B	5	2026-03-10 00:54:29.055	2026-03-10 00:54:29.055	\N	\N	\N
cmmjwdrr9000er4pv4txapu8a	SOAL-00098	Perhatikan fitur-fitur berikut ini. Accounting Address DHCP Client DHCP Server DHCP Relay Firewall Hotspot Berdasarkan pernyataan diatas, termasuk fitur-fitur dalam menu…..	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System", "isCorrect": false}, {"id": "B", "text": "Bridge", "isCorrect": false}, {"id": "C", "text": "Interfaces", "isCorrect": false}, {"id": "D", "text": "Queues", "isCorrect": false}, {"id": "E", "text": "IPmenu", "isCorrect": true}]	E	5	2026-03-10 00:54:29.06	2026-03-10 00:54:29.06	\N	\N	\N
cmmjwdrrk000gr4pvtd81wov4	SOAL-00100	Untuk memberikan IP Address pada router melalui Winbox, kita harus membuka menu...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System → Routerboard", "isCorrect": false}, {"id": "B", "text": "IP → DHCP Client", "isCorrect": false}, {"id": "C", "text": "IP → Routes", "isCorrect": false}, {"id": "D", "text": "IP → Addresses", "isCorrect": true}, {"id": "E", "text": "IP → DNS", "isCorrect": false}]	D	5	2026-03-10 00:54:29.072	2026-03-10 00:54:29.072	\N	\N	\N
cmmjwdrrp000hr4pv6bsv1xm2	SOAL-00101	Apa fungsi dari menu “Bridge” di Winbox?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Menggabungkan dua IP address", "isCorrect": false}, {"id": "B", "text": "Menghubungkan beberapa interface menjadi satu jaringan", "isCorrect": true}, {"id": "C", "text": "Menyimpan konfigurasi otomatis", "isCorrect": false}, {"id": "D", "text": "Membuat rule firewall", "isCorrect": false}, {"id": "E", "text": "Mengatur DNS secara manual", "isCorrect": false}]	B	5	2026-03-10 00:54:29.077	2026-03-10 00:54:29.077	\N	\N	\N
cmmjwdrrv000ir4pv9tlgfb55	SOAL-00102	Fungsi utama dari DHCP dalam jaringan komputer adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Menerjemahkan nama domain menjadi IP", "isCorrect": false}, {"id": "B", "text": "Menyediakan keamanan jaringan", "isCorrect": false}, {"id": "C", "text": "Memberikan alamat IP secara otomatis", "isCorrect": true}, {"id": "D", "text": "Mengatur kecepatan akses internet", "isCorrect": false}, {"id": "E", "text": "Menyimpan data pengguna", "isCorrect": false}]	C	5	2026-03-10 00:54:29.083	2026-03-10 00:54:29.083	\N	\N	\N
cmmjwdrs1000jr4pvtz50efd1	SOAL-00103	Apa yang terjadi jika DNS server tidak dikonfigurasi dengan benar?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jaringan akan lebih cepat", "isCorrect": false}, {"id": "B", "text": "Komputer tidak akan mendapatkan IP", "isCorrect": false}, {"id": "C", "text": "Komputer tidak dapat mengakses situs menggunakan nama domain", "isCorrect": true}, {"id": "D", "text": "Semua IP menjadi statis", "isCorrect": false}, {"id": "E", "text": "DHCP tidak akan aktif", "isCorrect": false}]	C	5	2026-03-10 00:54:29.089	2026-03-10 00:54:29.089	\N	\N	\N
cmmjwdrs8000kr4pvytm7t1c5	SOAL-00104	Untuk memverifikasi bahwa MikroTik sudah mendapatkan informasi DHCP dari ISP, kita harus memastikan pada bagian "Status" tertulis..	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Registered", "isCorrect": false}, {"id": "B", "text": "Configured", "isCorrect": false}, {"id": "C", "text": "Running", "isCorrect": false}, {"id": "D", "text": "Bound", "isCorrect": true}, {"id": "E", "text": "Active", "isCorrect": false}]	D	5	2026-03-10 00:54:29.095	2026-03-10 00:54:29.095	\N	\N	\N
cmmjwdrsd000lr4pvpr30dr69	SOAL-00105	Konfigurasi apa yang diperlukan pada MikroTik untuk merubah IP LAN client menjadi IP WAN agar client tersebut bisa mengakses internet?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Upgrade Jaringan", "isCorrect": false}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "NAT (Network Address Translation)", "isCorrect": true}, {"id": "D", "text": "QoS", "isCorrect": false}, {"id": "E", "text": "Subnetting", "isCorrect": false}]	C	5	2026-03-10 00:54:29.101	2026-03-10 00:54:29.101	\N	\N	\N
cmmjypuhi003jr4pvgdp5hwv2	SOAL-00106	Seorang profesional yang bertugas merancang, membangun, dan memelihara infrastruktur jaringan komunikasi dalam sebuah organisasi disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Graphic Designer", "isCorrect": false}, {"id": "B", "text": "Web Developer", "isCorrect": false}, {"id": "C", "text": "Database Administrator", "isCorrect": false}, {"id": "D", "text": "System Analyst", "isCorrect": false}, {"id": "E", "text": "Network Engineer", "isCorrect": true}]	E	4	2026-03-10 01:59:51.702	2026-03-10 01:59:51.702	\N	\N	\N
cmmjypuho003kr4pvajj1jufs	SOAL-00107	Profesi di bidang TJKT yang memiliki tanggung jawab khusus untuk melindungi sistem jaringan dari serangan siber dan akses yang tidak sah adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Computer Technician", "isCorrect": false}, {"id": "B", "text": "Cable Installer", "isCorrect": false}, {"id": "C", "text": "Cyber Security Specialist", "isCorrect": true}, {"id": "D", "text": "Data Entry Operator", "isCorrect": false}, {"id": "E", "text": "Support Engineer", "isCorrect": false}]	C	4	2026-03-10 01:59:51.707	2026-03-10 01:59:51.707	\N	\N	\N
cmmjypuhs003lr4pvzja8vc1s	SOAL-00108	Salah satu peluang usaha di bidang TJKT yang menyediakan layanan akses internet kepada masyarakat umum atau perusahaan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Software House", "isCorrect": false}, {"id": "B", "text": "Graphic House", "isCorrect": false}, {"id": "C", "text": "ISP (Internet Service Provider)", "isCorrect": true}, {"id": "D", "text": "Content Creator", "isCorrect": false}, {"id": "E", "text": "Hardware Supplier", "isCorrect": false}]	C	4	2026-03-10 01:59:51.711	2026-03-10 01:59:51.711	\N	\N	\N
cmmjypuhw003mr4pvgk9re7a2	SOAL-00109	Karakteristik seorang wirausahawan yang mampu bangkit kembali setelah mengalami kegagalan dalam usahanya disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Kreatif", "isCorrect": false}, {"id": "B", "text": "Inovatif", "isCorrect": false}, {"id": "C", "text": "Resilien (Tangguh)", "isCorrect": true}, {"id": "D", "text": "Konsumtif", "isCorrect": false}, {"id": "E", "text": "Subjektif", "isCorrect": false}]	C	4	2026-03-10 01:59:51.715	2026-03-10 01:59:51.715	\N	\N	\N
cmmjypuhz003nr4pvd33wlq9o	SOAL-00110	Jenis peluang usaha di bidang TJKT yang menawarkan jasa perbaikan perangkat keras jaringan atau komputer pelanggan disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "IT Consultant", "isCorrect": false}, {"id": "B", "text": "Maintenance &amp; Repair Service", "isCorrect": true}, {"id": "C", "text": "Digital Marketer", "isCorrect": false}, {"id": "D", "text": "Web Designer", "isCorrect": false}, {"id": "E", "text": "Cloud Architect", "isCorrect": false}]	B	4	2026-03-10 01:59:51.719	2026-03-10 01:59:51.719	\N	\N	\N
cmmjypui4003or4pvcwq7sgu5	SOAL-00111	Mengapa seorang teknisi TJKT perlu memiliki etika profesi yang baik?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Agar bisa menjual perangkat dengan harga yang sangat mahal", "isCorrect": false}, {"id": "B", "text": "Agar dapat mengakses data pribadi pelanggan secara bebas", "isCorrect": false}, {"id": "C", "text": "Untuk membangun kepercayaan pelanggan dan menjaga kerahasiaan data", "isCorrect": true}, {"id": "D", "text": "Supaya tidak perlu mengikuti perkembangan teknologi terbaru", "isCorrect": false}, {"id": "E", "text": "Hanya sekadar formalitas untuk mendapatkan sertifikat", "isCorrect": false}]	C	4	2026-03-10 01:59:51.723	2026-03-10 01:59:51.723	\N	\N	\N
cmmjypui8003pr4pvt3jlrm2y	SOAL-00112	Berikut yang merupakan tahapan awal dalam memulai sebuah usaha (start-up) di bidang teknologi adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Langsung menyewa gedung kantor yang mewah", "isCorrect": false}, {"id": "B", "text": "Melakukan riset pasar dan identifikasi masalah", "isCorrect": true}, {"id": "C", "text": "Mempekerjakan karyawan sebanyak mungkin", "isCorrect": false}, {"id": "D", "text": "Mengabaikan masukan dari calon pelanggan", "isCorrect": false}, {"id": "E", "text": "Menutup diri dari persaingan usaha", "isCorrect": false}]	B	4	2026-03-10 01:59:51.727	2026-03-10 01:59:51.727	\N	\N	\N
cmmjypuic003qr4pve0utsc96	SOAL-00113	Kemampuan untuk melihat peluang, berani mengambil risiko, dan menciptakan inovasi baru merupakan definisi dari...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Pekerja kantor", "isCorrect": false}, {"id": "B", "text": "Buruh pabrik", "isCorrect": false}, {"id": "C", "text": "Entrepreneurship (Kewirausahaan)", "isCorrect": true}, {"id": "D", "text": "Freelancer", "isCorrect": false}, {"id": "E", "text": "Pegawai Negeri Sipil", "isCorrect": false}]	C	4	2026-03-10 01:59:51.732	2026-03-10 01:59:51.732	\N	\N	\N
cmmjypuig003rr4pvvli26sfm	SOAL-00114	Seorang teknisi yang khusus menangani masalah pada kabel fiber optic termasuk dalam kategori pekerjaan...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Software Engineering", "isCorrect": false}, {"id": "B", "text": "Data Scientist", "isCorrect": false}, {"id": "C", "text": "Fiber Optic Technician", "isCorrect": true}, {"id": "D", "text": "Mobile App Developer", "isCorrect": false}, {"id": "E", "text": "User Experience Designer", "isCorrect": false}]	C	4	2026-03-10 01:59:51.736	2026-03-10 01:59:51.736	\N	\N	\N
cmmjypuik003sr4pvxjh1e82j	SOAL-00115	Layanan 'Cloud Computing' yang menyediakan infrastruktur seperti server virtual dan penyimpanan data merupakan peluang bisnis di bidang...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hardware Assembly", "isCorrect": false}, {"id": "B", "text": "Infrastructure as a Service (IaaS)", "isCorrect": true}, {"id": "C", "text": "Social Media Marketing", "isCorrect": false}, {"id": "D", "text": "SEO Optimization", "isCorrect": false}, {"id": "E", "text": "Game Development", "isCorrect": false}]	B	4	2026-03-10 01:59:51.74	2026-03-10 01:59:51.74	\N	\N	\N
cmmjypuip003tr4pv08jr1c7n	SOAL-00116	Sikap yang harus dihindari oleh seorang calon wirausahawan di bidang teknologi adalah...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Terbuka terhadap kritik", "isCorrect": false}, {"id": "B", "text": "Selalu belajar hal baru", "isCorrect": false}, {"id": "C", "text": "Mudah menyerah saat menghadapi kendala teknis", "isCorrect": true}, {"id": "D", "text": "Berani mengambil risiko yang terukur", "isCorrect": false}, {"id": "E", "text": "Mampu bekerja dalam tim", "isCorrect": false}]	C	4	2026-03-10 01:59:51.745	2026-03-10 01:59:51.745	\N	\N	\N
cmmjypuiu003ur4pvpeuc6qos	SOAL-00117	Dalam dunia kerja TJKT, sertifikasi kompetensi (seperti Mikrotik MTCNA atau Cisco CCNA) sangat penting karena...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Hanya sebagai pajangan di dinding kantor", "isCorrect": false}, {"id": "B", "text": "Memberikan bukti pengakuan keahlian secara internasional", "isCorrect": true}, {"id": "C", "text": "Dapat digunakan untuk menggantikan ijazah sekolah", "isCorrect": false}, {"id": "D", "text": "Agar bisa mendapatkan diskon saat membeli perangkat", "isCorrect": false}, {"id": "E", "text": "Supaya tidak perlu bekerja keras lagi", "isCorrect": false}]	B	4	2026-03-10 01:59:51.749	2026-03-10 01:59:51.749	\N	\N	\N
cmmjypuiy003vr4pv585thwbs	SOAL-00118	Seorang 'System Administrator' memiliki tugas utama untuk...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuat desain grafis untuk iklan perusahaan", "isCorrect": false}, {"id": "B", "text": "Mengelola dan menjaga operasional server serta sistem komputer", "isCorrect": true}, {"id": "C", "text": "Menjual perangkat keras di toko komputer", "isCorrect": false}, {"id": "D", "text": "Menulis artikel berita teknologi di blog", "isCorrect": false}, {"id": "E", "text": "Melakukan survei kepuasan pelanggan", "isCorrect": false}]	B	4	2026-03-10 01:59:51.754	2026-03-10 01:59:51.754	\N	\N	\N
cmmjypuj3003wr4pvvkqtu3oz	SOAL-00119	Layanan jasa yang membantu perusahaan untuk menganalisis dan memberikan solusi atas masalah IT yang dihadapi disebut...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Dropshipper", "isCorrect": false}, {"id": "B", "text": "Reseller perangkat IT", "isCorrect": false}, {"id": "C", "text": "IT Consultant (Konsultan IT)", "isCorrect": true}, {"id": "D", "text": "Data Miner", "isCorrect": false}, {"id": "E", "text": "Video Editor", "isCorrect": false}]	C	4	2026-03-10 01:59:51.759	2026-03-10 01:59:51.759	\N	\N	\N
cmmjypuj8003xr4pvqqzvooe0	SOAL-00120	Manakah yang merupakan pemanfaatan teknologi Internet of Things (IoT) sebagai peluang usaha di masa depan?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membuka kursus mengetik cepat 10 jari", "isCorrect": false}, {"id": "B", "text": "Layanan instalasi rumah pintar (Smart Home) berbasis sensor", "isCorrect": true}, {"id": "C", "text": "Jasa fotokopi dan penjilidan dokumen", "isCorrect": false}, {"id": "D", "text": "Menjual pulsa elektrik secara manual", "isCorrect": false}, {"id": "E", "text": "Jasa pembuatan spanduk kain", "isCorrect": false}]	B	4	2026-03-10 01:59:51.764	2026-03-10 01:59:51.764	\N	\N	\N
cmmjypujd003yr4pv1sgls6h3	SOAL-00121	Apa tujuan utama dari pemeliharaan jaringan komputer secara berkala?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Menambah kecepatan internet", "isCorrect": false}, {"id": "B", "text": "Mengurangi biaya operasional perusahaan", "isCorrect": false}, {"id": "C", "text": "Meningkatkan performa dan mencegah kerusakan jaringan", "isCorrect": true}, {"id": "D", "text": "Mempercepat proses instalasi jaringan baru", "isCorrect": false}, {"id": "E", "text": "Mengurangi jumlah pengguna jaringan", "isCorrect": false}]	C	4	2026-03-10 01:59:51.769	2026-03-10 01:59:51.769	\N	\N	\N
cmmjypuji003zr4pv7919t2zv	SOAL-00122	Berikut ini merupakan bagian dari perawatan preventif pada perangkat jaringan, kecuali...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Membersihkan perangkat dari debu", "isCorrect": false}, {"id": "B", "text": "Mengatur ulang konfigurasi tanpa alasan", "isCorrect": true}, {"id": "C", "text": "Memastikan suhu ruangan tetap stabil", "isCorrect": false}, {"id": "D", "text": "Memeriksa koneksi kabel secara berkala", "isCorrect": false}, {"id": "E", "text": "Memperbarui firmware perangkat jaringan", "isCorrect": false}]	B	4	2026-03-10 01:59:51.774	2026-03-10 01:59:51.774	\N	\N	\N
cmmjypujo0040r4pvdg211hk6	SOAL-00123	Apa tindakan yang paling tepat jika router mengalami hang dan tidak merespons?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Menghapus semua file di router", "isCorrect": false}, {"id": "B", "text": "Melakukan restart pada router", "isCorrect": true}, {"id": "C", "text": "Mengganti router dengan yang baru", "isCorrect": false}, {"id": "D", "text": "Menonaktifkan semua firewall", "isCorrect": false}, {"id": "E", "text": "Mengganti kabel UTP", "isCorrect": false}]	B	4	2026-03-10 01:59:51.779	2026-03-10 01:59:51.779	\N	\N	\N
cmmjypujt0041r4pv1ndtz6j8	SOAL-00124	Apa fungsi dari kabel straight-through dalam instalasi jaringan?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Menghubungkan dua komputer secara langsung", "isCorrect": false}, {"id": "B", "text": "Menghubungkan switch ke switch", "isCorrect": false}, {"id": "C", "text": "Menghubungkan komputer ke switch", "isCorrect": true}, {"id": "D", "text": "Menghubungkan router ke router", "isCorrect": false}, {"id": "E", "text": "Menghubungkan dua perangkat sejenis", "isCorrect": false}]	C	4	2026-03-10 01:59:51.785	2026-03-10 01:59:51.785	\N	\N	\N
cmmjypuk00042r4pv5yrfuwmh	SOAL-00125	Berikut ini adalah perangkat keras jaringan, kecuali...	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Router", "isCorrect": false}, {"id": "B", "text": "Switch", "isCorrect": false}, {"id": "C", "text": "Kabel UTP", "isCorrect": false}, {"id": "D", "text": "Command Prompt", "isCorrect": true}, {"id": "E", "text": "Access Point", "isCorrect": false}]	D	4	2026-03-10 01:59:51.791	2026-03-10 01:59:51.791	\N	\N	\N
cmmjypuk60043r4pvv6bw2xur	SOAL-00126	Manakah dari berikut ini yang merupakan contoh alamat IPv6?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "192.168.1.1", "isCorrect": false}, {"id": "B", "text": "2001:0db8:85a3:0000:0000:8a2e:0370:7334", "isCorrect": true}, {"id": "C", "text": "10.0.0.1", "isCorrect": false}, {"id": "D", "text": "172.16.254.1", "isCorrect": false}, {"id": "E", "text": "175.16.10.4", "isCorrect": false}]	B	4	2026-03-10 01:59:51.797	2026-03-10 01:59:51.797	\N	\N	\N
cmmjypukc0044r4pvo8uho1h6	SOAL-00127	IP address versi 4 terdiri dari berapa bit?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "16 bit", "isCorrect": false}, {"id": "B", "text": "32 bit", "isCorrect": true}, {"id": "C", "text": "64 bit", "isCorrect": false}, {"id": "D", "text": "128 bit", "isCorrect": false}, {"id": "E", "text": "256 bit", "isCorrect": false}]	B	4	2026-03-10 01:59:51.804	2026-03-10 01:59:51.804	\N	\N	\N
cmmjypukj0045r4pv6f21z7y9	SOAL-00128	Dalam format penulisan alamat IPv4, berapa banyak oktet yang digunakan?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "2", "isCorrect": false}, {"id": "B", "text": "4", "isCorrect": true}, {"id": "C", "text": "6", "isCorrect": false}, {"id": "D", "text": "8", "isCorrect": false}, {"id": "E", "text": "12", "isCorrect": false}]	B	4	2026-03-10 01:59:51.81	2026-03-10 01:59:51.81	\N	\N	\N
cmmjypukp0046r4pvl8y48q8s	SOAL-00129	Alamat IP 192.168.0.1 termasuk dalam kelas apa?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Kelas A", "isCorrect": false}, {"id": "B", "text": "Kelas B", "isCorrect": false}, {"id": "C", "text": "Kelas C", "isCorrect": true}, {"id": "D", "text": "Kelas D", "isCorrect": false}, {"id": "E", "text": "Kelas E", "isCorrect": false}]	C	4	2026-03-10 01:59:51.816	2026-03-10 01:59:51.816	\N	\N	\N
cmmjypukv0047r4pvdkwmbq3h	SOAL-00130	Apa keuntungan utama menggunakan kabel fiber optik dibandingkan dengan kabel tembaga?	PILIHAN_GANDA	cmj9z7q87001e5dudb1uk5u9j	[{"id": "A", "text": "Lebih murah", "isCorrect": false}, {"id": "B", "text": "Lebih mudah dipasang", "isCorrect": false}, {"id": "C", "text": "Lebih cepat dalam transmisi data", "isCorrect": true}, {"id": "D", "text": "Lebih fleksibel", "isCorrect": false}, {"id": "E", "text": "Lebih terjangkau", "isCorrect": false}]	C	4	2026-03-10 01:59:51.823	2026-03-10 01:59:51.823	\N	\N	\N
cmmlbh5ib0002rspv48yvd9nb	SOAL-00131	Alamat IP Kelas C dimulai dari 192.0.0.0 sampai 223.255.255.0. Subnet Mask default untuk Kelas C adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "255.0.0.0", "isCorrect": false}, {"id": "B", "text": "255.255.0.0", "isCorrect": false}, {"id": "C", "text": "255.255.255.0", "isCorrect": true}, {"id": "D", "text": "255.255.255.192", "isCorrect": false}, {"id": "E", "text": "255.255.255.255", "isCorrect": false}]	C	4	2026-03-11 00:44:47.267	2026-03-11 00:44:47.267	\N	\N	\N
cmmlbh5il0003rspvfgaly3c0	SOAL-00132	Bandwidth adalah kapasitas maksimum transfer data yang dapat dilakukan melalui suatu jaringan dalam satuan waktu tertentu. Satuan yang umum digunakan untuk menyatakan bandwidth adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Hertz (Hz)", "isCorrect": false}, {"id": "B", "text": "Byte per detik (Bps)", "isCorrect": false}, {"id": "C", "text": "Watt (W)", "isCorrect": false}, {"id": "D", "text": "Volt (V)", "isCorrect": false}, {"id": "E", "text": "Bit per detik (bps), seperti Kbps, Mbps, atau Gbps.", "isCorrect": true}]	E	4	2026-03-11 00:44:47.276	2026-03-11 00:44:47.276	\N	\N	\N
cmmlbh5iq0004rspvvftz9zha	SOAL-00133	Alat yang digunakan untuk mengukur kecepatan unduhan dan unggahan bandwidth, seperti Ookla Speedtest atau Fast.com, dikenal sebagai...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "B", "text": "Speed Test Tools", "isCorrect": true}, {"id": "C", "text": "Pengaturan QoS", "isCorrect": false}, {"id": "D", "text": "New Terminal", "isCorrect": false}, {"id": "E", "text": "RouterOS", "isCorrect": false}]	B	4	2026-03-11 00:44:47.282	2026-03-11 00:44:47.282	\N	\N	\N
cmmlbh5iv0005rspvaya0xw71	SOAL-00134	Protokol Layanan Jaringan yang berfungsi untuk memetakan nama domain (contoh: www.google.com) menjadi sebuah alamat IP (contoh: 142.250.191.46) agar komputer dapat saling berkomunikasi adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "FTP", "isCorrect": false}, {"id": "B", "text": "SMTP", "isCorrect": false}, {"id": "C", "text": "DHCP", "isCorrect": false}, {"id": "D", "text": "DNS", "isCorrect": true}, {"id": "E", "text": "SNMP", "isCorrect": false}]	D	4	2026-03-11 00:44:47.287	2026-03-11 00:44:47.287	\N	\N	\N
cmmlbh5j10006rspvg5rmmrpw	SOAL-00135	Dalam jaringan TCP/IP, apabila kita ingin menghubungkan dua segmen jaringan yang memiliki Network ID (subnet) yang berbeda, maka perangkat utama yang paling tepat dan wajib digunakan adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Switch", "isCorrect": false}, {"id": "B", "text": "Hub", "isCorrect": false}, {"id": "C", "text": "Access Point", "isCorrect": false}, {"id": "D", "text": "Repeater", "isCorrect": false}, {"id": "E", "text": "Router", "isCorrect": true}]	E	4	2026-03-11 00:44:47.292	2026-03-11 00:44:47.292	\N	\N	\N
cmmlbh5j60007rspv8oio1xmq	SOAL-00136	Sebelum memulai konfigurasi dasar MikroTik dari awal, langkah pertama yang disarankan ketika login menggunakan Winbox adalah memilih opsi...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "New Terminal", "isCorrect": false}, {"id": "B", "text": "System - Reboot", "isCorrect": false}, {"id": "C", "text": "Upgrade RouterOS", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Download &amp; Install", "isCorrect": false}]	D	4	2026-03-11 00:44:47.298	2026-03-11 00:44:47.298	\N	\N	\N
cmmlbh5jc0008rspvuxedoena	SOAL-00137	Subnetting adalah teknik untuk membagi jaringan IP menjadi beberapa sub-jaringan kecil agar penggunaan IP lebih efisien dan meminimalkan konflik jaringan. Subnetting membantu dalam peningkatan...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jarak pengiriman data.", "isCorrect": false}, {"id": "B", "text": "Jumlah bit yang dipinjam.", "isCorrect": false}, {"id": "C", "text": "Lease Time IP.", "isCorrect": false}, {"id": "D", "text": "Keamanan serta performa jaringan.", "isCorrect": true}, {"id": "E", "text": "Versi RouterOS.", "isCorrect": false}]	D	4	2026-03-11 00:44:47.304	2026-03-11 00:44:47.304	\N	\N	\N
cmmlbh5jh0009rspv1h03xf7q	SOAL-00138	Perangkat lunak apa yang digunakan untuk mengkonfigurasi perangkat MikroTik, dan dapat diunduh dari mikrotik.com?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "RouterOS", "isCorrect": false}, {"id": "B", "text": "New Terminal", "isCorrect": false}, {"id": "C", "text": "Speed Test Tools", "isCorrect": false}, {"id": "D", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "E", "text": "Winbox", "isCorrect": true}]	E	4	2026-03-11 00:44:47.308	2026-03-11 00:44:47.308	\N	\N	\N
cmmlbh5jl000arspvuj5qtsl1	SOAL-00139	Semakin besar bandwidth yang dimiliki oleh suatu "jalur," maka...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Latency akan selalu berkurang.", "isCorrect": false}, {"id": "B", "text": "Jumlah pengguna harus dibatasi.", "isCorrect": false}, {"id": "C", "text": "Semakin banyak data yang dapat ditransmisikan dalam waktu yang sama.", "isCorrect": true}, {"id": "D", "text": "Jarak pengiriman harus dipersingkat.", "isCorrect": false}, {"id": "E", "text": "Koneksi harus menggunakan kabel tembaga.", "isCorrect": false}]	C	4	2026-03-11 00:44:47.313	2026-03-11 00:44:47.313	\N	\N	\N
cmmlbh5jr000brspv35hxb4du	SOAL-00140	Setelah konfigurasi dasar berhasil, disarankan untuk mengganti nama interface (misalnya dari ether1 menjadi ether1-INDIHOME) dengan tujuan agar...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Mengurangi latency.", "isCorrect": false}, {"id": "B", "text": "Mempercepat koneksi ke ISP.", "isCorrect": false}, {"id": "C", "text": "Lebih mudah memonitor dan mengidentifikasi port tersebut.", "isCorrect": true}, {"id": "D", "text": "Mengaktifkan DHCP Server.", "isCorrect": false}, {"id": "E", "text": "Membatasi traffic broadcast.", "isCorrect": false}]	C	4	2026-03-11 00:44:47.318	2026-03-11 00:44:47.318	\N	\N	\N
cmmlbh5jw000crspv9e3z2mm0	SOAL-00141	Login winbox, secara default router Mikrotik memiliki default konfigurasi bawaan pabrik, tentunya untuk memudahkan user yang tidak ingin melakukan konfigurasi secara basic atau advance. Karena kita akan melakukan konfigurasi router dari 0 jadi kita akan menghapus konfigurasi bawaan router ini semua konfigurasi dasar akan dihapus dan memulainya kembali dari awal.……	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": false}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "Mac Address", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Action", "isCorrect": false}]	D	4	2026-03-11 00:44:47.324	2026-03-11 00:44:47.324	\N	\N	\N
cmmlbh5k2000drspvawxfcjsd	SOAL-00142	Pada menu ini yang berfungsi sangat banyak yang dapat kita lakukan yaitu seperti : Melakukan blok pada content atau IP melalui Filter relus, Melakukan NAT di menu NAT, Melakukan mangle yaitu melakukan penandaan pada sebuat trafik lalu diproses sesuai kebutuhan, Service port, Address List (pengelompokan IP) untuk kebutuhan yg lebih advanced, Dan Layer7 Protocol, Pernyataan diatas termasuk fungsi dari fitur-fitur network….	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System", "isCorrect": false}, {"id": "B", "text": "IP-Firewall", "isCorrect": true}, {"id": "C", "text": "IP-DHCPServer", "isCorrect": false}, {"id": "D", "text": "Files", "isCorrect": false}, {"id": "E", "text": "Log", "isCorrect": false}]	B	4	2026-03-11 00:44:47.33	2026-03-11 00:44:47.33	\N	\N	\N
cmmlbh5k8000erspvvurxp9fa	SOAL-00143	Perhatikan fitur-fitur berikut ini. Accounting Address DHCP Client DHCP Server DHCP Relay Firewall Hotspot Berdasarkan pernyataan diatas, termasuk fitur-fitur dalam menu…..	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System", "isCorrect": false}, {"id": "B", "text": "Bridge", "isCorrect": false}, {"id": "C", "text": "Interfaces", "isCorrect": false}, {"id": "D", "text": "Queues", "isCorrect": false}, {"id": "E", "text": "IPmenu", "isCorrect": true}]	E	4	2026-03-11 00:44:47.335	2026-03-11 00:44:47.335	\N	\N	\N
cmmlbh5kd000frspv4ak57h2f	SOAL-00144	Dalam menu Queues, langkah selanjutnya untuk mengatur bandwidth adalah dengan membuat:	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Simple Queue", "isCorrect": true}, {"id": "B", "text": "Address List", "isCorrect": false}, {"id": "C", "text": "Filter Rule", "isCorrect": false}, {"id": "D", "text": "NAT Rule", "isCorrect": false}, {"id": "E", "text": "Mangle Rule", "isCorrect": false}]	A	4	2026-03-11 00:44:47.341	2026-03-11 00:44:47.341	\N	\N	\N
cmmlbh5kj000grspviogspb7l	SOAL-00145	Untuk memberikan IP Address pada router melalui Winbox, kita harus membuka menu...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System → Routerboard", "isCorrect": false}, {"id": "B", "text": "IP → DHCP Client", "isCorrect": false}, {"id": "C", "text": "IP → Routes", "isCorrect": false}, {"id": "D", "text": "IP → Addresses", "isCorrect": true}, {"id": "E", "text": "IP → DNS", "isCorrect": false}]	D	4	2026-03-11 00:44:47.347	2026-03-11 00:44:47.347	\N	\N	\N
cmmlbh5kp000hrspv8a5l70ku	SOAL-00146	Apa fungsi dari menu “Bridge” di Winbox?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Menggabungkan dua IP address", "isCorrect": false}, {"id": "B", "text": "Menghubungkan beberapa interface menjadi satu jaringan", "isCorrect": true}, {"id": "C", "text": "Menyimpan konfigurasi otomatis", "isCorrect": false}, {"id": "D", "text": "Membuat rule firewall", "isCorrect": false}, {"id": "E", "text": "Mengatur DNS secara manual", "isCorrect": false}]	B	4	2026-03-11 00:44:47.353	2026-03-11 00:44:47.353	\N	\N	\N
cmmlbh5kv000irspvg0boemro	SOAL-00147	Fungsi utama dari DHCP dalam jaringan komputer adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Menerjemahkan nama domain menjadi IP", "isCorrect": false}, {"id": "B", "text": "Menyediakan keamanan jaringan", "isCorrect": false}, {"id": "C", "text": "Memberikan alamat IP secara otomatis", "isCorrect": true}, {"id": "D", "text": "Mengatur kecepatan akses internet", "isCorrect": false}, {"id": "E", "text": "Menyimpan data pengguna", "isCorrect": false}]	C	4	2026-03-11 00:44:47.358	2026-03-11 00:44:47.358	\N	\N	\N
cmmlbh5l0000jrspv27w7blcy	SOAL-00148	Apa yang terjadi jika DNS server tidak dikonfigurasi dengan benar?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jaringan akan lebih cepat", "isCorrect": false}, {"id": "B", "text": "Komputer tidak akan mendapatkan IP", "isCorrect": false}, {"id": "C", "text": "Komputer tidak dapat mengakses situs menggunakan nama domain", "isCorrect": true}, {"id": "D", "text": "Semua IP menjadi statis", "isCorrect": false}, {"id": "E", "text": "DHCP tidak akan aktif", "isCorrect": false}]	C	4	2026-03-11 00:44:47.364	2026-03-11 00:44:47.364	\N	\N	\N
cmmlbh5l5000krspvbixresw4	SOAL-00149	Untuk memverifikasi bahwa MikroTik sudah mendapatkan informasi DHCP dari ISP, kita harus memastikan pada bagian "Status" tertulis..	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Registered", "isCorrect": false}, {"id": "B", "text": "Configured", "isCorrect": false}, {"id": "C", "text": "Running", "isCorrect": false}, {"id": "D", "text": "Bound", "isCorrect": true}, {"id": "E", "text": "Active", "isCorrect": false}]	D	4	2026-03-11 00:44:47.368	2026-03-11 00:44:47.368	\N	\N	\N
cmmlbh5l9000lrspvkjpyidzr	SOAL-00150	Konfigurasi apa yang diperlukan pada MikroTik untuk merubah IP LAN client menjadi IP WAN agar client tersebut bisa mengakses internet?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Upgrade Jaringan", "isCorrect": false}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "NAT (Network Address Translation)", "isCorrect": true}, {"id": "D", "text": "QoS", "isCorrect": false}, {"id": "E", "text": "Subnetting", "isCorrect": false}]	C	4	2026-03-11 00:44:47.373	2026-03-11 00:44:47.373	\N	\N	\N
cmmlbh5le000mrspvuv3gu74i	SOAL-00151	Sebuah jaringan menggunakan IP Address 192.168.10.0/28. Berapakah jumlah host maksimal yang dapat terhubung dan digunakan dalam jaringan tersebut?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "8 host", "isCorrect": false}, {"id": "B", "text": "14 host", "isCorrect": true}, {"id": "C", "text": "16 host", "isCorrect": false}, {"id": "D", "text": "30 host", "isCorrect": false}, {"id": "E", "text": "32 host", "isCorrect": false}]	B	4	2026-03-11 00:44:47.378	2026-03-11 00:44:47.378	\N	\N	\N
cmmlbh5lj000nrspvqxiy2uuc	SOAL-00152	Layanan jaringan yang berfungsi untuk memberikan alamat IP secara otomatis kepada komputer client yang memintanya disebut...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DNS Server", "isCorrect": false}, {"id": "B", "text": "Web Server", "isCorrect": false}, {"id": "C", "text": "FTP Server", "isCorrect": false}, {"id": "D", "text": "DHCP Server", "isCorrect": true}, {"id": "E", "text": "Proxy Server", "isCorrect": false}]	D	4	2026-03-11 00:44:47.382	2026-03-11 00:44:47.382	\N	\N	\N
cmmlbh5lo000orspvtsr217bn	SOAL-00153	Jika Anda ingin mengakses halaman web yang aman, browser akan menggunakan protokol HTTPS. Port standar berapakah yang digunakan oleh HTTPS dan HTTP?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "80 dan 21", "isCorrect": false}, {"id": "B", "text": "80 dan 443", "isCorrect": false}, {"id": "C", "text": "443 dan 80", "isCorrect": true}, {"id": "D", "text": "21 dan 22", "isCorrect": false}, {"id": "E", "text": "8080 dan 80", "isCorrect": false}]	C	4	2026-03-11 00:44:47.388	2026-03-11 00:44:47.388	\N	\N	\N
cmmlbh5lt000prspvbt546zim	SOAL-00154	Untuk menghubungkan jaringan LAN (Lokal) dengan jaringan Internet menggunakan router MikroTik, kita perlu melakukan translasi IP privat menjadi IP publik. Fitur yang digunakan untuk keperluan ini adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Relay", "isCorrect": false}, {"id": "B", "text": "Web Proxy", "isCorrect": false}, {"id": "C", "text": "Firewall Mangle", "isCorrect": false}, {"id": "D", "text": "Firewall NAT (Network Address Translation)", "isCorrect": true}, {"id": "E", "text": "Hotspot Walled Garden", "isCorrect": false}]	D	4	2026-03-11 00:44:47.393	2026-03-11 00:44:47.393	\N	\N	\N
cmmlbh5ly000qrspvv7zf6klo	SOAL-00155	Fitur di MikroTik yang memungkinkan pembuatan jaringan publik di mana setiap pengguna yang ingin terhubung ke internet harus login terlebih dahulu melalui captive portal (halaman web) disebut...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "PPPoE", "isCorrect": false}, {"id": "B", "text": "VPN", "isCorrect": false}, {"id": "C", "text": "VLAN", "isCorrect": false}, {"id": "D", "text": "Hotspot", "isCorrect": true}, {"id": "E", "text": "Web Proxy", "isCorrect": false}]	D	4	2026-03-11 00:44:47.398	2026-03-11 00:44:47.398	\N	\N	\N
cmmlbmdna001grspvke8dnoz6	SOAL-00156	Alamat IP Kelas C dimulai dari 192.0.0.0 sampai 223.255.255.0. Subnet Mask default untuk Kelas C adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "255.0.0.0", "isCorrect": false}, {"id": "B", "text": "255.255.0.0", "isCorrect": false}, {"id": "C", "text": "255.255.255.0", "isCorrect": true}, {"id": "D", "text": "255.255.255.192", "isCorrect": false}, {"id": "E", "text": "255.255.255.255", "isCorrect": false}]	C	4	2026-03-11 00:48:51.094	2026-03-11 00:48:51.094	\N	\N	\N
cmmlbmdng001hrspvqz47uvtq	SOAL-00157	Bandwidth adalah kapasitas maksimum transfer data yang dapat dilakukan melalui suatu jaringan dalam satuan waktu tertentu. Satuan yang umum digunakan untuk menyatakan bandwidth adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Hertz (Hz)", "isCorrect": false}, {"id": "B", "text": "Byte per detik (Bps)", "isCorrect": false}, {"id": "C", "text": "Watt (W)", "isCorrect": false}, {"id": "D", "text": "Volt (V)", "isCorrect": false}, {"id": "E", "text": "Bit per detik (bps), seperti Kbps, Mbps, atau Gbps.", "isCorrect": true}]	E	4	2026-03-11 00:48:51.1	2026-03-11 00:48:51.1	\N	\N	\N
cmmlbmdnl001irspvkw2p8w4u	SOAL-00158	Alat yang digunakan untuk mengukur kecepatan unduhan dan unggahan bandwidth, seperti Ookla Speedtest atau Fast.com, dikenal sebagai...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "B", "text": "Speed Test Tools", "isCorrect": true}, {"id": "C", "text": "Pengaturan QoS", "isCorrect": false}, {"id": "D", "text": "New Terminal", "isCorrect": false}, {"id": "E", "text": "RouterOS", "isCorrect": false}]	B	4	2026-03-11 00:48:51.104	2026-03-11 00:48:51.104	\N	\N	\N
cmmlbmdnq001jrspvimdtyv6q	SOAL-00159	Protokol Layanan Jaringan yang berfungsi untuk memetakan nama domain (contoh: www.google.com) menjadi sebuah alamat IP (contoh: 142.250.191.46) agar komputer dapat saling berkomunikasi adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "FTP", "isCorrect": false}, {"id": "B", "text": "SMTP", "isCorrect": false}, {"id": "C", "text": "DHCP", "isCorrect": false}, {"id": "D", "text": "DNS", "isCorrect": true}, {"id": "E", "text": "SNMP", "isCorrect": false}]	D	4	2026-03-11 00:48:51.11	2026-03-11 00:48:51.11	\N	\N	\N
cmmlbmdnx001krspvat4jkn73	SOAL-00160	Dalam jaringan TCP/IP, apabila kita ingin menghubungkan dua segmen jaringan yang memiliki Network ID (subnet) yang berbeda, maka perangkat utama yang paling tepat dan wajib digunakan adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Switch", "isCorrect": false}, {"id": "B", "text": "Hub", "isCorrect": false}, {"id": "C", "text": "Access Point", "isCorrect": false}, {"id": "D", "text": "Repeater", "isCorrect": false}, {"id": "E", "text": "Router", "isCorrect": true}]	E	4	2026-03-11 00:48:51.117	2026-03-11 00:48:51.117	\N	\N	\N
cmmlbmdo3001lrspvpcqgxmnc	SOAL-00161	Sebelum memulai konfigurasi dasar MikroTik dari awal, langkah pertama yang disarankan ketika login menggunakan Winbox adalah memilih opsi...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "New Terminal", "isCorrect": false}, {"id": "B", "text": "System - Reboot", "isCorrect": false}, {"id": "C", "text": "Upgrade RouterOS", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Download &amp; Install", "isCorrect": false}]	D	4	2026-03-11 00:48:51.123	2026-03-11 00:48:51.123	\N	\N	\N
cmmlbmdo9001mrspvhc7xavxd	SOAL-00162	Subnetting adalah teknik untuk membagi jaringan IP menjadi beberapa sub-jaringan kecil agar penggunaan IP lebih efisien dan meminimalkan konflik jaringan. Subnetting membantu dalam peningkatan...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jarak pengiriman data.", "isCorrect": false}, {"id": "B", "text": "Jumlah bit yang dipinjam.", "isCorrect": false}, {"id": "C", "text": "Lease Time IP.", "isCorrect": false}, {"id": "D", "text": "Keamanan serta performa jaringan.", "isCorrect": true}, {"id": "E", "text": "Versi RouterOS.", "isCorrect": false}]	D	4	2026-03-11 00:48:51.128	2026-03-11 00:48:51.128	\N	\N	\N
cmmlbmdoe001nrspvmk1jihw6	SOAL-00163	Perangkat lunak apa yang digunakan untuk mengkonfigurasi perangkat MikroTik, dan dapat diunduh dari mikrotik.com?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "RouterOS", "isCorrect": false}, {"id": "B", "text": "New Terminal", "isCorrect": false}, {"id": "C", "text": "Speed Test Tools", "isCorrect": false}, {"id": "D", "text": "Monitor Jaringan", "isCorrect": false}, {"id": "E", "text": "Winbox", "isCorrect": true}]	E	4	2026-03-11 00:48:51.134	2026-03-11 00:48:51.134	\N	\N	\N
cmmlbmdok001orspv2e9nrf52	SOAL-00164	Semakin besar bandwidth yang dimiliki oleh suatu "jalur," maka...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Latency akan selalu berkurang.", "isCorrect": false}, {"id": "B", "text": "Jumlah pengguna harus dibatasi.", "isCorrect": false}, {"id": "C", "text": "Semakin banyak data yang dapat ditransmisikan dalam waktu yang sama.", "isCorrect": true}, {"id": "D", "text": "Jarak pengiriman harus dipersingkat.", "isCorrect": false}, {"id": "E", "text": "Koneksi harus menggunakan kabel tembaga.", "isCorrect": false}]	C	4	2026-03-11 00:48:51.139	2026-03-11 00:48:51.139	\N	\N	\N
cmmlbmdop001prspvh623cbct	SOAL-00165	Setelah konfigurasi dasar berhasil, disarankan untuk mengganti nama interface (misalnya dari ether1 menjadi ether1-INDIHOME) dengan tujuan agar...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Mengurangi latency.", "isCorrect": false}, {"id": "B", "text": "Mempercepat koneksi ke ISP.", "isCorrect": false}, {"id": "C", "text": "Lebih mudah memonitor dan mengidentifikasi port tersebut.", "isCorrect": true}, {"id": "D", "text": "Mengaktifkan DHCP Server.", "isCorrect": false}, {"id": "E", "text": "Membatasi traffic broadcast.", "isCorrect": false}]	C	4	2026-03-11 00:48:51.145	2026-03-11 00:48:51.145	\N	\N	\N
cmmlbmdov001qrspv1ruzt8ku	SOAL-00166	Login winbox, secara default router Mikrotik memiliki default konfigurasi bawaan pabrik, tentunya untuk memudahkan user yang tidak ingin melakukan konfigurasi secara basic atau advance. Karena kita akan melakukan konfigurasi router dari 0 jadi kita akan menghapus konfigurasi bawaan router ini semua konfigurasi dasar akan dihapus dan memulainya kembali dari awal.……	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Client", "isCorrect": false}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "Mac Address", "isCorrect": false}, {"id": "D", "text": "Remove Configuration", "isCorrect": true}, {"id": "E", "text": "Action", "isCorrect": false}]	D	4	2026-03-11 00:48:51.15	2026-03-11 00:48:51.15	\N	\N	\N
cmmlbmdp0001rrspvsyi714v6	SOAL-00167	Pada menu ini yang berfungsi sangat banyak yang dapat kita lakukan yaitu seperti : Melakukan blok pada content atau IP melalui Filter relus, Melakukan NAT di menu NAT, Melakukan mangle yaitu melakukan penandaan pada sebuat trafik lalu diproses sesuai kebutuhan, Service port, Address List (pengelompokan IP) untuk kebutuhan yg lebih advanced, Dan Layer7 Protocol, Pernyataan diatas termasuk fungsi dari fitur-fitur network….	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System", "isCorrect": false}, {"id": "B", "text": "IP-Firewall", "isCorrect": true}, {"id": "C", "text": "IP-DHCPServer", "isCorrect": false}, {"id": "D", "text": "Files", "isCorrect": false}, {"id": "E", "text": "Log", "isCorrect": false}]	B	4	2026-03-11 00:48:51.156	2026-03-11 00:48:51.156	\N	\N	\N
cmmlbmdp6001srspvtfac4e9q	SOAL-00168	Cara termudah dan tercepat untuk membatasi bandwidth internet bagi pengguna tunggal (misal IP 192.168.10.5) dengan limit Download 2Mbps dan Upload 1Mbps pada MikroTik adalah menggunakan fitur...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Queue Tree", "isCorrect": false}, {"id": "B", "text": "PCQ", "isCorrect": false}, {"id": "C", "text": "Mangle", "isCorrect": false}, {"id": "D", "text": "Simple Queue", "isCorrect": true}, {"id": "E", "text": "Firewall Filter", "isCorrect": false}]	D	4	2026-03-11 00:48:51.162	2026-03-11 00:48:51.162	\N	\N	\N
cmmlbmdpc001trspvmnbpzoa0	SOAL-00169	Dalam menu Queues, langkah selanjutnya untuk mengatur bandwidth adalah dengan membuat:	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Simple Queue", "isCorrect": true}, {"id": "B", "text": "Address List", "isCorrect": false}, {"id": "C", "text": "Filter Rule", "isCorrect": false}, {"id": "D", "text": "NAT Rule", "isCorrect": false}, {"id": "E", "text": "Mangle Rule", "isCorrect": false}]	A	4	2026-03-11 00:48:51.168	2026-03-11 00:48:51.168	\N	\N	\N
cmmlbmdpi001urspvnpon2orv	SOAL-00170	Untuk memberikan IP Address pada router melalui Winbox, kita harus membuka menu...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "System → Routerboard", "isCorrect": false}, {"id": "B", "text": "IP → DHCP Client", "isCorrect": false}, {"id": "C", "text": "IP → Routes", "isCorrect": false}, {"id": "D", "text": "IP → Addresses", "isCorrect": true}, {"id": "E", "text": "IP → DNS", "isCorrect": false}]	D	4	2026-03-11 00:48:51.174	2026-03-11 00:48:51.174	\N	\N	\N
cmmlbmdpp001vrspvyr0rhiaj	SOAL-00171	Apa fungsi dari menu “Bridge” di Winbox?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Menggabungkan dua IP address", "isCorrect": false}, {"id": "B", "text": "Menghubungkan beberapa interface menjadi satu jaringan", "isCorrect": true}, {"id": "C", "text": "Menyimpan konfigurasi otomatis", "isCorrect": false}, {"id": "D", "text": "Membuat rule firewall", "isCorrect": false}, {"id": "E", "text": "Mengatur DNS secara manual", "isCorrect": false}]	B	4	2026-03-11 00:48:51.181	2026-03-11 00:48:51.181	\N	\N	\N
cmmlbmdpw001wrspv4uadflm7	SOAL-00172	Fungsi utama dari DHCP dalam jaringan komputer adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Menerjemahkan nama domain menjadi IP", "isCorrect": false}, {"id": "B", "text": "Menyediakan keamanan jaringan", "isCorrect": false}, {"id": "C", "text": "Memberikan alamat IP secara otomatis", "isCorrect": true}, {"id": "D", "text": "Mengatur kecepatan akses internet", "isCorrect": false}, {"id": "E", "text": "Menyimpan data pengguna", "isCorrect": false}]	C	4	2026-03-11 00:48:51.187	2026-03-11 00:48:51.187	\N	\N	\N
cmmlbmdq2001xrspvgnn17rbi	SOAL-00173	Apa yang terjadi jika DNS server tidak dikonfigurasi dengan benar?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Jaringan akan lebih cepat", "isCorrect": false}, {"id": "B", "text": "Komputer tidak akan mendapatkan IP", "isCorrect": false}, {"id": "C", "text": "Komputer tidak dapat mengakses situs menggunakan nama domain", "isCorrect": true}, {"id": "D", "text": "Semua IP menjadi statis", "isCorrect": false}, {"id": "E", "text": "DHCP tidak akan aktif", "isCorrect": false}]	C	4	2026-03-11 00:48:51.193	2026-03-11 00:48:51.193	\N	\N	\N
cmmlbmdq8001yrspvennj241t	SOAL-00174	Untuk memverifikasi bahwa MikroTik sudah mendapatkan informasi DHCP dari ISP, kita harus memastikan pada bagian "Status" tertulis..	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Registered", "isCorrect": false}, {"id": "B", "text": "Configured", "isCorrect": false}, {"id": "C", "text": "Running", "isCorrect": false}, {"id": "D", "text": "Bound", "isCorrect": true}, {"id": "E", "text": "Active", "isCorrect": false}]	D	4	2026-03-11 00:48:51.2	2026-03-11 00:48:51.2	\N	\N	\N
cmmlbmdqg001zrspvfxvyld4k	SOAL-00175	Konfigurasi apa yang diperlukan pada MikroTik untuk merubah IP LAN client menjadi IP WAN agar client tersebut bisa mengakses internet?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "Upgrade Jaringan", "isCorrect": false}, {"id": "B", "text": "DHCP Server", "isCorrect": false}, {"id": "C", "text": "NAT (Network Address Translation)", "isCorrect": true}, {"id": "D", "text": "QoS", "isCorrect": false}, {"id": "E", "text": "Subnetting", "isCorrect": false}]	C	4	2026-03-11 00:48:51.207	2026-03-11 00:48:51.207	\N	\N	\N
cmmlbmdqm0020rspvc9x8w897	SOAL-00176	Sebuah jaringan menggunakan IP Address 192.168.10.0/28. Berapakah jumlah host maksimal yang dapat terhubung dan digunakan dalam jaringan tersebut?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "8 host", "isCorrect": false}, {"id": "B", "text": "14 host", "isCorrect": true}, {"id": "C", "text": "16 host", "isCorrect": false}, {"id": "D", "text": "30 host", "isCorrect": false}, {"id": "E", "text": "32 host", "isCorrect": false}]	B	4	2026-03-11 00:48:51.214	2026-03-11 00:48:51.214	\N	\N	\N
cmmlbmdqt0021rspvkhmn5w8v	SOAL-00177	Layanan jaringan yang berfungsi untuk memberikan alamat IP secara otomatis kepada komputer client yang memintanya disebut...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DNS Server", "isCorrect": false}, {"id": "B", "text": "Web Server", "isCorrect": false}, {"id": "C", "text": "FTP Server", "isCorrect": false}, {"id": "D", "text": "DHCP Server", "isCorrect": true}, {"id": "E", "text": "Proxy Server", "isCorrect": false}]	D	4	2026-03-11 00:48:51.221	2026-03-11 00:48:51.221	\N	\N	\N
cmmlbmdr10022rspv5pxzq7gv	SOAL-00178	Jika Anda ingin mengakses halaman web yang aman, browser akan menggunakan protokol HTTPS. Port standar berapakah yang digunakan oleh HTTPS dan HTTP?	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "80 dan 21", "isCorrect": false}, {"id": "B", "text": "80 dan 443", "isCorrect": false}, {"id": "C", "text": "443 dan 80", "isCorrect": true}, {"id": "D", "text": "21 dan 22", "isCorrect": false}, {"id": "E", "text": "8080 dan 80", "isCorrect": false}]	C	4	2026-03-11 00:48:51.228	2026-03-11 00:48:51.228	\N	\N	\N
cmmlbmdr80023rspvgzo7ww7m	SOAL-00179	Untuk menghubungkan jaringan LAN (Lokal) dengan jaringan Internet menggunakan router MikroTik, kita perlu melakukan translasi IP privat menjadi IP publik. Fitur yang digunakan untuk keperluan ini adalah...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "DHCP Relay", "isCorrect": false}, {"id": "B", "text": "Web Proxy", "isCorrect": false}, {"id": "C", "text": "Firewall Mangle", "isCorrect": false}, {"id": "D", "text": "Firewall NAT (Network Address Translation)", "isCorrect": true}, {"id": "E", "text": "Hotspot Walled Garden", "isCorrect": false}]	D	4	2026-03-11 00:48:51.235	2026-03-11 00:48:51.235	\N	\N	\N
cmmlbmdrf0024rspvns9u3zzm	SOAL-00180	Fitur di MikroTik yang memungkinkan pembuatan jaringan publik di mana setiap pengguna yang ingin terhubung ke internet harus login terlebih dahulu melalui captive portal (halaman web) disebut...	PILIHAN_GANDA	cmj9z7q9n001s5dudxr525koc	[{"id": "A", "text": "PPPoE", "isCorrect": false}, {"id": "B", "text": "VPN", "isCorrect": false}, {"id": "C", "text": "VLAN", "isCorrect": false}, {"id": "D", "text": "Hotspot", "isCorrect": true}, {"id": "E", "text": "Web Proxy", "isCorrect": false}]	D	4	2026-03-11 00:48:51.243	2026-03-11 00:48:51.243	\N	\N	\N
\.


--
-- Data for Name: ForumKategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ForumKategori" (id, nama, deskripsi, icon, warna, "mataPelajaranId", "kelasId", urutan, "isActive", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ForumPost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ForumPost" (id, "threadId", "parentId", "authorId", "authorType", konten, "isEdited", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: ForumReaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ForumReaction" (id, "postId", "userId", tipe, "createdAt") FROM stdin;
\.


--
-- Data for Name: ForumThread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ForumThread" (id, judul, "isPinned", "isLocked", "kategoriId", "authorId", "authorType", "viewCount", "replyCount", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: Guru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Guru" (id, nip, nama, email, "nomorTelepon", status, "createdAt", "updatedAt", "deletedAt", "userId") FROM stdin;
cmj9z8yox00385dudt5p2uvo1	1234567891	Ila Febti Sherly M., S.E	ilafebtisherly@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.849	2025-12-17 12:25:57.706	\N	cmj9z8you00375dudrf1e71qe
cmj9z8ybn002q5dud7n4058u9	5040758659300040	Nurmala Evayanti S.Pd.	nurmalaevayanti2006@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.371	2025-12-23 11:57:12.118	\N	cmj9z8ybk002p5dudp5man22v
cmj9z8y4a002g5dudjlq4s2jp	0000000000000066	M. Fais Jainuddin, S.Pd	faizabrahammalik@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.105	2025-12-23 11:57:31.914	\N	cmj9z8y44002f5dudfvho6nza
cmj9z8y77002k5dudwjch4365	8834765666130320	Moh. Yunus Ansori, S.Pd.	yunuskacer@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.211	2025-12-23 11:58:13.302	\N	cmj9z8y73002j5dud9ooury49
cmj9z8xtu00225dudew59ixr7	8550751654200000	Aini Abdul Cholis S.Pd.	ainiabdcholis.73@gmail.com	081234567890	AKTIF	2025-12-17 12:17:53.73	2025-12-23 11:59:18.368	\N	cmj9z8xto00215dudxiyqcr71
cmj9z8y5q002i5dudk3gr40r9	00000000000023235	Moh. Rohim, S.T.	mohrohim02@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.158	2025-12-23 12:02:46.205	\N	cmj9z8y5n002h5dud9vb23462
cmj9z8yd4002s5dudqb9lav2o	0000000000000007878	Nurul Hidayah, S.E.	nurulhidayahse485@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.423	2025-12-23 12:01:50.717	\N	cmj9z8ycz002r5duda3p9ojun
cmj9z8y8o002m5dudwnycw1jf	0000000000000006	Mulyono, S.Th.	danzia22@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.263	2025-12-23 12:05:31.217	\N	cmj9z8y8l002l5dudo8u4k81t
cmj9z8yhl002y5dudqly12oc3	8549764665110030	Syamsul Rizal, S.Pd.I.	rizalpecintaseni@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.585	2025-12-23 12:05:44.242	\N	cmj9z8yhh002x5dud9my7ci8i
cmj9z8xyc00285dudgvf5bnnv	3455763666300010	Erlin Novia Diana, S.E.	erlinnoviadiana@gmail.com	081234567890	AKTIF	2025-12-17 12:17:53.891	2025-12-23 12:06:19.489	\N	cmj9z8xy800275dudsv8ypuim
cmj9z8ykj00325dudk20mdgjx	00000000003444211	Wahyu Mirnawati, S.Ak.	wahyumirnawati30@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.691	2025-12-23 12:08:17.471	\N	cmj9z8ykf00315duda3u6niqb
cmj9z8y1b002c5dudh3e7fyuu	0000000023232323	Frances Laurence Setyo Budi, S.Pd.	franceskoyen16@gmail.com	081234567890	AKTIF	2025-12-17 12:17:53.998	2025-12-23 12:08:30.754	\N	cmj9z8y16002b5dudps21lpfm
cmj9z8ya7002o5dudm0yzma1k	5736762663300210	Nunung Indrawati, S.Pd.	nunungindrawati437@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.318	2025-12-25 11:59:15.002	\N	cmj9z8ya2002n5dudxxrmi27p
cmj9z8xzs002a5dudw0c717l2	00000000000000022222	Fera Mega Haristina, S.Tr.Kom.	feramegaharistiana@gmail.com	081234567890	AKTIF	2025-12-17 12:17:53.943	2025-12-25 12:04:08.915	\N	cmj9z8xzp00295dudiet5g8kd
cmj9z8yg3002w5dud29sel0av	00000000000000977	Siska Purwanti, S.E.	purwantisiska25@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.53	2025-12-25 12:08:06.998	\N	cmj9z8yfy002v5dudvf51yqq4
cmj9z8yj000305dudtwddc0j1	0000000000000010044	Udayani, S.Pd.	udayaniprayuda@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.635	2025-12-27 14:54:08.736	\N	cmj9z8yix002z5dudbc4lk8nv
cmj9z8yem002u5dudolwskcz4	1201212121212110	Rizky Lutfi Romadona, S.Kom.	rizkielutfi@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.477	2025-12-29 13:49:03.398	\N	cmj9z8yej002t5dudlb0wn4mh
cmj9z8ynh00365dudxaiuoy08	00000000000000076	Maulida Putri Lesmana, S.Pd.	pa717885@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.797	2025-12-29 13:51:21.808	\N	cmj9z8ynd00355dudycn1e6hi
cmj9z8yly00345dudadjrqvfh	0000000000000044	Zulfi Amaliyah, S.Kom.	zulfiamaliyah1306@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.742	2025-12-29 13:51:25.822	\N	cmj9z8ylv00335dudr8tet2na
cmj9z8y2q002e5dud69l0gx00	00000000000000004	Imtiana, S.Pd.	imtianateguh@gmail.com	081234567890	AKTIF	2025-12-17 12:17:54.049	2025-12-29 13:51:36.674	\N	cmj9z8y2n002d5dudjgj6nzx4
cmj9z8xwv00265dud0w98oh1m	00000000230011444	Dwi Wahyudi, S.T.	yudiaster1922@gmail.com	081234567890	AKTIF	2025-12-17 12:17:53.839	2025-12-29 13:51:43.272	\N	cmj9z8xws00255dudbgtsplon
cmj9z8xvg00245duda7dxbp56	3449744648300010	Dra. Subur Hindartin, S.Pd.	drasuburhindartin@gmail.com	081234567890	AKTIF	2025-12-17 12:17:53.787	2025-12-29 13:51:53.255	\N	cmj9z8xvb00235dudd4xbolii
\.


--
-- Data for Name: JadwalPelajaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JadwalPelajaran" (id, hari, "jamMulai", "jamSelesai", "kelasId", "mataPelajaranId", "guruId", "createdAt", "updatedAt") FROM stdin;
cmjr7mij60004laudb3xy6wa8	SENIN	08:16	08:54	cmj5eca0w0006jsud9bca11b3	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:44:29.01	2025-12-29 14:03:04.577
cmjr7mijc0005laudungska8r	SENIN	08:54	09:32	cmj5eca0w0006jsud9bca11b3	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:44:29.016	2025-12-29 14:03:04.585
cmjr7mijj0006laud3ja4aztt	SENIN	10:10	10:45	cmj5eca0w0006jsud9bca11b3	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:44:29.023	2025-12-29 14:03:04.593
cmjr7spee000nlaudxqbumeko	SENIN	10:45	11:20	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-29 13:49:17.846	2025-12-29 14:03:04.686
cmjr7spek000olaudaqt9nmi4	SENIN	11:20	11:55	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-29 13:49:17.852	2025-12-29 14:03:04.691
cmjr7spep000plaud2bdijgv1	SENIN	11:55	12:30	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-29 13:49:17.857	2025-12-29 14:03:04.696
cmjr7speu000qlaudl4whrwb0	SENIN	12:30	13:05	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-29 13:49:17.862	2025-12-29 14:03:04.702
cmjr89biy000rlaud6t1l7ikd	SENIN	07:38	08:16	cmj5eca130007jsudvzwt5rjx	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.018	2025-12-29 14:03:04.706
cmjr7mijq0007laud2yfc6yxo	SENIN	10:45	11:20	cmj5eca0w0006jsud9bca11b3	cmj9z7q7y001c5dudu38a65qb	cmj9z8y4a002g5dudjlq4s2jp	2025-12-29 13:44:29.03	2025-12-29 14:03:04.601
cmjr7mijv0008laudp9i3uhso	SENIN	11:20	11:55	cmj5eca0w0006jsud9bca11b3	cmj9z7q7y001c5dudu38a65qb	cmj9z8y4a002g5dudjlq4s2jp	2025-12-29 13:44:29.035	2025-12-29 14:03:04.606
cmjr7mik20009laudu1d05jlf	SENIN	11:55	12:30	cmj5eca0w0006jsud9bca11b3	cmj9z7q7y001c5dudu38a65qb	cmj9z8y4a002g5dudjlq4s2jp	2025-12-29 13:44:29.042	2025-12-29 14:03:04.612
cmjr7mik7000alaudla2f7jnr	SENIN	12:30	13:05	cmj5eca0w0006jsud9bca11b3	cmj9z7q7y001c5dudu38a65qb	cmj9z8y4a002g5dudjlq4s2jp	2025-12-29 13:44:29.047	2025-12-29 14:03:04.617
cmjr7ovsh000blaude5fhsbzy	SENIN	07:38	08:16	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q94001n5dudvyt50cow	cmj9z8yg3002w5dud29sel0av	2025-12-29 13:46:19.505	2025-12-29 14:03:04.623
cmjr7ovsm000claudg7h4ihvz	SENIN	08:16	08:54	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q94001n5dudvyt50cow	cmj9z8yg3002w5dud29sel0av	2025-12-29 13:46:19.51	2025-12-29 14:03:04.628
cmjr7ovsr000dlaudo5k5ifra	SENIN	08:54	09:32	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q94001n5dudvyt50cow	cmj9z8yg3002w5dud29sel0av	2025-12-29 13:46:19.515	2025-12-29 14:03:04.633
cmjr7ovsw000elauditk0mcm1	SENIN	10:10	10:45	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q94001n5dudvyt50cow	cmj9z8yg3002w5dud29sel0av	2025-12-29 13:46:19.52	2025-12-29 14:03:04.638
cmjr7ovt1000flaudanywb0z8	SENIN	10:45	11:20	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:46:19.525	2025-12-29 14:03:04.643
cmjr7ovt6000glaudisesfljw	SENIN	11:20	11:55	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:46:19.53	2025-12-29 14:03:04.648
cmjr7ovtc000hlaudjd7b89q9	SENIN	11:55	12:30	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:46:19.536	2025-12-29 14:03:04.654
cmjr7ovti000ilaud3v1rsx3b	SENIN	12:30	13:05	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:46:19.542	2025-12-29 14:03:04.658
cmjr7spdh000jlaudv1xaahr8	SENIN	07:38	08:16	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-29 13:49:17.813	2025-12-29 14:03:04.664
cmjr7spdr000klaudtbyedgjs	SENIN	08:16	08:54	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-29 13:49:17.823	2025-12-29 14:03:04.67
cmjr7spe3000llauds31ruxra	SENIN	08:54	09:32	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-29 13:49:17.835	2025-12-29 14:03:04.675
cmjr7spe9000mlauduq8wv1fy	SENIN	10:10	10:45	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8c001f5dudtoyt49tx	cmj9z8y8o002m5dudwnycw1jf	2025-12-29 13:49:17.841	2025-12-29 14:03:04.681
cmjr89bj4000slaudacb7hd6u	SENIN	08:16	08:54	cmj5eca130007jsudvzwt5rjx	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.024	2025-12-29 14:03:04.712
cmjr89bj9000tlaud9hdp917x	SENIN	08:54	09:32	cmj5eca130007jsudvzwt5rjx	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.029	2025-12-29 14:03:04.717
cmjr89bje000ulaudjh7fttn8	SENIN	10:10	10:45	cmj5eca130007jsudvzwt5rjx	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.034	2025-12-29 14:03:04.722
cmjr89bjk000vlaudpa7agawy	SENIN	10:45	11:20	cmj5eca130007jsudvzwt5rjx	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.04	2025-12-29 14:03:04.727
cmjr89bjp000wlaudd0lzlvj5	SENIN	11:20	11:55	cmj5eca130007jsudvzwt5rjx	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.045	2025-12-29 14:03:04.732
cmjr89bju000xlaudzcr4mwfr	SENIN	11:55	12:30	cmj5eca130007jsudvzwt5rjx	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.05	2025-12-29 14:03:04.737
cmjr89bjz000ylaudakuob2f1	SENIN	12:30	13:05	cmj5eca130007jsudvzwt5rjx	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.055	2025-12-29 14:03:04.742
cmjr89bk5000zlauddwy7fc9s	SENIN	07:38	08:16	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q7y001c5dudu38a65qb	cmj9z8yj000305dudtwddc0j1	2025-12-29 14:02:13.061	2025-12-29 14:03:04.747
cmjr89bk90010laudvoq6bult	SENIN	08:16	08:54	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q7y001c5dudu38a65qb	cmj9z8yj000305dudtwddc0j1	2025-12-29 14:02:13.065	2025-12-29 14:03:04.752
cmjr89bke0011laudxwu0jawl	SENIN	08:54	09:32	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q7y001c5dudu38a65qb	cmj9z8yj000305dudtwddc0j1	2025-12-29 14:02:13.07	2025-12-29 14:03:04.757
cmjr89bkj0012laudc1yfq525	SENIN	10:10	10:45	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-29 14:02:13.075	2025-12-29 14:03:04.763
cmjr89bko0013laud8y3kqv81	SENIN	10:45	11:20	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-29 14:02:13.08	2025-12-29 14:03:04.768
cmjr89bkt0014lauduxgnpfkn	SENIN	11:20	11:55	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-29 14:02:13.085	2025-12-29 14:03:04.773
cmjr89bl00015laudqzbp5r0v	SENIN	11:55	12:30	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8xyc00285dudgvf5bnnv	2025-12-29 14:02:13.092	2025-12-29 14:03:04.778
cmjr89bl90016laudocdafnkm	SENIN	12:30	13:05	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8xyc00285dudgvf5bnnv	2025-12-29 14:02:13.101	2025-12-29 14:03:04.783
cmjr89bli0017laudmu1rqcbq	SENIN	07:38	08:16	cmj5eca0k0004jsuddjewnal1	cmj9z7q8q001j5dudx5o1zuri	cmj9z8xvg00245duda7dxbp56	2025-12-29 14:02:13.11	2025-12-29 14:03:04.788
cmjr89blq0018laudz84us053	SENIN	08:16	08:54	cmj5eca0k0004jsuddjewnal1	cmj9z7q8q001j5dudx5o1zuri	cmj9z8xvg00245duda7dxbp56	2025-12-29 14:02:13.118	2025-12-29 14:03:04.793
cmjr89bm00019laudghsm3uuk	SENIN	08:54	09:32	cmj5eca0k0004jsuddjewnal1	cmj9z7q8m001i5dudi334c2ms	cmj9z8xyc00285dudgvf5bnnv	2025-12-29 14:02:13.128	2025-12-29 14:03:04.798
cmjr89bm9001alauda0j961f3	SENIN	10:10	10:45	cmj5eca0k0004jsuddjewnal1	cmj9z7q8m001i5dudi334c2ms	cmj9z8xyc00285dudgvf5bnnv	2025-12-29 14:02:13.137	2025-12-29 14:03:04.803
cmjr89bmh001blaudws2r6585	SENIN	10:45	11:20	cmj5eca0k0004jsuddjewnal1	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.145	2025-12-29 14:03:04.808
cmjr89bmp001claudil7qpllo	SENIN	11:20	11:55	cmj5eca0k0004jsuddjewnal1	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.153	2025-12-29 14:03:04.813
cmjr7miil0003laudjtx7100x	SENIN	07:38	08:16	cmj5eca0w0006jsud9bca11b3	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-29 13:44:28.989	2025-12-29 14:03:04.564
cmjr89bmu001dlaud3rxer16a	SENIN	11:55	12:30	cmj5eca0k0004jsuddjewnal1	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.158	2025-12-29 14:03:04.817
cmjr89bn0001elaudzifq9lqx	SENIN	12:30	13:05	cmj5eca0k0004jsuddjewnal1	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-29 14:02:13.164	2025-12-29 14:03:04.822
cmjr89bn7001flaudku54wur1	SENIN	07:38	08:16	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.171	2025-12-29 14:03:04.826
cmjr89bnc001glaud8eju6ig7	SENIN	08:16	08:54	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.176	2025-12-29 14:03:04.831
cmjr89bni001hlaudvpq6bgzm	SENIN	08:54	09:32	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-29 14:02:13.182	2025-12-29 14:03:04.836
cmjr8afig001rlaud74y27et6	SENIN	10:10	10:45	cmj5eca170008jsudb4r1h58n	cmj9z7qa8001y5dud4gjab2sw	cmj9z8xwv00265dud0w98oh1m	2025-12-29 14:03:04.84	2025-12-29 14:03:04.84
cmjr8afil001slaud9if0a1m2	SENIN	10:45	11:20	cmj5eca170008jsudb4r1h58n	cmj9z7qa8001y5dud4gjab2sw	cmj9z8xwv00265dud0w98oh1m	2025-12-29 14:03:04.845	2025-12-29 14:03:04.845
cmjr89bnr001ilaud8x9bm612	SENIN	07:38	08:16	cmj5eca050002jsudq5rc3oa3	cmj9z7q8x001l5dudh15r8ocj	cmj9z8ya7002o5dudm0yzma1k	2025-12-29 14:02:13.191	2025-12-29 14:03:04.85
cmjr89bnw001jlaudod8er5k7	SENIN	08:16	08:54	cmj5eca050002jsudq5rc3oa3	cmj9z7q8x001l5dudh15r8ocj	cmj9z8ya7002o5dudm0yzma1k	2025-12-29 14:02:13.196	2025-12-29 14:03:04.854
cmjr89bo2001klaudsbv98chc	SENIN	08:54	09:32	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-29 14:02:13.202	2025-12-29 14:03:04.859
cmjr89bo8001llauddkih58au	SENIN	10:10	10:45	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-29 14:02:13.208	2025-12-29 14:03:04.863
cmjr89boe001mlaudgtpmwgfi	SENIN	10:45	11:20	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-29 14:02:13.214	2025-12-29 14:03:04.868
cmjr89bok001nlaud64jhepnx	SENIN	11:20	11:55	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-29 14:02:13.22	2025-12-29 14:03:04.873
cmjr89bop001olaudwpzh79hp	SENIN	07:38	08:16	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8xzs002a5dudw0c717l2	2025-12-29 14:02:13.225	2025-12-29 14:03:04.877
cmjr89bow001plaud9fn9dfpi	SENIN	08:16	08:54	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8xzs002a5dudw0c717l2	2025-12-29 14:02:13.232	2025-12-29 14:03:04.882
cmjr89bp1001qlaud4wrphamt	SENIN	08:54	09:32	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8xzs002a5dudw0c717l2	2025-12-29 14:02:13.237	2025-12-29 14:03:04.886
cmjs6jarh000055ud2ejf2m47	SELASA	07:00	07:38	cmj5eca0w0006jsud9bca11b3	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-30 06:01:45.532	2025-12-30 06:01:45.532
cmjs6jg41000155ud2mggikw4	SELASA	07:38	08:16	cmj5eca0w0006jsud9bca11b3	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-30 06:01:52.464	2025-12-30 06:01:52.464
cmjs6jk22000255udja90wkk2	SELASA	08:16	08:54	cmj5eca0w0006jsud9bca11b3	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-30 06:01:57.576	2025-12-30 06:01:57.576
cmjs6jyhc000355ud6ozb8qn9	SELASA	08:54	09:32	cmj5eca0w0006jsud9bca11b3	cmj9z7q8c001f5dudtoyt49tx	cmj9z8yly00345dudadjrqvfh	2025-12-30 06:02:16.271	2025-12-30 06:02:16.271
cmjs6k3yp000455udba0tzbbi	SELASA	10:10	10:45	cmj5eca0w0006jsud9bca11b3	cmj9z7q8c001f5dudtoyt49tx	cmj9z8yly00345dudadjrqvfh	2025-12-30 06:02:23.376	2025-12-30 06:02:23.376
cmjs6kpo6000555ud75t9pf5c	SELASA	10:45	11:20	cmj5eca0w0006jsud9bca11b3	cmj9z7q98001o5dudu8zzru3q	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:02:51.509	2025-12-30 06:02:51.509
cmjs6ktts000655ud8ss1of3n	SELASA	11:20	11:55	cmj5eca0w0006jsud9bca11b3	cmj9z7q98001o5dudu8zzru3q	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:02:56.895	2025-12-30 06:02:56.895
cmjs6kxd9000755udg2jkok71	SELASA	11:55	12:30	cmj5eca0w0006jsud9bca11b3	cmj9z7q98001o5dudu8zzru3q	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:03:01.485	2025-12-30 06:03:01.485
cmjs6l2mv000855udkpcldo21	SELASA	12:30	13:05	cmj5eca0w0006jsud9bca11b3	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:03:08.308	2025-12-30 06:03:08.308
cmjs6lsfl000955udh7i36ma3	SELASA	07:00	07:38	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-30 06:03:41.744	2025-12-30 06:03:41.744
cmjs6lw7l000a55udklmjlkm3	SELASA	07:38	08:16	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-30 06:03:46.639	2025-12-30 06:03:46.639
cmjs6m1bg000b55ud958jmape	SELASA	08:16	08:54	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8v001k5dudwd0dr0f2	cmj9z8y77002k5dudwjch4365	2025-12-30 06:03:53.26	2025-12-30 06:03:53.26
cmjs6ml4k000c55ud1wxye928	SELASA	08:54	09:32	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-30 06:04:18.931	2025-12-30 06:04:18.931
cmjs6mokb000d55uda77jb741	SELASA	10:10	10:45	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-30 06:04:23.386	2025-12-30 06:04:23.386
cmjs6msa0000e55udxrvagyhh	SELASA	10:45	11:20	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-30 06:04:28.199	2025-12-30 06:04:28.199
cmjs6n26n000f55udt8s4a7hi	SELASA	11:20	11:55	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8k001h5dudkou2wtsf	cmj9z8ya7002o5dudm0yzma1k	2025-12-30 06:04:41.039	2025-12-30 06:04:41.039
cmjs6n6gn000g55uds5eloxw5	SELASA	11:55	12:30	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8h001g5dud3cnj22wr	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:04:46.582	2025-12-30 06:04:46.582
cmjs6naan000h55udswvz68dj	SELASA	12:30	13:05	cmj5ec9zf0000jsudgpxci2hf	cmj9z7q8h001g5dud3cnj22wr	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:04:51.55	2025-12-30 06:04:51.55
cmjs6nya8000i55ud0n5nr0zd	SELASA	07:00	07:38	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8h001g5dud3cnj22wr	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:05:22.639	2025-12-30 06:05:22.639
cmjs6o18f000j55ud12m3ptay	SELASA	07:38	08:16	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8h001g5dud3cnj22wr	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:05:26.461	2025-12-30 06:05:26.461
cmjs6o43e000k55udevlmmsg4	SELASA	08:16	08:54	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8h001g5dud3cnj22wr	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:05:30.169	2025-12-30 06:05:30.169
cmjs6oif5000l55ud996qsgxn	SELASA	08:54	09:32	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:05:48.736	2025-12-30 06:05:48.736
cmjs6on6f000m55ud5ypsfw6z	SELASA	10:10	10:45	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:05:54.903	2025-12-30 06:05:54.903
cmjs6or55000n55ud67mymvue	SELASA	10:45	11:20	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:06:00.041	2025-12-30 06:06:00.041
cmjs6oye5000o55ud5eg1yr31	SELASA	11:20	11:55	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:06:09.436	2025-12-30 06:06:09.436
cmjs6p2zu000p55udkhu6dpf3	SELASA	11:55	12:30	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8m001i5dudi334c2ms	cmj9z8xyc00285dudgvf5bnnv	2025-12-30 06:06:15.402	2025-12-30 06:06:15.402
cmjs6p66o000q55ud5pyvv9tt	SELASA	12:30	13:05	cmj5eca0e0003jsud1uxj50o4	cmj9z7q8m001i5dudi334c2ms	cmj9z8xyc00285dudgvf5bnnv	2025-12-30 06:06:19.536	2025-12-30 06:06:19.536
cmjs6qap3000r55ud02pwyx5z	SELASA	07:00	07:38	cmj5eca130007jsudvzwt5rjx	cmj9z7q90001m5dud5q6cvaku	cmj9z8yly00345dudadjrqvfh	2025-12-30 06:07:12.039	2025-12-30 06:07:12.039
cmjs6qdm3000s55udxpoho987	SELASA	07:38	08:16	cmj5eca130007jsudvzwt5rjx	cmj9z7q90001m5dud5q6cvaku	cmj9z8yly00345dudadjrqvfh	2025-12-30 06:07:15.818	2025-12-30 06:07:15.818
cmjs6qgps000t55udwbewqf91	SELASA	08:16	08:54	cmj5eca130007jsudvzwt5rjx	cmj9z7q90001m5dud5q6cvaku	cmj9z8yly00345dudadjrqvfh	2025-12-30 06:07:19.84	2025-12-30 06:07:19.84
cmjs6qya9000u55udwppwzo67	SELASA	08:54	09:32	cmj5eca130007jsudvzwt5rjx	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:07:42.608	2025-12-30 06:07:42.608
cmjs6r1lc000v55udunts7sad	SELASA	10:10	10:45	cmj5eca130007jsudvzwt5rjx	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:07:46.895	2025-12-30 06:07:46.895
cmjs6r4w9000w55udgak7jwh7	SELASA	10:45	11:20	cmj5eca130007jsudvzwt5rjx	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:07:51.177	2025-12-30 06:07:51.177
cmjs6rg48000x55udz7ljt2ug	SELASA	11:20	11:55	cmj5eca130007jsudvzwt5rjx	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:08:05.72	2025-12-30 06:08:05.72
cmjs6rjo3000y55udemnypz4n	SELASA	11:55	12:30	cmj5eca130007jsudvzwt5rjx	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:08:10.321	2025-12-30 06:08:10.321
cmjs6rn6n000z55ud313z0j7n	SELASA	12:30	13:05	cmj5eca130007jsudvzwt5rjx	cmj9z7q98001o5dudu8zzru3q	cmj9z8xwv00265dud0w98oh1m	2025-12-30 06:08:14.879	2025-12-30 06:08:14.879
cmjs6tt1m001055ud70xthpf6	SELASA	07:00	07:38	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q8x001l5dudh15r8ocj	cmj9z8ykj00325dudk20mdgjx	2025-12-30 06:09:55.785	2025-12-30 06:09:55.785
cmjs6txll001155udqb0bo501	SELASA	07:38	08:16	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q8x001l5dudh15r8ocj	cmj9z8ykj00325dudk20mdgjx	2025-12-30 06:10:01.688	2025-12-30 06:10:01.688
cmjs6u1i4001255ud0wyfb1kf	SELASA	08:16	08:54	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q8x001l5dudh15r8ocj	cmj9z8ykj00325dudk20mdgjx	2025-12-30 06:10:06.746	2025-12-30 06:10:06.746
cmjs6uy0w001355udtz3i4p11	SELASA	08:54	09:32	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8xyc00285dudgvf5bnnv	2025-12-30 06:10:48.895	2025-12-30 06:10:48.895
cmjs6v6vm001455udm94fgh9l	SELASA	10:10	10:45	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8xyc00285dudgvf5bnnv	2025-12-30 06:11:00.369	2025-12-30 06:11:00.369
cmjs6vcnt001555uda0ajwyex	SELASA	10:45	11:20	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-30 06:11:07.864	2025-12-30 06:11:07.864
cmjs6vhkx001655uddmm65hrf	SELASA	11:20	11:55	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-30 06:11:14.239	2025-12-30 06:11:14.239
cmjs6vlmb001755udkc2ajxny	SELASA	11:55	12:30	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-30 06:11:19.475	2025-12-30 06:11:19.475
cmjs6vpgg001855ud0g2hz55w	SELASA	12:30	13:05	cmj5ec9zx0001jsud5cnf1k74	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-30 06:11:24.446	2025-12-30 06:11:24.446
cmjs6w9ox001955udh6ywaowz	SELASA	07:00	07:38	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:11:50.673	2025-12-30 06:11:50.673
cmjs6wd0z001a55udxrs9lyg0	SELASA	07:38	08:16	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:11:54.994	2025-12-30 06:11:54.994
cmjs6wgcc001b55udvi3q70z9	SELASA	08:16	08:54	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2025-12-30 06:11:59.291	2025-12-30 06:11:59.291
cmjs6wpuh001c55udx2sy9s6q	SELASA	08:54	09:32	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8y8o002m5dudwnycw1jf	2025-12-30 06:12:11.608	2025-12-30 06:12:11.608
cmjs6wtpy001d55ude1zk2ume	SELASA	10:10	10:45	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8y8o002m5dudwnycw1jf	2025-12-30 06:12:16.628	2025-12-30 06:12:16.628
cmjs6wxhs001e55udhhascbpc	SELASA	10:45	11:20	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8y8o002m5dudwnycw1jf	2025-12-30 06:12:21.52	2025-12-30 06:12:21.52
cmjs6x1x5001f55uds3tfrguj	SELASA	11:20	11:55	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8y8o002m5dudwnycw1jf	2025-12-30 06:12:27.256	2025-12-30 06:12:27.256
cmjs6x6m2001g55udti5f4y1x	SELASA	11:55	12:30	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8y8o002m5dudwnycw1jf	2025-12-30 06:12:33.338	2025-12-30 06:12:33.338
cmjs6xa6o001h55ud0tl3u60n	SELASA	12:30	13:05	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8y8o002m5dudwnycw1jf	2025-12-30 06:12:37.967	2025-12-30 06:12:37.967
cmjs6xqww001i55ud3gbhvhpg	SELASA	07:00	07:38	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:12:59.648	2025-12-30 06:12:59.648
cmjs6xu49001j55udz35rascc	SELASA	07:38	08:16	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:13:03.8	2025-12-30 06:13:03.8
cmjs6xx02001k55udfi59yihs	SELASA	08:16	08:54	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:13:07.537	2025-12-30 06:13:07.537
cmjs6xzw0001l55ud2crz6tkx	SELASA	08:54	09:32	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:13:11.279	2025-12-30 06:13:11.279
cmjs6y7a9001m55udg31hu9rb	SELASA	10:10	10:45	cmj5eca170008jsudb4r1h58n	cmj9z7q9f001q5dud3giiabft	cmj9z8y5q002i5dudk3gr40r9	2025-12-30 06:13:20.864	2025-12-30 06:13:20.864
cmjs6yiu8001n55udvn1hbo3b	SELASA	07:00	07:38	cmj5eca050002jsudq5rc3oa3	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-30 06:13:35.839	2025-12-30 06:13:35.839
cmjs6ytkd001o55udexvh859k	SELASA	07:38	08:16	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yd4002s5dudqb9lav2o	2025-12-30 06:13:49.74	2025-12-30 06:13:49.74
cmjs6z3nk001p55udjrp345vj	SELASA	08:16	08:54	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yox00385dudt5p2uvo1	2025-12-30 06:14:02.815	2025-12-30 06:14:02.815
cmjs6z7p6001q55ud9450akfe	SELASA	08:54	09:32	cmj5eca050002jsudq5rc3oa3	cmj9z7q9i001r5dudnscpl8q0	cmj9z8yox00385dudt5p2uvo1	2025-12-30 06:14:08.057	2025-12-30 06:14:08.057
cmjs6zogc001r55ud47wl7nfd	SELASA	07:00	07:38	cmj5eca0o0005jsud0ambwla7	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-30 06:14:29.771	2025-12-30 06:14:29.771
cmjs6zsc2001s55udq9yovq9y	SELASA	07:38	08:16	cmj5eca0o0005jsud0ambwla7	cmj9z7q8k001h5dudkou2wtsf	cmj9z8xtu00225dudew59ixr7	2025-12-30 06:14:34.801	2025-12-30 06:14:34.801
cmjs702ox001t55udsvwlm47x	SELASA	08:16	08:54	cmj5eca0o0005jsud0ambwla7	cmj9z7qa5001x5dudniu477gy	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:14:48.225	2025-12-30 06:14:48.225
cmjs705sg001u55udp9tajcrt	SELASA	08:54	09:32	cmj5eca0o0005jsud0ambwla7	cmj9z7qa5001x5dudniu477gy	cmj9z8y2q002e5dud69l0gx00	2025-12-30 06:14:52.239	2025-12-30 06:14:52.239
cmjs70a76001v55udtp739a5y	SELASA	10:10	10:45	cmj5eca0o0005jsud0ambwla7	cmj9z7q84001d5dud60yqektg	cmj9z8ybn002q5dud7n4058u9	2025-12-30 06:14:57.951	2025-12-30 06:14:57.951
cmkop3eio0000tfpvy4yk1hn2	KAMIS	07:00	07:38	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:09:54.238	2026-01-22 00:09:54.238
cmkop3l950001tfpvvkywkzb0	KAMIS	07:38	08:16	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:10:02.966	2026-01-22 00:10:02.966
cmkop3qur0002tfpvmgif7jua	KAMIS	08:16	08:54	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:10:10.226	2026-01-22 00:10:10.226
cmkop3xfw0003tfpvzjcapcg4	KAMIS	08:54	09:32	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:10:18.763	2026-01-22 00:10:18.763
cmkop4eg20004tfpvwhj9aqjh	SABTU	07:00	07:38	cmj5eca0o0005jsud0ambwla7	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:10:40.8	2026-01-22 00:10:40.8
cmkop4q6h0005tfpvtjdljtyh	SABTU	10:10	10:45	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:10:56.007	2026-01-22 00:10:56.007
cmkop4x9b0006tfpvlp9cu7k8	SABTU	10:45	11:20	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:11:05.181	2026-01-22 00:11:05.181
cmkop52jz0007tfpvyjcdkqtj	SABTU	11:20	11:55	cmj5eca0k0004jsuddjewnal1	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	2026-01-22 00:11:12.045	2026-01-22 00:11:12.045
cmmcwggkh001ur0pv6mt0ngwl	KAMIS	10:45	11:20	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2026-03-05 03:22:11.296	2026-03-05 03:22:11.296
cmmcwgmau001vr0pvwfn0rnnk	KAMIS	11:20	11:55	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2026-03-05 03:22:18.725	2026-03-05 03:22:18.725
cmmcwgt0l001wr0pvizu4b4gs	KAMIS	11:55	12:30	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2026-03-05 03:22:27.428	2026-03-05 03:22:27.428
cmmcwgy1r001xr0pvpaoplbgd	KAMIS	12:30	13:05	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2026-03-05 03:22:33.95	2026-03-05 03:22:33.95
cmmo9vvdl001ahgpvmjjxy9oq	JUMAT	09:05	09:35	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2026-03-13 02:23:33.273	2026-03-13 02:23:33.273
cmmo9w1za001bhgpvt7yv84ey	JUMAT	09:35	10:05	cmj5eca0e0003jsud1uxj50o4	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	2026-03-13 02:23:41.829	2026-03-13 02:23:41.829
\.


--
-- Data for Name: JenisUjian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JenisUjian" (id, nama, kode, deskripsi, aktif, urutan, "createdAt", "updatedAt", "deletedAt") FROM stdin;
cmkvui8hs000s9tpvjb2watz3	Ulangan	UL		t	0	2026-01-27 00:15:47.584	2026-01-27 00:15:47.584	\N
cmkvuig8b000t9tpvnr3t0896	SAS	SAS		t	1	2026-01-27 00:15:57.611	2026-01-27 00:15:57.611	\N
cmkvuikww000u9tpvx5kkeme5	STS	STS		t	2	2026-01-27 00:16:03.68	2026-01-27 00:16:03.68	\N
\.


--
-- Data for Name: JurnalMengajar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JurnalMengajar" (id, "absensiKelasId", "materiPembelajaran", "kegiatanPembelajaran", catatan, "createdAt", "updatedAt") FROM stdin;
cmkknts4l000z8xpv9na2b6rr	cmkknts3y000l8xpvs2jzr3os	Profesi dan Kewirausahaan di bidang TJKT	Profesi dan Kewirausahaan di bidang TJKT		2026-01-19 04:23:20.997	2026-01-19 04:23:20.997
cmkm0m3ny0008vkpvbjev27am	cmkm0m3nf0000vkpvs2ie9t6q	Management Bandwidth 	Materi dan tugas		2026-01-20 03:09:03.886	2026-01-20 03:09:03.886
cmkvvx49h001p9tpv3ef0j0kw	cmkvvx48b001h9tpvzmrpgtn4	Qos (Quality Of Service)	Ulangan 		2026-01-27 00:55:21.557	2026-01-27 00:55:21.557
cmkz0n4ep000exypv4mvx4qzw	cmkz0n4di0000xypvlnj539ad	Latihan UKK	Latihan UKK		2026-01-29 05:30:51.793	2026-01-29 05:30:51.793
cml1r63ct000eqzpv9sqfbqpz	cml1r63by0000qzpvez87rajo	UKK	UKK		2026-01-31 03:28:59.261	2026-01-31 03:28:59.261
cml1r8tnd000nqzpv9t6gthpb	cml1r8tmy000fqzpvtw5cqrhn	Ulangan Praktik Mikrotik 	Ulangan Praktik Mikrotik . Konfigurasi dasar, management Bandwidth, firewall dasar		2026-01-31 03:31:06.649	2026-01-31 03:31:06.649
cml5vm4h1000aqvpv0qza33zv	cml5vm4gm0002qvpvccl8kyl6	Panduan Merakit PC	Praktik Rakit PC 		2026-02-03 00:44:30.373	2026-02-03 00:44:30.373
cmlbskyhu000eqkpv78u8ppm0	cmlbskyh00000qkpvd07gnrsn	Persiapan UKK	Praktik UKK Mikrotik		2026-02-07 04:06:14.178	2026-02-07 04:06:14.178
cmlbslldb000nqkpvsddho2yg	cmlbsllcv000fqkpv1ghfd2qa	File Sharing	Praktik file sharing 2 komputer		2026-02-07 04:06:43.823	2026-02-07 04:06:43.823
cmlfvngzi000jrapv70ftzcfu	cmlfvngyv000brapvt2zop64f	Ulangan 	Ulangan		2026-02-10 00:43:15.006	2026-02-10 00:43:15.006
cmlg2vnnt002drapvkdwfgzgc	cmlg2vnmp001yrapv0g0exppc	TCP IP	TCP IP	TCP IP	2026-02-10 04:05:34.217	2026-02-10 04:05:34.217
cmm9womrk0008r6pvuqo93205	cmm9womr10000r6pvucxvb9qt	QoS	Praktik QoS dan Firewall		2026-03-03 01:05:14.048	2026-03-03 01:05:14.048
cmmcrhm48000er0pvrynz021i	cmmcrhm3c0000r0pv1udwb7uf	Firewall	Materi dan tugas Firewall		2026-03-05 01:03:07.064	2026-03-05 01:03:07.064
cmmcrjl44000nr0pv5rgge8rc	cmmcrjl3p000fr0pvtbu34ajd	Firewall	Tugas Praktik Firewall		2026-03-05 01:04:39.076	2026-03-05 01:04:39.076
cmmcwk0aw002dr0pv20rw0aze	cmmcwk0aa001yr0pvln5u5euu	Layanan Jaringan	Layanan Jaringan		2026-03-05 03:24:56.84	2026-03-05 03:24:56.84
cmmfqpvmh000uqrpv6o7258i2	cmmfqpvm1000mqrpvd3yydlbz	Firewall	Firewall		2026-03-07 03:04:51.545	2026-03-07 03:04:51.545
cmmmu06zo0017qrpvjqk0hgd6	cmmmu06xv000tqrpvvo6pirm5	STS GENAP	STS GENAP		2026-03-12 02:11:14.916	2026-03-12 02:11:14.916
cmmo9x3ad001rhgpvkl8b9tks	cmmo9x392001chgpvfkr97d45	dsd	sdsd		2026-03-13 02:24:30.181	2026-03-13 02:27:30.117
cmmoa6mv3002fhgpvqk7jnfzo	cmmoa6mur0027hgpvbct0r0ri	STS	STS		2026-03-13 02:31:55.455	2026-03-13 02:31:55.455
\.


--
-- Data for Name: Jurusan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Jurusan" (id, kode, nama, deskripsi, "createdAt", "updatedAt", "deletedAt") FROM stdin;
cmj5cz42g00034iudqf3vd4tn	AK	Akuntansi	\N	2025-12-14 06:43:19	2025-12-14 06:43:19	\N
cmj5czfhl00044iudsyvwnrok	TKJ	Teknik Komputer dan Jaringan	\N	2025-12-14 06:43:33.801	2025-12-14 06:43:33.801	\N
cmj5czn6h00054iuds6wh2zr0	TKR	Teknik Kendaraan Ringan	\N	2025-12-14 06:43:43.768	2025-12-14 06:43:43.768	\N
\.


--
-- Data for Name: Kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kelas" (id, nama, tingkat, kapasitas, "createdAt", "updatedAt", "deletedAt", "waliKelasId", "jurusanId") FROM stdin;
cmj5eca170008jsudb4r1h58n	XII Teknik Kendaraan Ringan	XII	30	2025-12-14 07:21:32.875	2025-12-30 15:29:46.063	\N	cmj9z8y1b002c5dudh3e7fyuu	cmj5czn6h00054iuds6wh2zr0
cmj5eca130007jsudvzwt5rjx	XI Teknik Kendaraan Ringan	XI	30	2025-12-14 07:21:32.871	2025-12-30 15:31:25.529	\N	cmj9z8ybn002q5dud7n4058u9	cmj5czn6h00054iuds6wh2zr0
cmj5eca0w0006jsud9bca11b3	X Teknik Kendaraan Ringan	X	30	2025-12-14 07:21:32.864	2025-12-30 15:31:31.482	\N	cmj9z8ya7002o5dudm0yzma1k	cmj5czn6h00054iuds6wh2zr0
cmj5eca0o0005jsud0ambwla7	XII Teknik Komputer dan Jaringan	XII	30	2025-12-14 07:21:32.856	2025-12-30 15:31:39.152	\N	cmj9z8yj000305dudtwddc0j1	cmj5czfhl00044iudsyvwnrok
cmj5eca0k0004jsuddjewnal1	XI Teknik Komputer dan Jaringan	XI	30	2025-12-14 07:21:32.852	2025-12-30 15:31:50.978	\N	cmj9z8xzs002a5dudw0c717l2	cmj5czfhl00044iudsyvwnrok
cmj5eca0e0003jsud1uxj50o4	X Teknik Komputer dan Jaringan	X	30	2025-12-14 07:21:32.846	2025-12-30 15:31:58.01	\N	cmj9z8yly00345dudadjrqvfh	cmj5czfhl00044iudsyvwnrok
cmj5eca050002jsudq5rc3oa3	XII Akuntansi	XII	30	2025-12-14 07:21:32.837	2025-12-30 15:32:08.21	\N	cmj9z8y2q002e5dud69l0gx00	cmj5cz42g00034iudqf3vd4tn
cmj5ec9zx0001jsud5cnf1k74	XI Akuntansi	XI	30	2025-12-14 07:21:32.829	2025-12-30 15:32:21.516	\N	cmj9z8y8o002m5dudwnycw1jf	cmj5cz42g00034iudqf3vd4tn
cmj5ec9zf0000jsudgpxci2hf	X Akuntansi	X	30	2025-12-14 07:21:32.811	2025-12-30 15:32:29.025	\N	cmj9z8y4a002g5dudjlq4s2jp	cmj5cz42g00034iudqf3vd4tn
\.


--
-- Data for Name: MataPelajaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MataPelajaran" (id, kode, nama, "jamPelajaran", deskripsi, tingkat, "createdAt", "updatedAt", "deletedAt") FROM stdin;
cmj9z7q7y001c5dudu38a65qb	MTK	Matematika	4		SEMUA	2025-12-17 12:16:57.214	2025-12-17 12:16:57.214	\N
cmj9z7q84001d5dud60yqektg	BIND	Bahasa Indonesia	4		SEMUA	2025-12-17 12:16:57.22	2025-12-17 12:16:57.22	\N
cmj9z7q87001e5dudb1uk5u9j	DPK TKJ	Dasar Program Keahlian TKJ	4		SEMUA	2025-12-17 12:16:57.223	2025-12-17 12:16:57.223	\N
cmj9z7q8c001f5dudtoyt49tx	Informatika	Informatika	4		SEMUA	2025-12-17 12:16:57.228	2025-12-17 12:16:57.228	\N
cmj9z7q8h001g5dud3cnj22wr	IPAS	IPAS	4		SEMUA	2025-12-17 12:16:57.233	2025-12-17 12:16:57.233	\N
cmj9z7q8k001h5dudkou2wtsf	Bahasa Inggris	Bahasa Inggris	4		SEMUA	2025-12-17 12:16:57.236	2025-12-17 12:16:57.236	\N
cmj9z7q8m001i5dudi334c2ms	Sejarah Indonesia	Sejarah Indonesia	4		SEMUA	2025-12-17 12:16:57.238	2025-12-17 12:16:57.238	\N
cmj9z7q8q001j5dudx5o1zuri	PPKN	Pendidikan Pancasila dan Kewarganegaraan	4		SEMUA	2025-12-17 12:16:57.242	2025-12-17 12:16:57.242	\N
cmj9z7q8v001k5dudwd0dr0f2	PJOK	PJOK	4		SEMUA	2025-12-17 12:16:57.247	2025-12-17 12:16:57.247	\N
cmj9z7q8x001l5dudh15r8ocj	PKKWU AK	PKKWU AK	4		SEMUA	2025-12-17 12:16:57.249	2025-12-17 12:16:57.249	\N
cmj9z7q90001m5dud5q6cvaku	PAI	PAI	4		SEMUA	2025-12-17 12:16:57.252	2025-12-17 12:16:57.252	\N
cmj9z7q94001n5dudvyt50cow	DPK AK	Dasar Program Keahlian AK	4		SEMUA	2025-12-17 12:16:57.256	2025-12-17 12:16:57.256	\N
cmj9z7q98001o5dudu8zzru3q	DPK TKR	Dasar Program Keahlian TKR	4		SEMUA	2025-12-17 12:16:57.26	2025-12-17 12:16:57.26	\N
cmj9z7q9c001p5dudhh2cp17a	Bahasa Daerah	Bahasa Daerah	4		SEMUA	2025-12-17 12:16:57.264	2025-12-17 12:16:57.264	\N
cmj9z7q9f001q5dud3giiabft	KK TKR	Konsentrasi Keahlian TKR	4		SEMUA	2025-12-17 12:16:57.267	2025-12-17 12:16:57.267	\N
cmj9z7q9i001r5dudnscpl8q0	KK AK	Konsentrasi Keahlian AK	4		SEMUA	2025-12-17 12:16:57.27	2025-12-17 12:16:57.27	\N
cmj9z7q9n001s5dudxr525koc	KK TKJ	Konsentrasi Keahlian TKJ	4		SEMUA	2025-12-17 12:16:57.275	2025-12-17 12:16:57.275	\N
cmj9z7q9q001t5dudysev7yd8	PAK	PAK	4		SEMUA	2025-12-17 12:16:57.278	2025-12-17 12:16:57.278	\N
cmj9z7q9s001u5dudswlkj5ya	Mapel Pilihan AK	Mapel Pilihan AK	4		SEMUA	2025-12-17 12:16:57.28	2025-12-17 12:16:57.28	\N
cmj9z7q9v001v5dud8r2heab2	Mapel Pilihan TKJ	Mapel Pilihan TKJ	4		SEMUA	2025-12-17 12:16:57.283	2025-12-17 12:16:57.283	\N
cmj9z7qa0001w5dudmau1sngf	Mapel Pilihan TKR	Mapel Pilihan TKR	4		SEMUA	2025-12-17 12:16:57.288	2025-12-17 12:16:57.288	\N
cmj9z7qa5001x5dudniu477gy	PKKWU TKJ	PKKWU TKJ	4		SEMUA	2025-12-17 12:16:57.293	2025-12-17 12:16:57.293	\N
cmj9z7qa8001y5dud4gjab2sw	PKKWU TKR	PKKWU TKR	4		SEMUA	2025-12-17 12:16:57.296	2025-12-17 12:16:57.296	\N
cmj9z7qaa001z5dudjfz3mlu8	Pramuka	Pramuka	4		SEMUA	2025-12-17 12:16:57.298	2025-12-17 12:16:57.298	\N
cmj9z7qae00205dudqey9zf1h	Seni Budaya	Seni Budaya	4		SEMUA	2025-12-17 12:16:57.302	2025-12-17 12:16:57.302	\N
cmjof810t000005udgq7bzpjh	BK	Bimbingan Konseling	5	\N	SEMUA	2025-12-27 14:53:51.533	2025-12-27 14:53:51.533	\N
\.


--
-- Data for Name: Materi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Materi" (id, judul, deskripsi, tipe, konten, "mataPelajaranId", "guruId", "kelasId", "isPinned", "isPublished", "viewCount", "createdAt", "updatedAt", "deletedAt", "originalFileName") FROM stdin;
cmkkjpa6600008xpvymlkc9pe	Tes		DOKUMEN	file://1768789672145-8907779f4be41f599cb7d549aa10a21a1.pdf	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	f	t	1	2026-01-19 02:27:52.634	2026-01-19 03:39:57.095	2026-01-19 03:39:57.093	JADWAL PETUGAS DAN PEMBINA UPACARA BENDERA SEMESTER GENAP1 (1).pdf
cmkxln46e0000qlpvndgmr8rh	Tes		DOKUMEN	file://1769578947305-5de97e689e987e4787af2fa798afafb10.pdf	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	f	t	0	2026-01-28 05:43:11.076	2026-01-28 05:43:15.122	2026-01-28 05:43:15.119	Kelompok 2_20260127_085859_0000.pdf
cml1s57r7000oqzpv2cby0ddh	Web Proxy		DOKUMEN	file://1769831776932-3d0610b319939110627e69218e807bafd7.pdf	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	f	t	0	2026-01-31 03:56:17.921	2026-01-31 03:56:17.921	\N	Web Filtering Mikrotik.pdf
cml1s5sjt000pqzpvpcejb5vj	Blokir Website 		DOKUMEN	file://1769831804616-c25c398db3c725b8865967610dee8bf52.pdf	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	f	t	0	2026-01-31 03:56:44.871	2026-01-31 03:56:44.871	\N	Blokir Website.pdf
cml5ufk9n0000qvpvf3sn3k8m	Panduan Merakit PC		DOKUMEN	file://1770077461437-c1dee68bb85163f977dfa7becc10affc6.pdf	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	f	t	0	2026-02-03 00:11:24.632	2026-02-03 00:11:24.632	\N	Merakit_PC_Panduan_Lengkap.pdf
cml5ugisz0001qvpvetoc697a	Panduan Merakit PC		DOKUMEN	file://1770077516147-b821a78a616a76c855911175fbd947e2.pdf	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	f	t	1	2026-02-03 00:12:09.394	2026-02-03 03:00:34.708	\N	Merakit_PC_Panduan_Lengkap.pdf
cmlfvazfi0000rapvjuk29xk5	Materi Dasar TJKT	Materi Dasar TJKT	DOKUMEN	file://1770683606392-f47193ffc85becf212811db25af5e024.pdf	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	f	t	0	2026-02-10 00:33:32.381	2026-02-10 00:33:32.381	\N	Buku Murid Dasar-dasar Teknik Jaringan Komputer dan Telekomunikasi - Dasar-Dasar Teknik Jaringan Komputer dan Telekomunikasi untuk SMK_MAK Kelas X - Fase E - E4mELBMJGa.pdf
cmlfvcbdb0001rapvec8matp6	Dasar-Dasar Teknik Jaringan Komputer dan Telekomunikasi	Dasar-Dasar Teknik Jaringan Komputer dan Telekomunikasi	DOKUMEN	file://1770683667461-aad10664d7a84a79bcde3eee9ab156ade.pdf	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	f	t	1	2026-02-10 00:34:34.511	2026-02-10 02:02:04.76	\N	Buku Murid Dasar-dasar Teknik Jaringan Komputer dan Telekomunikasi - Dasar-Dasar Teknik Jaringan Komputer dan Telekomunikasi untuk SMK_MAK Kelas X - Fase E - E4mELBMJGa.pdf
cmlg3fp4d002erapv38eymud2	Praktik Simulasi TCP IP	Cisco Packet Tracer	LINK	https://drive.google.com/file/d/143sjgEBvGC3RbXd8sMjkKNBtFiUZVhdS/view?usp=sharing	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	f	t	3	2026-02-10 04:21:09.229	2026-03-05 01:05:33.266	\N	\N
\.


--
-- Data for Name: MateriAttachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MateriAttachment" (id, "materiId", "namaFile", "ukuranFile", "tipeFile", "urlFile", "createdAt") FROM stdin;
\.


--
-- Data for Name: MateriBookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MateriBookmark" (id, "materiId", "siswaId", "createdAt") FROM stdin;
\.


--
-- Data for Name: Notifikasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notifikasi" (id, "userId", tipe, judul, pesan, "linkUrl", "isRead", "readAt", metadata, "createdAt") FROM stdin;
cmkknmae800058xpvxulgecxk	cmj5gwztr001f35udgp2iqne6	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.424
cmkknmaed00068xpvlw9s2e3w	cmj5gx0o3002j35uda0ok0i4j	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.429
cmkknmaei00078xpvwhxj69kf	cmj5gx17k003935udaewx76ro	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.434
cmkknmaew000a8xpv8ubhv7qx	cmj5gx264004j35ud8hnkcdnj	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.448
cmkknmaf1000b8xpvlhnru5ej	cmj5gx2i0004z35udecgz1nlq	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.453
cmkknmaf5000c8xpvi15czzqe	cmj5gx2ny005735udgqgfno56	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.457
cmkknmaf8000d8xpv8vpxgem0	cmj5gx2qz005b35ud4370ott0	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.46
cmkknmafh000f8xpv37mecofy	cmj5gx0c0002335udrmwctcnm	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.469
cmkknmafk000g8xpvx47v3ris	cmj5gx1o2003v35udzn7dj9ls	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	f	\N	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.472
cmkknmafd000e8xpv0lpqkr6j	cmj5gwyx9000935ud28f9ggyr	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	t	2026-01-20 01:11:41.852	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.465
cmkm0n1mq0009vkpvd4jrwa9d	cmj5gx17k003935udaewx76ro	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 90/100	/tugas	f	\N	{"score": 90, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:09:47.906
cmkm0n8ki000avkpvk1tc8cuv	cmj5gwyx9000935ud28f9ggyr	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 90/100	/tugas	f	\N	{"score": 90, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:09:56.898
cmkm0nfd7000bvkpvge0g9s1l	cmj5gx21o004d35udxjptvn08	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 90/100	/tugas	f	\N	{"score": 90, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:10:05.707
cmkm0nlx6000cvkpvzit1y5lh	cmj5gx0c0002335udrmwctcnm	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 90/100	/tugas	f	\N	{"score": 90, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:10:14.202
cmkknmaer00098xpvj08lblkc	cmj5gx21o004d35udxjptvn08	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	t	2026-03-10 02:11:06.763	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.443
cmkknmae100048xpvqy45tyjy	cmj5gwzeh000v35udwd1xnzk8	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 20/1/2026	/tugas	t	2026-03-12 00:50:55.689	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:17:31.417
cmkm0nuva000dvkpvrybag3gm	cmj5gx264004j35ud8hnkcdnj	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 90/100	/tugas	f	\N	{"score": 90, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:10:25.798
cmkm0o0mp000evkpvyr7y1u7r	cmj5gx1o2003v35udzn7dj9ls	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:10:33.265
cmkm0o7p5000fvkpvr8j77fj0	cmj5gx21o004d35udxjptvn08	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:10:42.425
cmkm0oich000gvkpvtef3hvdj	cmj5gx2i0004z35udecgz1nlq	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:10:56.225
cmkm0ow6w000ivkpv31ipwoco	cmj5gwztr001f35udgp2iqne6	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:11:14.168
cmkm0p11y000jvkpvk0135b1d	cmj5gx2qz005b35ud4370ott0	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:11:20.47
cmkm0pdlf000lvkpvaezcd5w1	cmj5gx0o3002j35uda0ok0i4j	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:11:36.723
cmkknsxgv000i8xpvzb4wyulq	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	ALFAZA OKTAVINO PRADITIA telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:22:41.263
cmkko4cwy00118xpvae17ft9h	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	RAZKY GABRIL WAHYUDI telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:31:34.498
cmkko7v5100158xpv765zbuz4	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	BADRIA NUR ANISA telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:34:18.085
cmkko8cmk00188xpv80s27xry	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	SUPRIYADI telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:34:40.748
cmkkoas35001b8xpviaz2g8qz	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	MUHAMAD RISKI NEO VALENTINO telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:36:34.097
cmkkob5co001e8xpvucjkrf4e	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	FERDIO PUTRA PRASETYA telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:36:51.288
cmkkod3um001i8xpvewdkoeqx	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	M. YUSRON GINANDA telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:38:22.654
cmkkohjfu001l8xpvp0ce2sdx	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	NAUFAL DZAKI HANIF ABIYYI telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:41:49.482
cmkkoj975001p8xpvwgo3z4ee	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	DWI AYU MEI JAYANTI telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:43:09.521
cmkkoxcgj001t8xpv0maqln1c	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	MUHAMMAD RIZKI telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:54:06.931
cmkkoxucy001x8xpvyhttrmnh	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	ADITYA DAMARA PUTRA KRISTIAWAN telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:50.568	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 04:54:30.13
cmkkphm2b00218xpvbgx6pybc	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	KETUT DIMAS MUHAMAD RISAL telah mengumpulkan tugas "Profesi dan Kewirausahaan di bidang TJKT"	/tugas-management	t	2026-01-20 03:12:53.874	{"tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-19 05:09:52.499
cmkm3k508000qvkpvglq472vu	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	MUHAMAD RISKI NEO VALENTINO telah mengumpulkan tugas "Tugas Projek Kelompok Profesi dan Kewirausahaan "	/tugas-management	t	2026-01-26 00:02:11.567	{"tugasId": "cmkm1rzac000ovkpvsbbby549"}	2026-01-20 04:31:31.16
cml5zy1jc000bqvpvsnn4neml	cmj5gx206004b35uduf215trn	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas Projek Kelompok Profesi dan Kewirausahaan " telah dinilai. Nilai Anda: 90/100	/tugas	f	\N	{"score": 90, "tugasId": "cmkm1rzac000ovkpvsbbby549"}	2026-02-03 02:45:44.904
cmlfvijr40004rapv5b934ztj	cmj5gx0ml002h35udvjc8yzeb	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.311
cmlfvijr70005rapvoe7hw2ax	cmj5gx0r4002n35ud6i7qxccl	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.315
cmlfvijr00003rapvuykxs1bh	cmj5gx08y001z35udsqo698l8	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	t	2026-02-10 00:54:21.74	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.308
cmkm0oo3h000hvkpv6qcvl0bo	cmj5gwzeh000v35udwd1xnzk8	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Profesi dan Kewirausahaan di bidang TJKT" telah dinilai. Nilai Anda: 85/100	/tugas	t	2026-03-12 00:50:53.12	{"score": 85, "tugasId": "cmkknmad700038xpvoco0fnki"}	2026-01-20 03:11:03.677
cmlfvijrd0007rapvbq1zno0x	cmj5gx103002z35udn2m30zv3	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.321
cmlfvijrg0008rapvp2az7xbo	cmj5gx1vm004535udc4l2kzg5	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.324
cmlfvijri0009rapvxnn2txn8	cmj5gx2kx005335udc4757qsp	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.326
cmlg2rbjo001wrapvsvz1g5mx	cmj5gx206004b35uduf215trn	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:02:11.892
cmlg2rbjr001xrapvjl599ltz	cml4n1odj005nrgpvbubg8thz	TUGAS_BARU	Tugas Baru: Dasar Program Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	f	\N	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:02:11.895
cmmcrlwmj000or0pv4mi8wqxv	cmj5gx1o2003v35udzn7dj9ls	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 70/100	/tugas	f	\N	{"score": 70, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:06:27.307
cmmcrm040000pr0pvwl8nu57f	cmj5gx2qz005b35ud4370ott0	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 70/100	/tugas	f	\N	{"score": 70, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:06:31.823
cmmcrm3d6000qr0pvx9ubj23d	cmj5gx2i0004z35udecgz1nlq	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 70/100	/tugas	f	\N	{"score": 70, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:06:36.042
cmmcrm85t000rr0pv5dcb88eg	cmj5gwztr001f35udgp2iqne6	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 75/100	/tugas	f	\N	{"score": 75, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:06:42.257
cmmcrmcdk000sr0pvtdmckd67	cml4n1odj005nrgpvbubg8thz	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 70/100	/tugas	f	\N	{"score": 70, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:06:47.72
cmmcrmyew000vr0pvqekqloqf	cmj5gx0c0002335udrmwctcnm	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 80/100	/tugas	f	\N	{"score": 80, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:16.28
cmmcrn38w000wr0pvqifyyvvy	cmj5gx0o3002j35uda0ok0i4j	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 75/100	/tugas	f	\N	{"score": 75, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:22.544
cmmcrn7de000xr0pv6smaksim	cmj5gx206004b35uduf215trn	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 80/100	/tugas	f	\N	{"score": 80, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:27.89
cmmcrni9y000yr0pv4mp7i7dw	cmj5gx21o004d35udxjptvn08	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 70/100	/tugas	f	\N	{"score": 70, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:42.022
cmmcrnlsc000zr0pv7jurto7f	cmj5gwyx9000935ud28f9ggyr	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 75/100	/tugas	f	\N	{"score": 75, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:46.572
cmlfvijra0006rapv0lhdvy87	cmj5gx0x4002v35udz7qohe6d	TUGAS_BARU	Tugas Baru: Konsentrasi Keahlian TKJ	Rizky Lutfi Romadona, S.Kom. memberi tugas baru dengan deadline 10/2/2026	/tugas	t	2026-03-10 01:27:38.941	{"tugasId": "cmlfvijqf0002rapvs7zgv0r0"}	2026-02-10 00:39:25.318
cmmcrnov80010r0pvfrw6xkef	cmj5gx264004j35ud8hnkcdnj	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 75/100	/tugas	t	2026-03-10 02:24:12.921	{"score": 75, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:50.564
cmmcrmumt000ur0pvsqsia3zk	cmj5gwzeh000v35udwd1xnzk8	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 70/100	/tugas	t	2026-03-12 00:50:46.714	{"score": 70, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:11.381
cmmcrmfwn000tr0pvt5u77hde	cmj5gwzeh000v35udwd1xnzk8	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 75/100	/tugas	t	2026-03-12 00:50:51.262	{"score": 75, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:06:52.295
cmmcrnrvf0011r0pvlqb436yj	cmj5gx17k003935udaewx76ro	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 80/100	/tugas	f	\N	{"score": 80, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:07:54.459
cmmcro0yc0012r0pvmkknk33b	cmj5gx206004b35uduf215trn	TUGAS_DINILAI	Tugas Telah Dinilai	Tugas "Tugas TCP IP" telah dinilai. Nilai Anda: 85/100	/tugas	f	\N	{"score": 85, "tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-03-05 01:08:06.228
cmlg3ha5i002grapvqr34duzn	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	KETUT DIMAS MUHAMAD RISAL telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:22:23.142
cmlg3i2dy002jrapvff1wqcij	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	NAUFAL DZAKI HANIF ABIYYI telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:22:59.734
cmlg3inkd002mrapv8ylqnjj1	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	ADITYA DAMARA PUTRA KRISTIAWAN telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:23:27.181
cmlg3jms1002prapv7mhc9vhm	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	MUHAMMAD RIZKI telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:24:12.817
cmlg3kre9002srapvdz7x3xiu	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	MUHAMAD RISKI NEO VALENTINO telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:25:05.457
cmlg3q3yb002vrapvvpv80fcv	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	FERDIO PUTRA PRASETYA telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:29:15.011
cmlg3qjbo002yrapv82o9eu52	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	DWI AYU MEI JAYANTI telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:29:34.932
cmlg3vbnw0031rapvguek3bx1	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	ALFAZA OKTAVINO PRADITIA telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:33:18.284
cmlg3wt1j0033rapvi104x3w0	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	Abil telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:34:27.463
cmlg3ztti0036rapvsf172g5g	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	BADRIA NUR ANISA telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:36:48.438
cmlg42gac0039rapv4gv66k2x	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	RAZKY GABRIL WAHYUDI telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:38:50.868
cmlg47h0n003crapvk8j20ify	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	SUPRIYADI telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:42:45.095
cmlg4t8oy003frapvckxxvemf	cmj9z8yem002u5dudolwskcz4	TUGAS_DINILAI	Pengumpulan Tugas Baru	M. YUSRON GINANDA telah mengumpulkan tugas "Tugas TCP IP"	/tugas-management	t	2026-03-05 01:08:59.898	{"tugasId": "cmlg2rbja001vrapv0yhd1lni"}	2026-02-10 04:59:40.738
\.


--
-- Data for Name: PaketSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaketSoal" (id, kode, nama, deskripsi, "mataPelajaranId", "totalSoal", "createdAt", "updatedAt", "deletedAt", "guruId") FROM stdin;
cmkvudbt400009tpvwssp9jfx	PKT-00001	Ulangan Kelas XI TKJ	\N	cmj9z7q9n001s5dudxr525koc	13	2026-01-27 00:11:58.597	2026-01-27 00:14:41.897	\N	cmj9z8yem002u5dudolwskcz4
cml4lvuht0000rgpvaavqi7yo	PKT-00002	Ulangan kelas x TKJ	\N	cmj9z7q87001e5dudb1uk5u9j	30	2026-02-02 03:24:21.663	2026-02-02 03:35:29.59	2026-02-02 03:35:29.589	cmj9z8yem002u5dudolwskcz4
cml4mcaxd001qrgpvfuj6ietx	PKT-00003	Ulangan Kelas X TKJ	\N	cmj9z7q87001e5dudb1uk5u9j	30	2026-02-02 03:37:09.456	2026-02-02 03:37:19.133	\N	cmj9z8yem002u5dudolwskcz4
cmlfwmp53000krapvvo7q2zw8	PKT-00004	Ulangan ke 2 KK	\N	cmj9z7q9n001s5dudxr525koc	12	2026-02-10 01:10:38.534	2026-02-10 01:11:29.397	\N	cmj9z8yem002u5dudolwskcz4
cmmjwbqu50000r4pvp6v2a9p2	PKT-00005	STS GENAP XI TKJ	\N	cmj9z7q9n001s5dudxr525koc	20	2026-03-10 00:52:54.556	2026-03-10 00:54:29.162	\N	cmj9z8yem002u5dudolwskcz4
cmmjynvpz003hr4pvoby307lo	PKT-00006	STS GENAP DPK KELAS X TKJ	\N	cmj9z7q87001e5dudb1uk5u9j	25	2026-03-10 01:58:19.99	2026-03-10 01:59:51.884	\N	cmj9z8yem002u5dudolwskcz4
cmmlbgqln0000rspvnl9ri7bh	PKT-00007	STS GENAP XII TKJ	\N	cmj9z7q9n001s5dudxr525koc	25	2026-03-11 00:44:27.944	2026-03-11 00:48:51.322	\N	cmj9z8yem002u5dudolwskcz4
\.


--
-- Data for Name: PaketSoalItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaketSoalItem" (id, "paketSoalId", "bankSoalId", urutan, "createdAt") FROM stdin;
cmkvugtsg000g9tpvh4bazs23	cmkvudbt400009tpvwssp9jfx	cmkvugtq700029tpvbd2p7jaf	1	2026-01-27 00:14:41.861
cmkvugtsf000f9tpvqq9afcqd	cmkvudbt400009tpvwssp9jfx	cmkvugtqf00039tpvianx6e0u	2	2026-01-27 00:14:41.862
cmkvugtsg000h9tpviaevn9ev	cmkvudbt400009tpvwssp9jfx	cmkvugtqk00049tpvovqw9v22	3	2026-01-27 00:14:41.862
cmkvugtsg000i9tpvno22ga3g	cmkvudbt400009tpvwssp9jfx	cmkvugtqp00059tpvzxxb7qry	4	2026-01-27 00:14:41.863
cmkvugtsl000j9tpv8xnoyq6s	cmkvudbt400009tpvwssp9jfx	cmkvugtrl000c9tpv8undkp3n	11	2026-01-27 00:14:41.868
cmkvugtsm000k9tpv8grx9c5f	cmkvudbt400009tpvwssp9jfx	cmkvugtrq000d9tpvloy2r3xs	12	2026-01-27 00:14:41.869
cmkvugtsn000l9tpvw60tma6g	cmkvudbt400009tpvwssp9jfx	cmkvugtrv000e9tpv0zusqhwy	13	2026-01-27 00:14:41.869
cmkvugtss000m9tpvr5r7m3ln	cmkvudbt400009tpvwssp9jfx	cmkvugtqu00069tpvih5v2r9k	5	2026-01-27 00:14:41.864
cmkvugtst000n9tpvumz448dk	cmkvudbt400009tpvwssp9jfx	cmkvugtr300089tpv56fp4fqn	7	2026-01-27 00:14:41.865
cmkvugtst000p9tpv6y9diphl	cmkvudbt400009tpvwssp9jfx	cmkvugtrd000a9tpvt0gbc167	9	2026-01-27 00:14:41.867
cmkvugtst000o9tpvj4k96c4o	cmkvudbt400009tpvwssp9jfx	cmkvugtr800099tpvg0ds82y6	8	2026-01-27 00:14:41.866
cmkvugtsu000q9tpvd9gc8t8s	cmkvudbt400009tpvwssp9jfx	cmkvugtqy00079tpv1z5c50b3	6	2026-01-27 00:14:41.865
cmkvugtsw000r9tpvp9it562d	cmkvudbt400009tpvwssp9jfx	cmkvugtrh000b9tpvffymrb7r	10	2026-01-27 00:14:41.867
cml4m97hq000yrgpvc2b0ogzo	cml4lvuht0000rgpvaavqi7yo	cml4m97d20002rgpvrkvuggpu	1	2026-02-02 03:34:45.014
cml4m97hq000zrgpv8zsssdi1	cml4lvuht0000rgpvaavqi7yo	cml4m97di0005rgpvt53dhc7n	4	2026-02-02 03:34:45.017
cml4m97hp000wrgpvht5krx8c	cml4lvuht0000rgpvaavqi7yo	cml4m97d80003rgpvf8bnizox	2	2026-02-02 03:34:45.015
cml4m97hp000xrgpvqrbgqtw2	cml4lvuht0000rgpvaavqi7yo	cml4m97dd0004rgpvg5js9ln2	3	2026-02-02 03:34:45.016
cml4m97hv0010rgpvvs9178gr	cml4lvuht0000rgpvaavqi7yo	cml4m97ed000crgpvrdn4qznk	11	2026-02-02 03:34:45.022
cml4m97hx0011rgpvnrwd7hm8	cml4lvuht0000rgpvaavqi7yo	cml4m97ei000drgpv6a6s8obt	12	2026-02-02 03:34:45.023
cml4m97hx0012rgpvoyon1vh2	cml4lvuht0000rgpvaavqi7yo	cml4m97em000ergpv14th1zp7	13	2026-02-02 03:34:45.024
cml4m97hz0013rgpv25awk38c	cml4lvuht0000rgpvaavqi7yo	cml4m97eq000frgpvrqknploa	14	2026-02-02 03:34:45.024
cml4m97i00014rgpvpyqb576e	cml4lvuht0000rgpvaavqi7yo	cml4m97eu000grgpvgb9y0qbq	15	2026-02-02 03:34:45.025
cml4m97i10015rgpvtcbyy9jx	cml4lvuht0000rgpvaavqi7yo	cml4m97dr0007rgpvui4uzvdn	6	2026-02-02 03:34:45.018
cml4m97i30017rgpvvy7neclk	cml4lvuht0000rgpvaavqi7yo	cml4m97ez000hrgpvh0mzdz0i	16	2026-02-02 03:34:45.026
cml4m97i20016rgpvi9r0xdto	cml4lvuht0000rgpvaavqi7yo	cml4m97dn0006rgpvv4hujm8o	5	2026-02-02 03:34:45.018
cml4m97i3001argpvjc252c79	cml4lvuht0000rgpvaavqi7yo	cml4m97f3000irgpvybj6etjk	17	2026-02-02 03:34:45.026
cml4m97i30019rgpvxgnvyfnf	cml4lvuht0000rgpvaavqi7yo	cml4m97dw0008rgpvlnwt30ft	7	2026-02-02 03:34:45.019
cml4m97i30018rgpvu4on0dbp	cml4lvuht0000rgpvaavqi7yo	cml4m97e00009rgpvfbxjc81w	8	2026-02-02 03:34:45.02
cml4m97i5001crgpvkd5vdkza	cml4lvuht0000rgpvaavqi7yo	cml4m97f7000jrgpvkqezt4ev	18	2026-02-02 03:34:45.027
cml4m97i4001brgpvx3xqtrrd	cml4lvuht0000rgpvaavqi7yo	cml4m97e4000argpvlq5ic118	9	2026-02-02 03:34:45.021
cml4m97i7001drgpv1fcp2z0e	cml4lvuht0000rgpvaavqi7yo	cml4m97fb000krgpvjxws7q78	19	2026-02-02 03:34:45.028
cml4m97i9001ergpvqixu31np	cml4lvuht0000rgpvaavqi7yo	cml4m97fj000mrgpvolqpih62	21	2026-02-02 03:34:45.029
cml4m97i9001frgpvmbj7z6r0	cml4lvuht0000rgpvaavqi7yo	cml4m97ff000lrgpvwbojttd8	20	2026-02-02 03:34:45.028
cml4m97ia001grgpvzkjvt8tn	cml4lvuht0000rgpvaavqi7yo	cml4m97fo000nrgpv2yv7ixgf	22	2026-02-02 03:34:45.03
cml4m97ib001hrgpvzugrfnzo	cml4lvuht0000rgpvaavqi7yo	cml4m97e9000brgpvkiqybw99	10	2026-02-02 03:34:45.021
cml4m97id001irgpv5i45v467	cml4lvuht0000rgpvaavqi7yo	cml4m97fx000prgpvs6i0bh7m	24	2026-02-02 03:34:45.031
cml4m97id001jrgpv0nn3rpp7	cml4lvuht0000rgpvaavqi7yo	cml4m97fs000orgpvh42hbtho	23	2026-02-02 03:34:45.03
cml4m97ie001krgpviz3bszpq	cml4lvuht0000rgpvaavqi7yo	cml4m97g3000qrgpvpygwh87h	25	2026-02-02 03:34:45.032
cml4m97ie001lrgpv1w7z9q7m	cml4lvuht0000rgpvaavqi7yo	cml4m97g8000rrgpv8ybj426q	26	2026-02-02 03:34:45.032
cml4m97if001mrgpvamz3asdi	cml4lvuht0000rgpvaavqi7yo	cml4m97gc000srgpvau5246di	27	2026-02-02 03:34:45.033
cml4m97ig001nrgpvp5z7nwi8	cml4lvuht0000rgpvaavqi7yo	cml4m97gh000trgpvnix1zyf7	28	2026-02-02 03:34:45.034
cml4m97ig001orgpv2u4gb8ek	cml4lvuht0000rgpvaavqi7yo	cml4m97gm000urgpvbaqidhpj	29	2026-02-02 03:34:45.034
cml4m97ii001prgpv08i63vtd	cml4lvuht0000rgpvaavqi7yo	cml4m97gr000vrgpva0cdhgvy	30	2026-02-02 03:34:45.035
cml4mcid6002mrgpvmbo2x3xt	cml4mcaxd001qrgpvfuj6ietx	cml4mci84001srgpvp3hrwrmq	1	2026-02-02 03:37:19.073
cml4mcid7002nrgpvdic4q6q5	cml4mcaxd001qrgpvfuj6ietx	cml4mci89001trgpvyrtyw8sl	2	2026-02-02 03:37:19.074
cml4mcid7002orgpvbxl7qv6j	cml4mcaxd001qrgpvfuj6ietx	cml4mci8d001urgpv1k6y1h8z	3	2026-02-02 03:37:19.075
cml4mcid7002prgpv8ijzqbet	cml4mcaxd001qrgpvfuj6ietx	cml4mci8h001vrgpvbn5v3szn	4	2026-02-02 03:37:19.076
cml4mcidc002qrgpvkwx4p0p5	cml4mcaxd001qrgpvfuj6ietx	cml4mci9c0022rgpvyy4h4xbu	11	2026-02-02 03:37:19.082
cml4mcidd002rrgpv2honlwa4	cml4mcaxd001qrgpvfuj6ietx	cml4mci9g0023rgpvc1iujwzo	12	2026-02-02 03:37:19.083
cml4mcidd002srgpvzn7sa7yv	cml4mcaxd001qrgpvfuj6ietx	cml4mci9k0024rgpv0ktf8och	13	2026-02-02 03:37:19.084
cml4mcidf002trgpvcgo8g0ex	cml4mcaxd001qrgpvfuj6ietx	cml4mci9p0025rgpvrxib62sx	14	2026-02-02 03:37:19.085
cml4mcidh002urgpvh5xlx9fa	cml4mcaxd001qrgpvfuj6ietx	cml4mci9u0026rgpv6z79hyp2	15	2026-02-02 03:37:19.085
cml4mcidh002vrgpv4vftth3k	cml4mcaxd001qrgpvfuj6ietx	cml4mci9z0027rgpv3hqw3s43	16	2026-02-02 03:37:19.086
cml4mcidj002xrgpvdbz8mhgq	cml4mcaxd001qrgpvfuj6ietx	cml4mcia40028rgpv0hjvbqmd	17	2026-02-02 03:37:19.087
cml4mcidj002wrgpvdg3jnwp1	cml4mcaxd001qrgpvfuj6ietx	cml4mci8q001xrgpvkhyvra67	6	2026-02-02 03:37:19.078
cml4mcidl0031rgpv81zbhae1	cml4mcaxd001qrgpvfuj6ietx	cml4mcia90029rgpvu5bfgrct	18	2026-02-02 03:37:19.088
cml4mcidk002yrgpvab91dntk	cml4mcaxd001qrgpvfuj6ietx	cml4mci8m001wrgpv6hzvzmw0	5	2026-02-02 03:37:19.077
cml4mcidk002zrgpvm72nhey7	cml4mcaxd001qrgpvfuj6ietx	cml4mci930020rgpv71dlgdwf	9	2026-02-02 03:37:19.081
cml4mcidk0030rgpv6ag898dx	cml4mcaxd001qrgpvfuj6ietx	cml4mci8v001yrgpvlrrubb6v	7	2026-02-02 03:37:19.079
cml4mcidm0033rgpvhsppb229	cml4mcaxd001qrgpvfuj6ietx	cml4mciaf002argpvdccm9nof	19	2026-02-02 03:37:19.089
cml4mcidm0032rgpvzk7hetvw	cml4mcaxd001qrgpvfuj6ietx	cml4mci8z001zrgpvkuhii72a	8	2026-02-02 03:37:19.08
cml4mcidn0035rgpvphc8fe1m	cml4mcaxd001qrgpvfuj6ietx	cml4mciak002brgpvgqkzu3as	20	2026-02-02 03:37:19.089
cml4mcidn0034rgpvzb7bx98q	cml4mcaxd001qrgpvfuj6ietx	cml4mci980021rgpvygkrq73g	10	2026-02-02 03:37:19.081
cml4mcidq0036rgpvjvcfujs2	cml4mcaxd001qrgpvfuj6ietx	cml4mciaq002crgpvfaszib5t	21	2026-02-02 03:37:19.09
cml4mcidr0037rgpvnir985bg	cml4mcaxd001qrgpvfuj6ietx	cml4mciav002drgpvau6f2jib	22	2026-02-02 03:37:19.091
cml4mcids0038rgpvdhxyy19w	cml4mcaxd001qrgpvfuj6ietx	cml4mcib0002ergpvhsb8ywhv	23	2026-02-02 03:37:19.091
cml4mcidw0039rgpviaxf4t6q	cml4mcaxd001qrgpvfuj6ietx	cml4mciba002grgpvgdr5lxlu	25	2026-02-02 03:37:19.093
cml4mcidw003argpvo41bwj64	cml4mcaxd001qrgpvfuj6ietx	cml4mcibg002hrgpvp3obcvd1	26	2026-02-02 03:37:19.094
cml4mcidx003brgpvw80rgauz	cml4mcaxd001qrgpvfuj6ietx	cml4mcib5002frgpv76r2bjsi	24	2026-02-02 03:37:19.092
cml4mcidy003crgpvgsume9sh	cml4mcaxd001qrgpvfuj6ietx	cml4mcibl002irgpv4oib878b	27	2026-02-02 03:37:19.094
cml4mcidy003drgpvrnwuld7k	cml4mcaxd001qrgpvfuj6ietx	cml4mcibr002jrgpvd7mntrmy	28	2026-02-02 03:37:19.095
cml4mcidy003ergpvmgvqifgz	cml4mcaxd001qrgpvfuj6ietx	cml4mcibx002krgpvs0hnsuzy	29	2026-02-02 03:37:19.096
cml4mcidz003frgpvk4nmo4xo	cml4mcaxd001qrgpvfuj6ietx	cml4mcic3002lrgpv00zoz162	30	2026-02-02 03:37:19.096
cmlfwnsdc000zrapvltex8ezm	cmlfwmp53000krapvvo7q2zw8	cmlfwnsb5000mrapvfh5b0twr	1	2026-02-10 01:11:29.365
cmlfwnsdc000yrapvtn7u2f54	cmlfwmp53000krapvvo7q2zw8	cmlfwnsbg000orapv1elijm56	3	2026-02-10 01:11:29.366
cmlfwnsdc0010rapvrvb0bnak	cmlfwmp53000krapvvo7q2zw8	cmlfwnsbk000prapvdj1thluw	4	2026-02-10 01:11:29.367
cmlfwnsdc0011rapv9rdd6p6u	cmlfwmp53000krapvvo7q2zw8	cmlfwnsbb000nrapvneybpkec	2	2026-02-10 01:11:29.366
cmlfwnsdh0012rapvna4shb6b	cmlfwmp53000krapvvo7q2zw8	cmlfwnscl000wrapvsitl1k1e	11	2026-02-10 01:11:29.373
cmlfwnsdi0013rapvv3pallwq	cmlfwmp53000krapvvo7q2zw8	cmlfwnscq000xrapv055oieom	12	2026-02-10 01:11:29.373
cmlfwnsdm0014rapvrncvpbcm	cmlfwmp53000krapvvo7q2zw8	cmlfwnsbp000qrapv2b1p87qc	5	2026-02-10 01:11:29.368
cmlfwnsdn0015rapvbpx4543q	cmlfwmp53000krapvvo7q2zw8	cmlfwnsbv000rrapv5js2epw3	6	2026-02-10 01:11:29.369
cmlfwnsdn0017rapv4lexvqja	cmlfwmp53000krapvvo7q2zw8	cmlfwnscf000vrapvpo0rcsxc	10	2026-02-10 01:11:29.372
cmlfwnsdn0016rapvohck1rk9	cmlfwmp53000krapvvo7q2zw8	cmlfwnsc0000srapvubpk1hoj	7	2026-02-10 01:11:29.37
cmlfwnsdn0018rapvt9b88d54	cmlfwmp53000krapvvo7q2zw8	cmlfwnsca000urapvtftpnh44	9	2026-02-10 01:11:29.371
cmlfwnsdo0019rapvz768gfoj	cmlfwmp53000krapvvo7q2zw8	cmlfwnsc5000trapv57y1fw8n	8	2026-02-10 01:11:29.37
cmmjwdrt7000mr4pv4mo2v645	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrpe0002r4pvgwgvzpj0	1	2026-03-10 00:54:29.114
cmmjwdrt7000nr4pvzykb4216	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrpl0003r4pvy6or8pr3	2	2026-03-10 00:54:29.115
cmmjwdrt8000pr4pv1fd1wpdt	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrpw0005r4pvqnldjecp	4	2026-03-10 00:54:29.117
cmmjwdrt8000or4pvwrbrqzw3	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrpr0004r4pvuzz7o7cd	3	2026-03-10 00:54:29.116
cmmjwdrte000qr4pv8sesx90r	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrqy000cr4pvljwuekwm	11	2026-03-10 00:54:29.122
cmmjwdrtf000rr4pvpy88njwb	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrr3000dr4pv7ez9kvy9	12	2026-03-10 00:54:29.123
cmmjwdrtg000sr4pvanw7bhbb	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrr9000er4pv4txapu8a	13	2026-03-10 00:54:29.124
cmmjwdrth000tr4pvw81ysdzb	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrre000fr4pvs4rhtp8u	14	2026-03-10 00:54:29.124
cmmjwdrtn000ur4pva05en5o2	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrqc0008r4pv5cfupl05	7	2026-03-10 00:54:29.119
cmmjwdrto000wr4pvil19zvty	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrrk000gr4pvtd81wov4	15	2026-03-10 00:54:29.125
cmmjwdrtp000yr4pvx6c7hli9	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrrp000hr4pv6bsv1xm2	16	2026-03-10 00:54:29.126
cmmjwdrto000vr4pv3hlng82f	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrq10006r4pvjsvncl0w	5	2026-03-10 00:54:29.117
cmmjwdrtq0010r4pvn047fyyb	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrrv000ir4pv9tlgfb55	17	2026-03-10 00:54:29.127
cmmjwdrto000xr4pv3oqyxgb6	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrqt000br4pvnfl4gq1p	10	2026-03-10 00:54:29.121
cmmjwdrtp000zr4pve3flwhgf	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrqi0009r4pvhcx3nvhb	8	2026-03-10 00:54:29.12
cmmjwdrtr0012r4pv4k7xazvp	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrs1000jr4pvtz50efd1	18	2026-03-10 00:54:29.127
cmmjwdrtr0011r4pvwppdt9r6	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrq70007r4pv1dmy29pd	6	2026-03-10 00:54:29.118
cmmjwdrtt0013r4pvub924b2h	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrqn000ar4pvic8pj2us	9	2026-03-10 00:54:29.12
cmmjwdrtu0014r4pvedw69onb	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrs8000kr4pvytm7t1c5	19	2026-03-10 00:54:29.128
cmmjwdrtv0015r4pvurnxynej	cmmjwbqu50000r4pvp6v2a9p2	cmmjwdrsd000lr4pvpr30dr69	20	2026-03-10 00:54:29.129
cmmjypulu0048r4pvnkr755p3	cmmjynvpz003hr4pvoby307lo	cmmjypuhi003jr4pvgdp5hwv2	1	2026-03-10 01:59:51.838
cmmjypulv0049r4pvj2fumbl7	cmmjynvpz003hr4pvoby307lo	cmmjypuho003kr4pvajj1jufs	2	2026-03-10 01:59:51.838
cmmjypulv004br4pvnytiqo1u	cmmjynvpz003hr4pvoby307lo	cmmjypuhw003mr4pvgk9re7a2	4	2026-03-10 01:59:51.84
cmmjypulv004ar4pvqjcl36wz	cmmjynvpz003hr4pvoby307lo	cmmjypuhs003lr4pvzja8vc1s	3	2026-03-10 01:59:51.839
cmmjypum0004cr4pv6ahdy52g	cmmjynvpz003hr4pvoby307lo	cmmjypuip003tr4pv08jr1c7n	11	2026-03-10 01:59:51.846
cmmjypum0004dr4pva9g3t1sf	cmmjynvpz003hr4pvoby307lo	cmmjypuiu003ur4pvpeuc6qos	12	2026-03-10 01:59:51.847
cmmjypum1004er4pvk8z9g1t7	cmmjynvpz003hr4pvoby307lo	cmmjypuiy003vr4pv585thwbs	13	2026-03-10 01:59:51.848
cmmjypum3004fr4pvbcyjwzdu	cmmjynvpz003hr4pvoby307lo	cmmjypuj3003wr4pvvkqtu3oz	14	2026-03-10 01:59:51.848
cmmjypum4004gr4pvpcblm476	cmmjynvpz003hr4pvoby307lo	cmmjypuj8003xr4pvqqzvooe0	15	2026-03-10 01:59:51.849
cmmjypum5004hr4pvdj2716f0	cmmjynvpz003hr4pvoby307lo	cmmjypujd003yr4pv1sgls6h3	16	2026-03-10 01:59:51.85
cmmjypum5004ir4pv8akvpkqr	cmmjynvpz003hr4pvoby307lo	cmmjypui8003pr4pvt3jlrm2y	7	2026-03-10 01:59:51.843
cmmjypum6004lr4pvooxbmkua	cmmjynvpz003hr4pvoby307lo	cmmjypuji003zr4pv7919t2zv	17	2026-03-10 01:59:51.851
cmmjypum6004jr4pvl4nzcajp	cmmjynvpz003hr4pvoby307lo	cmmjypuhz003nr4pvd33wlq9o	5	2026-03-10 01:59:51.841
cmmjypum6004kr4pvs6vdzyie	cmmjynvpz003hr4pvoby307lo	cmmjypui4003or4pvcwq7sgu5	6	2026-03-10 01:59:51.842
cmmjypum8004pr4pv9hq5ru28	cmmjynvpz003hr4pvoby307lo	cmmjypujo0040r4pvdg211hk6	18	2026-03-10 01:59:51.851
cmmjypum8004qr4pv3ycb3g54	cmmjynvpz003hr4pvoby307lo	cmmjypujt0041r4pv1ndtz6j8	19	2026-03-10 01:59:51.852
cmmjypum7004mr4pvtgi59kis	cmmjynvpz003hr4pvoby307lo	cmmjypuig003rr4pvvli26sfm	9	2026-03-10 01:59:51.844
cmmjypum7004nr4pvv14751hq	cmmjynvpz003hr4pvoby307lo	cmmjypuic003qr4pve0utsc96	8	2026-03-10 01:59:51.844
cmmjypum8004or4pv5u0ese1l	cmmjynvpz003hr4pvoby307lo	cmmjypuik003sr4pvxjh1e82j	10	2026-03-10 01:59:51.845
cmmjypumb004rr4pv5n0cakl3	cmmjynvpz003hr4pvoby307lo	cmmjypuk00042r4pv5yrfuwmh	20	2026-03-10 01:59:51.853
cmmjypumc004sr4pv3b80gmnb	cmmjynvpz003hr4pvoby307lo	cmmjypuk60043r4pvv6bw2xur	21	2026-03-10 01:59:51.853
cmmjypumd004tr4pvrf5216f2	cmmjynvpz003hr4pvoby307lo	cmmjypukc0044r4pvo8uho1h6	22	2026-03-10 01:59:51.854
cmmjypume004ur4pvklewl9yi	cmmjynvpz003hr4pvoby307lo	cmmjypukj0045r4pv6f21z7y9	23	2026-03-10 01:59:51.855
cmmjypumf004vr4pvgmsmgmwm	cmmjynvpz003hr4pvoby307lo	cmmjypukp0046r4pvl8y48q8s	24	2026-03-10 01:59:51.856
cmmjypumf004wr4pv7a7yo3xs	cmmjynvpz003hr4pvoby307lo	cmmjypukv0047r4pvdkwmbq3h	25	2026-03-10 01:59:51.856
cmmlbmdsp0025rspvgmqlcacb	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdna001grspvke8dnoz6	1	2026-03-11 00:48:51.263
cmmlbmdsq0026rspvx3g1npit	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdng001hrspvqz47uvtq	2	2026-03-11 00:48:51.264
cmmlbmdsr0028rspv3p8o7gse	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdnq001jrspvimdtyv6q	4	2026-03-11 00:48:51.266
cmmlbmdsq0027rspvt40e0fki	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdnl001irspvkw2p8w4u	3	2026-03-11 00:48:51.265
cmmlbmdsw0029rspvweib6xz7	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdov001qrspv1ruzt8ku	11	2026-03-11 00:48:51.274
cmmlbmdsx002arspv363ob7f8	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdp0001rrspvsyi714v6	12	2026-03-11 00:48:51.275
cmmlbmdsx002brspvybiqshdi	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdp6001srspvtfac4e9q	13	2026-03-11 00:48:51.276
cmmlbmdsz002crspv1qq6tui5	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdpc001trspvmnbpzoa0	14	2026-03-11 00:48:51.277
cmmlbmdt4002drspv5nxs9ykf	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdpi001urspvnpon2orv	15	2026-03-11 00:48:51.278
cmmlbmdt5002erspvxf2nlogc	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdpp001vrspvyr0rhiaj	16	2026-03-11 00:48:51.278
cmmlbmdt6002frspv13jpb1uo	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdok001orspv2e9nrf52	9	2026-03-11 00:48:51.272
cmmlbmdt8002irspv2mh52yrj	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdpw001wrspv4uadflm7	17	2026-03-11 00:48:51.279
cmmlbmdt7002grspvz2lfzxr8	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdo3001lrspvpcqgxmnc	6	2026-03-11 00:48:51.269
cmmlbmdt8002hrspvmfol4i69	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdnx001krspvat4jkn73	5	2026-03-11 00:48:51.268
cmmlbmdt9002nrspv28f4tel6	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdq2001xrspvgnn17rbi	18	2026-03-11 00:48:51.28
cmmlbmdt8002jrspv9et8zet5	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdoe001nrspvmk1jihw6	8	2026-03-11 00:48:51.271
cmmlbmdt9002krspvhm7v7je2	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdop001prspvh623cbct	10	2026-03-11 00:48:51.273
cmmlbmdta002orspva99uhakw	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdqg001zrspvfxvyld4k	20	2026-03-11 00:48:51.282
cmmlbmdt9002lrspvss39p0ic	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdo9001mrspvhc7xavxd	7	2026-03-11 00:48:51.27
cmmlbmdt9002mrspv6uska57o	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdq8001yrspvennj241t	19	2026-03-11 00:48:51.281
cmmlbmdtc002prspv3ruu1e3t	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdqm0020rspvc9x8w897	21	2026-03-11 00:48:51.283
cmmlbmdtf002qrspvm8epq8uo	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdqt0021rspvkhmn5w8v	22	2026-03-11 00:48:51.284
cmmlbmdtg002rrspvnusa3khz	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdr80023rspvgzo7ww7m	24	2026-03-11 00:48:51.286
cmmlbmdtg002srspvtj35cesb	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdrf0024rspvns9u3zzm	25	2026-03-11 00:48:51.286
cmmlbmdth002trspvg76dui7m	cmmlbgqln0000rspvnl9ri7bh	cmmlbmdr10022rspv5pxzq7gv	23	2026-03-11 00:48:51.285
\.


--
-- Data for Name: PaketSoalKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaketSoalKelas" (id, "paketSoalId", "kelasId", "createdAt") FROM stdin;
cmkvudbt800019tpvtyv9lus9	cmkvudbt400009tpvwssp9jfx	cmj5eca0k0004jsuddjewnal1	2026-01-27 00:11:58.597
cml4lvuhw0001rgpv2o0tz65k	cml4lvuht0000rgpvaavqi7yo	cmj5eca0e0003jsud1uxj50o4	2026-02-02 03:24:21.663
cml4mcaxe001rrgpvwk9r1uu5	cml4mcaxd001qrgpvfuj6ietx	cmj5eca0e0003jsud1uxj50o4	2026-02-02 03:37:09.456
cmlfwmp55000lrapvyzzor0wr	cmlfwmp53000krapvvo7q2zw8	cmj5eca0k0004jsuddjewnal1	2026-02-10 01:10:38.534
cmmjwbqu80001r4pvpd29emwt	cmmjwbqu50000r4pvp6v2a9p2	cmj5eca0k0004jsuddjewnal1	2026-03-10 00:52:54.556
cmmjynvq0003ir4pv6gxsf1v4	cmmjynvpz003hr4pvoby307lo	cmj5eca0e0003jsud1uxj50o4	2026-03-10 01:58:19.99
cmmlbgqls0001rspvdb6tf203	cmmlbgqln0000rspvnl9ri7bh	cmj5eca0o0005jsud0ambwla7	2026-03-11 00:44:27.944
\.


--
-- Data for Name: Pengumuman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pengumuman" (id, judul, konten, "targetRoles", "authorId", "isActive", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: ProgressSiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProgressSiswa" (id, "siswaId", "mataPelajaranId", "materiDibaca", "tugasSelesai", "forumPosts", "totalScore", "lastActivity", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RPP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RPP" (id, kode, "mataPelajaranId", "guruId", "capaianPembelajaran", "tujuanPembelajaran", status, "isPublished", "createdAt", "updatedAt", "deletedAt", "alokasiWaktu", "asesmenAkhir", "asesmenAwal", "asesmenProses", "dimensiProfilLulusan", fase, "identifikasiMateri", "identifikasiPesertaDidik", "kegiatanAwal", "kegiatanMemahami", "kegiatanMengaplikasi", "kegiatanMerefleksi", "kegiatanPenutup", "kemitraanPembelajaran", "lingkunganPembelajaran", "lintasDisiplinIlmu", materi, "namaGuru", "pemanfaatanDigital", "praktikPedagogik", "tahunAjaran", "topikPembelajaran") FROM stdin;
cmjsihj2y0000v5ud7f0f6syr	RPP-DPK	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	Pada akhir fase F, peserta didik mampu mengelola dan mengamankan jaringan komputer berbasis kabel dan nirkabel, termasuk mengkonfigurasi perangkat jaringan aktif, menerapkan protokol jaringan, serta melakukan pemeliharaan dan perbaikan. Secara spesifik, peserta didik mampu mengkonfigurasi perangkat jaringan Mikrotik untuk membangun konektivitas dasar dan layanan jaringan esensial sesuai standar operasional prosedur dan kebutuhan fungsional.	["Setelah mengikuti sesi diskusi dan demonstrasi, peserta didik mampu menjelaskan fungsi dan konsep dasar komponen Mikrotik (misalnya, Winbox, IP Address, DHCP Server, DNS, Gateway) dengan tepat dan percaya diri.", "Melalui kegiatan praktikum mandiri, peserta didik mampu mengaplikasikan langkah-langkah setting dasar Mikrotik (identitas router, konfigurasi IP Address, DHCP Server, DNS, dan Gateway) pada perangkat fisik atau virtual dengan akurat dan sesuai prosedur.", "Melalui studi kasus sederhana, peserta didik mampu menganalisis dan mengidentifikasi potensi permasalahan pada konfigurasi dasar Mikrotik serta mengusulkan solusi secara logis dan kritis."]	PUBLISHED	t	2025-12-30 11:36:18.393	2025-12-30 11:45:05.838	2025-12-30 11:45:05.835	90	1. **Unjuk Kerja/Praktik:** Peserta didik diminta untuk mendemonstrasikan konfigurasi dasar Mikrotik sesuai skenario yang diberikan (misalnya, 'Konfigurasikan Mikrotik ini agar dapat memberikan internet ke 3 komputer klien dan 1 perangkat Wi-Fi'). Penilaian berdasarkan rubrik yang mencakup ketepatan konfigurasi, fungsionalitas, efisiensi, dan kemampuan troubleshooting.\n2. **Pertanyaan Lisan/Tertulis:** Pertanyaan yang menguji pemahaman konseptual dan kemampuan penalaran kritis, misalnya 'Jelaskan perbedaan antara IP Address statis dan dinamis pada Mikrotik!', atau 'Jika klien tidak mendapatkan IP dari DHCP Server Mikrotik, langkah-langkah apa saja yang akan kamu lakukan untuk mendiagnosis masalah tersebut?'	Kuis lisan singkat di awal pembelajaran untuk mengidentifikasi pengetahuan awal peserta didik terkait konsep dasar jaringan seperti IP Address, DHCP, DNS, dan fungsi router.	1. **Observasi Praktikum:** Guru melakukan observasi langsung selama praktikum, mencatat ketepatan langkah, kemandirian, efisiensi waktu, serta kemampuan peserta didik dalam mengidentifikasi dan memecahkan masalah saat konfigurasi. Guru dapat menggunakan lembar observasi dengan rubrik.\n2. **Diskusi & Tanya Jawab:** Penilaian keaktifan peserta didik dalam diskusi kelompok dan kemampuan menjawab pertanyaan guru terkait konsep dan prosedur konfigurasi Mikrotik.\n3. **Penyelesaian LKS:** Penilaian kelengkapan dan kebenaran hasil konfigurasi yang tercatat dalam Lembar Kerja Siswa (LKS).	["KEWARGAAN", "PENALARAN_KRITIS"]	fase f	Materi 'Setting Dasar Mikrotik' merupakan pengetahuan prosedural yang sangat aplikatif, namun juga membutuhkan pemahaman konseptual yang kuat (misalnya, fungsi IP address, DHCP, DNS, gateway). Relevansi materi ini sangat tinggi karena Mikrotik adalah perangkat jaringan yang banyak digunakan di berbagai skala industri di Indonesia, sehingga penguasaan materi ini menjadi kompetensi esensial bagi teknisi jaringan. Tingkat kesulitan materi ini moderat; langkah-langkah dasarnya relatif mudah diikuti, namun pemahaman mendalam tentang setiap parameter dan kemampuan untuk memecahkan masalah membutuhkan penalaran kritis dan pengalaman.	Peserta didik fase F (kelas XI/XII SMK) pada program keahlian TKJ umumnya memiliki dasar pengetahuan tentang komputer dan jaringan, namun dengan tingkat pemahaman yang bervariasi. Sebagian mungkin telah terpapar konsep jaringan dasar seperti IP address dan router, sementara yang lain mungkin baru mengenalnya secara mendalam. Mereka memiliki minat yang tinggi terhadap praktik langsung, eksplorasi teknologi, dan pemecahan masalah nyata yang relevan dengan dunia kerja. Kesiapan belajar mereka akan dipengaruhi oleh pengalaman sebelumnya dan motivasi untuk menguasai keterampilan teknis yang dibutuhkan di industri. Beberapa mungkin memiliki gaya belajar visual-kinestetik yang kuat, sehingga pendekatan praktikum sangat cocok.	{"prinsip": ["Mindful", "Meaningful", "Bermakna (Meaningful)", "Berkesadaran (Mindful)"], "kegiatan": "1. **Pembukaan & Sapaan (2 menit):** Guru menyapa peserta didik dengan hangat, mengucapkan salam, dan mengajak untuk berdoa bersama sebagai wujud rasa syukur dan kesiapan belajar (Mindful).\\n2. **Cek Kehadiran & Kesiapan (2 menit):** Guru melakukan pengecekan kehadiran dan memastikan kesiapan fisik serta mental peserta didik untuk memulai pembelajaran.\\n3. **Apersepsi & Motivasi (4 menit):** Guru memantik diskusi singkat tentang pentingnya router dalam kehidupan sehari-hari (misalnya, 'Bagaimana internet di rumah atau sekolah bisa terhubung?') dan mengaitkannya dengan peran Mikrotik sebagai salah satu perangkat router populer. Guru juga menjelaskan relevansi materi 'Setting Dasar Mikrotik' dengan kompetensi yang dibutuhkan di dunia kerja sebagai teknisi jaringan, menumbuhkan motivasi dan kesadaran akan makna pembelajaran (Meaningful).\\n4. **Penyampaian Tujuan Pembelajaran & Dimensi P3 (2 menit):** Guru menyampaikan tujuan pembelajaran yang akan dicapai dan mengaitkannya dengan dimensi Profil Pelajar Pancasila 'Kewargaan' (misalnya, tanggung jawab dalam mengelola infrastruktur jaringan) dan 'Penalaran Kritis' (kemampuan memecahkan masalah jaringan)."}	{"prinsip": ["Meaningful", "Mindful", "Bermakna (Meaningful)", "Berkesadaran (Mindful)"], "kegiatan": "1. **Identifikasi Pengetahuan Awal (5 menit):** Guru menyajikan pertanyaan pemantik seperti 'Apa yang kalian ketahui tentang IP Address?', 'Mengapa router dibutuhkan?', 'Pernahkah kalian melihat atau menggunakan perangkat Mikrotik?' untuk mengidentifikasi pengetahuan awal peserta didik dan memicu rasa ingin tahu (Mindful).\\n2. **Eksplorasi Konsep (10 menit):** Guru memfasilitasi diskusi singkat tentang konsep dasar jaringan dan fungsi utama sebuah router. Guru kemudian menampilkan antarmuka Winbox dan mendemonstrasikan secara singkat cara login ke Mikrotik. Peserta didik diajak untuk mengamati dan bertanya (Meaningful).\\n3. **Studi Kasus Sederhana (10 menit):** Guru menyajikan skenario sederhana 'Sebuah kantor kecil ingin memiliki jaringan internet yang terbagi ke beberapa komputer dan perangkat Wi-Fi. Komponen Mikrotik apa saja yang perlu diatur?' Peserta didik secara berpasangan berdiskusi untuk mengidentifikasi komponen Mikrotik yang perlu di-setting. Guru membimbing diskusi untuk memastikan pemahaman konsep dasar (Meaningful, Mindful)."}	{"prinsip": ["Meaningful", "Joyful", "Menggembirakan (Joyful)", "Bermakna (Meaningful)"], "kegiatan": "1. **Demonstrasi Interaktif (15 menit):** Guru mendemonstrasikan langkah-langkah setting dasar Mikrotik (mengganti identitas, konfigurasi IP Address, DHCP Server, DNS, dan Gateway) secara langsung menggunakan perangkat Mikrotik dan Winbox. Guru menjelaskan setiap langkah secara detail dan memberikan kesempatan peserta didik untuk bertanya. (Meaningful)\\n2. **Praktikum Mandiri/Berpasangan (25 menit):** Peserta didik menerima Lembar Kerja Siswa (LKS) yang berisi panduan langkah demi langkah untuk melakukan setting dasar Mikrotik pada perangkat fisik atau virtual yang telah disediakan. Mereka bekerja secara mandiri atau berpasangan. Guru berkeliling untuk memantau, memberikan bimbingan, dan menstimulasi pemikiran kritis dengan pertanyaan seperti 'Jika terjadi error, apa langkah pertama yang akan kamu cek?' (Joyful, Meaningful, Penalaran Kritis).\\n3. **Tantangan Pemecahan Masalah (5 menit):** Guru memberikan tantangan kecil, misalnya 'Setelah setting selesai, coba ping ke google.com. Jika tidak bisa, identifikasi di mana letak masalahnya dan bagaimana solusinya?' Ini mendorong peserta didik untuk menerapkan penalaran kritis dalam menghadapi masalah nyata. (Joyful, Penalaran Kritis)"}	{"prinsip": ["Mindful", "Bermakna (Meaningful)"], "kegiatan": "1. **Refleksi Diri (5 menit):** Setiap peserta didik diminta untuk menuliskan secara singkat (atau menyampaikan secara lisan) tiga hal yang paling menantang dalam proses setting dasar Mikrotik, dua hal yang paling mereka pelajari, dan satu hal yang ingin mereka eksplorasi lebih lanjut. (Mindful)\\n2. **Diskusi Reflektif (3 menit):** Guru memfasilitasi diskusi singkat tentang pengalaman praktikum. 'Bagaimana perasaan kalian setelah berhasil mengkonfigurasi Mikrotik?', 'Apakah kalian menemukan kesulitan? Bagaimana cara kalian mengatasinya?' Ini juga kesempatan untuk mengaitkan kembali dengan dimensi Profil Pelajar Pancasila 'Penalaran Kritis' (bagaimana mereka mengatasi masalah) dan 'Kewargaan' (tanggung jawab dalam melakukan konfigurasi jaringan yang benar)."}	{"prinsip": ["Mindful", "Bermakna (Meaningful)", "Menggembirakan (Joyful)"], "kegiatan": "1. **Rangkuman (2 menit):** Guru bersama peserta didik merangkum poin-poin penting dari materi 'Setting Dasar Mikrotik' yang telah dipelajari.\\n2. **Umpan Balik & Apresiasi (2 menit):** Guru memberikan umpan balik positif atas partisipasi dan usaha peserta didik, serta memberikan apresiasi atas kerja keras mereka. Guru juga menanyakan umpan balik singkat dari peserta didik tentang pembelajaran hari ini.\\n3. **Informasi Lanjutan & Doa (2 menit):** Guru menyampaikan materi atau topik yang akan dibahas pada pertemuan berikutnya dan menutup pembelajaran dengan doa bersama."}	Tidak ada kemitraan dengan pihak luar secara spesifik untuk sesi ini, namun materi ini dapat dikembangkan di kemudian hari dengan praktisi industri.	Laboratorium Komputer yang dilengkapi dengan perangkat Mikrotik RouterBoard (fisik atau virtual/simulasi seperti EVE-NG/GNS3) untuk setiap kelompok/individu, komputer klien, koneksi internet, proyektor, dan papan tulis interaktif. Budaya belajar yang diterapkan adalah kolaboratif, eksploratif, dan berorientasi pada pemecahan masalah, dengan mendorong peserta didik untuk berani mencoba dan belajar dari kesalahan.	Matematika (untuk konsep subnetting IP address), Bahasa Inggris (untuk istilah teknis dan dokumentasi), Pendidikan Pancasila (untuk etika penggunaan teknologi dan keamanan siber).	Setting Dasar Mikrotik	\N	Aplikasi Winbox untuk konfigurasi Mikrotik, perangkat Mikrotik RouterOS (fisik/virtual), browser web untuk akses dokumentasi/referensi online (wiki.mikrotik.com, forum), proyektor untuk demonstrasi, dan mungkin platform LMS untuk berbagi materi/LKS.	Pendekatan Deep Learning dengan model Pembelajaran Berbasis Masalah (Problem-Based Learning) dan Pembelajaran Berbasis Proyek Sederhana (Project-Based Learning). Strategi yang digunakan meliputi demonstrasi interaktif, diskusi kelompok, praktikum mandiri, dan studi kasus. Metode yang diterapkan adalah ceramah singkat, tanya jawab, simulasi, dan praktik langsung (hands-on).	2025-2026	Konfigurasi Dasar Mikrotik RouterOS (Menggunakan Winbox): Pengaturan Identitas Router, Konfigurasi IP Address pada Interface, Konfigurasi DHCP Server, Konfigurasi DNS Client, dan Konfigurasi Gateway (Routing).
cmjsiy5ed000096ud77slyg7m	RPP-DPK-001	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	Pada akhir fase F, peserta didik mampu menerapkan dasar-dasar sistem jaringan komputer, mengidentifikasi komponen jaringan, serta mengimplementasikan konfigurasi dasar jaringan kabel dan nirkabel secara mandiri atau berkelompok untuk mendukung konektivitas data dan informasi.	["Peserta didik mampu menjelaskan konsep dasar jaringan kabel dan nirkabel (jenis, komponen, topologi) dengan tepat setelah mengikuti diskusi dan presentasi. (PENALARAN_KRITIS)", "Peserta didik mampu mengidentifikasi dan membedakan komponen perangkat keras yang diperlukan untuk membangun jaringan kabel dan nirkabel melalui observasi dan eksplorasi. (PENALARAN_KRITIS)", "Peserta didik mampu mengimplementasikan konfigurasi dasar jaringan kabel menggunakan simulasi atau perangkat fisik sederhana secara kolaboratif dalam kelompok. (KREATIFITAS, KOLABORASI)"]	PUBLISHED	t	2025-12-30 11:49:13.811	2026-01-19 03:40:45.278	2026-01-19 03:40:45.276	90	Unjuk kerja/Portofolio: Hasil konfigurasi jaringan kabel dan nirkabel pada perangkat simulasi atau fisik yang diunggah atau didokumentasikan, disertai penjelasan singkat tentang langkah-langkah dan hasil pengujian. Penilaian refleksi individu (kedalaman pemahaman, kesadaran diri terhadap proses belajar).	Observasi partisipasi dan jawaban lisan peserta didik saat apersepsi dan asesmen diagnostik singkat tentang pengetahuan dasar jaringan (misalnya, 'Apa itu IP address?', 'Apa fungsi router?').	Observasi guru selama diskusi kelompok (keaktifan, kolaborasi, kemampuan berargumen, PENALARAN_KRITIS). Observasi performa saat praktikum (ketepatan mengikuti prosedur, kemampuan memecahkan masalah, KREATIFITAS dalam mencari solusi, KOLABORASI). Penilaian lembar kerja praktikum (kelengkapan konfigurasi, hasil pengujian konektivitas).	["PENALARAN_KRITIS", "KREATIFITAS", "KOLABORASI"]	Fase F/X/Ganjil	Materi 'Konfigurasi Jaringan Kabel dan Nirkabel' mencakup pengetahuan konseptual (jenis-jenis jaringan, protokol, topologi) dan prosedural (langkah-langkah konfigurasi perangkat). Materi ini sangat relevan dengan kehidupan sehari-hari peserta didik (penggunaan internet, Wi-Fi) dan menjadi dasar penting dalam program keahlian TKJ. Tingkat kesulitan materi ini moderat, membutuhkan pemahaman teori dasar sebelum dapat diaplikasikan secara praktis. Materi ini mendorong peserta didik untuk berpikir kritis dalam memecahkan masalah konfigurasi.	Peserta didik Fase F di SMK kelas X umumnya berada pada tahap perkembangan kognitif operasional formal, mampu berpikir abstrak namun masih memerlukan konteks konkret. Mereka memiliki tingkat literasi digital yang bervariasi, beberapa mungkin sudah memiliki pengetahuan dasar tentang jaringan dari pengalaman pribadi atau media sosial. Kesiapan belajar mereka dapat beragam, ada yang antusias dengan praktik, ada pula yang lebih suka teori. Minat mereka cenderung pada hal-hal aplikatif dan relevan dengan dunia kerja. Beberapa mungkin memiliki gaya belajar visual, auditori, atau kinestetik. Peserta didik diharapkan dapat bekerja secara kolaboratif dalam kelompok.	{"prinsip": ["Mindful", "Meaningful"], "kegiatan": "1. Guru membuka pelajaran dengan salam dan memimpin doa. (Mindful)\\n2. Guru mengecek kehadiran dan kesiapan belajar peserta didik.\\n3. Guru melakukan apersepsi dengan menampilkan video singkat atau gambar tentang penggunaan jaringan internet dalam kehidupan sehari-hari (misalnya, di rumah, sekolah, tempat kerja) dan menanyakan 'Apa yang kalian ketahui tentang bagaimana perangkat-perangkat ini bisa saling terhubung?' (Meaningful, Mindful)\\n4. Guru menjelaskan tujuan pembelajaran dan manfaat mempelajari konfigurasi jaringan dalam dunia kerja TKJ.\\n5. Guru melakukan asesmen diagnostik singkat (pertanyaan lisan atau polling sederhana) untuk mengetahui pengetahuan awal peserta didik tentang jaringan komputer. Contoh: 'Siapa yang tahu bedanya jaringan kabel dan nirkabel?'"}	{"prinsip": ["Meaningful", "Mindful"], "kegiatan": "1. Peserta didik dibagi menjadi beberapa kelompok kecil (3-4 orang).\\n2. Setiap kelompok diberikan studi kasus sederhana tentang kebutuhan jaringan di sebuah kantor kecil atau rumah. (Meaningful)\\n3. Guru memfasilitasi diskusi kelompok untuk mengidentifikasi jenis-jenis jaringan (LAN, WLAN), komponen utama (router, switch, kabel, NIC, AP), dan topologi dasar yang mungkin digunakan dalam studi kasus tersebut. Peserta didik dapat mencari informasi dari buku paket atau sumber online. (Meaningful, Mindful, PENALARAN_KRITIS)\\n4. Guru memberikan penjelasan singkat dan interaktif tentang konsep-konsep kunci (IP address, subnet mask, gateway, DHCP) yang akan digunakan dalam konfigurasi, menggunakan contoh-contoh yang relevan.\\n5. Setiap kelompok diminta mempresentasikan hasil diskusi awal mereka tentang komponen dan topologi yang akan mereka pilih."}	{"prinsip": ["Meaningful", "Joyful"], "kegiatan": "1. Guru mendemonstrasikan langkah-langkah dasar konfigurasi jaringan kabel pada perangkat lunak simulasi (misalnya, Cisco Packet Tracer) atau perangkat fisik sederhana (misalnya, menghubungkan PC ke switch, memberikan IP address statis). (Meaningful)\\n2. Setiap kelompok menerima lembar kerja praktikum yang berisi skenario konfigurasi dasar jaringan kabel dan nirkabel.\\n3. Peserta didik secara berkelompok memulai praktikum konfigurasi jaringan sesuai skenario, baik menggunakan Cisco Packet Tracer atau perangkat fisik yang tersedia. Mereka diminta untuk mengkonfigurasi IP Address, menguji konektivitas (ping), dan jika memungkinkan, mengkonfigurasi SSID dan password pada perangkat nirkabel. (Meaningful, Joyful, KREATIFITAS, KOLABORASI)\\n4. Guru memfasilitasi dan membimbing peserta didik, memberikan bantuan jika diperlukan, dan mendorong diskusi antar anggota kelompok untuk memecahkan masalah."}	{"prinsip": ["Mindful"], "kegiatan": "1. Setiap kelompok diminta untuk menuliskan secara singkat kendala yang mereka hadapi selama praktikum dan bagaimana mereka mengatasinya.\\n2. Guru memimpin diskusi singkat tentang 'Apa hal baru yang kalian pelajari hari ini?' dan 'Bagian mana dari konfigurasi yang paling menantang dan mengapa?'. (Mindful)\\n3. Peserta didik secara individu menuliskan satu hal penting yang mereka pahami dari pembelajaran hari ini dan satu pertanyaan yang masih ingin mereka ketahui."}	{"prinsip": ["Mindful"], "kegiatan": "1. Guru bersama peserta didik menyimpulkan poin-poin penting pembelajaran hari ini.\\n2. Guru memberikan apresiasi atas partisipasi aktif peserta didik.\\n3. Guru menyampaikan materi untuk pertemuan selanjutnya (misalnya, troubleshooting jaringan sederhana).\\n4. Guru menutup pelajaran dengan doa dan salam."}	Belum ada kemitraan khusus untuk sesi ini.	Laboratorium komputer dengan akses internet dan perangkat lunak simulasi jaringan (misalnya Cisco Packet Tracer) atau laboratorium praktik dengan perangkat jaringan fisik sederhana (switch, router Wi-Fi, kabel UTP, PC/laptop). Budaya belajar yang kolaboratif, saling membantu, dan mendorong eksperimen.	Informatika (algoritma, logika), Matematika (perhitungan IP address, subnetting), Bahasa Indonesia (komunikasi teknis, penulisan laporan).	Konfigurasi Jaringan Kabel dan Nirkabel	\N	Perangkat lunak simulasi jaringan (Cisco Packet Tracer) untuk praktikum virtual. Sumber belajar daring (video tutorial, artikel teknis) untuk eksplorasi mandiri. Media presentasi digital (PowerPoint, Google Slides) untuk penjelasan konsep dan presentasi hasil.	Pembelajaran Berbasis Proyek (Project-Based Learning) atau Pembelajaran Berbasis Masalah (Problem-Based Learning) dengan pendekatan Deep Learning, di mana peserta didik tidak hanya menghafal prosedur tetapi memahami 'mengapa' dan 'bagaimana' suatu konfigurasi bekerja, serta mampu memecahkan masalah. Metode diskusi, demonstrasi, dan praktikum mandiri/kelompok.	2025-2026	Konfigurasi Dasar Jaringan Kabel (LAN) dan Jaringan Nirkabel (WLAN) menggunakan perangkat simulasi atau perangkat fisik sederhana (router, switch, kabel UTP).
cmkkmg04f00018xpvkzn52tcn	RPP-01	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	Pada akhir Fase E, peserta didik mampu mengidentifikasi berbagai profesi dan peluang kewirausahaan di bidang Teknik Jaringan Komputer dan Telekomunikasi, serta merancang ide bisnis sederhana berdasarkan analisis kebutuhan pasar dan perkembangan teknologi.	["Peserta didik mampu mengidentifikasi minimal 5 jenis profesi di bidang Teknik Jaringan Komputer dan Telekomunikasi dengan tepat setelah melakukan riset kelompok.", "Peserta didik mampu menganalisis peluang dan tantangan kewirausahaan di bidang Teknik Jaringan Komputer dan Telekomunikasi melalui studi kasus sederhana secara kolaboratif.", "Peserta didik terampil menyusun ide bisnis sederhana yang relevan dengan kebutuhan pasar di bidang Teknik Jaringan Komputer dan Telekomunikasi, ditunjukkan dengan hasil presentasi yang kreatif.", "Peserta didik menunjukkan sikap proaktif, mandiri, dan bertanggung jawab dalam mencari informasi serta berkolaborasi dalam kelompok terkait profesi dan kewirausahaan."]	PUBLISHED	t	2026-01-19 03:44:38.558	2026-01-19 03:44:38.558	\N	90	1. Produk Proyek (Poster Digital/Infografis/Presentasi): Penilaian berdasarkan rubrik yang mencakup aspek: kelengkapan informasi, kedalaman analisis (PENALARAN KRITIS), kreativitas visual (KREATIFITAS), dan kejelasan penyampaian ide (KOMUNIKASI).\n2. Jurnal Refleksi Individu: Penilaian terhadap kedalaman refleksi, pemahaman diri, dan rencana pengembangan diri peserta didik (KEMANDIRIAN, Mindful).\n3. Presentasi Kelompok: Penilaian kemampuan presentasi, penguasaan materi, dan respons terhadap pertanyaan (KOMUNIKASI, PENALARAN KRITIS).	1. Kuesioner singkat atau Curah Pendapat: Guru menanyakan 'Apa saja profesi di bidang komputer/jaringan yang kalian ketahui?' dan 'Menurut kalian, apa itu wirausaha? Berikan contohnya!' untuk mengidentifikasi pengetahuan awal dan miskonsepsi.\n2. Pertanyaan Pancingan: Guru mengajukan pertanyaan 'Apa cita-cita karirmu di masa depan?' atau 'Jika kamu bisa menciptakan sesuatu dengan teknologi jaringan, apa itu?' untuk mengetahui minat dan potensi awal.	1. Observasi Partisipasi Diskusi: Guru mengamati keaktifan peserta didik dalam diskusi kelompok dan kelas, serta kemampuan mereka dalam menyampaikan ide dan mendengarkan pendapat orang lain (KOMUNIKASI, KOLABORASI).\n2. Rubrik Penilaian Kinerja Kelompok: Penilaian terhadap proses riset, pembagian tugas, dan kerja sama dalam kelompok (KOLABORASI, KEMANDIRIAN).\n3. Catatan Anekdot: Guru mencatat perilaku atau respons peserta didik yang menonjol terkait dimensi Profil Pelajar Pancasila (misalnya, inisiatif dalam riset, kemampuan menganalisis masalah, kreativitas dalam ide).	["KREATIFITAS", "KOLABORASI", "PENALARAN_KRITIS", "KEMANDIRIAN", "KOMUNIKASI"]	Fase E-X-Genap	Materi Profesi dan Kewirausahaan di bidang Teknik Jaringan Komputer dan Telekomunikasi mencakup jenis pengetahuan konseptual (definisi profesi, konsep kewirausahaan, peluang dan tantangan), faktual (contoh-contoh profesi spesifik, tokoh wirausaha sukses), dan prosedural (langkah-langkah identifikasi peluang, pengembangan ide bisnis sederhana, riset pasar). Materi ini sangat relevan dengan kehidupan peserta didik karena secara langsung mempersiapkan mereka untuk masa depan karir dan potensi menjadi seorang wirausahawan di bidang yang mereka pelajari. Tingkat kesulitan materi ini tergolong sedang, karena membutuhkan pemahaman konsep dasar, kemampuan analisis, serta kreativitas dalam mengembangkan ide. Relevansinya tinggi untuk menumbuhkan motivasi belajar dan memberikan gambaran nyata tentang aplikasi ilmu TKJ.	Peserta didik pada Fase E (kelas X) memiliki rentang usia remaja, menunjukkan minat yang bervariasi terhadap teknologi informasi, khususnya di bidang jaringan komputer. Sebagian besar memiliki pengetahuan dasar tentang penggunaan komputer dan internet, namun pemahaman tentang profesi dan potensi kewirausahaan di bidang TKJ mungkin masih terbatas. Mereka cenderung antusias dalam kegiatan kelompok dan membutuhkan bimbingan untuk mengembangkan kemampuan analisis dan presentasi. Beberapa peserta didik mungkin memiliki gaya belajar visual, auditori, atau kinestetik yang berbeda, sehingga pendekatan pembelajaran perlu mengakomodasi keragaman ini. Kesiapan belajar mereka bervariasi; beberapa mungkin sudah memiliki gambaran karir, sementara yang lain masih dalam tahap eksplorasi.	{"prinsip": ["Mindful", "Meaningful"], "kegiatan": "1. Pembukaan dan Doa: Guru membuka pelajaran dengan salam dan memimpin doa bersama untuk menciptakan suasana yang tenang dan fokus (Mindful).\\n2. Presensi dan Pengecekan Kesiapan Belajar: Guru mengecek kehadiran dan kesiapan peserta didik, serta menanyakan kabar untuk membangun koneksi awal.\\n3. Apersepsi: Guru memancing pengetahuan awal dan minat peserta didik dengan pertanyaan 'Apa cita-cita kalian setelah lulus SMK?' atau 'Profesi apa yang kalian bayangkan di bidang jaringan komputer?' Kemudian, guru menampilkan beberapa gambar atau video singkat tentang profesi unik di bidang TKJ untuk membangkitkan rasa ingin tahu (Meaningful).\\n4. Penyampaian Tujuan Pembelajaran: Guru menyampaikan tujuan pembelajaran yang akan dicapai dan relevansi materi dengan masa depan karir peserta didik, serta mengaitkannya dengan dimensi Profil Pelajar Pancasila yang akan dikembangkan."}	{"prinsip": ["Meaningful", "Mindful"], "kegiatan": "1. Brainstorming Profesi: Guru meminta peserta didik secara individu menuliskan profesi yang mereka ketahui di bidang TKJ. Kemudian, secara bergantian mereka berbagi dan guru mencatatnya di papan tulis, mendorong partisipasi aktif (Meaningful).\\n2. Studi Kasus Inspiratif: Guru menampilkan video atau artikel tentang seorang profesional TKJ yang sukses atau seorang wirausaha muda yang merintis startup di bidang telekomunikasi. Peserta didik diminta untuk menyimak dan mencatat poin-poin penting (Mindful).\\n3. Diskusi Kelompok Awal: Peserta didik dibagi menjadi beberapa kelompok. Setiap kelompok mendiskusikan 'Apa saja jenis profesi yang ada di bidang TKJ berdasarkan video/artikel dan pengetahuan awal kalian?' serta 'Apa yang dimaksud dengan kewirausahaan di bidang ini dan mengapa penting?' (Meaningful).\\n4. Penguatan Konsep: Guru memfasilitasi diskusi kelas dan memberikan penguatan konsep tentang berbagai jenis profesi di bidang TKJ (misalnya, network engineer, cybersecurity specialist, cloud architect, teknisi telekomunikasi) dan konsep dasar kewirausahaan (identifikasi masalah, solusi, nilai tambah). Guru juga mengaitkan dengan pentingnya PENALARAN KRITIS dalam melihat peluang dan tantangan."}	{"prinsip": ["Meaningful", "Joyful"], "kegiatan": "1. Pembentukan Kelompok Proyek: Peserta didik dibagi menjadi kelompok-kelompok kecil (4-5 orang). Setiap kelompok akan berkolaborasi dalam proyek riset dan pengembangan ide (KOLABORASI).\\n2. Pemilihan Topik Proyek: Setiap kelompok memilih salah satu dari dua opsi proyek: a) Eksplorasi mendalam 1-2 profesi di bidang TKJ, atau b) Pengembangan ide bisnis sederhana di bidang Teknik Jaringan Komputer dan Telekomunikasi. Pilihan ini disesuaikan dengan minat kelompok (Meaningful, Joyful).\\n3. Riset Kolaboratif: Dengan memanfaatkan sumber daya digital (internet, video, artikel), setiap kelompok melakukan riset mendalam. Untuk opsi profesi, mereka mencari tahu deskripsi pekerjaan, kualifikasi, prospek karir, dan rata-rata penghasilan. Untuk opsi ide bisnis, mereka mengidentifikasi masalah di sekitar mereka yang bisa diselesaikan dengan teknologi jaringan/telekomunikasi, merumuskan solusi, target pasar, dan keunikan ide (KEMANDIRIAN, PENALARAN KRITIS).\\n4. Penyusunan Produk Kreatif: Berdasarkan hasil riset, setiap kelompok membuat produk presentasi yang kreatif dan menarik. Produk bisa berupa poster digital, infografis, atau slide presentasi menggunakan Google Slides/Canva. Produk ini harus secara jelas memaparkan hasil riset atau ide bisnis mereka (KREATIFITAS).\\n5. Presentasi dan Sesi Tanya Jawab: Setiap kelompok mempresentasikan hasil proyeknya di depan kelas dalam waktu singkat (5-7 menit). Setelah presentasi, dibuka sesi tanya jawab dan umpan balik dari kelompok lain dan guru. Guru mengamati kemampuan KOMUNIKASI dan KOLABORASI antar anggota kelompok."}	{"prinsip": ["Mindful"], "kegiatan": "1. Refleksi Individu: Guru meminta setiap peserta didik untuk menuliskan refleksi singkat dalam jurnal belajar mereka dengan pertanyaan panduan: 'Apa pengetahuan baru yang paling berkesan bagi saya hari ini?', 'Bagaimana relevansi materi ini dengan cita-cita atau minat saya?', 'Bagaimana saya bisa mengembangkan diri lebih lanjut di bidang ini?', dan 'Pelajaran apa yang saya dapatkan dari proses kolaborasi kelompok?' (Mindful).\\n2. Refleksi Kelompok: Setiap kelompok mendiskusikan: 'Apa tantangan terbesar yang kami hadapi saat mengerjakan proyek dan bagaimana kami mengatasinya?', 'Bagaimana kami bisa meningkatkan kolaborasi di masa depan?', 'Apa yang paling kami nikmati dari kegiatan ini?'.\\n3. Diskusi Reflektif Kelas: Guru memfasilitasi diskusi kelas singkat, meminta beberapa peserta didik atau perwakilan kelompok untuk berbagi hasil refleksinya. Guru mengaitkan pengalaman belajar dengan pengembangan dimensi Profil Pelajar Pancasila seperti KEMANDIRIAN, KREATIFITAS, dan KOLABORASI."}	{"prinsip": ["Mindful"], "kegiatan": "1. Rangkuman Pembelajaran: Guru bersama peserta didik merangkum poin-poin penting yang telah dipelajari tentang profesi dan kewirausahaan di bidang TKJ (Mindful).\\n2. Apresiasi dan Motivasi: Guru memberikan apresiasi atas partisipasi aktif dan hasil kerja keras peserta didik. Guru juga memberikan motivasi untuk terus belajar dan berani mengeksplorasi potensi diri di bidang TKJ.\\n3. Tindak Lanjut: Guru memberikan informasi mengenai sumber belajar tambahan atau kegiatan yang relevan (misalnya, webinar, kunjungan industri virtual) untuk memperkaya wawasan peserta didik.\\n4. Doa Penutup: Guru memimpin doa penutup dan mengucapkan salam."}	Sekolah dapat menjalin kemitraan dengan alumni yang telah sukses berkarir atau merintis usaha di bidang TKJ, atau dengan praktisi industri lokal untuk menjadi narasumber inspiratif. Kemitraan ini bertujuan untuk memberikan wawasan langsung dari dunia kerja dan kewirausahaan.	Setting ruang fisik dirancang interaktif dan fleksibel, memungkinkan peserta didik untuk bekerja secara individu, berpasangan, atau dalam kelompok kecil. Tersedia akses ke laboratorium komputer dengan koneksi internet yang stabil. Lingkungan virtual didukung oleh platform e-learning sekolah atau grup komunikasi kelas untuk berbagi materi dan hasil kerja. Budaya belajar yang dikembangkan adalah budaya kolaboratif, saling menghargai ide, mendorong inovasi, dan berani mengambil risiko untuk mencoba hal baru.	Ekonomi (konsep kewirausahaan, analisis pasar), Bahasa Indonesia (keterampilan presentasi dan komunikasi efektif), Informatika (penggunaan perangkat lunak presentasi dan riset digital), PPKn (etika profesi, tanggung jawab sosial wirausaha).	Profesi dan Kewirausahaan di bidang Teknik Jaringan Komputer dan Telekomunikasi	\N	Pemanfaatan teknologi digital meliputi: internet untuk riset profesi dan peluang kewirausahaan, Google Docs/Slides/Canva untuk kolaborasi penyusunan laporan atau presentasi ide bisnis, YouTube atau platform video edukasi lainnya untuk studi kasus video inspiratif mengenai profesional atau wirausaha di bidang TKJ, serta platform e-learning untuk pengumpulan tugas dan sumber belajar tambahan.	Model Pembelajaran: Project-Based Learning (PBL) dengan pendekatan Deep Learning. Peserta didik akan terlibat dalam proyek riset dan pengembangan ide bisnis sederhana yang memungkinkan mereka menggali materi secara mendalam, menghubungkan konsep dengan dunia nyata, dan membangun pengetahuan secara aktif. Strategi Pembelajaran: Diskusi interaktif, studi kasus, riset kolaboratif, presentasi kelompok, dan curah pendapat. Metode Pembelajaran: Inkuiri (penyelidikan mandiri), pembelajaran berbasis masalah, dan pembelajaran kooperatif.	2025-2026	Eksplorasi Profesi, Peluang Kewirausahaan, dan Pengembangan Ide Bisnis Inovatif di Bidang Teknik Jaringan Komputer dan Telekomunikasi.
\.


--
-- Data for Name: RPPKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RPPKelas" (id, "rppId", "kelasId", "createdAt") FROM stdin;
cmjsihj3c0001v5ud9ro4r2zv	cmjsihj2y0000v5ud7f0f6syr	cmj5eca0k0004jsuddjewnal1	2025-12-30 11:36:18.407
cmjsiy5eo000196ud9fcg2fmm	cmjsiy5ed000096ud77slyg7m	cmj5eca0e0003jsud1uxj50o4	2025-12-30 11:49:13.823
cmkkmg04o00028xpv806kdau9	cmkkmg04f00018xpvkzn52tcn	cmj5eca0e0003jsud1uxj50o4	2026-01-19 03:44:38.568
\.


--
-- Data for Name: Settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Settings" (id, key, value, "createdAt", "updatedAt") FROM stdin;
cmjaxivkf0000u0udfciy166n	late_time_threshold	07:00	2025-12-18 04:17:24.303	2025-12-18 04:17:24.303
cmjsjzanb0001hkudfdbzvco7	school_address	Situbondo	2025-12-30 12:18:06.887	2025-12-30 13:50:02.082
cmjsjzana0000hkudwsylon6p	school_name	SMKS PGRI Banyuputih	2025-12-30 12:18:06.886	2025-12-30 13:50:02.082
cmjsjzanb0002hkudh035yqke	school_phone	08563682390	2025-12-30 12:18:06.887	2025-12-30 13:50:02.083
cmjsjzane000ahkudr287pppa	school_youtube	@esgriba	2025-12-30 12:18:06.89	2025-12-30 13:50:02.086
cmjsjzand0007hkudpkcf2o7s	school_logo	-	2025-12-30 12:18:06.889	2025-12-30 13:50:02.085
cmjsjzanc0005hkudpnvxj2fh	school_principal_name	Irawan Adi Wasito, S.T.	2025-12-30 12:18:06.888	2025-12-30 13:50:02.084
cmjsjzand0006hkudwelpwbui	school_principal_nip	-	2025-12-30 12:18:06.888	2025-12-30 13:50:02.084
cmjsjzane0009hkud5c30rbb7	school_facebook	@esgriba	2025-12-30 12:18:06.889	2025-12-30 13:50:02.086
cmjsjzanc0003hkude4xm6g20	school_email	esgriba20522645@gmail.com	2025-12-30 12:18:06.887	2025-12-30 13:50:02.083
cmjsjzanc0004hkud3a36orf8	school_website	https://www.smkpgribanyuputih.sch.id/	2025-12-30 12:18:06.888	2025-12-30 13:50:02.084
cmjsjzand0008hkudtjodll1q	school_instagram	@esgriba	2025-12-30 12:18:06.889	2025-12-30 13:50:02.085
\.


--
-- Data for Name: Siswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Siswa" (id, nisn, nama, "tanggalLahir", alamat, "nomorTelepon", email, status, "createdAt", "updatedAt", "deletedAt", "kelasId", "userId", "tahunAjaranId", agama) FROM stdin;
cmj5gwyqw000135udakhyrrna	81475874	ABI HARTO WICAKSONO	1970-01-01 00:00:38.367	Jl. Merdeka No. 123	81234567890	abihartowicaksono@cbt.com	AKTIF	2025-12-14 08:33:37.255	2025-12-14 08:33:37.255	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwyql000035udj9kefx0z	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwysk000335ud06zbjkum	95805399	ADAM SYAHREZA GUMILANG	1970-01-01 00:00:38.431	Jl. Sudirman No. 45	81234567891	adamsyahrezagumilang@cbt.com	AKTIF	2025-12-14 08:33:37.315	2025-12-14 08:33:37.315	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwysf000235udeqpf8mo9	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwyu3000535udp8xm32kg	3088037976	ADITIYA RIZKY BAYU PRADIKA	1970-01-01 00:00:38.431	Jl. Sudirman No. 46	81234567892	aditiyarizkybayupradika@cbt.com	AKTIF	2025-12-14 08:33:37.371	2025-12-14 08:33:37.371	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwytz000435ud3k5i6zne	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz0g000d35ud5n8q889d	77382296	AGUNG TRISNA DEWI	1970-01-01 00:00:38.431	Jl. Sudirman No. 50	81234567896	agungtrisnadewi@cbt.com	AKTIF	2025-12-14 08:33:37.599	2025-12-14 08:33:37.599	\N	cmj5eca050002jsudq5rc3oa3	cmj5gwz0c000c35udn9g3zoan	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz3n000h35udillr14ag	99461767	AHMAD DIMAS KURNIAWAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 52	81234567898	example1@cbt.com	AKTIF	2025-12-14 08:33:37.714	2025-12-14 08:33:37.714	\N	cmj5eca0w0006jsud9bca11b3	cmj5gwz3i000g35udydzzmr53	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz6t000l35ud8wsvgkyz	99396650	AINO YOEL	1970-01-01 00:00:38.431	Jl. Sudirman No. 54	81234567900	example2@cbt.com	AKTIF	2025-12-14 08:33:37.828	2025-12-14 08:33:37.828	\N	cmj5eca0w0006jsud9bca11b3	cmj5gwz6p000k35ud68fsf33i	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz8c000n35ud8pxa34ep	50397766	AINUR ROHMAH	1970-01-01 00:00:38.431	Jl. Sudirman No. 55	81234567901	ainurrohmah@cbt.com	AKTIF	2025-12-14 08:33:37.883	2025-12-14 08:33:37.883	\N	cmj5ec9zx0001jsud5cnf1k74	cmj5gwz88000m35ud5x4ctx7s	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzg0000x35udzy1o8cpn	97759070	ALIFATUR ROSIKIN	1970-01-01 00:00:38.431	Jl. Sudirman No. 60	81234567906	alifaturrosikin@cbt.com	AKTIF	2025-12-14 08:33:38.16	2025-12-14 08:33:38.16	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwzfw000w35udzc26ap9b	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzhi000z35udkij11ubh	85609468	AMELIA DEWI SINTA	1970-01-01 00:00:38.431	Jl. Sudirman No. 61	81234567907	ameliadewisinta@cbt.com	AKTIF	2025-12-14 08:33:38.214	2025-12-14 08:33:38.214	\N	cmj5eca050002jsudq5rc3oa3	cmj5gwzhe000y35udg8o4lrsn	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzj2001135udp7u21il5	94461900	ANANDA MAYCKO WIJAYA	1970-01-01 00:00:38.431	Jl. Sudirman No. 62	81234567908	example3@cbt.com	AKTIF	2025-12-14 08:33:38.269	2025-12-14 08:33:38.269	\N	cmj5eca0w0006jsud9bca11b3	cmj5gwziy001035udhbgntn1o	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzkk001335uddaybproj	88279036	ANDHIKA BAYU SAPUTRA	1970-01-01 00:00:38.431	Jl. Sudirman No. 63	81234567909	andhikabayusaputra@cbt.com	AKTIF	2025-12-14 08:33:38.324	2025-12-14 08:33:38.324	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwzkg001235uda1zowq2b	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzm3001535ud35s55raa	104207471	ANGGA CAHYO PRATAMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 64	81234567910	example4@cbt.com	AKTIF	2025-12-14 08:33:38.378	2025-12-14 08:33:38.378	\N	cmj5eca0w0006jsud9bca11b3	cmj5gwzlz001435udoar1p1ou	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwznm001735udpzuadsi6	87785971	ANGGI VIRNANDA PUTRI	1970-01-01 00:00:38.431	Jl. Sudirman No. 65	81234567911	anggivirnandaputri@cbt.com	AKTIF	2025-12-14 08:33:38.434	2025-12-14 08:33:38.434	\N	cmj5ec9zx0001jsud5cnf1k74	cmj5gwzni001635udt2intkub	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzp6001935udi39qku1d	3080015591	AWANG SETIAWAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 66	81234567912	awangsetiawan@cbt.com	AKTIF	2025-12-14 08:33:38.489	2025-12-14 08:33:38.489	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwzp2001835udtswr5q1s	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzqp001b35udoas61cxe	95325705	AYUNI ARIMBI	1970-01-01 00:00:38.431	Jl. Sudirman No. 67	81234567913	example25@cbt.com	AKTIF	2025-12-14 08:33:38.544	2025-12-14 08:33:38.544	\N	cmj5ec9zf0000jsudgpxci2hf	cmj5gwzql001a35udfoqzqfcv	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzs8001d35ud78grtko5	88137615	AZAI DENIS SAFARULLAH	1970-01-01 00:00:38.431	Jl. Sudirman No. 68	81234567914	example5@cbt.com	AKTIF	2025-12-14 08:33:38.599	2025-12-14 08:33:38.599	\N	cmj5eca0w0006jsud9bca11b3	cmj5gwzs4001c35udaqgx22e1	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzv9001h35udc6lry71w	85744170	BAGUS SETIAWAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 70	81234567916	bagussetiawan@cbt.com	AKTIF	2025-12-14 08:33:38.708	2025-12-14 08:33:38.708	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwzv5001g35ud5bbn2qzz	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzws001j35ud376v2a11	3096187956	CANDRA PRATAMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 71	81234567917	example6@cbt.com	AKTIF	2025-12-14 08:33:38.764	2025-12-14 08:33:38.764	\N	cmj5eca0w0006jsud9bca11b3	cmj5gwzwo001i35uduhbzcboi	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzzu001n35udi1ekaazg	3080427888	DAVA PUTRA PRASETYA	1970-01-01 00:00:38.431	Jl. Sudirman No. 73	81234567919	davaputraprasetya@cbt.com	AKTIF	2025-12-14 08:33:38.874	2025-12-14 08:33:38.874	\N	cmj5eca130007jsudvzwt5rjx	cmj5gwzzr001m35udpblpr5c0	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzbe000r35ud3dm0w5mp	57279011	ALDO ILFAN PRATAMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 57	81234567903	aldoilfanpratama@cbt.com	AKTIF	2025-12-14 08:33:37.994	2025-12-16 12:33:14.38	\N	cmj5eca170008jsudb4r1h58n	cmj5gwzb9000q35uds8mmj6bl	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz58000j35ud2jgpgotd	86817502	AHMAD RIAN ZUHRI AFANDI	1970-01-01 00:00:38.431	Jl. Sudirman No. 53	81234567899	ahmadrianzuhriafandi@cbt.com	AKTIF	2025-12-14 08:33:37.771	2025-12-16 12:33:17.609	\N	cmj5eca170008jsudb4r1h58n	cmj5gwz53000i35udw6fgqktc	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwyyw000b35udpo5b2m4t	76544902	ADRIANO DWI PRADHITA	1970-01-01 00:00:38.431	Jl. Sudirman No. 49	81234567895	adrianodwipradhita@cbt.com	AKTIF	2025-12-14 08:33:37.543	2025-12-16 12:33:21.091	\N	cmj5eca170008jsudb4r1h58n	cmj5gwyyq000a35udwqnc8ohp	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzcy000t35ud1wibxk47	78367595	ALFA TRI EFENDI	1970-01-01 00:00:38.431	Jl. Sudirman No. 58	81234567904	alfatriefendi@cbt.com	AKTIF	2025-12-14 08:33:38.049	2025-12-16 12:33:11.1	\N	cmj5eca170008jsudb4r1h58n	cmj5gwzct000s35udllh69h8u	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx02w001r35ud6qdfidog	86514583	DENDI BAYU PRATAMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 75	81234567921	dendibayupratama@cbt.com	AKTIF	2025-12-14 08:33:38.983	2025-12-14 08:33:38.983	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx02s001q35udsc32mvtz	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzeh000v35udwd1xnzk8	0097678393	ALFAZA OKTAVINO PRADITIA	1970-01-01 00:00:38.431	Jl. Sudirman No. 59	81234567905	example13@cbt.com	AKTIF	2025-12-14 08:33:38.105	2026-01-19 02:54:04.773	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gwzed000u35udlnddwq47	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwztr001f35udgp2iqne6	0099940723	BADRIA NUR ANISA	1970-01-01 00:00:38.431	Jl. Sudirman No. 69	81234567915	example14@cbt.com	AKTIF	2025-12-14 08:33:38.654	2026-01-19 02:54:10.324	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gwztn001e35udd3b8c4mg	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwyvo000735udytelfevq	0084194598	ADITYA CATUR PRAYOGO	1970-01-01 00:00:38.431	Jl. Sudirman No. 47	81234567893	adityacaturprayogo@cbt.com	AKTIF	2025-12-14 08:33:37.427	2026-03-05 01:18:07.777	\N	cmj5eca0o0005jsud0ambwla7	cmj5gwyvj000635udzcqos5da	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz23000f35udoygf650d	0086881070	AGUS WIRA ADI PURNOMO	1970-01-01 00:00:38.431	Jl. Sudirman No. 51	81234567897	aguswiraadipurnomo@cbt.com	AKTIF	2025-12-14 08:33:37.659	2026-03-05 01:18:16.047	\N	cmj5eca0o0005jsud0ambwla7	cmj5gwz1y000e35udzacwpk0x	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwz9u000p35uddazsd00z	0079686226	ALDI PRAYATNA	1970-01-01 00:00:38.431	Jl. Sudirman No. 56	81234567902	aldiprayatna@cbt.com	AKTIF	2025-12-14 08:33:37.937	2026-03-05 01:18:22.627	\N	cmj5eca0o0005jsud0ambwla7	cmj5gwz9q000o35ud7f7d7ltw	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx01e001p35udcjqmly7n	0075360603	DEFI NINGTYAS	1970-01-01 00:00:38.431	Jl. Sudirman No. 74	81234567920	definingtyas@cbt.com	AKTIF	2025-12-14 08:33:38.929	2026-03-05 01:18:30.261	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx01a001o35udcz1uye9r	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx07f001x35udj3ispkx8	74612857	DINA RIZA AYU MATUSSHOLEHA	1970-01-01 00:00:38.431	Jl. Sudirman No. 78	81234567924	dinarizaayumatussholeha@cbt.com	AKTIF	2025-12-14 08:33:39.147	2025-12-14 08:33:39.147	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx07b001w35ud6uy774vt	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0ag002135ud9fhzdekh	84607003	DIZA YOGA YUDISTIA	1970-01-01 00:00:38.431	Jl. Sudirman No. 80	81234567926	dizayogayudistia@cbt.com	AKTIF	2025-12-14 08:33:39.256	2025-12-14 08:33:39.256	\N	cmj5ec9zx0001jsud5cnf1k74	cmj5gx0ac002035udfnj8z7vm	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0ez002735ud6aegx8z1	83725353	EKA DEVI AINUROHMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 83	81234567929	ekadeviainurohma@cbt.com	AKTIF	2025-12-14 08:33:39.419	2025-12-14 08:33:39.419	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx0ev002635udvv65yg6g	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0jj002d35udjlza7xue	82535073	FAHMI ADLIYANTO	1970-01-01 00:00:38.431	Jl. Sudirman No. 86	81234567932	fahmiadliyanto@cbt.com	AKTIF	2025-12-14 08:33:39.582	2025-12-14 08:33:39.582	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx0jf002c35udq9gtxbg2	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0l0002f35ud6j2sufzk	3087966253	FAREL ADITYA PUTRA	1970-01-01 00:00:38.431	Jl. Sudirman No. 87	81234567933	fareladityaputra@cbt.com	AKTIF	2025-12-14 08:33:39.635	2025-12-14 08:33:39.635	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx0kw002e35ud03ae2xo1	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0pm002l35udhnyriry6	83278579	FIOLA SEPTIANA RAMADANI	1970-01-01 00:00:38.431	Jl. Sudirman No. 90	81234567936	fiolaseptianaramadani@cbt.com	AKTIF	2025-12-14 08:33:39.802	2025-12-14 08:33:39.802	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx0pi002k35udwebdytrh	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0sm002p35udzxd3mus1	73255473	FITRIANA EKA AMELIA	1970-01-01 00:00:38.431	Jl. Sudirman No. 92	81234567938	fitrianaekaamelia@cbt.com	AKTIF	2025-12-14 08:33:39.91	2025-12-14 08:33:39.91	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx0si002o35ud2jnff2tj	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0u3002r35udqkenscl3	81943244	HERNANDA WILDAN FIRDAUSI	1970-01-01 00:00:38.431	Jl. Sudirman No. 93	81234567939	hernandawildanfirdausi@cbt.com	AKTIF	2025-12-14 08:33:39.962	2025-12-14 08:33:39.962	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx0tz002q35udykvj7rwf	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0vl002t35udzzptrcos	91150081	HUMAM FAUZI YANTO	1970-01-01 00:00:38.431	Jl. Sudirman No. 94	81234567940	example7@cbt.com	AKTIF	2025-12-14 08:33:40.017	2025-12-14 08:33:40.017	\N	cmj5eca0w0006jsud9bca11b3	cmj5gx0vh002s35udu1n8yl9k	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0ym002x35udzhcjnau4	83877893	INA AZRIANA DEVI	1970-01-01 00:00:38.431	Jl. Sudirman No. 96	81234567942	inaazrianadevi@cbt.com	AKTIF	2025-12-14 08:33:40.125	2025-12-14 08:33:40.125	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx0yj002w35ud8v9qi589	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx11k003135ud73cds1fi	93398824	JENI EKA NURSABELA	1970-01-01 00:00:38.431	Jl. Sudirman No. 98	81234567944	jeniekanursabela@cbt.com	AKTIF	2025-12-14 08:33:40.232	2025-12-14 08:33:40.232	\N	cmj5ec9zx0001jsud5cnf1k74	cmj5gx11g003035ud3bx82k5d	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx131003335ud6cxmwwir	27420464	JESEN ARDIYANTO	1970-01-01 00:00:38.431	Jl. Sudirman No. 99	81234567945	jesenardiyanto@cbt.com	AKTIF	2025-12-14 08:33:40.285	2025-12-14 08:33:40.285	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx12x003235udw6jxtx4r	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx14k003535udo7rhjcnp	71482878	JESIKA MARTA AL-ZAHRA	1970-01-01 00:00:38.431	Jl. Sudirman No. 100	81234567946	jesikamartaal-zahra@cbt.com	AKTIF	2025-12-14 08:33:40.339	2025-12-14 08:33:40.339	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx14g003435ud6w8b4goi	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx193003b35udn6l73ohj	3102507572	KEVIN MAULANA ISHAQ	1970-01-01 00:00:38.431	Jl. Sudirman No. 103	81234567949	example8@cbt.com	AKTIF	2025-12-14 08:33:40.503	2025-12-14 08:33:40.503	\N	cmj5eca0w0006jsud9bca11b3	cmj5gx18z003a35udlra3qj4l	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1dj003h35udb14ouf8y	82219934	LIANA RANTIKA PUTRI	1970-01-01 00:00:38.431	Jl. Sudirman No. 106	81234567952	lianarantikaputri@cbt.com	AKTIF	2025-12-14 08:33:40.663	2025-12-14 08:33:40.663	\N	cmj5ec9zx0001jsud5cnf1k74	cmj5gx1dg003g35udnuykpero	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1f1003j35udutcxv8c7	81662471	LIVIAN AYUNING UTAMI	1970-01-01 00:00:38.431	Jl. Sudirman No. 107	81234567953	livianayuningutami@cbt.com	AKTIF	2025-12-14 08:33:40.717	2025-12-14 08:33:40.717	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx1ex003i35ud2tmr6ezm	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1gj003l35udh98cts8w	94280655	LUCKY ADITYA PRATAMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 108	81234567954	luckyadityapratama@cbt.com	AKTIF	2025-12-14 08:33:40.77	2025-12-14 08:33:40.77	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx1gf003k35udqn4te1zt	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0o3002j35uda0ok0i4j	0108026037	FERDIO PUTRA PRASETYA	1970-01-01 00:00:38.431	Jl. Sudirman No. 89	81234567935	example16@cbt.com	AKTIF	2025-12-14 08:33:39.747	2026-01-19 02:54:24.844	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx0nz002i35udbi0v5c4g	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx17k003935udaewx76ro	0098437959	KETUT DIMAS MUHAMAD RISAL	1970-01-01 00:00:38.431	Jl. Sudirman No. 102	81234567948	example17@cbt.com	AKTIF	2025-12-14 08:33:40.447	2026-01-19 02:54:31.453	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx17g003835uduzmy772u	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx08y001z35udsqo698l8	0088236354	DINO ABI PRATAMA	1970-01-01 00:00:38.431	Jl. Sudirman No. 79	81234567925	dinoabipratama@cbt.com	AKTIF	2025-12-14 08:33:39.201	2026-01-27 00:19:13.278	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx08u001y35udh95b095v	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0ml002h35udvjc8yzeb	0078956609	FATURROHMAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 88	81234567934	faturrohman@cbt.com	AKTIF	2025-12-14 08:33:39.692	2026-01-27 00:19:19.234	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx0mf002g35udp7fvgdod	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0r4002n35ud6i7qxccl	0091017410	FIQI ADITIA	1970-01-01 00:00:38.431	Jl. Sudirman No. 91	81234567937	fiqiaditia@cbt.com	AKTIF	2025-12-14 08:33:39.855	2026-01-27 00:19:24.502	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx0r0002m35udzu8e92kf	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0x4002v35udz7qohe6d	0082276835	ICHA JUWITA	1970-01-01 00:00:38.431	Jl. Sudirman No. 95	81234567941	ichajuwita@cbt.com	AKTIF	2025-12-14 08:33:40.072	2026-01-27 00:19:30.859	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx0x0002u35udc7ccpufd	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx103002z35udn2m30zv3	3083956550	INTAN BALQIS HUMAIRO	1970-01-01 00:00:38.431	Jl. Sudirman No. 97	81234567943	intanbalqishumairo@cbt.com	AKTIF	2025-12-14 08:33:40.178	2026-01-27 00:19:36.728	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx100002y35udilmg1ny8	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx05x001v35udwd5nk8nj	0071300771	DEWI WAHYUNI	1970-01-01 00:00:38.431	Jl. Sudirman No. 77	81234567923	dewiwahyuni@cbt.com	AKTIF	2025-12-14 08:33:39.093	2026-03-05 01:18:37.173	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx05t001u35ud56w1gpg0	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0di002535ud32uasdbw	0085947084	DWI SINTIA PUTRI	1970-01-01 00:00:38.431	Jl. Sudirman No. 82	81234567928	dwisintiaputri@cbt.com	AKTIF	2025-12-14 08:33:39.365	2026-03-05 01:18:44.5	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx0de002435ud24zdsw0s	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0gi002935udl20nfbog	0024142799	ENGGAR DWI PRASETYO	1970-01-01 00:00:38.431	Jl. Sudirman No. 84	81234567930	enggardwiprasetyo@cbt.com	AKTIF	2025-12-14 08:33:39.474	2026-03-05 01:18:53.614	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx0gd002835udbw0sqmi6	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0i0002b35ud19a6xd7r	0076887989	ESA AGIL PUTRA	1970-01-01 00:00:38.431	Jl. Sudirman No. 85	81234567931	esaagilputra@cbt.com	AKTIF	2025-12-14 08:33:39.528	2026-03-05 01:19:01.593	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx0hw002a35udavq9oyfo	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx162003735ud5de1cxbc	0084405603	JOSHUA BAGUS NUGROHO	1970-01-01 00:00:38.431	Jl. Sudirman No. 101	81234567947	joshuabagusnugroho@cbt.com	AKTIF	2025-12-14 08:33:40.394	2026-03-05 01:19:12.014	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx15y003635udfzfvsnsn	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1c3003f35udp6zso1o3	0076188634	KHALUD SAIFUL ANWAR	1970-01-01 00:00:38.431	Jl. Sudirman No. 105	81234567951	khaludsaifulanwar@cbt.com	AKTIF	2025-12-14 08:33:40.61	2026-03-05 01:19:19.389	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx1bz003e35udkcmtj455	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1ji003p35udxuz53ke6	3088988176	M. BAGAS SANTOSO	1970-01-01 00:00:38.431	Jl. Sudirman No. 110	81234567956	mbagassantoso@cbt.com	AKTIF	2025-12-14 08:33:40.878	2025-12-14 08:33:40.878	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx1je003o35udc4kp1c2m	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1l1003r35udz4zykbfo	3088352964	M. BAGUS SATRIO	1970-01-01 00:00:38.431	Jl. Sudirman No. 111	81234567957	mbagussatrio@cbt.com	AKTIF	2025-12-14 08:33:40.933	2025-12-14 08:33:40.933	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx1kx003q35udsvrwk0yg	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1mi003t35udec1w0c85	97802751	M. SAIFURROSI	1970-01-01 00:00:38.431	Jl. Sudirman No. 112	81234567958	example9@cbt.com	AKTIF	2025-12-14 08:33:40.986	2025-12-14 08:33:40.986	\N	cmj5eca0w0006jsud9bca11b3	cmj5gx1mf003s35udmkcekzi3	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1pk003x35udstmkp6g7	78252676	MARCEL GALIH GINANJAR	1970-01-01 00:00:38.431	Jl. Sudirman No. 114	81234567960	marcelgalihginanjar@cbt.com	AKTIF	2025-12-14 08:33:41.095	2025-12-14 08:33:41.095	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx1pg003w35ud8n0lxpp8	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1u3004335udkj267fhr	82560328	MOH. AMAR MA'RUF	1970-01-01 00:00:38.431	Jl. Sudirman No. 117	81234567963	example10000@example.com	AKTIF	2025-12-14 08:33:41.258	2025-12-14 08:33:41.258	\N	cmj5eca0w0006jsud9bca11b3	cmj5gx1tz004235udd1rv3ppx	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1x5004735udoeer6a1p	3093129285	MOH. RADITH MUSTOFA	1970-01-01 00:00:38.431	Jl. Sudirman No. 119	81234567965	example10@cbt.com	AKTIF	2025-12-14 08:33:41.368	2025-12-14 08:33:41.368	\N	cmj5eca0w0006jsud9bca11b3	cmj5gx1x1004635udvhadbran	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx234004f35udt3s4ka40	101593710	MUHAMMAD ZAINAL ABIDIN	1970-01-01 00:00:38.431	Jl. Sudirman No. 123	81234567969	example11@cbt.com	AKTIF	2025-12-14 08:33:41.584	2025-12-14 08:33:41.584	\N	cmj5eca0w0006jsud9bca11b3	cmj5gx231004e35udeisgbcya	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx24m004h35udvyljawbl	83159381	NADIATUZZAHROH	1970-01-01 00:00:38.431	Jl. Sudirman No. 124	81234567970	nadiatuzzahroh@cbt.com	AKTIF	2025-12-14 08:33:41.637	2025-12-14 08:33:41.637	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx24i004g35udt6qrnb7l	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx27k004l35udp3ylddi4	74347595	NAYSILA NADINE CEYSEANA	1970-01-01 00:00:38.431	Jl. Sudirman No. 126	81234567972	naysilanadineceyseana@cbt.com	AKTIF	2025-12-14 08:33:41.744	2025-12-14 08:33:41.744	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx27h004k35udvdyo2fwy	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2ak004p35udjg0jhfie	79295893	NUKE KUSUMA WARDANI	1970-01-01 00:00:38.431	Jl. Sudirman No. 128	81234567974	nukekusumawardani@cbt.com	AKTIF	2025-12-14 08:33:41.852	2025-12-14 08:33:41.852	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx2ag004o35udqr0i50ow	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2c1004r35udtqywx9eq	78151631	NURHASAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 129	81234567975	example27@cbt.com	AKTIF	2025-12-14 08:33:41.905	2025-12-14 08:33:41.905	\N	cmj5ec9zf0000jsudgpxci2hf	cmj5gx2bx004q35udncso3x1e	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2dj004t35udiz37sd6e	65243793	PHILIPUS JAYA BALAN RAKASIWI	1970-01-01 00:00:38.431	Jl. Sudirman No. 130	81234567976	philipusjayabalanrakasiwi@cbt.com	AKTIF	2025-12-14 08:33:41.958	2025-12-14 08:33:41.958	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx2dg004s35udfhoy10rz	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2gi004x35ud0wei40by	81034228	RAVADAL ADHA	1970-01-01 00:00:38.431	Jl. Sudirman No. 132	81234567978	ravadaladha@cbt.com	AKTIF	2025-12-14 08:33:42.066	2025-12-14 08:33:42.066	\N	cmj5ec9zx0001jsud5cnf1k74	cmj5gx2gf004w35udlkyaly82	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2jh005135udtbcxbtb9	71528590	REZY ANGGARA BAHARI	1970-01-01 00:00:38.431	Jl. Sudirman No. 134	81234567980	rezyanggarabahari@cbt.com	AKTIF	2025-12-14 08:33:42.172	2025-12-14 08:33:42.172	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx2jd005035udyuohrs2j	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2mh005535ud6oic8o1p	82598502	RIVA ADITYA PUTRA	1970-01-01 00:00:38.431	Jl. Sudirman No. 136	81234567982	rivaadityaputra@cbt.com	AKTIF	2025-12-14 08:33:42.28	2025-12-14 08:33:42.28	\N	cmj5eca130007jsudvzwt5rjx	cmj5gx2mc005435udz2z1c0tg	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1yo004935ud3pslwtt1	78005721	MOHAMMAD ZIDAN MAULANA	1970-01-01 00:00:38.431	Jl. Sudirman No. 120	81234567966	mohammadzidanmaulana@cbt.com	AKTIF	2025-12-14 08:33:41.424	2025-12-16 12:32:56.951	\N	cmj5eca170008jsudb4r1h58n	cmj5gx1yk004835ud9hcuxcvr	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1i0003n35udv6gnc1l1	67491019	LUKMAN AFANDI	1970-01-01 00:00:38.431	Jl. Sudirman No. 109	81234567955	lukmanafandi@cbt.com	AKTIF	2025-12-14 08:33:40.824	2025-12-16 12:33:00.633	\N	cmj5eca170008jsudb4r1h58n	cmj5gx1hw003m35udhjaaqojj	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx292004n35ud17iskv1j	89544490	NOUVAL YURI SAPUTRA	1970-01-01 00:00:38.431	Jl. Sudirman No. 127	81234567973	nouvalyurisaputra@cbt.com	AKTIF	2025-12-14 08:33:41.796	2025-12-16 12:32:51.295	\N	cmj5eca170008jsudb4r1h58n	cmj5gx28x004m35udws9r11al	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2sg005d35udvqbnlkoz	86217954	TESYA HERLIANA	1970-01-01 00:00:38.431	Jl. Sudirman No. 140	81234567986	tesyaherliana@cbt.com	AKTIF	2025-12-14 08:33:42.496	2025-12-14 08:33:42.496	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx2sd005c35udyl3o8dav	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2u0005f35udktuxz1uv	75001728	WISNU MAULANA	1970-01-01 00:00:38.431	Jl. Sudirman No. 141	81234567987	wisnumaulana@cbt.com	AKTIF	2025-12-14 08:33:42.551	2025-12-14 08:33:42.551	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx2tv005e35udpkauz4m3	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx21o004d35udxjptvn08	0119631620	MUHAMMAD RIZKI	1970-01-01 00:00:38.431	Jl. Sudirman No. 122	81234567968	example20@cbt.com	AKTIF	2025-12-14 08:33:41.532	2026-01-19 02:55:01.566	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx21k004c35udlo92ywg1	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx264004j35ud8hnkcdnj	0095829771	NAUFAL DZAKI HANIF ABIYYI	1970-01-01 00:00:38.431	Jl. Sudirman No. 125	81234567971	example21@cbt.com	AKTIF	2025-12-14 08:33:41.691	2026-01-19 02:55:07.456	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx260004i35udriuw72oc	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2i0004z35udecgz1nlq	0099114829	RAZKY GABRIL WAHYUDI	1970-01-01 00:00:38.431	Jl. Sudirman No. 133	81234567979	example22@cbt.com	AKTIF	2025-12-14 08:33:42.119	2026-01-19 02:55:15.614	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx2hw004y35udh3y17ie4	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2ny005735udgqgfno56	0109444333	RIZKY WIDODO	1970-01-01 00:00:38.431	Jl. Sudirman No. 137	81234567983	example23@cbt.com	AKTIF	2025-12-14 08:33:42.334	2026-01-19 02:55:21.42	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx2nv005635udhkikfx5c	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2qz005b35ud4370ott0	0113396361	SUPRIYADI	1970-01-01 00:00:38.431	Jl. Sudirman No. 139	81234567985	example24@cbt.com	AKTIF	2025-12-14 08:33:42.443	2026-01-19 02:55:27.015	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx2qv005a35ud9ybz7pdt	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1vm004535udc4l2kzg5	0094760422	MOH. BAYU AINURROHMAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 118	81234567964	mohbayuainurrohman@cbt.com	AKTIF	2025-12-14 08:33:41.314	2026-01-27 00:19:42.053	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx1vi004435ud0rdy53xd	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2kx005335udc4757qsp	0098069279	RIDHO IRWANSYAH	1970-01-01 00:00:38.431	Jl. Sudirman No. 135	81234567981	ridhoirwansyah@cbt.com	AKTIF	2025-12-14 08:33:42.225	2026-01-27 00:19:47.419	\N	cmj5eca0k0004jsuddjewnal1	cmj5gx2ku005235udqtgs17js	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1sk004135udexpydl8s	0029537229	MINEL ASARI	1970-01-01 00:00:38.431	Jl. Sudirman No. 116	81234567962	minelasari@cbt.com	AKTIF	2025-12-14 08:33:41.204	2026-03-05 01:16:26.933	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx1sg004035udzqsyoalc	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1r2003z35udbet34tx1	0081962676	MAZELLO ITO AFRIANZIE	1970-01-01 00:00:38.431	Jl. Sudirman No. 115	81234567961	mazelloitoafrianzie@cbt.com	AKTIF	2025-12-14 08:33:41.15	2026-03-05 01:19:33.709	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx1qy003y35udt05qd1id	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx206004b35uduf215trn	0089145134	Muhammad Riski Neo Valentino 	1970-01-01 00:00:38.431	Jl. Sudirman No. 121	81234567967	v4lentino833@gmail.com	AKTIF	2025-12-14 08:33:41.477	2026-03-10 02:09:36.313	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx202004a35uditlzqygw	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2vh005h35udn702xrb0	83757487	WULAN FEBRIYANTI	1970-01-01 00:00:38.431	Jl. Sudirman No. 142	81234567988	wulanfebriyanti@cbt.com	AKTIF	2025-12-14 08:33:42.605	2025-12-14 08:33:42.605	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx2vd005g35udsfcg75mb	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2zz005n35udbo6v7qv9	97561362	YUDA WIRASA	1970-01-01 00:00:38.431	Jl. Sudirman No. 145	81234567991	example28@cbt.com	AKTIF	2025-12-14 08:33:42.766	2025-12-14 08:33:42.766	\N	cmj5ec9zf0000jsudgpxci2hf	cmj5gx2zv005m35ud2aj2o8s7	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2yi005l35udcr748bi3	79467322	YOHANES DWI PRAYOGA	1970-01-01 00:00:38.431	Jl. Sudirman No. 144	81234567990	yohanesdwiprayoga@cbt.com	AKTIF	2025-12-14 08:33:42.713	2025-12-16 12:32:37.753	\N	cmj5eca170008jsudb4r1h58n	cmj5gx2ye005k35ud0lbk4bs6	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2ph005935udv1g8ipeb	77627927	SEPTIA IRFAN RAMADHAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 138	81234567984	septiairfanramadhan@cbt.com	AKTIF	2025-12-14 08:33:42.388	2025-12-16 12:32:41.218	\N	cmj5eca170008jsudb4r1h58n	cmj5gx2pd005835udp1ug0523	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx2f2004v35udq20lwbo0	78440641	RAHMAD FIRMANSYAH	1970-01-01 00:00:38.431	Jl. Sudirman No. 131	81234567977	rahmadfirmansyah@cbt.com	AKTIF	2025-12-14 08:33:42.013	2025-12-16 12:32:46.386	\N	cmj5eca170008jsudb4r1h58n	cmj5gx2ey004u35udtxb4t3ri	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1al003d35udbg9vhv2a	72745125	KHAIRUL RIZAL FAUZI TUKIMIN	1970-01-01 00:00:38.431	Jl. Sudirman No. 104	81234567950	khairulrizalfauzitukimin@cbt.com	AKTIF	2025-12-14 08:33:40.557	2025-12-16 12:33:03.952	\N	cmj5eca170008jsudb4r1h58n	cmj5gx1ai003c35udrndkgaz9	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwzyc001l35udnzueuy9e	69853933	DANU BAGUS PRAYOGO	1970-01-01 00:00:38.431	Jl. Sudirman No. 72	81234567918	danubagusprayogo@cbt.com	AKTIF	2025-12-14 08:33:38.819	2025-12-16 12:33:07.513	\N	cmj5eca170008jsudb4r1h58n	cmj5gwzy7001k35udjqgqcye1	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx31i005p35ud17ebh91g	71347347	YULI YATIMAH	1970-01-01 00:00:38.431	Jl. Sudirman No. 146	81234567992	yuliyatimah@cbt.com	AKTIF	2025-12-14 08:33:42.821	2025-12-16 12:33:27.522	\N	cmj5eca050002jsudq5rc3oa3	cmj5gx31d005o35udqv3tt8vd	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx04g001t35udknq3yqoe	3093967437	DESY MUSTIKA MAYA SARI	1970-01-01 00:00:38.431	Jl. Sudirman No. 76	81234567922	desimustika@esgriba.com	AKTIF	2025-12-14 08:33:39.039	2025-12-22 11:46:56.003	\N	cmj5ec9zf0000jsudgpxci2hf	cmj5gx04c001s35udal7y6kqp	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gwyx9000935ud28f9ggyr	0108737154	ADITYA DAMARA PUTRA KRISTIAWAN	1970-01-01 00:00:38.431	Jl. Sudirman No. 48	81234567894	example12@cbt.com	AKTIF	2025-12-14 08:33:37.485	2026-01-19 02:53:57.483	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gwyx4000835udq2k2tbxp	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx0c0002335udrmwctcnm	0108153368	DWI AYU MEI JAYANTI	1970-01-01 00:00:38.431	Jl. Sudirman No. 81	81234567927	example15@cbt.com	AKTIF	2025-12-14 08:33:39.311	2026-01-19 02:54:18.942	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx0bv002235ud9wy5giy5	cmj5cxv7e00014iudyynxuvmc	\N
cmj5gx1o2003v35udzn7dj9ls	0093234409	M. YUSRON GINANDA	1970-01-01 00:00:38.431	Jl. Sudirman No. 113	81234567959	example18@cbt.com	AKTIF	2025-12-14 08:33:41.041	2026-01-19 02:54:37.777	\N	cmj5eca0e0003jsud1uxj50o4	cmj5gx1nx003u35udc8a2l13v	cmj5cxv7e00014iudyynxuvmc	\N
cml4n1odj005nrgpvbubg8thz	12345666	Abil	2003-02-02 00:00:00	Dusun Pandean	081121334645	abil@gmail.com	AKTIF	2026-02-02 03:56:53.285	2026-02-02 03:56:53.285	\N	cmj5eca0e0003jsud1uxj50o4	cml4n1oda005mrgpvj0kf3pav	\N	\N
cmj5gx2wz005j35ud2ivwa2j0	0088579651	YEHEZKIEL KEVIN RAHARJO	1970-01-01 00:00:38.431	Jl. Sudirman No. 143	81234567989	yehezkielkevinraharjo@cbt.com	AKTIF	2025-12-14 08:33:42.658	2026-03-05 01:16:20.371	\N	cmj5eca0o0005jsud0ambwla7	cmj5gx2ww005i35udmbp9bp8d	cmj5cxv7e00014iudyynxuvmc	\N
\.


--
-- Data for Name: SiswaKelasHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SiswaKelasHistory" (id, "siswaId", "kelasId", "tahunAjaranId", "tanggalMulai", "tanggalSelesai", status, catatan, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TahunAjaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TahunAjaran" (id, tahun, "tanggalMulai", "tanggalSelesai", status, "createdAt", "updatedAt", "deletedAt") FROM stdin;
4eb8830f-602f-400e-823b-82e332a40240	2024/2025	2024-07-01 00:00:00	2024-12-31 00:00:00	AKTIF	2026-03-13 01:59:25.024	2026-03-13 01:59:25.024	\N
cmj5cxv7e00014iudyynxuvmc	2025/2026	2025-12-16 00:00:00	2026-02-19 00:00:00	AKTIF	2025-12-14 06:42:20.858	2025-12-17 07:23:20.52	\N
\.


--
-- Data for Name: Tugas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tugas" (id, judul, deskripsi, instruksi, "mataPelajaranId", "guruId", "kelasId", deadline, "maxScore", "tipePenilaian", "allowLateSubmit", "isPublished", "createdAt", "updatedAt", "deletedAt") FROM stdin;
cmkknmad700038xpvoco0fnki	Profesi dan Kewirausahaan di bidang TJKT			cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	2026-01-20 04:17:00	100	MANUAL	f	t	2026-01-19 04:17:31.385	2026-01-19 04:17:31.385	\N
cmkm1rzac000ovkpvsbbby549	Tugas Projek Kelompok Profesi dan Kewirausahaan 	Tugas Projek Kelompok Profesi dan Kewirausahaan di bidang TJKT 		cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	2026-01-20 05:41:00	100	MANUAL	f	t	2026-01-20 03:41:37.764	2026-01-20 03:41:37.764	\N
cmlg2rbja001vrapv0yhd1lni	Tugas TCP IP	pada TCP/IP ada 4 layer.. sebutkan dan jelaskan !!!	pada TCP/IP ada 4 layer.. sebutkan dan jelaskan !!!	cmj9z7q87001e5dudb1uk5u9j	cmj9z8yem002u5dudolwskcz4	cmj5eca0e0003jsud1uxj50o4	2026-02-10 17:02:00	100	MANUAL	f	t	2026-02-10 04:02:11.877	2026-02-10 04:21:36.864	\N
cmlfvijqf0002rapvs7zgv0r0	Ulangan Ke-2		kerjakan dengan mandiri. jangan nyontekk ..>!!!!!	cmj9z7q9n001s5dudxr525koc	cmj9z8yem002u5dudolwskcz4	cmj5eca0k0004jsuddjewnal1	2026-02-10 02:38:00	100	MANUAL	f	t	2026-02-10 00:39:25.286	2026-02-10 04:21:44.828	2026-02-10 04:21:44.828
\.


--
-- Data for Name: TugasAttachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TugasAttachment" (id, "tugasId", "namaFile", "ukuranFile", "tipeFile", "urlFile", "createdAt") FROM stdin;
cmlfvijrl000arapvhvk2qwmq	cmlfvijqf0002rapvs7zgv0r0	SOAL ULANGAN ke-2.docx	19831	application/vnd.openxmlformats-officedocument.wordprocessingml.document	tugas-1770683965281-352886850.docx	2026-02-10 00:39:25.329
\.


--
-- Data for Name: TugasSiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TugasSiswa" (id, "tugasId", "siswaId", status, "submittedAt", "gradedAt", konten, score, feedback, "createdAt", "updatedAt") FROM stdin;
cmkkphm2400208xpv9j8npk25	cmkknmad700038xpvoco0fnki	cmj5gx17k003935udaewx76ro	DINILAI	2026-01-19 05:09:52.488	2026-01-20 03:09:47.891		90		2026-01-19 05:09:52.491	2026-01-20 03:09:47.896
cmkkoxucp001w8xpvxapus4zg	cmkknmad700038xpvoco0fnki	cmj5gwyx9000935ud28f9ggyr	DINILAI	2026-01-19 04:54:30.114	2026-01-20 03:09:56.888		90		2026-01-19 04:54:30.12	2026-01-20 03:09:56.891
cmkkoj96t001o8xpvcpd2own4	cmkknmad700038xpvoco0fnki	cmj5gx0c0002335udrmwctcnm	DINILAI	2026-01-19 04:43:09.499	2026-01-20 03:10:14.193		90		2026-01-19 04:43:09.508	2026-01-20 03:10:14.196
cmkkohjfl001k8xpv4hjhb1bv	cmkknmad700038xpvoco0fnki	cmj5gx264004j35ud8hnkcdnj	DINILAI	2026-01-19 04:41:49.465	2026-01-20 03:10:25.794	nih pak	90		2026-01-19 04:41:49.472	2026-01-20 03:10:25.794
cmkkod3ug001h8xpvsrpqjtrq	cmkknmad700038xpvoco0fnki	cmj5gx1o2003v35udzn7dj9ls	DINILAI	2026-01-19 04:38:22.643	2026-01-20 03:10:33.256		85		2026-01-19 04:38:22.647	2026-01-20 03:10:33.259
cmkkoxcg3001s8xpvt2cganp8	cmkknmad700038xpvoco0fnki	cmj5gx21o004d35udxjptvn08	DINILAI	2026-01-19 04:54:06.902	2026-01-20 03:10:42.416		85		2026-01-19 04:54:06.914	2026-01-20 03:10:42.418
cmkko4cwi00108xpvfc3995h5	cmkknmad700038xpvoco0fnki	cmj5gx2i0004z35udecgz1nlq	DINILAI	2026-01-19 04:31:34.472	2026-01-20 03:10:56.221		85		2026-01-19 04:31:34.481	2026-01-20 03:10:56.222
cmkknsxgn000h8xpv9me67v2z	cmkknmad700038xpvoco0fnki	cmj5gwzeh000v35udwd1xnzk8	DINILAI	2026-01-19 04:22:41.25	2026-01-20 03:11:03.668		85		2026-01-19 04:22:41.255	2026-01-20 03:11:03.671
cmkko7v4t00148xpve5y6g0ww	cmkknmad700038xpvoco0fnki	cmj5gwztr001f35udgp2iqne6	DINILAI	2026-01-19 04:34:18.073	2026-01-20 03:11:14.159		85		2026-01-19 04:34:18.077	2026-01-20 03:11:14.162
cmkko8cm600178xpv784tgevr	cmkknmad700038xpvoco0fnki	cmj5gx2qz005b35ud4370ott0	DINILAI	2026-01-19 04:34:40.724	2026-01-20 03:11:20.461		85		2026-01-19 04:34:40.732	2026-01-20 03:11:20.464
cmkkoas30001a8xpvgho6eby4	cmkknmad700038xpvoco0fnki	cmj5gx206004b35uduf215trn	DINILAI	2026-01-19 04:36:34.088	2026-01-20 03:11:29.264		93		2026-01-19 04:36:34.092	2026-01-20 03:11:29.267
cmkkob5c8001d8xpvwskkrcoh	cmkknmad700038xpvoco0fnki	cmj5gx0o3002j35uda0ok0i4j	DINILAI	2026-01-19 04:36:51.263	2026-01-20 03:11:36.712		85		2026-01-19 04:36:51.27	2026-01-20 03:11:36.715
cmkm3k502000pvkpvpxt970bk	cmkm1rzac000ovkpvsbbby549	cmj5gx206004b35uduf215trn	DINILAI	2026-01-20 04:31:31.149	2026-02-03 02:45:44.896	https://www.canva.com/design/DAG-68JxHUg/cEHh1NTjL1kVLpGOGKm3Ng/edit?utm_content=DAG-68JxHUg&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton	90		2026-01-20 04:31:31.153	2026-02-03 02:45:44.897
cmlg4t8om003erapv9bclq4nz	cmlg2rbja001vrapv0yhd1lni	cmj5gx1o2003v35udzn7dj9ls	DINILAI	2026-02-10 04:59:40.718	2026-03-05 01:06:27.299		70		2026-02-10 04:59:40.725	2026-03-05 01:06:27.301
cmlg47h07003brapvynbrs609	cmlg2rbja001vrapv0yhd1lni	cmj5gx2qz005b35ud4370ott0	DINILAI	2026-02-10 04:42:45.071	2026-03-05 01:06:31.814		70		2026-02-10 04:42:45.078	2026-03-05 01:06:31.817
cmlg42ga60038rapvpzwc8nzu	cmlg2rbja001vrapv0yhd1lni	cmj5gx2i0004z35udecgz1nlq	DINILAI	2026-02-10 04:38:50.858	2026-03-05 01:06:36.033		70		2026-02-10 04:38:50.861	2026-03-05 01:06:36.035
cmlg3zttb0035rapvsxhfa9at	cmlg2rbja001vrapv0yhd1lni	cmj5gwztr001f35udgp2iqne6	DINILAI	2026-02-10 04:36:48.427	2026-03-05 01:06:42.247		75		2026-02-10 04:36:48.43	2026-03-05 01:06:42.249
cmlg3wt1b0032rapvd41l22uy	cmlg2rbja001vrapv0yhd1lni	cml4n1odj005nrgpvbubg8thz	DINILAI	2026-02-10 04:34:27.451	2026-03-05 01:06:47.71		70		2026-02-10 04:34:27.455	2026-03-05 01:06:47.713
cmlg3vbnr0030rapvv63rupd5	cmlg2rbja001vrapv0yhd1lni	cmj5gwzeh000v35udwd1xnzk8	DINILAI	2026-02-10 04:33:18.275	2026-03-05 01:07:11.377	Pada TCP/IP ada 4 layer... Sebutkan dan jelaskan!!!\r\n\r\n1. Application layer\r\n     Berfungsi sebagai antar muka antara pengguna \r\n      Dan jaringan\r\n2. Transport layer \r\n        Mengatur pengiriman data dari satu host ke \r\n        Host lain secara end - to - end\r\n3. Internet layer\r\n       Bertugas mengatur pengalaman IP dan proses \r\n        Pengiriman paket data antar jaringan \r\n4. Network Access layer \r\n       Mengatur pengiriman data secara fisik melalui\r\n        Media jaringan	70		2026-02-10 04:33:18.278	2026-03-05 01:07:11.378
cmlg3qjbb002xrapv07k424pq	cmlg2rbja001vrapv0yhd1lni	cmj5gx0c0002335udrmwctcnm	DINILAI	2026-02-10 04:29:34.907	2026-03-05 01:07:16.269		80		2026-02-10 04:29:34.918	2026-03-05 01:07:16.272
cmlg3q3y1002urapvtcgdd6n0	cmlg2rbja001vrapv0yhd1lni	cmj5gx0o3002j35uda0ok0i4j	DINILAI	2026-02-10 04:29:14.99	2026-03-05 01:07:22.535		75		2026-02-10 04:29:15.001	2026-03-05 01:07:22.538
cmlg3jmrs002orapvr8tnsrhn	cmlg2rbja001vrapv0yhd1lni	cmj5gx21o004d35udxjptvn08	DINILAI	2026-02-10 04:24:12.804	2026-03-05 01:07:42.017		70		2026-02-10 04:24:12.807	2026-03-05 01:07:42.019
cmlg3ink5002lrapv997avc3c	cmlg2rbja001vrapv0yhd1lni	cmj5gwyx9000935ud28f9ggyr	DINILAI	2026-02-10 04:23:27.168	2026-03-05 01:07:46.56	Aditya Damara	75		2026-02-10 04:23:27.171	2026-03-05 01:07:46.563
cmlg3i2dr002irapvjmi4tz89	cmlg2rbja001vrapv0yhd1lni	cmj5gx264004j35ud8hnkcdnj	DINILAI	2026-02-10 04:22:59.723	2026-03-05 01:07:50.556	Nih pakkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk	75		2026-02-10 04:22:59.727	2026-03-05 01:07:50.558
cmlg3ha51002frapvnjq75oc4	cmlg2rbja001vrapv0yhd1lni	cmj5gx17k003935udaewx76ro	DINILAI	2026-02-10 04:22:23.112	2026-03-05 01:07:54.456	sipp	80		2026-02-10 04:22:23.124	2026-03-05 01:07:54.456
cmlg3kre3002rrapvubcrv9pt	cmlg2rbja001vrapv0yhd1lni	cmj5gx206004b35uduf215trn	DINILAI	2026-02-10 04:25:05.447	2026-03-05 01:08:06.224	uyeqftou uywqukl2f valerrrrrrrrrrrrrrrrrrrrrrrrr s	85		2026-02-10 04:25:05.45	2026-03-05 01:08:06.225
\.


--
-- Data for Name: TugasSiswaFile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TugasSiswaFile" (id, "tugasSiswaId", "namaFile", "ukuranFile", "tipeFile", "urlFile", "createdAt") FROM stdin;
cmkknsxgx000j8xpv8pw1z164	cmkknsxgn000h8xpv9me67v2z	17688827161132127085192051855663.jpg	3105110	image/jpeg	submission-1768796463887-531428155.jpg	2026-01-19 04:22:41.265
cmkknsxh0000k8xpv7fm702pz	cmkknsxgn000h8xpv9me67v2z	17688827811913944075434438791403.jpg	3574572	image/jpeg	submission-1768796512973-535470141.jpg	2026-01-19 04:22:41.267
cmkko4cx600128xpv1iknicm6	cmkko4cwi00108xpvfc3995h5	IMG_20260112_115606_1.jpg	1773010	image/jpeg	submission-1768797089045-606011219.jpg	2026-01-19 04:31:34.506
cmkko4cxc00138xpvssyv94k9	cmkko4cwi00108xpvfc3995h5	IMG_20260112_115602_1.jpg	2138737	image/jpeg	submission-1768797091335-391487204.jpg	2026-01-19 04:31:34.512
cmkko7v5400168xpv8029pdif	cmkko7v4t00148xpve5y6g0ww	IMG20260111184151.jpg	1717620	image/jpeg	submission-1768797241869-26957457.jpg	2026-01-19 04:34:18.088
cmkko8cms00198xpvd7s7148s	cmkko8cm600178xpv784tgevr	17687972488738306217367046329138.jpg	3532663	image/jpeg	submission-1768797273002-856917899.jpg	2026-01-19 04:34:40.756
cmkkoas38001c8xpvzguqjlsv	cmkkoas30001a8xpvgho6eby4	IMG20260119113522.jpg	2136331	image/jpeg	submission-1768797370472-751776.jpg	2026-01-19 04:36:34.1
cmkkob5cv001f8xpvp3ztylgz	cmkkob5c8001d8xpvwskkrcoh	IMG-20260119-WA0002.jpg	121992	image/jpeg	submission-1768797408628-761802877.jpg	2026-01-19 04:36:51.295
cmkkob5d2001g8xpvtfgl3fry	cmkkob5c8001d8xpvwskkrcoh	IMG-20260119-WA0001.jpg	68487	image/jpeg	submission-1768797409975-78149243.jpg	2026-01-19 04:36:51.301
cmkkod3uq001j8xpv9ntdnd3a	cmkkod3ug001h8xpvsrpqjtrq	17687974345821780478065303015522.jpg	3565369	image/jpeg	submission-1768797459157-152711741.jpg	2026-01-19 04:38:22.658
cmkkohjfz001m8xpvtiqgl5jt	cmkkohjfl001k8xpv4hjhb1bv	IMG_20260112_114744_422.jpg	8423234	image/jpeg	submission-1768797629242-606601533.jpg	2026-01-19 04:41:49.487
cmkkohjg3001n8xpv05bbwnc6	cmkkohjfl001k8xpv4hjhb1bv	IMG_20260112_114800_143.jpg	8391497	image/jpeg	submission-1768797663854-755514739.jpg	2026-01-19 04:41:49.491
cmkkoj97c001q8xpvroo2z358	cmkkoj96t001o8xpvcpd2own4	IMG_20260119_113425.jpg	2481884	image/jpeg	submission-1768797779497-592942893.jpg	2026-01-19 04:43:09.528
cmkkoj97j001r8xpvh44eu01b	cmkkoj96t001o8xpvcpd2own4	IMG_20260119_113406.jpg	2685933	image/jpeg	submission-1768797784699-690106008.jpg	2026-01-19 04:43:09.534
cmkkoxcgp001u8xpvqelseers	cmkkoxcg3001s8xpvt2cganp8	IMG_20260113_091003.jpg	1564261	image/jpeg	submission-1768798440973-66961734.jpg	2026-01-19 04:54:06.937
cmkkoxcgu001v8xpv4a0hak6v	cmkkoxcg3001s8xpvt2cganp8	IMG_20260113_090959.jpg	2062483	image/jpeg	submission-1768798443778-555415546.jpg	2026-01-19 04:54:06.942
cmkkoxud3001y8xpvj0bzjyc2	cmkkoxucp001w8xpvxapus4zg	WhatsApp Image 2026-01-19 at 11.52.59.jpeg	167761	image/jpeg	submission-1768798466515-121830260.jpeg	2026-01-19 04:54:30.135
cmkkoxud6001z8xpvzlt4mjo1	cmkkoxucp001w8xpvxapus4zg	WhatsApp Image 2026-01-19 at 11.52.58.jpeg	141430	image/jpeg	submission-1768798468886-45876309.jpeg	2026-01-19 04:54:30.138
cmkkphm2f00228xpv36i6ddes	cmkkphm2400208xpv9j8npk25	WhatsApp Image 2026-01-19 at 12.05.45.jpeg	128388	image/jpeg	submission-1768799390144-498554961.jpeg	2026-01-19 05:09:52.503
cmkkphm2i00238xpvkhledhyr	cmkkphm2400208xpv9j8npk25	WhatsApp Image 2026-01-19 at 12.05.41.jpeg	162640	image/jpeg	submission-1768799391487-671737129.jpeg	2026-01-19 05:09:52.506
cmlg3ha5o002hrapvh1x3bvti	cmlg3ha51002frapvnjq75oc4	TUGAS Pak Riski DPK.docx	13763	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697343088-474993682.docx	2026-02-10 04:22:23.148
cmlg3i2e0002krapv7oj5pt6p	cmlg3i2dr002irapvjmi4tz89	TCP DZAKI X TKJ.docx	16626	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697379706-669538441.docx	2026-02-10 04:22:59.736
cmlg3inki002nrapvw2mxdt2x	cmlg3ink5002lrapv997avc3c	Tugas DPK TCP.docx	17063	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697407149-498539924.docx	2026-02-10 04:23:27.186
cmlg3jms5002qrapvrmf54n64	cmlg3jmrs002orapvr8tnsrhn	Nama muhammad rizki.docx	14487	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697452800-173582135.docx	2026-02-10 04:24:12.821
cmlg3kreb002trapvx6iul2gc	cmlg3kre3002rrapvubcrv9pt	TUGAS DPK SEBUTKAN DAN JELASKAN 4 LAYER PADA TCP.docx	16891	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697505396-198968290.docx	2026-02-10 04:25:05.459
cmlg3q3yf002wrapvbztnc6zb	cmlg3q3y1002urapvtcgdd6n0	TUGAS.docx	14996	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697754974-332071563.docx	2026-02-10 04:29:15.015
cmlg3qjbs002zrapvck1xubol	cmlg3qjbb002xrapv07k424pq	TUGAS AYUKS.docx	19646	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770697774857-306320227.docx	2026-02-10 04:29:34.936
cmlg3wt1m0034rapv4fs2qjgn	cmlg3wt1b0032rapvd41l22uy	TUGAS.docx	15348	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770698067428-168439185.docx	2026-02-10 04:34:27.466
cmlg3zttm0037rapvm26wb4ge	cmlg3zttb0035rapvsxhfa9at	TUGAS PAK RISKI.docx	16028	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770698208410-268403996.docx	2026-02-10 04:36:48.442
cmlg42gaf003arapvxnfs5kld	cmlg42ga60038rapvpzwc8nzu	tcp gabril x tkj.docx	16157	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770698330831-60993893.docx	2026-02-10 04:38:50.871
cmlg47h0u003drapvpg5gi9u6	cmlg47h07003brapvynbrs609	supriyadi.docx	19803	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770698565043-355283676.docx	2026-02-10 04:42:45.102
cmlg4t8p5003grapvgqq42qzs	cmlg4t8om003erapv9bclq4nz	m.yusron ginanda.docx	1601375	application/vnd.openxmlformats-officedocument.wordprocessingml.document	submission-1770699579110-219690806.docx	2026-02-10 04:59:40.745
\.


--
-- Data for Name: Ujian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ujian" (id, kode, judul, deskripsi, "mataPelajaranId", "kelasId", durasi, "tanggalMulai", "tanggalSelesai", "nilaiMinimal", "acakSoal", "tampilkanNilai", status, "createdBy", "createdAt", "updatedAt", "deletedAt", "paketSoalId", "guruId", "deteksiKecurangan", "jenisUjianId") FROM stdin;
cmmo9rkxm0000hgpvp25ph3ul	UJI-00016	tes		cmj9z7q87001e5dudb1uk5u9j	\N	60	2026-03-13 02:20:00	2026-03-13 03:20:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-13 02:20:13.111	2026-03-13 02:44:28.962	2026-03-13 02:44:28.961	cml4mcaxd001qrgpvfuj6ietx	cmj9z8yem002u5dudolwskcz4	t	\N
cmkvx99a8001q9tpv64yvhvpo	UJI-00002	Remidi Ulangan Harian		cmj9z7q9n001s5dudxr525koc	\N	60	2026-01-27 01:32:00	2026-01-27 02:32:00	70	t	t	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-01-27 01:32:47.552	2026-01-27 02:32:00.039	\N	cmkvudbt400009tpvwssp9jfx	cmj9z8yem002u5dudolwskcz4	t	\N
cmkvujdrj000v9tpvppviumxp	UJI-00001	Ulangan Kelas XI TKJ		cmj9z7q9n001s5dudxr525koc	\N	120	2026-01-27 00:16:00	2026-01-27 02:16:00	70	t	t	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-01-27 00:16:41.07	2026-02-02 02:21:52.046	\N	cmkvudbt400009tpvwssp9jfx	cmj9z8yem002u5dudolwskcz4	t	\N
cmmfqhbdb0000qrpv7vvdx247	UJI-00008	Tes	Tes	cmj9z7q9n001s5dudxr525koc	\N	60	2026-03-07 02:57:00	2026-03-07 03:57:00	70	f	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-07 02:58:12.043	2026-03-13 02:51:29.241	2026-03-13 02:51:29.24	cmkvudbt400009tpvwssp9jfx	cmj9z8yem002u5dudolwskcz4	t	\N
cml4mdzu6003grgpvi7qohvfc	UJI-00003	Ulangan Profesi dan Kewirausahaan di bidang TJKT		cmj9z7q87001e5dudb1uk5u9j	\N	137	2026-02-02 03:38:00	2026-02-02 05:55:00	70	t	t	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-02-02 03:38:28.397	2026-02-03 00:06:01.075	\N	cml4mcaxd001qrgpvfuj6ietx	cmj9z8yem002u5dudolwskcz4	t	\N
cmlfwooe0001arapva97odoug	UJI-00006	Ulangan		\N	\N	120	2026-02-10 01:11:00	2026-02-10 03:11:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-02-10 01:12:10.871	2026-03-13 02:55:36.284	\N	cmlfwmp53000krapvvo7q2zw8	cmj9z8yem002u5dudolwskcz4	t	\N
cmmjxirnp001zr4pvr3j3egwq	UJI-00010	STS REMIDI		cmj9z7q9n001s5dudxr525koc	\N	20	2026-03-10 01:25:00	2026-03-10 01:45:00	70	t	f	DRAFT	cmj9z8yej002t5dudlb0wn4mh	2026-03-10 01:26:21.828	2026-03-10 01:26:46.267	2026-03-10 01:26:46.266	cmmjwbqu50000r4pvp6v2a9p2	cmj9z8yem002u5dudolwskcz4	t	\N
cmmjweuud0016r4pvw4ij3lxz	UJI-00009	STS GENAP XI TKJ		cmj9z7q9n001s5dudxr525koc	\N	60	2026-03-10 00:55:00	2026-03-10 01:55:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-10 00:55:19.717	2026-03-13 02:55:37.182	\N	cmmjwbqu50000r4pvp6v2a9p2	cmj9z8yem002u5dudolwskcz4	t	\N
cml4n5ha4005orgpv2bycgzg4	UJI-00005	Ulangan X TKJ Abil		cmj9z7q87001e5dudb1uk5u9j	\N	120	2026-02-02 03:59:00	2026-02-02 05:59:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-02-02 03:59:50.71	2026-03-13 02:55:38.965	\N	cml4mcaxd001qrgpvfuj6ietx	cmj9z8yem002u5dudolwskcz4	t	\N
cml4mtmxw004prgpvmtp3vuqx	UJI-00004	Ulangan TKJ Adit		cmj9z7q87001e5dudb1uk5u9j	\N	129	2026-02-02 03:50:00	2026-02-02 05:59:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-02-02 03:50:38.177	2026-03-13 02:55:40.176	\N	cml4mcaxd001qrgpvfuj6ietx	cmj9z8yem002u5dudolwskcz4	t	\N
cmmcsevsd0013r0pv5je0p4we	UJI-00007	Ulangan XII TKJ	Ulangan XII TKJ	cmj9z7q9n001s5dudxr525koc	\N	60	2026-03-05 01:28:00	2026-03-05 02:28:00	70	t	t	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-05 01:28:59.244	2026-03-13 02:55:56.198	\N	cmlfwmp53000krapvvo7q2zw8	cmj9z8yem002u5dudolwskcz4	t	\N
cmmmtbgbc0000qrpv6hjl5rpd	UJI-00015	STS REMIDI XII TKJ		cmj9z7q9n001s5dudxr525koc	\N	60	2026-03-12 01:51:00	2026-03-12 02:51:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-12 01:52:00.593	2026-03-13 02:55:26.532	\N	cmmjwbqu50000r4pvp6v2a9p2	cmj9z8yem002u5dudolwskcz4	t	\N
cmmle1rkt002urspv36z7gvns	UJI-00013	STS Susulan Dimas		cmj9z7q87001e5dudb1uk5u9j	\N	60	2026-03-11 01:56:00	2026-03-11 02:56:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-11 01:56:48.221	2026-03-13 02:55:27.975	\N	cmmjynvpz003hr4pvoby307lo	cmj9z8yem002u5dudolwskcz4	t	\N
cmmlfsg9q003mrspvkzd4yy6j	UJI-00014	STS GENAP XII TKJ		cmj9z7q9n001s5dudxr525koc	\N	75	2026-03-12 00:45:00	2026-03-12 02:00:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-11 02:45:32.893	2026-03-13 02:55:29.994	\N	cmmlbgqln0000rspvnl9ri7bh	cmj9z8yem002u5dudolwskcz4	t	\N
cmmjyqpy0004xr4pv5b5r5q5g	UJI-00012	STS GENAP DPK X TKJ		cmj9z7q87001e5dudb1uk5u9j	\N	60	2026-03-10 02:00:00	2026-03-10 03:00:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-10 02:00:32.471	2026-03-13 02:55:30.81	\N	cmmjynvpz003hr4pvoby307lo	cmj9z8yem002u5dudolwskcz4	t	\N
cmmjxkk2d002sr4pvwz0l1rak	UJI-00011	STS REMIDI		cmj9z7q9n001s5dudxr525koc	\N	18	2026-03-10 01:27:00	2026-03-10 01:45:00	70	t	f	SELESAI	cmj9z8yej002t5dudlb0wn4mh	2026-03-10 01:27:45.3	2026-03-13 02:55:31.702	\N	cmmjwbqu50000r4pvp6v2a9p2	cmj9z8yem002u5dudolwskcz4	t	\N
\.


--
-- Data for Name: UjianKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UjianKelas" (id, "ujianId", "kelasId", "createdAt") FROM stdin;
cmkvujdrp00199tpv2x0bh2gg	cmkvujdrj000v9tpvppviumxp	cmj5eca0k0004jsuddjewnal1	2026-01-27 00:16:41.07
cmkvx99ac00249tpvg6oejlqa	cmkvx99a8001q9tpv64yvhvpo	cmj5eca0k0004jsuddjewnal1	2026-01-27 01:32:47.552
cml4mdzub004brgpvq5i50qtz	cml4mdzu6003grgpvi7qohvfc	cmj5eca0e0003jsud1uxj50o4	2026-02-02 03:38:28.397
cml4mtmyf005krgpv2t0g6rt7	cml4mtmxw004prgpvmtp3vuqx	cmj5eca0e0003jsud1uxj50o4	2026-02-02 03:50:38.177
cml4n5hai006jrgpval4bpqy8	cml4n5ha4005orgpv2bycgzg4	cmj5eca0e0003jsud1uxj50o4	2026-02-02 03:59:50.71
cmlfwooe5001nrapv1zru9sig	cmlfwooe0001arapva97odoug	cmj5eca0k0004jsuddjewnal1	2026-02-10 01:12:10.871
cmmcsevsj001gr0pvs96y9d27	cmmcsevsd0013r0pv5je0p4we	cmj5eca0o0005jsud0ambwla7	2026-03-05 01:28:59.244
cmmfqhbdj000eqrpvbxcg1n5p	cmmfqhbdb0000qrpv7vvdx247	cmj5eca0k0004jsuddjewnal1	2026-03-07 02:58:12.043
cmmjweuul001rr4pv0ryoktde	cmmjweuud0016r4pvw4ij3lxz	cmj5eca0k0004jsuddjewnal1	2026-03-10 00:55:19.717
cmmjxirnv002kr4pv1ysg5j1q	cmmjxirnp001zr4pvr3j3egwq	cmj5eca0k0004jsuddjewnal1	2026-03-10 01:26:21.828
cmmjxkk2y003dr4pvwtsp6dbx	cmmjxkk2d002sr4pvwz0l1rak	cmj5eca0k0004jsuddjewnal1	2026-03-10 01:27:45.3
cmmjyqpyj005nr4pvxvekxj8o	cmmjyqpy0004xr4pv5b5r5q5g	cmj5eca0e0003jsud1uxj50o4	2026-03-10 02:00:32.471
cmmle1rl1003krspvbt5qcer8	cmmle1rkt002urspv36z7gvns	cmj5eca0e0003jsud1uxj50o4	2026-03-11 01:56:48.221
cmmlfsg9x004crspv8803nlcu	cmmlfsg9q003mrspvkzd4yy6j	cmj5eca0o0005jsud0ambwla7	2026-03-11 02:45:32.893
cmmmtbgbt000lqrpvh0eca050	cmmmtbgbc0000qrpv6hjl5rpd	cmj5eca0o0005jsud0ambwla7	2026-03-12 01:52:00.593
cmmo9rkxz000vhgpv304z5138	cmmo9rkxm0000hgpvp25ph3ul	cmj5eca0e0003jsud1uxj50o4	2026-03-13 02:20:13.111
\.


--
-- Data for Name: UjianSiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UjianSiswa" (id, "ujianId", "siswaId", "tokenAkses", "waktuMulai", "waktuSelesai", durasi, status, "nilaiTotal", "isPassed", jawaban, "createdAt", "updatedAt", "manualGrades", "violationCount") FROM stdin;
cmmmtbgc7000qqrpvtt0bojxg	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gx0gi002935udl20nfbog	\N	2026-03-12 01:52:18.057	2026-03-12 02:10:32.368	18	SELESAI	75	t	[{"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "B"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "A"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "A"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "E"}]	2026-03-12 01:52:00.63	2026-03-12 02:10:32.371	\N	0
cml4mdzun004drgpvdc8u0dt4	cml4mdzu6003grgpvi7qohvfc	cmj5gwztr001f35udgp2iqne6	\N	2026-02-02 04:04:00.736	2026-02-02 04:14:06.159	10	SELESAI	50	f	[{"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "A"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "E"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "B"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "C"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "B"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "E"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "A"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "A"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "B"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "D"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "E"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "B"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "C"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "D"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "C"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "B"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "D"}]	2026-02-02 03:38:28.415	2026-02-02 04:14:06.16	\N	0
cmkvujds2001g9tpv0wvg0pq3	cmkvujdrj000v9tpvppviumxp	cmj5gx2kx005335udc4757qsp	\N	2026-01-27 00:59:02.326	2026-01-27 01:08:11.662	9	SELESAI	57.64705882352941	f	[{"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "B"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "B"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "D"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "untuk mendapatkan ip otomatis"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "restart"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "masuk kan ip "}]	2026-01-27 00:16:41.09	2026-01-27 01:27:46.855	{"cmkvujdrl00169tpv4x67yjfx": 9, "cmkvujdrl00179tpvo91qouvx": 5, "cmkvujdrl00189tpv00iwpyrp": 5}	0
cmkvx99ak00279tpveojf7g56	cmkvx99a8001q9tpv64yvhvpo	cmj5gx0r4002n35ud6i7qxccl	\N	2026-01-27 01:33:37.302	2026-01-27 01:37:25.159	3	SELESAI	47.05882352941176	f	[{"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "1. IP address\\n2. DNS \\n3. gateway\\n4. Subnet mask"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Nat "}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Untuk mendapat IP otomatis dari server"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}]	2026-01-27 01:32:47.564	2026-01-27 01:37:25.162	\N	0
cmlfwooel001qrapvr9miydgg	cmlfwooe0001arapva97odoug	cmj5gx0r4002n35ud6i7qxccl	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-02-10 01:12:10.893	2026-02-10 01:12:10.893	\N	0
cmlfwooel001urapvoyk9s4aa	cmlfwooe0001arapva97odoug	cmj5gx2kx005335udc4757qsp	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-02-10 01:12:10.893	2026-02-10 01:12:10.893	\N	0
cmlfwooel001trapvbblpj0jv	cmlfwooe0001arapva97odoug	cmj5gx1vm004535udc4l2kzg5	\N	2026-02-10 01:20:52.516	2026-02-10 01:35:45.45	14	SELESAI	60.86956521739131	f	[{"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "ipv4 menggunakan 32 bit\\nipv6 menggunakan 128bit"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "B"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "memastikan layanan sampai ke pelanggan dengan baik. "}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "A"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "A"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "A"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}]	2026-02-10 01:12:10.893	2026-03-05 01:14:11.612	{"cmlfwooe2001lrapv5bwukvro": 5, "cmlfwooe2001mrapv2rndc0wz": 5}	0
cmmjyqpzl005xr4pven4mii1u	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx2qz005b35ud4370ott0	\N	2026-03-10 02:15:59.819	2026-03-10 02:37:00.152	21	SELESAI	64	f	[{"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "D"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "A"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "D"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "A"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "B"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "B"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "A"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "B"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "C"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "A"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}]	2026-03-10 02:00:32.528	2026-03-10 02:37:00.155	\N	0
cmmcsevsx001nr0pvhb8itwdu	cmmcsevsd0013r0pv5je0p4we	cmj5gx0gi002935udl20nfbog	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 01:28:59.265	\N	0
cmmcsevsx001qr0pv2vyhi3tl	cmmcsevsd0013r0pv5je0p4we	cmj5gx1c3003f35udp6zso1o3	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 01:28:59.265	\N	0
cmkvx99ak00259tpvfuejsjx8	cmkvx99a8001q9tpv64yvhvpo	cmj5gx08y001z35udsqo698l8	\N	2026-01-27 01:33:26.015	2026-01-27 01:41:27.969	8	SELESAI	58.82352941176471	f	[{"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "1.ip yang di buat dari ether 2\\n2.gateaway dari ip tadi\\n3.address pool\\n4.dns server"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Karena DHCP Client memastikan pc tersambung ke internet dan berfungsi meminta ip dari router"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Konfigurasi NAT berfungsi untuk mengubah ip privat menjadi ip publik "}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}]	2026-01-27 01:32:47.564	2026-01-27 01:41:27.972	\N	0
cmmlfsgab004irspvjseca4ty	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx0di002535ud32uasdbw	\N	2026-03-12 00:56:08.741	2026-03-12 01:46:53.194	50	SELESAI	96	t	[{"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "A"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "B"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "C"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "D"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "C"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "D"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "D"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:46:53.195	\N	0
cmmfqhbea000iqrpv2cjevgds	cmmfqhbdb0000qrpv7vvdx247	cmj5gx0x4002v35udz7qohe6d	\N	2026-03-07 03:07:34.395	2026-03-07 03:31:08.761	23	SELESAI	11.76470588235294	f	[{"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "E"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "A"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "A"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "B"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "A"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "A"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "A"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "B"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "agar mempercepat  koneksi ke isp"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "IP Adrees"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "subnetting=tektik untuk  membagi jaringan ip menjadi beberapa sub-jaringan kecil agar penggunaan  ip lebih efisien\\n"}]	2026-03-07 02:58:12.081	2026-03-07 03:31:08.764	\N	0
cmmjweuv1001ur4pv3vuvpaw4	cmmjweuud0016r4pvw4ij3lxz	cmj5gx0r4002n35ud6i7qxccl	\N	2026-03-10 00:59:40.454	2026-03-10 01:07:20.489	7	SELESAI	70	t	[{"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "A"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "E"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "A"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "B"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "B"}]	2026-03-10 00:55:19.74	2026-03-10 01:07:20.493	\N	0
cmmjxkk3x003gr4pvi4yzyx7b	cmmjxkk2d002sr4pvwz0l1rak	cmj5gx1vm004535udc4l2kzg5	\N	2026-03-10 01:28:05.783	2026-03-10 01:33:33.606	5	SELESAI	50	f	[{"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "B"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "B"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "A"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "B"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "B"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "B"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "C"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "C"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "C"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}]	2026-03-10 01:27:45.356	2026-03-10 01:33:33.61	\N	0
cml4mtmze005lrgpvxled02r9	cml4mtmxw004prgpvmtp3vuqx	cmj5gwyx9000935ud28f9ggyr	\N	2026-02-02 03:51:25.813	2026-02-02 04:20:05.69	28	SELESAI	92	t	[{"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "B"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "C"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "B"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "B"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "C"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "A"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "C"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "C"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "B"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "C"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "C"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "B"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "E"}]	2026-02-02 03:50:38.233	2026-02-02 04:20:05.694	\N	0
cmmcsevsx001sr0pvbv4c2l6r	cmmcsevsd0013r0pv5je0p4we	cmj5gx1r2003z35udbet34tx1	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 01:28:59.265	\N	0
cmmlfsgab004orspvcvtkl5i0	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx1r2003z35udbet34tx1	\N	2026-03-12 00:57:10.754	2026-03-12 01:23:20.525	26	SELESAI	72	t	[{"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "B"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "E"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "B"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "B"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "E"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "C"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:23:20.529	\N	0
cmmcsevsx001tr0pv5n7xlsf1	cmmcsevsd0013r0pv5je0p4we	cmj5gx2wz005j35ud2ivwa2j0	\N	2026-03-05 01:59:29.923	2026-03-05 02:18:16.321	18	SELESAI	100	t	[{"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPv 4 memiliki 32 bit dipisahkan dengan tanda titik\\nIPv6 memiliki 128 bit dipisahkan dengan tanda kolom"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "Grup Kerja Marketing/Sales: Berperan dan menjual layanan internet kepada pelanggan, tugasnya mencari pelanggan, melakukan promosi, serta menjalin hubungan dengan pelanggan agar target penjualan tercapai\\n\\nGrup Kerja Networking Desaign: Berpera dalam merancang dan mendesain jaringan sesuai kebutuhan pelanggan, tugasnya membuat perencanaan topologi jaringan, menentukan perangkat yang digunakan serta memastikan jaringan dapat berjalan optimal dan efisien"}]	2026-03-05 01:28:59.265	2026-03-13 02:57:37.419	{"cmmcsevsf001er0pvz1wetlkh": 8, "cmmcsevsf001fr0pvv5u0ubpb": 8}	0
cmmcsevsx001ir0pv25gx111t	cmmcsevsd0013r0pv5je0p4we	cmj5gwz23000f35udoygf650d	\N	2026-03-05 01:36:04	2026-03-05 01:59:08.095	23	SELESAI	93.47826086956522	t	[{"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPv4 menggunakan alamat 32-bit (menghasilkan 4,3 miliar alamat)\\n\\nIPv6 menggunakan 128-bit (menghasilkan jumlah alamat yang jauh lebih besar, sekitar 3.4x10³⁸)"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "A"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "Answer:Peran utama Grup Kerja Marketing/Sales adalah memasarkan dan menjual layanan ISP kepada pelanggan, sementara Grup Kerja Networking Design bertanggung jawab merancang infrastruktur jaringan yang efisien dan andal."}]	2026-03-05 01:28:59.265	2026-03-05 03:20:17.363	{"cmmcsevsf001er0pvz1wetlkh": 8, "cmmcsevsf001fr0pvv5u0ubpb": 8}	0
cmkvx99ak002b9tpvciun6u3j	cmkvx99a8001q9tpv64yvhvpo	cmj5gx2kx005335udc4757qsp	\N	2026-01-27 01:35:19.049	2026-01-27 01:45:26.04	10	SELESAI	52.94117647058824	f	[{"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "Interface\\nGetaway\\nDns server\\nDhcp address"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Untuk mendapatkan konfigurasi mengurangi kesalahan"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "B"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Nat dengan aksi masquarede pada firewal"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}]	2026-01-27 01:32:47.564	2026-01-27 01:45:26.041	\N	0
cmlfwooel001prapvlpwjgbxt	cmlfwooe0001arapva97odoug	cmj5gx0ml002h35udvjc8yzeb	\N	2026-02-10 01:18:09.651	2026-02-10 01:42:43.121	24	SELESAI	80.43478260869566	t	[{"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "B"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "B"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "B"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPv4 menggunakan angka desimal yang dibagi menjadi empat oktet setiap oktet berisi 8 bit \\nIPv6 menggunakan angka desimal dan huruf "}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "a. Grup kerja marketing/sales bertugas mempromosikan layanannya\\nb. Grup kerja networking Design bertugas mengatur jaringan "}]	2026-02-10 01:12:10.893	2026-03-05 01:12:20.085	{"cmlfwooe2001lrapv5bwukvro": 8, "cmlfwooe2001mrapv2rndc0wz": 8}	0
cmmjxiro6002rr4pv4iiyht4d	cmmjxirnp001zr4pvr3j3egwq	cmj5gx2kx005335udc4757qsp	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmlfwooel001rrapv3cxugfgg	cmlfwooe0001arapva97odoug	cmj5gx0x4002v35udz7qohe6d	\N	2026-02-10 01:17:41.474	2026-02-10 01:44:35.115	26	SELESAI	67.3913043478261	f	[{"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "D"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "memiliki peran krusial yang  saling bersinergi "}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPv4 menggunakan format  desimal bertitik\\nIPv6 menggunakan  format heksadesimal"}]	2026-02-10 01:12:10.893	2026-03-05 01:12:50.407	{"cmlfwooe2001lrapv5bwukvro": 2, "cmlfwooe2001mrapv2rndc0wz": 2}	0
cmkvujds2001c9tpva9gr819e	cmkvujdrj000v9tpvppviumxp	cmj5gx0r4002n35ud6i7qxccl	\N	2026-01-27 00:51:05.61	2026-01-27 01:02:51.732	11	SELESAI	63.52941176470588	f	[{"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "B"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Restart komputer, untuk memulai ulang perangkat "}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Untuk minta IP otomatis dari mikrotik "}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "B"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "1.  Menghubungkan kabel LAN ke port selain internet (biasanya ether 2)\\n2. Membuat IP pada ether 2\\n3. masuk ke menu dhcp server lalu klik dhcp setup\\n4. pada dhcp setup pilih ether 2 dan klik next sampai  \\n"}]	2026-01-27 00:16:41.09	2026-01-27 01:25:36.974	{"cmkvujdrl00169tpv4x67yjfx": 8, "cmkvujdrl00179tpvo91qouvx": 5, "cmkvujdrl00189tpv00iwpyrp": 6}	0
cml4mdzun004ergpvh25l9wov	cml4mdzu6003grgpvi7qohvfc	cmj5gx0o3002j35uda0ok0i4j	\N	2026-02-02 04:15:24.241	2026-02-02 04:23:44.334	8	SELESAI	80	t	[{"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "D"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "A"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "A"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "A"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "A"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "B"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "C"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "A"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "C"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "B"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "B"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "C"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "C"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}]	2026-02-02 03:38:28.415	2026-02-02 04:23:44.336	\N	0
cmmjweuv1001xr4pvtpyspz26	cmmjweuud0016r4pvw4ij3lxz	cmj5gx1vm004535udc4l2kzg5	\N	2026-03-10 01:01:19.422	2026-03-10 01:15:08.61	13	SELESAI	85	t	[{"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "B"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "E"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "B"}]	2026-03-10 00:55:19.74	2026-03-10 01:15:08.614	\N	0
cmlfwooel001orapve7fa9b4v	cmlfwooe0001arapva97odoug	cmj5gx08y001z35udsqo698l8	\N	2026-02-10 01:17:17.565	2026-02-10 01:44:04.003	26	SELESAI	86.95652173913044	t	[{"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "B"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "B. Grub kerja yang mendesign suatu jaringan agar pekerjaan teratur dan jaringan bekerja dengan baik\\nA. Grub kerja yang tugasnya mempromosikan layanannya"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "Ipv4 menggunakan angka desimal di bagi menjadi 4 oktet dan di bedakam dengan titik(.) Jumlah setiap oktet berisi 8 bit. Yang jika di jumlah ada 32 bit.\\n\\nIpv6 menggunkan angka desimal dan huruf dan memiliki 128 bit"}]	2026-02-10 01:12:10.893	2026-03-05 01:11:22.932	{"cmlfwooe2001lrapv5bwukvro": 5, "cmlfwooe2001mrapv2rndc0wz": 8}	0
cmmjweuv0001sr4pv9nj430n9	cmmjweuud0016r4pvw4ij3lxz	cmj5gx08y001z35udsqo698l8	\N	2026-03-10 01:00:42.251	2026-03-10 01:16:03.44	15	SELESAI	90	t	[{"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "B"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}]	2026-03-10 00:55:19.74	2026-03-10 01:16:03.443	\N	0
cmmjweuv1001vr4pvilqy209b	cmmjweuud0016r4pvw4ij3lxz	cmj5gx0x4002v35udz7qohe6d	\N	2026-03-10 01:00:25.595	2026-03-10 01:19:05.226	18	SELESAI	100	t	[{"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}]	2026-03-10 00:55:19.74	2026-03-10 01:19:05.229	\N	0
cmmjxiro6002lr4pvv3aegurl	cmmjxirnp001zr4pvr3j3egwq	cmj5gx08y001z35udsqo698l8	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmkvujds2001b9tpvqxwlf2t2	cmkvujdrj000v9tpvppviumxp	cmj5gx0ml002h35udvjc8yzeb	\N	2026-01-27 00:51:00.119	2026-01-27 01:11:29.897	20	SELESAI	85.88235294117646	t	[{"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "Terminal/ether, IP broadcast,IP server,dan subneting"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "DHCP client untuk mendapatkan IP dari server agar bisa terhubung ke internet"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Agar clien mendapatkan IP dari server "}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}]	2026-01-27 00:16:41.09	2026-01-27 01:24:15.9	{"cmkvujdrl00169tpv4x67yjfx": 11, "cmkvujdrl00179tpvo91qouvx": 7, "cmkvujdrl00189tpv00iwpyrp": 10}	0
cmkvujds2001f9tpv1xfr6qkk	cmkvujdrj000v9tpvppviumxp	cmj5gx1vm004535udc4l2kzg5	\N	2026-01-27 00:53:41.092	2026-01-27 01:06:54.945	13	SELESAI	89.41176470588236	t	[{"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "untuk mendapatkan ip address "}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "ip address, dhcp server, dhcp client dan Interface"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "NAT dan action mesqurade "}]	2026-01-27 00:16:41.09	2026-01-27 01:27:18.778	{"cmkvujdrl00169tpv4x67yjfx": 7, "cmkvujdrl00179tpvo91qouvx": 11, "cmkvujdrl00189tpv00iwpyrp": 8}	0
cmmjxiro6002mr4pvd5v6fie0	cmmjxirnp001zr4pvr3j3egwq	cmj5gx0ml002h35udvjc8yzeb	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmmjxiro6002nr4pvfnnxk3pq	cmmjxirnp001zr4pvr3j3egwq	cmj5gx0r4002n35ud6i7qxccl	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmkvx99ak00289tpveslu6guv	cmkvx99a8001q9tpv64yvhvpo	cmj5gx0x4002v35udz7qohe6d	\N	2026-01-27 01:38:56.941	2026-01-27 01:58:02.224	19	SELESAI	41.17647058823529	f	[{"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "A"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "mempercepat koneksi internet "}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Nat  fungsinya   adalah  merubah IP private LAN menjadi  IP publik "}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "D"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "DNS servers \\nDHCP server\\nAddrees \\ngateway "}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}]	2026-01-27 01:32:47.564	2026-01-27 01:58:02.227	\N	0
cmmcsevsx001or0pvz7u9d20r	cmmcsevsd0013r0pv5je0p4we	cmj5gx0i0002b35ud19a6xd7r	\N	2026-03-05 02:00:50.569	\N	\N	DIBLOKIR	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 02:06:26.273	\N	0
cmmcsevsx001hr0pvv7rl8q2w	cmmcsevsd0013r0pv5je0p4we	cmj5gwyvo000735udytelfevq	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 01:28:59.265	\N	0
cmlfwooel001srapvcw4f32dc	cmlfwooe0001arapva97odoug	cmj5gx103002z35udn2m30zv3	\N	2026-02-10 01:17:59.49	2026-02-10 01:47:21.096	29	SELESAI	73.91304347826086	t	[{"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "A"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "A"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "1. IPv4 menggunakan empat  1 byte angka desimal yang di pisahkan dengan titik.(192.168.1.1). Sedangkan IPV6 menggunakan angka hexadesimal yang di pisahkan oleh titik dua.\\n2. Ipv6 menawarkan fitur-fitur yang membuat perutean melalui internet yang lebih efisien dari pada IPv4."}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "B. Bertugas merencanakan desain jaringan lokal pada suatu perusahaan.\\nA. Menyebarkan jaringan"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "A"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}]	2026-02-10 01:12:10.893	2026-03-05 01:13:24.332	{"cmlfwooe2001lrapv5bwukvro": 5, "cmlfwooe2001mrapv2rndc0wz": 8}	0
cmmjxiro6002or4pvw5utabft	cmmjxirnp001zr4pvr3j3egwq	cmj5gx0x4002v35udz7qohe6d	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmmcsevsx001jr0pva0hcck8c	cmmcsevsd0013r0pv5je0p4we	cmj5gwz9u000p35uddazsd00z	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 01:28:59.265	\N	0
cmmcsevsx001kr0pvzovikekf	cmmcsevsd0013r0pv5je0p4we	cmj5gx01e001p35udcjqmly7n	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-05 01:28:59.265	2026-03-05 01:28:59.265	\N	0
cmmjxiro6002pr4pvbbb1p5t6	cmmjxirnp001zr4pvr3j3egwq	cmj5gx103002z35udn2m30zv3	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmmjxiro6002qr4pvt1umo015	cmmjxirnp001zr4pvr3j3egwq	cmj5gx1vm004535udc4l2kzg5	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 01:26:21.846	2026-03-10 01:26:21.846	\N	0
cmkvujds2001d9tpvjqtzn34i	cmkvujdrj000v9tpvppviumxp	cmj5gx0x4002v35udz7qohe6d	\N	2026-01-27 00:52:38.783	2026-01-27 01:12:56.502	20	SELESAI	45.88235294117647	f	[{"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "A"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "E"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "B"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "C"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "restart "}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "untuk mendapatkan IP otomatis "}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "IP address \\nSubnet mask \\nDefault gateway \\nDNS server "}]	2026-01-27 00:16:41.09	2026-01-27 01:26:15.922	{"cmkvujdrl00169tpv4x67yjfx": 11, "cmkvujdrl00179tpvo91qouvx": 5, "cmkvujdrl00189tpv00iwpyrp": 8}	0
cmkvujds2001e9tpvcih9k89s	cmkvujdrj000v9tpvppviumxp	cmj5gx103002z35udn2m30zv3	\N	2026-01-27 00:52:13.313	2026-01-27 01:12:56.261	20	SELESAI	80	t	[{"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Untuk mendapatkan IP otomatis "}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Restart router mikrotik"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "IP address \\nSubnet mask\\nDefault gateway \\nDNS server "}]	2026-01-27 00:16:41.09	2026-01-27 01:26:54.341	{"cmkvujdrl00169tpv4x67yjfx": 11, "cmkvujdrl00179tpvo91qouvx": 6, "cmkvujdrl00189tpv00iwpyrp": 6}	0
cmmcsevsx001rr0pv9oxcp1is	cmmcsevsd0013r0pv5je0p4we	cmj5gx1sk004135udexpydl8s	\N	2026-03-05 01:48:48.557	2026-03-05 02:08:00.203	19	SELESAI	80.43478260869566	t	[{"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "A"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPv4 = 192.168.1.1\\nIPv6 = 2001:0DB8:0234:AB00:0123:4567:8901:ABCD\\n\\nIPV4 = 32 bit\\nIPV6 = 128 bit"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "C"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "B"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "a. Untuk memasarkan layanan\\nb. Untuk merancang dan mengelola jaringan"}]	2026-03-05 01:28:59.265	2026-03-13 02:57:26.998	{"cmmcsevsf001er0pvz1wetlkh": 8, "cmmcsevsf001fr0pvv5u0ubpb": 8}	0
cml4mdzun004grgpvfi5s1grm	cml4mdzu6003grgpvi7qohvfc	cmj5gx206004b35uduf215trn	\N	2026-02-02 03:48:04.198	2026-02-02 04:11:51.126	23	SELESAI	86	t	[{"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "B"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "B"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "C"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "C"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "E"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "C"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "B"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "C"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "B"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "E"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "D"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "B"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "B"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}]	2026-02-02 03:38:28.415	2026-02-02 04:11:51.13	\N	0
cmmfqhbea000fqrpvow3jxeaj	cmmfqhbdb0000qrpv7vvdx247	cmj5gx08y001z35udsqo698l8	\N	2026-03-07 03:04:56.821	2026-03-07 03:30:05.431	25	SELESAI	52.94117647058824	f	[{"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "agar client mendapatkan ip otomatis dari isp"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "setting firewall fungsi nya adalah mengubah ip privat menjadi ip publik"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "1. gateaway\\n2. Dns\\n3. ip pool\\n4. ip dari ether client"}]	2026-03-07 02:58:12.081	2026-03-07 03:30:05.434	\N	0
cmmfqhbea000gqrpvxpaifdel	cmmfqhbdb0000qrpv7vvdx247	cmj5gx0ml002h35udvjc8yzeb	\N	2026-03-07 03:07:40.109	2026-03-07 03:30:39.293	22	SELESAI	52.94117647058824	f	[{"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "agar dapat terhubung ke jaringan internet WAN"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "IP broatcas ,IP mikrotik,IP  DNS, dan  IP client"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "DHCP client agar bisa terhubung ke jariangan WAN  dan mendapatkan IP secara otomatis"}]	2026-03-07 02:58:12.081	2026-03-07 03:30:39.296	\N	0
cml4mdzun004jrgpv3gygermf	cml4mdzu6003grgpvi7qohvfc	cmj5gx2i0004z35udecgz1nlq	\N	2026-02-02 03:54:38.034	2026-02-02 04:12:40.46	18	SELESAI	34	f	[{"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "C"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "A"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "C"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "A"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "A"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "B"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "C"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "E"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "C"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "C"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "B"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "C"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "D"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "C"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "D"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "A"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "A"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "B"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "C"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "E"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "C"}]	2026-02-02 03:38:28.415	2026-02-02 04:12:40.461	\N	0
cmkvujds2001a9tpvntb33n04	cmkvujdrj000v9tpvppviumxp	cmj5gx08y001z35udsqo698l8	\N	2026-01-27 00:50:44.272	2026-01-27 01:11:35.584	20	SELESAI	94.11764705882352	t	[{"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Konfigurasi NAT tambahkam masquerade pada menu firewall\\nFungsinya mengubah ip privat menjadi ip publik"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "1.Setting DHCP SETUP\\n2.pastikan ether yang tepat untuk client biasanya ether 2\\n3.pastikan ip sesuai dengan ip yang sudah di buat\\n4.perhatikan gateway dari ip apakah sudah betul atau tidak\\n"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "B"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Karna DHCP Client memastikan pc tersambung ke internet dan berfungsi meminta ip dari router"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}]	2026-01-27 00:16:41.09	2026-01-27 01:23:22.221	{"cmkvujdrl00169tpv4x67yjfx": 11, "cmkvujdrl00179tpvo91qouvx": 11, "cmkvujdrl00189tpv00iwpyrp": 13}	0
cmmfqhbea000kqrpvtmdjaopu	cmmfqhbdb0000qrpv7vvdx247	cmj5gx1vm004535udc4l2kzg5	\N	2026-03-07 03:06:49.011	2026-03-07 03:26:23.654	19	SELESAI	41.17647058823529	f	[{"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "E"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "B"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "C"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "untuk  preforma jaringan/ internet \\n"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "kongfigurasi NAT karena nat fungsinya  agar dapat internet dari mikrotik ke pc."}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "NAT. dns.ip adderes& dhcp client"}]	2026-03-07 02:58:12.081	2026-03-07 03:26:23.662	\N	0
cmkvx99ak002a9tpvp8pvo7ld	cmkvx99a8001q9tpv64yvhvpo	cmj5gx1vm004535udc4l2kzg5	\N	2026-01-27 01:36:45.782	2026-01-27 01:43:18.418	6	SELESAI	58.82352941176471	f	[{"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "efisien dan mudah mengakses ip address"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "NAT,ke action terus ke mesqurade "}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "dchp server,ip address, NAT, dn dhcp client"}]	2026-01-27 01:32:47.564	2026-01-27 01:43:18.421	\N	0
cml4mdzun004crgpv00ome5im	cml4mdzu6003grgpvi7qohvfc	cmj5gwzeh000v35udwd1xnzk8	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-02-02 03:38:28.415	2026-02-02 03:38:28.415	\N	0
cmkvx99ak00269tpvgsl85dhi	cmkvx99a8001q9tpv64yvhvpo	cmj5gx0ml002h35udvjc8yzeb	\N	2026-01-27 01:33:36.914	2026-01-27 01:42:55.321	9	SELESAI	58.82352941176471	f	[{"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "D"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Agar clien bisa mendapatkan IP dari server "}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "IP gateway,IP broadcast,IP pool,dan IP DNS"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Konfigurasi NAT di firewall agar clien dapat terhubung ke jaringan ISP"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}]	2026-01-27 01:32:47.564	2026-01-27 01:42:55.324	\N	0
cml4mdzun004frgpvjizp5af9	cml4mdzu6003grgpvi7qohvfc	cmj5gx17k003935udaewx76ro	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-02-02 03:38:28.415	2026-02-02 03:38:28.415	\N	0
cmkvx99ak00299tpvlunhrt9k	cmkvx99a8001q9tpv64yvhvpo	cmj5gx103002z35udn2m30zv3	\N	2026-01-27 01:36:38.287	2026-01-27 01:43:49.398	7	SELESAI	52.94117647058824	f	[{"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "Untuk memberikan IP otomatis "}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "Netmaks\\nDefault gateway \\nIP address \\nDNS server "}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "Restart router "}]	2026-01-27 01:32:47.564	2026-01-27 01:43:49.401	\N	0
cml4mdzun004krgpv7ml8qcpt	cml4mdzu6003grgpvi7qohvfc	cmj5gx2ny005735udgqgfno56	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-02-02 03:38:28.415	2026-02-02 03:38:28.415	\N	0
cml4mdzun004mrgpvl2voasp8	cml4mdzu6003grgpvi7qohvfc	cmj5gwyx9000935ud28f9ggyr	\N	2026-02-02 03:47:53.877	2026-02-02 03:48:25.648	0	SELESAI	2	f	[{"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}]	2026-02-02 03:38:28.415	2026-02-02 03:48:25.652	\N	0
cml4n5hb2006krgpvwsunw01u	cml4n5ha4005orgpv2bycgzg4	cml4n1odj005nrgpvbubg8thz	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-02-02 03:59:50.749	2026-02-02 03:59:50.749	\N	0
cml4mdzun004lrgpvax9jl2k4	cml4mdzu6003grgpvi7qohvfc	cmj5gx2qz005b35ud4370ott0	\N	2026-02-02 04:08:55.486	2026-02-02 04:20:56.584	12	SELESAI	98	t	[{"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "B"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "A"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "C"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "C"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "C"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "C"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "C"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "B"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "B"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "B"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "E"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "B"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}]	2026-02-02 03:38:28.415	2026-02-02 04:20:56.587	\N	0
cmmjxkk3x003fr4pv3fb4ju1u	cmmjxkk2d002sr4pvwz0l1rak	cmj5gx103002z35udn2m30zv3	\N	2026-03-10 01:28:29.352	2026-03-10 01:33:26.914	4	SELESAI	85	t	[{"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "A"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "A"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "B"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}]	2026-03-10 01:27:45.356	2026-03-10 01:33:26.917	\N	0
cmmjweuv1001wr4pv1eo04gka	cmmjweuud0016r4pvw4ij3lxz	cmj5gx103002z35udn2m30zv3	\N	2026-03-10 00:59:36.711	2026-03-10 01:17:39.738	18	SELESAI	85	t	[{"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "B"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "A"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "A"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}]	2026-03-10 00:55:19.74	2026-03-10 01:17:39.741	\N	0
cmmjyqpzl005sr4pvjgxlotxy	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx206004b35uduf215trn	\N	2026-03-10 02:09:52.779	2026-03-10 02:19:00.246	9	SELESAI	92	t	[{"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "B"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "B"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "E"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "A"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}]	2026-03-10 02:00:32.528	2026-03-10 02:19:00.249	\N	0
cmmjxkk3x003er4pvqoxakr5k	cmmjxkk2d002sr4pvwz0l1rak	cmj5gx0x4002v35udz7qohe6d	\N	2026-03-10 01:28:23.949	2026-03-10 01:37:18.218	8	SELESAI	80	t	[{"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "E"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "C"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}]	2026-03-10 01:27:45.356	2026-03-10 01:37:18.221	\N	0
cml4mdzun004irgpvmvyehx79	cml4mdzu6003grgpvi7qohvfc	cmj5gx264004j35ud8hnkcdnj	\N	2026-02-02 03:52:12.342	2026-02-02 04:13:29.672	21	SELESAI	86	t	[{"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "A"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "C"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "B"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "B"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "A"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "E"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "D"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "A"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "C"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "B"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "C"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "A"}]	2026-02-02 03:38:28.415	2026-02-02 04:13:29.675	\N	0
cmmcsevsx001lr0pvn36cx828	cmmcsevsd0013r0pv5je0p4we	cmj5gx05x001v35udwd5nk8nj	\N	2026-03-05 01:31:43.208	2026-03-05 01:49:54.984	18	SELESAI	100	t	[{"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "ipv4 menggunakan 32 bit dalam notasi desimal bertitik\\nipv6 menggunakan 128 bit dalam notasi heksa desimal berkolom"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "grup kerja marketing/sales berperan akuisisi pelanggan, negoisasi, dan promosi \\ngrup kerja networking design bertanggung jawab merancang, mengkonfigurasi, dan memastikan kelayakan insfratruktur jaringan "}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}]	2026-03-05 01:28:59.265	2026-03-13 02:56:49.847	{"cmmcsevsf001er0pvz1wetlkh": 8, "cmmcsevsf001fr0pvv5u0ubpb": 8}	0
cmmfqhbea000lqrpv0k251cy3	cmmfqhbdb0000qrpv7vvdx247	cmj5gx2kx005335udc4757qsp	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-07 02:58:12.081	2026-03-07 02:58:12.081	\N	0
cmmfqhbea000jqrpvh2ltczij	cmmfqhbdb0000qrpv7vvdx247	cmj5gx103002z35udn2m30zv3	\N	2026-03-07 03:05:06.537	2026-03-07 03:26:27.683	21	SELESAI	41.17647058823529	f	[{"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "E"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "B"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "D"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "untuk mendapatkan ip otomatis"}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "IP Adrees\\nInterface\\nDHCP Client\\nDNS"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "SUBNETTING = KEAMAN SERTA PERFORMA JARINGAN"}]	2026-03-07 02:58:12.081	2026-03-07 03:26:27.686	\N	0
cmmjweuv1001yr4pvpcr1dg0f	cmmjweuud0016r4pvw4ij3lxz	cmj5gx2kx005335udc4757qsp	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 00:55:19.74	2026-03-10 00:55:19.74	\N	0
cmmcsevsx001mr0pvjm9ekon8	cmmcsevsd0013r0pv5je0p4we	cmj5gx0di002535ud32uasdbw	\N	2026-03-05 01:34:09.438	2026-03-05 01:53:56.552	19	SELESAI	86.95652173913044	t	[{"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPv4 menggunakan 32-bit\\nIPv6 menggunakan 128-bit"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "B"}, {"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "A"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "bertanggungjawab untuk menarik pelanggan baru dan mempertahankan pelanggan yang sudah ada"}]	2026-03-05 01:28:59.265	2026-03-13 02:57:01.649	{"cmmcsevsf001er0pvz1wetlkh": 8, "cmmcsevsf001fr0pvv5u0ubpb": 8}	0
cml4mdzun004nrgpvwhl88q8g	cml4mdzu6003grgpvi7qohvfc	cmj5gx0c0002335udrmwctcnm	\N	2026-02-02 03:48:39.799	2026-02-02 04:02:40.431	14	SELESAI	92	t	[{"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "E"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "C"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "C"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "C"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "C"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "C"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "B"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "B"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "B"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "B"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "C"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "A"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "E"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "E"}]	2026-02-02 03:38:28.415	2026-02-02 04:02:40.435	\N	0
cml4mdzun004hrgpvykc7ds7q	cml4mdzu6003grgpvi7qohvfc	cmj5gx21o004d35udxjptvn08	\N	2026-02-02 03:59:48.721	2026-02-02 04:19:35.531	19	SELESAI	57.99999999999999	f	[{"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "B"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "C"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "D"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "B"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "A"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "A"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "E"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "C"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "C"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "A"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "A"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "A"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "B"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "C"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "E"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "B"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "A"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "A"}, {"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "A"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "B"}]	2026-02-02 03:38:28.415	2026-02-02 04:19:35.538	\N	0
cml4mdzun004orgpv5416vlt0	cml4mdzu6003grgpvi7qohvfc	cmj5gx1o2003v35udzn7dj9ls	\N	2026-02-02 04:21:47.54	2026-02-02 04:25:06.282	3	SELESAI	32	f	[{"soalId": "cml4mcibg002hrgpvp3obcvd1", "jawaban": "B"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "A"}, {"soalId": "cml4mci8h001vrgpvbn5v3szn", "jawaban": "B"}, {"soalId": "cml4mcibr002jrgpvd7mntrmy", "jawaban": "B"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "A"}, {"soalId": "cml4mci9k0024rgpv0ktf8och", "jawaban": "B"}, {"soalId": "cml4mciaq002crgpvfaszib5t", "jawaban": "C"}, {"soalId": "cml4mci9z0027rgpv3hqw3s43", "jawaban": "C"}, {"soalId": "cml4mci9g0023rgpvc1iujwzo", "jawaban": "A"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "C"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "B"}, {"soalId": "cml4mciaf002argpvdccm9nof", "jawaban": "D"}, {"soalId": "cml4mcibx002krgpvs0hnsuzy", "jawaban": "B"}, {"soalId": "cml4mci89001trgpvyrtyw8sl", "jawaban": "B"}, {"soalId": "cml4mci8d001urgpv1k6y1h8z", "jawaban": "C"}, {"soalId": "cml4mcib0002ergpvhsb8ywhv", "jawaban": "A"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "A"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "A"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "B"}, {"soalId": "cml4mci8z001zrgpvkuhii72a", "jawaban": "A"}, {"soalId": "cml4mci8q001xrgpvkhyvra67", "jawaban": "C"}, {"soalId": "cml4mciba002grgpvgdr5lxlu", "jawaban": "A"}, {"soalId": "cml4mcia40028rgpv0hjvbqmd", "jawaban": "B"}, {"soalId": "cml4mci9c0022rgpvyy4h4xbu", "jawaban": "D"}, {"soalId": "cml4mci84001srgpvp3hrwrmq", "jawaban": "D"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "A"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "A"}, {"soalId": "cml4mci980021rgpvygkrq73g", "jawaban": "C"}, {"soalId": "cml4mci8m001wrgpv6hzvzmw0", "jawaban": "A"}, {"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "D"}]	2026-02-02 03:38:28.415	2026-02-02 04:25:06.285	\N	0
cmmjyqpzl005rr4pvfhcqs2w0	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx17k003935udaewx76ro	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-10 02:00:32.528	2026-03-10 02:00:32.528	\N	0
cmmfqhbea000hqrpvi3kpy9id	cmmfqhbdb0000qrpv7vvdx247	cmj5gx0r4002n35ud6i7qxccl	\N	2026-03-07 03:05:09.528	2026-03-07 03:30:54.563	25	SELESAI	47.05882352941176	f	[{"soalId": "cmkvugtq700029tpvbd2p7jaf", "jawaban": "C"}, {"soalId": "cmkvugtqf00039tpvianx6e0u", "jawaban": "E"}, {"soalId": "cmkvugtqk00049tpvovqw9v22", "jawaban": "B"}, {"soalId": "cmkvugtqp00059tpvzxxb7qry", "jawaban": "A"}, {"soalId": "cmkvugtqu00069tpvih5v2r9k", "jawaban": "A"}, {"soalId": "cmkvugtqy00079tpv1z5c50b3", "jawaban": "D"}, {"soalId": "cmkvugtr300089tpv56fp4fqn", "jawaban": "B"}, {"soalId": "cmkvugtr800099tpvg0ds82y6", "jawaban": "E"}, {"soalId": "cmkvugtrd000a9tpvt0gbc167", "jawaban": "C"}, {"soalId": "cmkvugtrh000b9tpvffymrb7r", "jawaban": "C"}, {"soalId": "cmkvugtrl000c9tpv8undkp3n", "jawaban": "untuk mendapatkan ip secara otomatis "}, {"soalId": "cmkvugtrv000e9tpv0zusqhwy", "jawaban": "1.  membuat ip pada port ether2 (selain port internet)\\n2. konfigurasi dns\\n3. firewall\\n"}, {"soalId": "cmkvugtrq000d9tpvloy2r3xs", "jawaban": "konfigurasi firewall"}]	2026-03-07 02:58:12.081	2026-03-07 03:30:54.566	\N	0
cmmjweuv1001tr4pv0r4uj4ds	cmmjweuud0016r4pvw4ij3lxz	cmj5gx0ml002h35udvjc8yzeb	\N	2026-03-10 01:00:43.443	2026-03-10 01:15:16.743	14	SELESAI	75	t	[{"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "A"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "B"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "B"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "B"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}]	2026-03-10 00:55:19.74	2026-03-10 01:15:16.746	\N	0
cmmlfsgab004drspvqn47t2o6	cmmlfsg9q003mrspvkzd4yy6j	cmj5gwyvo000735udytelfevq	\N	2026-03-12 01:04:10.438	2026-03-12 01:47:41.006	43	SELESAI	56.00000000000001	f	[{"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "C"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "A"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "B"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "E"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "D"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "B"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "B"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "B"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "D"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "A"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "A"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "B"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "E"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "C"}]	2026-03-11 02:45:32.915	2026-03-12 01:47:41.01	\N	0
cmmjyqpzl005wr4pv34vsowwv	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx2ny005735udgqgfno56	\N	2026-03-10 02:17:23.455	2026-03-10 02:37:40.881	20	SELESAI	36	f	[{"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "A"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "A"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "A"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "A"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "D"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "D"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "A"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "E"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "D"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "E"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "D"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "A"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "D"}]	2026-03-10 02:00:32.528	2026-03-10 02:37:40.884	\N	0
cmmjyqpzl005ur4pvg81exm1m	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx264004j35ud8hnkcdnj	\N	2026-03-10 02:12:29.685	2026-03-10 02:21:20.952	8	SELESAI	100	t	[{"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "B"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "B"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}]	2026-03-10 02:00:32.528	2026-03-10 02:21:20.955	\N	0
cmmlfsgab004hrspv2fj70dt9	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx05x001v35udwd5nk8nj	\N	2026-03-12 00:58:43.147	2026-03-12 01:23:55.623	25	SELESAI	60	f	[{"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "C"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "B"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "B"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "E"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "A"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "A"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "B"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "B"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "C"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "C"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "A"}]	2026-03-11 02:45:32.915	2026-03-12 01:23:55.627	\N	0
cmmlfsgab004krspvpxzf37nu	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx0i0002b35ud19a6xd7r	\N	2026-03-12 01:26:26.131	2026-03-12 01:41:12.628	14	SELESAI	56.00000000000001	f	[{"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "E"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "E"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "B"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "B"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "E"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "B"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "B"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "B"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "E"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "A"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "D"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:41:12.631	\N	0
cmmlfsgab004frspv8m6qtfnq	cmmlfsg9q003mrspvkzd4yy6j	cmj5gwz9u000p35uddazsd00z	\N	2026-03-12 01:05:52.624	2026-03-12 01:48:56.439	43	SELESAI	84	t	[{"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "D"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "D"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "D"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "C"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "E"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "A"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "D"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "A"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "C"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}]	2026-03-11 02:45:32.915	2026-03-12 01:48:56.442	\N	0
cmmjyqpzl0060r4pvnsh1edqp	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx1o2003v35udzn7dj9ls	\N	2026-03-10 02:18:12.187	2026-03-10 02:23:39.092	5	SELESAI	28	f	[{"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "A"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "D"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "A"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "B"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "A"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "A"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "A"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "A"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "A"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "A"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "A"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "C"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "B"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "A"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "B"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "A"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "A"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "A"}]	2026-03-10 02:00:32.528	2026-03-10 02:23:39.099	\N	0
cmmjyqpzl005or4pvaqqgsjbb	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gwzeh000v35udwd1xnzk8	\N	2026-03-10 02:18:06.799	2026-03-10 02:35:06.222	16	SELESAI	76	t	[{"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "B"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "E"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "D"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "A"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "A"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "C"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "B"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}]	2026-03-10 02:00:32.528	2026-03-10 02:35:06.226	\N	0
cmmle1rlc003lrspv1a44oelx	cmmle1rkt002urspv36z7gvns	cmj5gx17k003935udaewx76ro	\N	2026-03-11 01:57:44.801	2026-03-11 02:10:24.006	12	SELESAI	76	t	[{"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "E"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "D"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "E"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "C"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "D"}]	2026-03-11 01:56:48.239	2026-03-11 02:10:24.011	\N	0
cmmo9rkyd000whgpvbs36fflq	cmmo9rkxm0000hgpvp25ph3ul	cmj5gwzeh000v35udwd1xnzk8	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd000xhgpv3wxca4ck	cmmo9rkxm0000hgpvp25ph3ul	cmj5gwztr001f35udgp2iqne6	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd000yhgpvrcfktlxe	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx0o3002j35uda0ok0i4j	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd000zhgpvfjzcr68l	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx17k003935udaewx76ro	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0010hgpvitx2uqn3	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx21o004d35udxjptvn08	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0011hgpvcuhrdif8	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx264004j35ud8hnkcdnj	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0012hgpvl76t04og	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx2i0004z35udecgz1nlq	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0013hgpvyw7s4jkb	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx2ny005735udgqgfno56	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0014hgpvsxiisnei	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx2qz005b35ud4370ott0	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0015hgpv1ut0ez0q	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx206004b35uduf215trn	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0017hgpvemtaou9u	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx0c0002335udrmwctcnm	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0018hgpvienmoi44	cmmo9rkxm0000hgpvp25ph3ul	cmj5gx1o2003v35udzn7dj9ls	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmo9rkyd0019hgpvl249s8vx	cmmo9rkxm0000hgpvp25ph3ul	cml4n1odj005nrgpvbubg8thz	\N	\N	\N	\N	BELUM_MULAI	\N	\N	\N	2026-03-13 02:20:13.14	2026-03-13 02:20:13.14	\N	0
cmmjyqpzl005qr4pv7uc3jpl2	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx0o3002j35uda0ok0i4j	\N	2026-03-10 02:12:03.443	2026-03-10 02:28:15.268	16	SELESAI	84	t	[{"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "C"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "A"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "A"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}]	2026-03-10 02:00:32.528	2026-03-10 02:28:15.269	\N	0
cmmo9rkyd0016hgpvpzd0ggiw	cmmo9rkxm0000hgpvp25ph3ul	cmj5gwyx9000935ud28f9ggyr	\N	2026-03-13 02:21:05.829	2026-03-13 02:21:44.552	0	SELESAI	14	f	[{"soalId": "cml4mcib5002frgpv76r2bjsi", "jawaban": "A"}, {"soalId": "cml4mci9p0025rgpvrxib62sx", "jawaban": "B"}, {"soalId": "cml4mcic3002lrgpv00zoz162", "jawaban": "C"}, {"soalId": "cml4mci8v001yrgpvlrrubb6v", "jawaban": "A"}, {"soalId": "cml4mci930020rgpv71dlgdwf", "jawaban": "C"}, {"soalId": "cml4mciak002brgpvgqkzu3as", "jawaban": "B"}, {"soalId": "cml4mcibl002irgpv4oib878b", "jawaban": "A"}, {"soalId": "cml4mciav002drgpvau6f2jib", "jawaban": "B"}, {"soalId": "cml4mci9u0026rgpv6z79hyp2", "jawaban": "C"}, {"soalId": "cml4mcia90029rgpvu5bfgrct", "jawaban": "B"}]	2026-03-13 02:20:13.14	2026-03-13 02:21:44.56	\N	0
cmmcsevsx001pr0pvjq66luz2	cmmcsevsd0013r0pv5je0p4we	cmj5gx162003735ud5de1cxbc	\N	2026-03-05 01:47:04.821	2026-03-05 02:18:16.702	31	SELESAI	100	t	[{"soalId": "cmlfwnsb5000mrapvfh5b0twr", "jawaban": "B"}, {"soalId": "cmlfwnsbv000rrapv5js2epw3", "jawaban": "A"}, {"soalId": "cmlfwnsc0000srapvubpk1hoj", "jawaban": "D"}, {"soalId": "cmlfwnscf000vrapvpo0rcsxc", "jawaban": "E"}, {"soalId": "cmlfwnsbg000orapv1elijm56", "jawaban": "B"}, {"soalId": "cmlfwnsca000urapvtftpnh44", "jawaban": "D"}, {"soalId": "cmlfwnsbk000prapvdj1thluw", "jawaban": "C"}, {"soalId": "cmlfwnsbp000qrapv2b1p87qc", "jawaban": "E"}, {"soalId": "cmlfwnsbb000nrapvneybpkec", "jawaban": "D"}, {"soalId": "cmlfwnsc5000trapv57y1fw8n", "jawaban": "E"}, {"soalId": "cmlfwnscq000xrapv055oieom", "jawaban": "IPV4: 32 bit\\nIPV6: 128 bit \\n\\nipv4 terdiri dari 4 angka desimal dipisahkan tanda titik (contohnya: 192.168.1.1)\\nipv6 terdiri dari kombinasi angka dan huruf heksadesimal dipisahkan tanda titik dua (contohnya: 2001:db8:1)"}, {"soalId": "cmlfwnscl000wrapvsitl1k1e", "jawaban": "grup kerja marketing/sales: berperan dan menjual layanan internet kepada pelanggan, tugasnya mencari pelanggan, melakukan promosi, serta menjalin hubungan dengan pelanggan agar target penjualan tercapai.\\n\\ngrup kerja networking design: berperan dalam merancang dan mendesain jaringan sesuai kebutuhan pelanggan, tugasnya membuat perencanaan topologi jaringan, menentukan perangkat yang digunakan serta memastikan jaringan dapat berjalan optimal dan efisien."}]	2026-03-05 01:28:59.265	2026-03-13 02:57:09.256	{"cmmcsevsf001er0pvz1wetlkh": 8, "cmmcsevsf001fr0pvv5u0ubpb": 8}	0
cmmmtbgc7000pqrpvr3ashc0c	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gx05x001v35udwd5nk8nj	\N	2026-03-12 01:52:26.199	2026-03-12 02:06:17.509	13	SELESAI	80	t	[{"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "A"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "B"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "B"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}]	2026-03-12 01:52:00.63	2026-03-12 02:06:17.512	\N	0
cmmjyqpzl005vr4pvpw0czlae	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx2i0004z35udecgz1nlq	\N	2026-03-10 02:13:28.544	2026-03-10 02:30:04.518	16	SELESAI	56.00000000000001	f	[{"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "D"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "D"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "D"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "A"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "C"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "A"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "A"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "D"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "E"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "B"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}]	2026-03-10 02:00:32.528	2026-03-10 02:30:04.521	\N	0
cmmlfsgab004mrspvz3vwgwpc	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx1c3003f35udp6zso1o3	\N	2026-03-12 01:07:12.38	2026-03-12 01:44:55.514	37	SELESAI	68	f	[{"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "D"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "E"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "E"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "B"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "B"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "A"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "C"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "D"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "B"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:44:55.517	\N	0
cmmlfsgab004nrspv2n9go37r	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx1sk004135udexpydl8s	\N	2026-03-12 00:51:32.782	2026-03-12 01:29:55.675	38	SELESAI	80	t	[{"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "E"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "A"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "A"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "C"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "C"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "B"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "D"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "B"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}]	2026-03-11 02:45:32.915	2026-03-12 01:29:55.678	\N	0
cmmlfsgab004grspvipqbpo3j	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx01e001p35udcjqmly7n	\N	2026-03-12 00:54:53.659	2026-03-12 01:30:40.194	35	SELESAI	56.00000000000001	f	[{"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "C"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "D"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "C"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "A"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "C"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "A"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "E"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "B"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "B"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "D"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "A"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:30:40.198	\N	0
cmmmtbgc6000oqrpv6d3us08r	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gx01e001p35udcjqmly7n	\N	2026-03-12 01:52:21.613	2026-03-12 02:08:25.189	16	SELESAI	80	t	[{"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "A"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "B"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "A"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "B"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}]	2026-03-12 01:52:00.63	2026-03-12 02:08:25.192	\N	0
cmmjyqpzl005pr4pve1jt2h6c	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gwztr001f35udgp2iqne6	\N	2026-03-10 02:13:52.753	2026-03-10 02:30:59.685	17	SELESAI	32	f	[{"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "A"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "A"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "D"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "D"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "B"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "C"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "A"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "A"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "A"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "A"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "C"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "D"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "B"}]	2026-03-10 02:00:32.528	2026-03-10 02:30:59.689	\N	0
cmmlfsgab004erspvg7wn3lr6	cmmlfsg9q003mrspvkzd4yy6j	cmj5gwz23000f35udoygf650d	\N	2026-03-12 01:02:55.506	2026-03-12 01:32:22.586	29	SELESAI	40	f	[{"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "C"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "B"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "E"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "C"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "B"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "E"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "B"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "A"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "C"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "C"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "B"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:32:22.59	\N	0
cmmjyqpzl005tr4pv26cyv05n	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx21o004d35udxjptvn08	\N	2026-03-10 02:13:51.568	2026-03-10 02:30:00.331	16	SELESAI	80	t	[{"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "A"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "A"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "B"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "E"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "C"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "A"}]	2026-03-10 02:00:32.528	2026-03-10 02:30:00.334	\N	0
cmmmtbgc7000rqrpvp5qhn308	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gx0i0002b35ud19a6xd7r	\N	2026-03-12 01:54:25.701	2026-03-12 02:07:33.686	13	SELESAI	85	t	[{"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "A"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "B"}]	2026-03-12 01:52:00.63	2026-03-12 02:07:33.689	\N	0
cmmjyqpzl005yr4pvhgnp66hr	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gwyx9000935ud28f9ggyr	\N	2026-03-10 02:12:24.259	2026-03-10 02:30:44.944	18	SELESAI	92	t	[{"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "B"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "B"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "C"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}]	2026-03-10 02:00:32.528	2026-03-10 02:30:44.948	\N	0
cmmlfsgab004lrspvzu2sb2pu	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx162003735ud5de1cxbc	\N	2026-03-12 00:53:17.856	2026-03-12 01:48:12.226	54	SELESAI	88	t	[{"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "E"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "D"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "D"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "D"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "B"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "B"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "A"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}]	2026-03-11 02:45:32.915	2026-03-12 01:48:12.229	\N	0
cmmjyqpzl0061r4pv3lfron23	cmmjyqpy0004xr4pv5b5r5q5g	cml4n1odj005nrgpvbubg8thz	\N	2026-03-10 02:13:00.352	2026-03-10 02:31:42.706	18	SELESAI	88	t	[{"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "B"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "A"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "B"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "A"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "B"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "E"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "B"}]	2026-03-10 02:00:32.528	2026-03-10 02:31:42.71	\N	0
cmmmtbgc7000sqrpvefwpr8gh	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gx1c3003f35udp6zso1o3	\N	2026-03-12 01:52:48.554	2026-03-12 02:08:50.301	16	SELESAI	95	t	[{"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "A"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}]	2026-03-12 01:52:00.63	2026-03-12 02:08:50.303	\N	0
cmmmtbgc6000mqrpvmryk3h73	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gwyvo000735udytelfevq	\N	2026-03-12 01:52:58.172	2026-03-12 02:08:28.92	15	SELESAI	80	t	[{"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "D"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "E"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "B"}, {"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "B"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "C"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}]	2026-03-12 01:52:00.63	2026-03-12 02:08:28.923	\N	0
cmmjyqpzl005zr4pvv0x9facn	cmmjyqpy0004xr4pv5b5r5q5g	cmj5gx0c0002335udrmwctcnm	\N	2026-03-10 02:17:08.581	2026-03-10 02:33:55.029	16	SELESAI	68	f	[{"soalId": "cmmjypuk00042r4pv5yrfuwmh", "jawaban": "D"}, {"soalId": "cmmjypuj8003xr4pvqqzvooe0", "jawaban": "B"}, {"soalId": "cmmjypuhi003jr4pvgdp5hwv2", "jawaban": "C"}, {"soalId": "cmmjypuip003tr4pv08jr1c7n", "jawaban": "C"}, {"soalId": "cmmjypukv0047r4pvdkwmbq3h", "jawaban": "C"}, {"soalId": "cmmjypuk60043r4pvv6bw2xur", "jawaban": "D"}, {"soalId": "cmmjypukj0045r4pv6f21z7y9", "jawaban": "D"}, {"soalId": "cmmjypujo0040r4pvdg211hk6", "jawaban": "C"}, {"soalId": "cmmjypukc0044r4pvo8uho1h6", "jawaban": "B"}, {"soalId": "cmmjypuiu003ur4pvpeuc6qos", "jawaban": "B"}, {"soalId": "cmmjypujt0041r4pv1ndtz6j8", "jawaban": "C"}, {"soalId": "cmmjypuiy003vr4pv585thwbs", "jawaban": "D"}, {"soalId": "cmmjypuic003qr4pve0utsc96", "jawaban": "C"}, {"soalId": "cmmjypuik003sr4pvxjh1e82j", "jawaban": "E"}, {"soalId": "cmmjypuj3003wr4pvvkqtu3oz", "jawaban": "C"}, {"soalId": "cmmjypukp0046r4pvl8y48q8s", "jawaban": "C"}, {"soalId": "cmmjypuji003zr4pv7919t2zv", "jawaban": "B"}, {"soalId": "cmmjypuho003kr4pvajj1jufs", "jawaban": "C"}, {"soalId": "cmmjypuhs003lr4pvzja8vc1s", "jawaban": "C"}, {"soalId": "cmmjypui4003or4pvcwq7sgu5", "jawaban": "C"}, {"soalId": "cmmjypuhw003mr4pvgk9re7a2", "jawaban": "C"}, {"soalId": "cmmjypujd003yr4pv1sgls6h3", "jawaban": "A"}, {"soalId": "cmmjypui8003pr4pvt3jlrm2y", "jawaban": "B"}, {"soalId": "cmmjypuhz003nr4pvd33wlq9o", "jawaban": "C"}, {"soalId": "cmmjypuig003rr4pvvli26sfm", "jawaban": "C"}]	2026-03-10 02:00:32.528	2026-03-10 02:33:55.032	\N	0
cmmlfsgab004jrspvgdxpsn58	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx0gi002935udl20nfbog	\N	2026-03-12 00:52:46.378	2026-03-12 01:30:19.948	37	SELESAI	56.00000000000001	f	[{"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "A"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "C"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "B"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "B"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "C"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "E"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "C"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "C"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "B"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "A"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "D"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "D"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "B"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "E"}]	2026-03-11 02:45:32.915	2026-03-12 01:30:19.955	\N	0
cmmmtbgc6000nqrpvjjbv3oah	cmmmtbgbc0000qrpv6hjl5rpd	cmj5gwz23000f35udoygf650d	\N	2026-03-12 01:52:56.392	2026-03-12 02:09:22.339	16	SELESAI	75	t	[{"soalId": "cmmjwdrs8000kr4pvytm7t1c5", "jawaban": "D"}, {"soalId": "cmmjwdrpe0002r4pvgwgvzpj0", "jawaban": "C"}, {"soalId": "cmmjwdrre000fr4pvs4rhtp8u", "jawaban": "A"}, {"soalId": "cmmjwdrsd000lr4pvpr30dr69", "jawaban": "C"}, {"soalId": "cmmjwdrpw0005r4pvqnldjecp", "jawaban": "A"}, {"soalId": "cmmjwdrqy000cr4pvljwuekwm", "jawaban": "C"}, {"soalId": "cmmjwdrqt000br4pvnfl4gq1p", "jawaban": "C"}, {"soalId": "cmmjwdrrk000gr4pvtd81wov4", "jawaban": "D"}, {"soalId": "cmmjwdrq70007r4pv1dmy29pd", "jawaban": "D"}, {"soalId": "cmmjwdrqc0008r4pv5cfupl05", "jawaban": "D"}, {"soalId": "cmmjwdrrp000hr4pv6bsv1xm2", "jawaban": "B"}, {"soalId": "cmmjwdrqn000ar4pvic8pj2us", "jawaban": "C"}, {"soalId": "cmmjwdrrv000ir4pv9tlgfb55", "jawaban": "C"}, {"soalId": "cmmjwdrr9000er4pv4txapu8a", "jawaban": "E"}, {"soalId": "cmmjwdrpl0003r4pvy6or8pr3", "jawaban": "E"}, {"soalId": "cmmjwdrq10006r4pvjsvncl0w", "jawaban": "D"}, {"soalId": "cmmjwdrqi0009r4pvhcx3nvhb", "jawaban": "C"}, {"soalId": "cmmjwdrs1000jr4pvtz50efd1", "jawaban": "B"}, {"soalId": "cmmjwdrr3000dr4pv7ez9kvy9", "jawaban": "C"}, {"soalId": "cmmjwdrpr0004r4pvuzz7o7cd", "jawaban": "C"}]	2026-03-12 01:52:00.63	2026-03-12 02:09:22.34	\N	0
cmmlfsgab004prspvz3zuj77i	cmmlfsg9q003mrspvkzd4yy6j	cmj5gx2wz005j35ud2ivwa2j0	\N	2026-03-12 00:54:46.67	2026-03-12 01:46:10.419	51	SELESAI	84	t	[{"soalId": "cmmlbmdqm0020rspvc9x8w897", "jawaban": "A"}, {"soalId": "cmmlbmdr80023rspvgzo7ww7m", "jawaban": "D"}, {"soalId": "cmmlbmdp6001srspvtfac4e9q", "jawaban": "D"}, {"soalId": "cmmlbmdpi001urspvnpon2orv", "jawaban": "D"}, {"soalId": "cmmlbmdrf0024rspvns9u3zzm", "jawaban": "E"}, {"soalId": "cmmlbmdnl001irspvkw2p8w4u", "jawaban": "B"}, {"soalId": "cmmlbmdq8001yrspvennj241t", "jawaban": "D"}, {"soalId": "cmmlbmdok001orspv2e9nrf52", "jawaban": "C"}, {"soalId": "cmmlbmdpp001vrspvyr0rhiaj", "jawaban": "A"}, {"soalId": "cmmlbmdqt0021rspvkhmn5w8v", "jawaban": "D"}, {"soalId": "cmmlbmdpw001wrspv4uadflm7", "jawaban": "C"}, {"soalId": "cmmlbmdo3001lrspvpcqgxmnc", "jawaban": "D"}, {"soalId": "cmmlbmdr10022rspv5pxzq7gv", "jawaban": "C"}, {"soalId": "cmmlbmdqg001zrspvfxvyld4k", "jawaban": "B"}, {"soalId": "cmmlbmdna001grspvke8dnoz6", "jawaban": "C"}, {"soalId": "cmmlbmdng001hrspvqz47uvtq", "jawaban": "E"}, {"soalId": "cmmlbmdov001qrspv1ruzt8ku", "jawaban": "D"}, {"soalId": "cmmlbmdq2001xrspvgnn17rbi", "jawaban": "C"}, {"soalId": "cmmlbmdop001prspvh623cbct", "jawaban": "C"}, {"soalId": "cmmlbmdnx001krspvat4jkn73", "jawaban": "E"}, {"soalId": "cmmlbmdnq001jrspvimdtyv6q", "jawaban": "D"}, {"soalId": "cmmlbmdoe001nrspvmk1jihw6", "jawaban": "E"}, {"soalId": "cmmlbmdp0001rrspvsyi714v6", "jawaban": "B"}, {"soalId": "cmmlbmdo9001mrspvhc7xavxd", "jawaban": "D"}, {"soalId": "cmmlbmdpc001trspvmnbpzoa0", "jawaban": "A"}]	2026-03-11 02:45:32.915	2026-03-12 01:46:10.423	\N	0
\.


--
-- Data for Name: UjianSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UjianSoal" (id, "ujianId", "bankSoalId", "nomorUrut", bobot, "createdAt") FROM stdin;
cmkvujdrl000w9tpvxyekp5wv	cmkvujdrj000v9tpvppviumxp	cmkvugtq700029tpvbd2p7jaf	1	5	2026-01-27 00:16:41.07
cmkvujdrl000x9tpvgvba5bav	cmkvujdrj000v9tpvppviumxp	cmkvugtqf00039tpvianx6e0u	2	5	2026-01-27 00:16:41.07
cmkvujdrl000y9tpvwf3a0tiy	cmkvujdrj000v9tpvppviumxp	cmkvugtqk00049tpvovqw9v22	3	5	2026-01-27 00:16:41.07
cmkvujdrl000z9tpvt3smr5yj	cmkvujdrj000v9tpvppviumxp	cmkvugtqp00059tpvzxxb7qry	4	5	2026-01-27 00:16:41.07
cmkvujdrl00109tpv9ylc7yop	cmkvujdrj000v9tpvppviumxp	cmkvugtqu00069tpvih5v2r9k	5	5	2026-01-27 00:16:41.07
cmkvujdrl00119tpvh13e4p2z	cmkvujdrj000v9tpvppviumxp	cmkvugtqy00079tpv1z5c50b3	6	5	2026-01-27 00:16:41.07
cmkvujdrl00129tpvgariw6ud	cmkvujdrj000v9tpvppviumxp	cmkvugtr300089tpv56fp4fqn	7	5	2026-01-27 00:16:41.07
cmkvujdrl00139tpvjeodebvm	cmkvujdrj000v9tpvppviumxp	cmkvugtr800099tpvg0ds82y6	8	5	2026-01-27 00:16:41.07
cmkvujdrl00149tpvyhob0i67	cmkvujdrj000v9tpvppviumxp	cmkvugtrd000a9tpvt0gbc167	9	5	2026-01-27 00:16:41.07
cmkvujdrl00159tpv1eytcudn	cmkvujdrj000v9tpvppviumxp	cmkvugtrh000b9tpvffymrb7r	10	5	2026-01-27 00:16:41.07
cmkvujdrl00169tpv4x67yjfx	cmkvujdrj000v9tpvppviumxp	cmkvugtrl000c9tpv8undkp3n	11	11	2026-01-27 00:16:41.07
cmkvujdrl00179tpvo91qouvx	cmkvujdrj000v9tpvppviumxp	cmkvugtrq000d9tpvloy2r3xs	12	11	2026-01-27 00:16:41.07
cmkvujdrl00189tpv00iwpyrp	cmkvujdrj000v9tpvppviumxp	cmkvugtrv000e9tpv0zusqhwy	13	13	2026-01-27 00:16:41.07
cmkvx99a9001r9tpv98z7om2l	cmkvx99a8001q9tpv64yvhvpo	cmkvugtq700029tpvbd2p7jaf	1	5	2026-01-27 01:32:47.552
cmkvx99a9001s9tpv0ds9ijm7	cmkvx99a8001q9tpv64yvhvpo	cmkvugtqf00039tpvianx6e0u	2	5	2026-01-27 01:32:47.552
cmkvx99a9001t9tpvxanlzouf	cmkvx99a8001q9tpv64yvhvpo	cmkvugtqk00049tpvovqw9v22	3	5	2026-01-27 01:32:47.552
cmkvx99a9001u9tpvc9o1psko	cmkvx99a8001q9tpv64yvhvpo	cmkvugtqp00059tpvzxxb7qry	4	5	2026-01-27 01:32:47.552
cmkvx99aa001v9tpvpbov5qmh	cmkvx99a8001q9tpv64yvhvpo	cmkvugtqu00069tpvih5v2r9k	5	5	2026-01-27 01:32:47.552
cmkvx99aa001w9tpv92s6usl2	cmkvx99a8001q9tpv64yvhvpo	cmkvugtqy00079tpv1z5c50b3	6	5	2026-01-27 01:32:47.552
cmkvx99aa001x9tpv5km4ljyw	cmkvx99a8001q9tpv64yvhvpo	cmkvugtr300089tpv56fp4fqn	7	5	2026-01-27 01:32:47.552
cmkvx99aa001y9tpvs6y06imt	cmkvx99a8001q9tpv64yvhvpo	cmkvugtr800099tpvg0ds82y6	8	5	2026-01-27 01:32:47.552
cmkvx99aa001z9tpvo8pdqn17	cmkvx99a8001q9tpv64yvhvpo	cmkvugtrd000a9tpvt0gbc167	9	5	2026-01-27 01:32:47.552
cmkvx99aa00209tpvxhqd6scw	cmkvx99a8001q9tpv64yvhvpo	cmkvugtrh000b9tpvffymrb7r	10	5	2026-01-27 01:32:47.552
cmkvx99aa00219tpv6w99ijvm	cmkvx99a8001q9tpv64yvhvpo	cmkvugtrl000c9tpv8undkp3n	11	11	2026-01-27 01:32:47.552
cmkvx99aa00229tpvu8d830ab	cmkvx99a8001q9tpv64yvhvpo	cmkvugtrq000d9tpvloy2r3xs	12	11	2026-01-27 01:32:47.552
cmkvx99aa00239tpv1gs9zzlu	cmkvx99a8001q9tpv64yvhvpo	cmkvugtrv000e9tpv0zusqhwy	13	13	2026-01-27 01:32:47.552
cml4mdzu7003hrgpvambdzsr3	cml4mdzu6003grgpvi7qohvfc	cml4mci84001srgpvp3hrwrmq	1	4	2026-02-02 03:38:28.397
cml4mdzu7003irgpviakvpxda	cml4mdzu6003grgpvi7qohvfc	cml4mci89001trgpvyrtyw8sl	2	4	2026-02-02 03:38:28.397
cml4mdzu7003jrgpve18uc7or	cml4mdzu6003grgpvi7qohvfc	cml4mci8d001urgpv1k6y1h8z	3	4	2026-02-02 03:38:28.397
cml4mdzu7003krgpvqs6ph19s	cml4mdzu6003grgpvi7qohvfc	cml4mci8h001vrgpvbn5v3szn	4	4	2026-02-02 03:38:28.397
cml4mdzu7003lrgpvai2in8l5	cml4mdzu6003grgpvi7qohvfc	cml4mci8m001wrgpv6hzvzmw0	5	4	2026-02-02 03:38:28.397
cml4mdzu7003mrgpvr4trdltg	cml4mdzu6003grgpvi7qohvfc	cml4mci8q001xrgpvkhyvra67	6	4	2026-02-02 03:38:28.397
cml4mdzu7003nrgpvteda5ewd	cml4mdzu6003grgpvi7qohvfc	cml4mci8v001yrgpvlrrubb6v	7	4	2026-02-02 03:38:28.397
cml4mdzu7003orgpvqwlxwhlm	cml4mdzu6003grgpvi7qohvfc	cml4mci8z001zrgpvkuhii72a	8	4	2026-02-02 03:38:28.397
cml4mdzu7003prgpvu9b94ncb	cml4mdzu6003grgpvi7qohvfc	cml4mci930020rgpv71dlgdwf	9	4	2026-02-02 03:38:28.397
cml4mdzu7003qrgpvgzug67su	cml4mdzu6003grgpvi7qohvfc	cml4mci980021rgpvygkrq73g	10	4	2026-02-02 03:38:28.397
cml4mdzu7003rrgpvpylkjbgz	cml4mdzu6003grgpvi7qohvfc	cml4mci9c0022rgpvyy4h4xbu	11	4	2026-02-02 03:38:28.397
cml4mdzu7003srgpvcp0erz6p	cml4mdzu6003grgpvi7qohvfc	cml4mci9g0023rgpvc1iujwzo	12	4	2026-02-02 03:38:28.397
cml4mdzu7003trgpvqleip016	cml4mdzu6003grgpvi7qohvfc	cml4mci9k0024rgpv0ktf8och	13	4	2026-02-02 03:38:28.397
cml4mdzu7003urgpv3m7zgzx1	cml4mdzu6003grgpvi7qohvfc	cml4mci9p0025rgpvrxib62sx	14	4	2026-02-02 03:38:28.397
cml4mdzu7003vrgpvvb2sm98x	cml4mdzu6003grgpvi7qohvfc	cml4mci9u0026rgpv6z79hyp2	15	4	2026-02-02 03:38:28.397
cml4mdzu7003wrgpvbf0wcvus	cml4mdzu6003grgpvi7qohvfc	cml4mci9z0027rgpv3hqw3s43	16	4	2026-02-02 03:38:28.397
cml4mdzu7003xrgpvt3fsna5b	cml4mdzu6003grgpvi7qohvfc	cml4mcia40028rgpv0hjvbqmd	17	4	2026-02-02 03:38:28.397
cml4mdzu7003yrgpv1m49obmj	cml4mdzu6003grgpvi7qohvfc	cml4mcia90029rgpvu5bfgrct	18	4	2026-02-02 03:38:28.397
cml4mdzu7003zrgpvngpyhepg	cml4mdzu6003grgpvi7qohvfc	cml4mciaf002argpvdccm9nof	19	4	2026-02-02 03:38:28.397
cml4mdzu70040rgpv1pr27yad	cml4mdzu6003grgpvi7qohvfc	cml4mciak002brgpvgqkzu3as	20	4	2026-02-02 03:38:28.397
cml4mdzu70041rgpv0kt8wwv5	cml4mdzu6003grgpvi7qohvfc	cml4mciaq002crgpvfaszib5t	21	2	2026-02-02 03:38:28.397
cml4mdzu80042rgpv3xtczsur	cml4mdzu6003grgpvi7qohvfc	cml4mciav002drgpvau6f2jib	22	2	2026-02-02 03:38:28.397
cml4mdzu80043rgpvjouo37eo	cml4mdzu6003grgpvi7qohvfc	cml4mcib0002ergpvhsb8ywhv	23	2	2026-02-02 03:38:28.397
cml4mdzu80044rgpvyygsqyqp	cml4mdzu6003grgpvi7qohvfc	cml4mcib5002frgpv76r2bjsi	24	2	2026-02-02 03:38:28.397
cml4mdzu80045rgpv7385xkry	cml4mdzu6003grgpvi7qohvfc	cml4mciba002grgpvgdr5lxlu	25	2	2026-02-02 03:38:28.397
cml4mdzu80046rgpvx62yqut4	cml4mdzu6003grgpvi7qohvfc	cml4mcibg002hrgpvp3obcvd1	26	2	2026-02-02 03:38:28.397
cml4mdzu80047rgpvgo8v5g93	cml4mdzu6003grgpvi7qohvfc	cml4mcibl002irgpv4oib878b	27	2	2026-02-02 03:38:28.397
cml4mdzu80048rgpvmvcrghm3	cml4mdzu6003grgpvi7qohvfc	cml4mcibr002jrgpvd7mntrmy	28	2	2026-02-02 03:38:28.397
cml4mdzu80049rgpv0bkg1f2a	cml4mdzu6003grgpvi7qohvfc	cml4mcibx002krgpvs0hnsuzy	29	2	2026-02-02 03:38:28.397
cml4mdzu8004argpvg5npke9s	cml4mdzu6003grgpvi7qohvfc	cml4mcic3002lrgpv00zoz162	30	2	2026-02-02 03:38:28.397
cml4mtmy1004qrgpvzyr9qjau	cml4mtmxw004prgpvmtp3vuqx	cml4mci84001srgpvp3hrwrmq	1	4	2026-02-02 03:50:38.177
cml4mtmy1004rrgpv09tugrr2	cml4mtmxw004prgpvmtp3vuqx	cml4mci89001trgpvyrtyw8sl	2	4	2026-02-02 03:50:38.177
cml4mtmy1004srgpvbsoualux	cml4mtmxw004prgpvmtp3vuqx	cml4mci8d001urgpv1k6y1h8z	3	4	2026-02-02 03:50:38.177
cml4mtmy1004trgpvrqldkyo6	cml4mtmxw004prgpvmtp3vuqx	cml4mci8h001vrgpvbn5v3szn	4	4	2026-02-02 03:50:38.177
cml4mtmy1004urgpvathmyc0o	cml4mtmxw004prgpvmtp3vuqx	cml4mci8m001wrgpv6hzvzmw0	5	4	2026-02-02 03:50:38.177
cml4mtmy1004vrgpv1ehshcbd	cml4mtmxw004prgpvmtp3vuqx	cml4mci8q001xrgpvkhyvra67	6	4	2026-02-02 03:50:38.177
cml4mtmy1004wrgpvyidp9whz	cml4mtmxw004prgpvmtp3vuqx	cml4mci8v001yrgpvlrrubb6v	7	4	2026-02-02 03:50:38.177
cml4mtmy1004xrgpv6bg9suj4	cml4mtmxw004prgpvmtp3vuqx	cml4mci8z001zrgpvkuhii72a	8	4	2026-02-02 03:50:38.177
cml4mtmy1004yrgpvnuf6enk2	cml4mtmxw004prgpvmtp3vuqx	cml4mci930020rgpv71dlgdwf	9	4	2026-02-02 03:50:38.177
cml4mtmy1004zrgpvxmoe2h21	cml4mtmxw004prgpvmtp3vuqx	cml4mci980021rgpvygkrq73g	10	4	2026-02-02 03:50:38.177
cml4mtmy20050rgpvbje6e2ai	cml4mtmxw004prgpvmtp3vuqx	cml4mci9c0022rgpvyy4h4xbu	11	4	2026-02-02 03:50:38.177
cml4mtmy20051rgpvofqbtssh	cml4mtmxw004prgpvmtp3vuqx	cml4mci9g0023rgpvc1iujwzo	12	4	2026-02-02 03:50:38.177
cml4mtmy20052rgpvze89guw8	cml4mtmxw004prgpvmtp3vuqx	cml4mci9k0024rgpv0ktf8och	13	4	2026-02-02 03:50:38.177
cml4mtmy20053rgpv1qqhonox	cml4mtmxw004prgpvmtp3vuqx	cml4mci9p0025rgpvrxib62sx	14	4	2026-02-02 03:50:38.177
cml4mtmy20054rgpv2t16k15c	cml4mtmxw004prgpvmtp3vuqx	cml4mci9u0026rgpv6z79hyp2	15	4	2026-02-02 03:50:38.177
cml4mtmy20055rgpv3oxmj4ni	cml4mtmxw004prgpvmtp3vuqx	cml4mci9z0027rgpv3hqw3s43	16	4	2026-02-02 03:50:38.177
cml4mtmy20056rgpv3kkhzgls	cml4mtmxw004prgpvmtp3vuqx	cml4mcia40028rgpv0hjvbqmd	17	4	2026-02-02 03:50:38.177
cml4mtmy20057rgpvsqikdsas	cml4mtmxw004prgpvmtp3vuqx	cml4mcia90029rgpvu5bfgrct	18	4	2026-02-02 03:50:38.177
cml4mtmy20058rgpv4i6prp7i	cml4mtmxw004prgpvmtp3vuqx	cml4mciaf002argpvdccm9nof	19	4	2026-02-02 03:50:38.177
cml4mtmy20059rgpvqq7jgx1a	cml4mtmxw004prgpvmtp3vuqx	cml4mciak002brgpvgqkzu3as	20	4	2026-02-02 03:50:38.177
cml4mtmy2005argpvdtm29pfb	cml4mtmxw004prgpvmtp3vuqx	cml4mciaq002crgpvfaszib5t	21	2	2026-02-02 03:50:38.177
cml4mtmy2005brgpvlghcyidz	cml4mtmxw004prgpvmtp3vuqx	cml4mciav002drgpvau6f2jib	22	2	2026-02-02 03:50:38.177
cml4mtmy2005crgpvzm69lbqc	cml4mtmxw004prgpvmtp3vuqx	cml4mcib0002ergpvhsb8ywhv	23	2	2026-02-02 03:50:38.177
cml4mtmy2005drgpvmf3rtya7	cml4mtmxw004prgpvmtp3vuqx	cml4mcib5002frgpv76r2bjsi	24	2	2026-02-02 03:50:38.177
cml4mtmy2005ergpv3q6ynrz5	cml4mtmxw004prgpvmtp3vuqx	cml4mciba002grgpvgdr5lxlu	25	2	2026-02-02 03:50:38.177
cml4mtmy2005frgpvsj33qb3g	cml4mtmxw004prgpvmtp3vuqx	cml4mcibg002hrgpvp3obcvd1	26	2	2026-02-02 03:50:38.177
cml4mtmy2005grgpvoz9411cf	cml4mtmxw004prgpvmtp3vuqx	cml4mcibl002irgpv4oib878b	27	2	2026-02-02 03:50:38.177
cml4mtmy2005hrgpvw25ozf82	cml4mtmxw004prgpvmtp3vuqx	cml4mcibr002jrgpvd7mntrmy	28	2	2026-02-02 03:50:38.177
cml4mtmy2005irgpvfx24e9ck	cml4mtmxw004prgpvmtp3vuqx	cml4mcibx002krgpvs0hnsuzy	29	2	2026-02-02 03:50:38.177
cml4mtmy2005jrgpvc2bb3nqx	cml4mtmxw004prgpvmtp3vuqx	cml4mcic3002lrgpv00zoz162	30	2	2026-02-02 03:50:38.177
cml4n5ha8005prgpvhnkhdyjm	cml4n5ha4005orgpv2bycgzg4	cml4mci84001srgpvp3hrwrmq	1	4	2026-02-02 03:59:50.71
cml4n5ha8005qrgpvyut7j17t	cml4n5ha4005orgpv2bycgzg4	cml4mci89001trgpvyrtyw8sl	2	4	2026-02-02 03:59:50.71
cml4n5ha8005rrgpv3ng8st00	cml4n5ha4005orgpv2bycgzg4	cml4mci8d001urgpv1k6y1h8z	3	4	2026-02-02 03:59:50.71
cml4n5ha8005srgpvj8xmfd6z	cml4n5ha4005orgpv2bycgzg4	cml4mci8h001vrgpvbn5v3szn	4	4	2026-02-02 03:59:50.71
cml4n5ha8005trgpv4ut0s2ln	cml4n5ha4005orgpv2bycgzg4	cml4mci8m001wrgpv6hzvzmw0	5	4	2026-02-02 03:59:50.71
cml4n5ha8005urgpv0gcoo2kp	cml4n5ha4005orgpv2bycgzg4	cml4mci8q001xrgpvkhyvra67	6	4	2026-02-02 03:59:50.71
cml4n5ha8005vrgpv7hf2e7ks	cml4n5ha4005orgpv2bycgzg4	cml4mci8v001yrgpvlrrubb6v	7	4	2026-02-02 03:59:50.71
cml4n5ha8005wrgpv16sqfayx	cml4n5ha4005orgpv2bycgzg4	cml4mci8z001zrgpvkuhii72a	8	4	2026-02-02 03:59:50.71
cml4n5ha8005xrgpvfzclzvbx	cml4n5ha4005orgpv2bycgzg4	cml4mci930020rgpv71dlgdwf	9	4	2026-02-02 03:59:50.71
cml4n5ha8005yrgpvibwvpv41	cml4n5ha4005orgpv2bycgzg4	cml4mci980021rgpvygkrq73g	10	4	2026-02-02 03:59:50.71
cml4n5ha8005zrgpvg4jkgmne	cml4n5ha4005orgpv2bycgzg4	cml4mci9c0022rgpvyy4h4xbu	11	4	2026-02-02 03:59:50.71
cml4n5ha80060rgpvgd7734jw	cml4n5ha4005orgpv2bycgzg4	cml4mci9g0023rgpvc1iujwzo	12	4	2026-02-02 03:59:50.71
cml4n5ha80061rgpvpm2ygtbj	cml4n5ha4005orgpv2bycgzg4	cml4mci9k0024rgpv0ktf8och	13	4	2026-02-02 03:59:50.71
cml4n5ha80062rgpvhvi9rahp	cml4n5ha4005orgpv2bycgzg4	cml4mci9p0025rgpvrxib62sx	14	4	2026-02-02 03:59:50.71
cml4n5ha80063rgpvnhzz1ye5	cml4n5ha4005orgpv2bycgzg4	cml4mci9u0026rgpv6z79hyp2	15	4	2026-02-02 03:59:50.71
cml4n5ha80064rgpvq0djwd0p	cml4n5ha4005orgpv2bycgzg4	cml4mci9z0027rgpv3hqw3s43	16	4	2026-02-02 03:59:50.71
cml4n5ha80065rgpv9r47xg6r	cml4n5ha4005orgpv2bycgzg4	cml4mcia40028rgpv0hjvbqmd	17	4	2026-02-02 03:59:50.71
cml4n5ha80066rgpvai9704bi	cml4n5ha4005orgpv2bycgzg4	cml4mcia90029rgpvu5bfgrct	18	4	2026-02-02 03:59:50.71
cml4n5ha80067rgpvervrxjpg	cml4n5ha4005orgpv2bycgzg4	cml4mciaf002argpvdccm9nof	19	4	2026-02-02 03:59:50.71
cml4n5ha80068rgpvj121zp0x	cml4n5ha4005orgpv2bycgzg4	cml4mciak002brgpvgqkzu3as	20	4	2026-02-02 03:59:50.71
cml4n5ha80069rgpvcql8exqu	cml4n5ha4005orgpv2bycgzg4	cml4mciaq002crgpvfaszib5t	21	2	2026-02-02 03:59:50.71
cml4n5ha8006argpvc2wzt7w5	cml4n5ha4005orgpv2bycgzg4	cml4mciav002drgpvau6f2jib	22	2	2026-02-02 03:59:50.71
cml4n5ha8006brgpvj8gb94e7	cml4n5ha4005orgpv2bycgzg4	cml4mcib0002ergpvhsb8ywhv	23	2	2026-02-02 03:59:50.71
cml4n5ha8006crgpvib3db1hs	cml4n5ha4005orgpv2bycgzg4	cml4mcib5002frgpv76r2bjsi	24	2	2026-02-02 03:59:50.71
cml4n5ha8006drgpvk1yygomu	cml4n5ha4005orgpv2bycgzg4	cml4mciba002grgpvgdr5lxlu	25	2	2026-02-02 03:59:50.71
cml4n5ha8006ergpvwio0uneq	cml4n5ha4005orgpv2bycgzg4	cml4mcibg002hrgpvp3obcvd1	26	2	2026-02-02 03:59:50.71
cml4n5ha8006frgpvmc3j0sth	cml4n5ha4005orgpv2bycgzg4	cml4mcibl002irgpv4oib878b	27	2	2026-02-02 03:59:50.71
cml4n5ha8006grgpv05qzz4i4	cml4n5ha4005orgpv2bycgzg4	cml4mcibr002jrgpvd7mntrmy	28	2	2026-02-02 03:59:50.71
cml4n5ha8006hrgpvttkmdtfx	cml4n5ha4005orgpv2bycgzg4	cml4mcibx002krgpvs0hnsuzy	29	2	2026-02-02 03:59:50.71
cml4n5ha8006irgpv7xzokz7u	cml4n5ha4005orgpv2bycgzg4	cml4mcic3002lrgpv00zoz162	30	2	2026-02-02 03:59:50.71
cmlfwooe1001brapvp68aiuc0	cmlfwooe0001arapva97odoug	cmlfwnsb5000mrapvfh5b0twr	1	3	2026-02-10 01:12:10.871
cmlfwooe2001crapvgwddfhvw	cmlfwooe0001arapva97odoug	cmlfwnsbb000nrapvneybpkec	2	3	2026-02-10 01:12:10.871
cmlfwooe2001drapvdiv1mlgx	cmlfwooe0001arapva97odoug	cmlfwnsbg000orapv1elijm56	3	3	2026-02-10 01:12:10.871
cmlfwooe2001erapv7isrsnfp	cmlfwooe0001arapva97odoug	cmlfwnsbk000prapvdj1thluw	4	3	2026-02-10 01:12:10.871
cmlfwooe2001frapveb324zfc	cmlfwooe0001arapva97odoug	cmlfwnsbp000qrapv2b1p87qc	5	3	2026-02-10 01:12:10.871
cmlfwooe2001grapvxkm2xhp6	cmlfwooe0001arapva97odoug	cmlfwnsbv000rrapv5js2epw3	6	3	2026-02-10 01:12:10.871
cmlfwooe2001hrapv1c5m648a	cmlfwooe0001arapva97odoug	cmlfwnsc0000srapvubpk1hoj	7	3	2026-02-10 01:12:10.871
cmlfwooe2001irapvrte20ciw	cmlfwooe0001arapva97odoug	cmlfwnsc5000trapv57y1fw8n	8	3	2026-02-10 01:12:10.871
cmlfwooe2001jrapvaavagj29	cmlfwooe0001arapva97odoug	cmlfwnsca000urapvtftpnh44	9	3	2026-02-10 01:12:10.871
cmlfwooe2001krapvevc94thu	cmlfwooe0001arapva97odoug	cmlfwnscf000vrapvpo0rcsxc	10	3	2026-02-10 01:12:10.871
cmlfwooe2001lrapv5bwukvro	cmlfwooe0001arapva97odoug	cmlfwnscl000wrapvsitl1k1e	11	8	2026-02-10 01:12:10.871
cmlfwooe2001mrapv2rndc0wz	cmlfwooe0001arapva97odoug	cmlfwnscq000xrapv055oieom	12	8	2026-02-10 01:12:10.871
cmmcsevsf0014r0pvrl942myw	cmmcsevsd0013r0pv5je0p4we	cmlfwnsb5000mrapvfh5b0twr	1	3	2026-03-05 01:28:59.244
cmmcsevsf0015r0pvp93gtcja	cmmcsevsd0013r0pv5je0p4we	cmlfwnsbb000nrapvneybpkec	2	3	2026-03-05 01:28:59.244
cmmcsevsf0016r0pvf710myke	cmmcsevsd0013r0pv5je0p4we	cmlfwnsbg000orapv1elijm56	3	3	2026-03-05 01:28:59.244
cmmcsevsf0017r0pvvxa9twfr	cmmcsevsd0013r0pv5je0p4we	cmlfwnsbk000prapvdj1thluw	4	3	2026-03-05 01:28:59.244
cmmcsevsf0018r0pvsn6cve6p	cmmcsevsd0013r0pv5je0p4we	cmlfwnsbp000qrapv2b1p87qc	5	3	2026-03-05 01:28:59.244
cmmcsevsf0019r0pvqo8ipw6a	cmmcsevsd0013r0pv5je0p4we	cmlfwnsbv000rrapv5js2epw3	6	3	2026-03-05 01:28:59.244
cmmcsevsf001ar0pvdr1u74sx	cmmcsevsd0013r0pv5je0p4we	cmlfwnsc0000srapvubpk1hoj	7	3	2026-03-05 01:28:59.244
cmmcsevsf001br0pvp3tb8te4	cmmcsevsd0013r0pv5je0p4we	cmlfwnsc5000trapv57y1fw8n	8	3	2026-03-05 01:28:59.244
cmmcsevsf001cr0pv85yxx227	cmmcsevsd0013r0pv5je0p4we	cmlfwnsca000urapvtftpnh44	9	3	2026-03-05 01:28:59.244
cmmcsevsf001dr0pv95n8k7gd	cmmcsevsd0013r0pv5je0p4we	cmlfwnscf000vrapvpo0rcsxc	10	3	2026-03-05 01:28:59.244
cmmcsevsf001er0pvz1wetlkh	cmmcsevsd0013r0pv5je0p4we	cmlfwnscl000wrapvsitl1k1e	11	8	2026-03-05 01:28:59.244
cmmcsevsf001fr0pvv5u0ubpb	cmmcsevsd0013r0pv5je0p4we	cmlfwnscq000xrapv055oieom	12	8	2026-03-05 01:28:59.244
cmmfqhbdf0001qrpvpxhhl3ia	cmmfqhbdb0000qrpv7vvdx247	cmkvugtq700029tpvbd2p7jaf	1	5	2026-03-07 02:58:12.043
cmmfqhbdf0002qrpvbhpybnfs	cmmfqhbdb0000qrpv7vvdx247	cmkvugtqf00039tpvianx6e0u	2	5	2026-03-07 02:58:12.043
cmmfqhbdf0003qrpvjtgey5k9	cmmfqhbdb0000qrpv7vvdx247	cmkvugtqk00049tpvovqw9v22	3	5	2026-03-07 02:58:12.043
cmmfqhbdf0004qrpv9gueoby2	cmmfqhbdb0000qrpv7vvdx247	cmkvugtqp00059tpvzxxb7qry	4	5	2026-03-07 02:58:12.043
cmmfqhbdf0005qrpvdz06bdwm	cmmfqhbdb0000qrpv7vvdx247	cmkvugtqu00069tpvih5v2r9k	5	5	2026-03-07 02:58:12.043
cmmfqhbdf0006qrpvq74b9u7l	cmmfqhbdb0000qrpv7vvdx247	cmkvugtqy00079tpv1z5c50b3	6	5	2026-03-07 02:58:12.043
cmmfqhbdf0007qrpvfz8v45o4	cmmfqhbdb0000qrpv7vvdx247	cmkvugtr300089tpv56fp4fqn	7	5	2026-03-07 02:58:12.043
cmmfqhbdf0008qrpvapd6vidl	cmmfqhbdb0000qrpv7vvdx247	cmkvugtr800099tpvg0ds82y6	8	5	2026-03-07 02:58:12.043
cmmfqhbdf0009qrpve64iots1	cmmfqhbdb0000qrpv7vvdx247	cmkvugtrd000a9tpvt0gbc167	9	5	2026-03-07 02:58:12.043
cmmfqhbdf000aqrpv1d0hk86d	cmmfqhbdb0000qrpv7vvdx247	cmkvugtrh000b9tpvffymrb7r	10	5	2026-03-07 02:58:12.043
cmmfqhbdf000bqrpvmt713vzi	cmmfqhbdb0000qrpv7vvdx247	cmkvugtrl000c9tpv8undkp3n	11	11	2026-03-07 02:58:12.043
cmmfqhbdf000cqrpvroy7maju	cmmfqhbdb0000qrpv7vvdx247	cmkvugtrq000d9tpvloy2r3xs	12	11	2026-03-07 02:58:12.043
cmmfqhbdf000dqrpvvcwgkzy6	cmmfqhbdb0000qrpv7vvdx247	cmkvugtrv000e9tpv0zusqhwy	13	13	2026-03-07 02:58:12.043
cmmjweuug0017r4pvkvf7r0xy	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrpe0002r4pvgwgvzpj0	1	5	2026-03-10 00:55:19.717
cmmjweuug0018r4pvieuk99c7	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrpl0003r4pvy6or8pr3	2	5	2026-03-10 00:55:19.717
cmmjweuug0019r4pvdsto1rvr	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrpr0004r4pvuzz7o7cd	3	5	2026-03-10 00:55:19.717
cmmjweuug001ar4pvjwblnxjz	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrpw0005r4pvqnldjecp	4	5	2026-03-10 00:55:19.717
cmmjweuug001br4pvslgzt5k5	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrq10006r4pvjsvncl0w	5	5	2026-03-10 00:55:19.717
cmmjweuug001cr4pvg2xv72x6	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrq70007r4pv1dmy29pd	6	5	2026-03-10 00:55:19.717
cmmjweuug001dr4pvz6qi6r5r	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrqc0008r4pv5cfupl05	7	5	2026-03-10 00:55:19.717
cmmjweuug001er4pvvsnatuqs	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrqi0009r4pvhcx3nvhb	8	5	2026-03-10 00:55:19.717
cmmjweuug001fr4pvujfu9mue	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrqn000ar4pvic8pj2us	9	5	2026-03-10 00:55:19.717
cmmjweuug001gr4pvxo195mpb	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrqt000br4pvnfl4gq1p	10	5	2026-03-10 00:55:19.717
cmmjweuug001hr4pvq1nt1o4h	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrqy000cr4pvljwuekwm	11	5	2026-03-10 00:55:19.717
cmmjweuug001ir4pvqeddtjhl	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrr3000dr4pv7ez9kvy9	12	5	2026-03-10 00:55:19.717
cmmjweuug001jr4pv6j2nn8rc	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrr9000er4pv4txapu8a	13	5	2026-03-10 00:55:19.717
cmmjweuug001kr4pv5xih431l	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrre000fr4pvs4rhtp8u	14	5	2026-03-10 00:55:19.717
cmmjweuug001lr4pvxc3riib2	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrrk000gr4pvtd81wov4	15	5	2026-03-10 00:55:19.717
cmmjweuug001mr4pvcrqr6tkf	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrrp000hr4pv6bsv1xm2	16	5	2026-03-10 00:55:19.717
cmmjweuug001nr4pvlse8asqz	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrrv000ir4pv9tlgfb55	17	5	2026-03-10 00:55:19.717
cmmjweuug001or4pv4u235uxn	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrs1000jr4pvtz50efd1	18	5	2026-03-10 00:55:19.717
cmmjweuug001pr4pvkhh62r5t	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrs8000kr4pvytm7t1c5	19	5	2026-03-10 00:55:19.717
cmmjweuug001qr4pvldvlbubf	cmmjweuud0016r4pvw4ij3lxz	cmmjwdrsd000lr4pvpr30dr69	20	5	2026-03-10 00:55:19.717
cmmjxirnq0020r4pvuxtvi5ku	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrpe0002r4pvgwgvzpj0	1	5	2026-03-10 01:26:21.828
cmmjxirnq0021r4pvw4m7mdbf	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrpl0003r4pvy6or8pr3	2	5	2026-03-10 01:26:21.828
cmmjxirnq0022r4pvnz0r6y2i	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrpr0004r4pvuzz7o7cd	3	5	2026-03-10 01:26:21.828
cmmjxirnq0023r4pv4bejn5ya	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrpw0005r4pvqnldjecp	4	5	2026-03-10 01:26:21.828
cmmjxirnq0024r4pva6uokmpu	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrq10006r4pvjsvncl0w	5	5	2026-03-10 01:26:21.828
cmmjxirnq0025r4pvbyl5h4v4	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrq70007r4pv1dmy29pd	6	5	2026-03-10 01:26:21.828
cmmjxirnq0026r4pv3fo8ej2f	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrqc0008r4pv5cfupl05	7	5	2026-03-10 01:26:21.828
cmmjxirnq0027r4pv53q5l4cr	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrqi0009r4pvhcx3nvhb	8	5	2026-03-10 01:26:21.828
cmmjxirnq0028r4pvher8rmfz	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrqn000ar4pvic8pj2us	9	5	2026-03-10 01:26:21.828
cmmjxirnq0029r4pvdew03zcp	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrqt000br4pvnfl4gq1p	10	5	2026-03-10 01:26:21.828
cmmjxirnq002ar4pvbgb9nddd	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrqy000cr4pvljwuekwm	11	5	2026-03-10 01:26:21.828
cmmjxirnq002br4pv1aeef6yo	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrr3000dr4pv7ez9kvy9	12	5	2026-03-10 01:26:21.828
cmmjxirnq002cr4pvihp2ll5y	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrr9000er4pv4txapu8a	13	5	2026-03-10 01:26:21.828
cmmjxirnq002dr4pvumq51dze	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrre000fr4pvs4rhtp8u	14	5	2026-03-10 01:26:21.828
cmmjxirnq002er4pvjsrvpzhh	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrrk000gr4pvtd81wov4	15	5	2026-03-10 01:26:21.828
cmmjxirnq002fr4pvss7pob2n	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrrp000hr4pv6bsv1xm2	16	5	2026-03-10 01:26:21.828
cmmjxirnq002gr4pvujvkbxu2	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrrv000ir4pv9tlgfb55	17	5	2026-03-10 01:26:21.828
cmmjxirnq002hr4pvkzvkle77	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrs1000jr4pvtz50efd1	18	5	2026-03-10 01:26:21.828
cmmjxirnr002ir4pvsfh1dqvl	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrs8000kr4pvytm7t1c5	19	5	2026-03-10 01:26:21.828
cmmjxirnr002jr4pv4elsrvmk	cmmjxirnp001zr4pvr3j3egwq	cmmjwdrsd000lr4pvpr30dr69	20	5	2026-03-10 01:26:21.828
cmmjxkk2j002tr4pvxrf866m6	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrpe0002r4pvgwgvzpj0	1	5	2026-03-10 01:27:45.3
cmmjxkk2j002ur4pv59km44kz	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrpl0003r4pvy6or8pr3	2	5	2026-03-10 01:27:45.3
cmmjxkk2j002vr4pvwm65jkdi	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrpr0004r4pvuzz7o7cd	3	5	2026-03-10 01:27:45.3
cmmjxkk2j002wr4pvb1zcj4ta	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrpw0005r4pvqnldjecp	4	5	2026-03-10 01:27:45.3
cmmjxkk2j002xr4pvowm3k6kf	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrq10006r4pvjsvncl0w	5	5	2026-03-10 01:27:45.3
cmmjxkk2j002yr4pvui1r6k0n	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrq70007r4pv1dmy29pd	6	5	2026-03-10 01:27:45.3
cmmjxkk2j002zr4pvb3ai7ubz	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrqc0008r4pv5cfupl05	7	5	2026-03-10 01:27:45.3
cmmjxkk2j0030r4pv808jzroj	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrqi0009r4pvhcx3nvhb	8	5	2026-03-10 01:27:45.3
cmmjxkk2j0031r4pvmyfe8uqi	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrqn000ar4pvic8pj2us	9	5	2026-03-10 01:27:45.3
cmmjxkk2j0032r4pvqgicflk4	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrqt000br4pvnfl4gq1p	10	5	2026-03-10 01:27:45.3
cmmjxkk2j0033r4pv69w9yrnh	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrqy000cr4pvljwuekwm	11	5	2026-03-10 01:27:45.3
cmmjxkk2j0034r4pvd0uwpqwl	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrr3000dr4pv7ez9kvy9	12	5	2026-03-10 01:27:45.3
cmmjxkk2j0035r4pve8uqtm4n	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrr9000er4pv4txapu8a	13	5	2026-03-10 01:27:45.3
cmmjxkk2j0036r4pvk42y6x22	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrre000fr4pvs4rhtp8u	14	5	2026-03-10 01:27:45.3
cmmjxkk2j0037r4pv7jte2q1c	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrrk000gr4pvtd81wov4	15	5	2026-03-10 01:27:45.3
cmmjxkk2j0038r4pv9krdf6b0	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrrp000hr4pv6bsv1xm2	16	5	2026-03-10 01:27:45.3
cmmjxkk2j0039r4pvm0vg3jsk	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrrv000ir4pv9tlgfb55	17	5	2026-03-10 01:27:45.3
cmmjxkk2j003ar4pvmv9xww9i	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrs1000jr4pvtz50efd1	18	5	2026-03-10 01:27:45.3
cmmjxkk2j003br4pvzeulx1tk	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrs8000kr4pvytm7t1c5	19	5	2026-03-10 01:27:45.3
cmmjxkk2j003cr4pvpeqx2hs0	cmmjxkk2d002sr4pvwz0l1rak	cmmjwdrsd000lr4pvpr30dr69	20	5	2026-03-10 01:27:45.3
cmmjyqpy4004yr4pv56z6uj80	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuhi003jr4pvgdp5hwv2	1	4	2026-03-10 02:00:32.471
cmmjyqpy4004zr4pvie04j6bd	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuho003kr4pvajj1jufs	2	4	2026-03-10 02:00:32.471
cmmjyqpy40050r4pv0iaavu04	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuhs003lr4pvzja8vc1s	3	4	2026-03-10 02:00:32.471
cmmjyqpy40051r4pvegtpkjmu	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuhw003mr4pvgk9re7a2	4	4	2026-03-10 02:00:32.471
cmmjyqpy40052r4pv9a4e9kpj	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuhz003nr4pvd33wlq9o	5	4	2026-03-10 02:00:32.471
cmmjyqpy50053r4pvcj6uuvks	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypui4003or4pvcwq7sgu5	6	4	2026-03-10 02:00:32.471
cmmjyqpy50054r4pvay3k0h8g	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypui8003pr4pvt3jlrm2y	7	4	2026-03-10 02:00:32.471
cmmjyqpy50055r4pvkdv884qc	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuic003qr4pve0utsc96	8	4	2026-03-10 02:00:32.471
cmmjyqpy50056r4pvd2qnymwg	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuig003rr4pvvli26sfm	9	4	2026-03-10 02:00:32.471
cmmjyqpy50057r4pv93xi2qfo	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuik003sr4pvxjh1e82j	10	4	2026-03-10 02:00:32.471
cmmjyqpy50058r4pve1uac1hf	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuip003tr4pv08jr1c7n	11	4	2026-03-10 02:00:32.471
cmmjyqpy50059r4pvp7877qpw	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuiu003ur4pvpeuc6qos	12	4	2026-03-10 02:00:32.471
cmmjyqpy5005ar4pv04qwr8i0	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuiy003vr4pv585thwbs	13	4	2026-03-10 02:00:32.471
cmmjyqpy5005br4pvl8bb56gn	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuj3003wr4pvvkqtu3oz	14	4	2026-03-10 02:00:32.471
cmmjyqpy5005cr4pvk2uvqaai	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuj8003xr4pvqqzvooe0	15	4	2026-03-10 02:00:32.471
cmmjyqpy5005dr4pv91tkdusk	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypujd003yr4pv1sgls6h3	16	4	2026-03-10 02:00:32.471
cmmjyqpy5005er4pv6rhf2fqm	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuji003zr4pv7919t2zv	17	4	2026-03-10 02:00:32.471
cmmjyqpy5005fr4pvwht5bpup	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypujo0040r4pvdg211hk6	18	4	2026-03-10 02:00:32.471
cmmjyqpy5005gr4pvbeqj684n	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypujt0041r4pv1ndtz6j8	19	4	2026-03-10 02:00:32.471
cmmjyqpy5005hr4pviwjq2ljh	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuk00042r4pv5yrfuwmh	20	4	2026-03-10 02:00:32.471
cmmjyqpy5005ir4pvdkwijqxc	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypuk60043r4pvv6bw2xur	21	4	2026-03-10 02:00:32.471
cmmjyqpy5005jr4pvo449gfn8	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypukc0044r4pvo8uho1h6	22	4	2026-03-10 02:00:32.471
cmmjyqpy5005kr4pv10dx91y3	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypukj0045r4pv6f21z7y9	23	4	2026-03-10 02:00:32.471
cmmjyqpy5005lr4pvdazb8h1h	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypukp0046r4pvl8y48q8s	24	4	2026-03-10 02:00:32.471
cmmjyqpy5005mr4pv5jnxsu6g	cmmjyqpy0004xr4pv5b5r5q5g	cmmjypukv0047r4pvdkwmbq3h	25	4	2026-03-10 02:00:32.471
cmmle1rkv002vrspvwthf1dpa	cmmle1rkt002urspv36z7gvns	cmmjypuhi003jr4pvgdp5hwv2	1	4	2026-03-11 01:56:48.221
cmmle1rkw002wrspv2yqnykat	cmmle1rkt002urspv36z7gvns	cmmjypuho003kr4pvajj1jufs	2	4	2026-03-11 01:56:48.221
cmmle1rkw002xrspvcuxcnop1	cmmle1rkt002urspv36z7gvns	cmmjypuhs003lr4pvzja8vc1s	3	4	2026-03-11 01:56:48.221
cmmle1rkw002yrspvh9d4y4ph	cmmle1rkt002urspv36z7gvns	cmmjypuhw003mr4pvgk9re7a2	4	4	2026-03-11 01:56:48.221
cmmle1rkw002zrspv4irjrv78	cmmle1rkt002urspv36z7gvns	cmmjypuhz003nr4pvd33wlq9o	5	4	2026-03-11 01:56:48.221
cmmle1rkw0030rspvindprs99	cmmle1rkt002urspv36z7gvns	cmmjypui4003or4pvcwq7sgu5	6	4	2026-03-11 01:56:48.221
cmmle1rkw0031rspvvv4el5ut	cmmle1rkt002urspv36z7gvns	cmmjypui8003pr4pvt3jlrm2y	7	4	2026-03-11 01:56:48.221
cmmle1rkw0032rspv1js4jmv4	cmmle1rkt002urspv36z7gvns	cmmjypuic003qr4pve0utsc96	8	4	2026-03-11 01:56:48.221
cmmle1rkw0033rspv0mb5wjpp	cmmle1rkt002urspv36z7gvns	cmmjypuig003rr4pvvli26sfm	9	4	2026-03-11 01:56:48.221
cmmle1rkw0034rspvpg7k3b9a	cmmle1rkt002urspv36z7gvns	cmmjypuik003sr4pvxjh1e82j	10	4	2026-03-11 01:56:48.221
cmmle1rkw0035rspvxi5tlnss	cmmle1rkt002urspv36z7gvns	cmmjypuip003tr4pv08jr1c7n	11	4	2026-03-11 01:56:48.221
cmmle1rkw0036rspv02uwcf9i	cmmle1rkt002urspv36z7gvns	cmmjypuiu003ur4pvpeuc6qos	12	4	2026-03-11 01:56:48.221
cmmle1rkw0037rspvcopfji8e	cmmle1rkt002urspv36z7gvns	cmmjypuiy003vr4pv585thwbs	13	4	2026-03-11 01:56:48.221
cmmle1rkw0038rspvcjodpspl	cmmle1rkt002urspv36z7gvns	cmmjypuj3003wr4pvvkqtu3oz	14	4	2026-03-11 01:56:48.221
cmmle1rkw0039rspv6ud8mni9	cmmle1rkt002urspv36z7gvns	cmmjypuj8003xr4pvqqzvooe0	15	4	2026-03-11 01:56:48.221
cmmle1rkw003arspvwwf3ljqj	cmmle1rkt002urspv36z7gvns	cmmjypujd003yr4pv1sgls6h3	16	4	2026-03-11 01:56:48.221
cmmle1rkw003brspvbq5ws5v8	cmmle1rkt002urspv36z7gvns	cmmjypuji003zr4pv7919t2zv	17	4	2026-03-11 01:56:48.221
cmmle1rkw003crspvjhwu7trs	cmmle1rkt002urspv36z7gvns	cmmjypujo0040r4pvdg211hk6	18	4	2026-03-11 01:56:48.221
cmmle1rkw003drspv8odhhco3	cmmle1rkt002urspv36z7gvns	cmmjypujt0041r4pv1ndtz6j8	19	4	2026-03-11 01:56:48.221
cmmle1rkw003erspvt44vfhll	cmmle1rkt002urspv36z7gvns	cmmjypuk00042r4pv5yrfuwmh	20	4	2026-03-11 01:56:48.221
cmmle1rkw003frspv33yjy6a9	cmmle1rkt002urspv36z7gvns	cmmjypuk60043r4pvv6bw2xur	21	4	2026-03-11 01:56:48.221
cmmle1rkw003grspvg7le7b7h	cmmle1rkt002urspv36z7gvns	cmmjypukc0044r4pvo8uho1h6	22	4	2026-03-11 01:56:48.221
cmmle1rkw003hrspvfslqyckr	cmmle1rkt002urspv36z7gvns	cmmjypukj0045r4pv6f21z7y9	23	4	2026-03-11 01:56:48.221
cmmle1rkw003irspv56lvdjle	cmmle1rkt002urspv36z7gvns	cmmjypukp0046r4pvl8y48q8s	24	4	2026-03-11 01:56:48.221
cmmle1rkw003jrspv3unf3oxz	cmmle1rkt002urspv36z7gvns	cmmjypukv0047r4pvdkwmbq3h	25	4	2026-03-11 01:56:48.221
cmmlfsg9s003nrspvtswy4pzx	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdna001grspvke8dnoz6	1	4	2026-03-11 02:45:32.893
cmmlfsg9s003orspvvlqtljiv	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdng001hrspvqz47uvtq	2	4	2026-03-11 02:45:32.893
cmmlfsg9s003prspvvzmkfo7l	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdnl001irspvkw2p8w4u	3	4	2026-03-11 02:45:32.893
cmmlfsg9s003qrspv4rsopqox	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdnq001jrspvimdtyv6q	4	4	2026-03-11 02:45:32.893
cmmlfsg9s003rrspv0rpp1cp9	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdnx001krspvat4jkn73	5	4	2026-03-11 02:45:32.893
cmmlfsg9s003srspvvw6vewuj	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdo3001lrspvpcqgxmnc	6	4	2026-03-11 02:45:32.893
cmmlfsg9s003trspvf7ue8fxu	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdo9001mrspvhc7xavxd	7	4	2026-03-11 02:45:32.893
cmmlfsg9s003urspvpdng5om7	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdoe001nrspvmk1jihw6	8	4	2026-03-11 02:45:32.893
cmmlfsg9s003vrspv4hz3ngfn	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdok001orspv2e9nrf52	9	4	2026-03-11 02:45:32.893
cmmlfsg9s003wrspvkjuww1s2	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdop001prspvh623cbct	10	4	2026-03-11 02:45:32.893
cmmlfsg9s003xrspvncw3p82y	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdov001qrspv1ruzt8ku	11	4	2026-03-11 02:45:32.893
cmmlfsg9s003yrspvk32ny5ki	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdp0001rrspvsyi714v6	12	4	2026-03-11 02:45:32.893
cmmlfsg9s003zrspvswq5tln3	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdp6001srspvtfac4e9q	13	4	2026-03-11 02:45:32.893
cmmlfsg9s0040rspvej3l8mq8	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdpc001trspvmnbpzoa0	14	4	2026-03-11 02:45:32.893
cmmlfsg9s0041rspv32wgaszu	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdpi001urspvnpon2orv	15	4	2026-03-11 02:45:32.893
cmmlfsg9s0042rspvvi6qz3xx	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdpp001vrspvyr0rhiaj	16	4	2026-03-11 02:45:32.893
cmmlfsg9s0043rspvlszsva5v	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdpw001wrspv4uadflm7	17	4	2026-03-11 02:45:32.893
cmmlfsg9s0044rspv1pc3qkn4	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdq2001xrspvgnn17rbi	18	4	2026-03-11 02:45:32.893
cmmlfsg9s0045rspvghswttff	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdq8001yrspvennj241t	19	4	2026-03-11 02:45:32.893
cmmlfsg9s0046rspv1xuuggi3	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdqg001zrspvfxvyld4k	20	4	2026-03-11 02:45:32.893
cmmlfsg9s0047rspve2j6hnp6	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdqm0020rspvc9x8w897	21	4	2026-03-11 02:45:32.893
cmmlfsg9s0048rspvhu3nozf9	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdqt0021rspvkhmn5w8v	22	4	2026-03-11 02:45:32.893
cmmlfsg9s0049rspv8en9g75o	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdr10022rspv5pxzq7gv	23	4	2026-03-11 02:45:32.893
cmmlfsg9s004arspvg3ozfrg6	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdr80023rspvgzo7ww7m	24	4	2026-03-11 02:45:32.893
cmmlfsg9s004brspvlncjiaf6	cmmlfsg9q003mrspvkzd4yy6j	cmmlbmdrf0024rspvns9u3zzm	25	4	2026-03-11 02:45:32.893
cmmmtbgbj0001qrpvet189x9m	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrpe0002r4pvgwgvzpj0	1	5	2026-03-12 01:52:00.593
cmmmtbgbj0002qrpvovfvkylo	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrpl0003r4pvy6or8pr3	2	5	2026-03-12 01:52:00.593
cmmmtbgbj0003qrpvvep4ju9n	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrpr0004r4pvuzz7o7cd	3	5	2026-03-12 01:52:00.593
cmmmtbgbj0004qrpvznfcscb0	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrpw0005r4pvqnldjecp	4	5	2026-03-12 01:52:00.593
cmmmtbgbj0005qrpv9t4z55sc	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrq10006r4pvjsvncl0w	5	5	2026-03-12 01:52:00.593
cmmmtbgbj0006qrpv9h0qeqge	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrq70007r4pv1dmy29pd	6	5	2026-03-12 01:52:00.593
cmmmtbgbj0007qrpvtz53a8oz	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrqc0008r4pv5cfupl05	7	5	2026-03-12 01:52:00.593
cmmmtbgbj0008qrpvcze8zta7	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrqi0009r4pvhcx3nvhb	8	5	2026-03-12 01:52:00.593
cmmmtbgbj0009qrpvldpoft7j	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrqn000ar4pvic8pj2us	9	5	2026-03-12 01:52:00.593
cmmmtbgbj000aqrpv02epddft	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrqt000br4pvnfl4gq1p	10	5	2026-03-12 01:52:00.593
cmmmtbgbj000bqrpvwyrta70w	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrqy000cr4pvljwuekwm	11	5	2026-03-12 01:52:00.593
cmmmtbgbj000cqrpvms4chjo0	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrr3000dr4pv7ez9kvy9	12	5	2026-03-12 01:52:00.593
cmmmtbgbj000dqrpv9tersutt	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrr9000er4pv4txapu8a	13	5	2026-03-12 01:52:00.593
cmmmtbgbj000eqrpvqashk3ek	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrre000fr4pvs4rhtp8u	14	5	2026-03-12 01:52:00.593
cmmmtbgbj000fqrpvatlixf64	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrrk000gr4pvtd81wov4	15	5	2026-03-12 01:52:00.593
cmmmtbgbj000gqrpvsums7dzq	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrrp000hr4pv6bsv1xm2	16	5	2026-03-12 01:52:00.593
cmmmtbgbj000hqrpvgaue448u	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrrv000ir4pv9tlgfb55	17	5	2026-03-12 01:52:00.593
cmmmtbgbj000iqrpvkh7puf2x	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrs1000jr4pvtz50efd1	18	5	2026-03-12 01:52:00.593
cmmmtbgbj000jqrpvpm7i24tm	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrs8000kr4pvytm7t1c5	19	5	2026-03-12 01:52:00.593
cmmmtbgbj000kqrpv1l60x4p2	cmmmtbgbc0000qrpv6hjl5rpd	cmmjwdrsd000lr4pvpr30dr69	20	5	2026-03-12 01:52:00.593
cmmo9rkxr0001hgpvpu2ft31d	cmmo9rkxm0000hgpvp25ph3ul	cml4mci84001srgpvp3hrwrmq	1	4	2026-03-13 02:20:13.111
cmmo9rkxr0002hgpvupa16p17	cmmo9rkxm0000hgpvp25ph3ul	cml4mci89001trgpvyrtyw8sl	2	4	2026-03-13 02:20:13.111
cmmo9rkxr0003hgpvvx3m7v7v	cmmo9rkxm0000hgpvp25ph3ul	cml4mci8d001urgpv1k6y1h8z	3	4	2026-03-13 02:20:13.111
cmmo9rkxr0004hgpv47frnljl	cmmo9rkxm0000hgpvp25ph3ul	cml4mci8h001vrgpvbn5v3szn	4	4	2026-03-13 02:20:13.111
cmmo9rkxr0005hgpvz8se5igs	cmmo9rkxm0000hgpvp25ph3ul	cml4mci8m001wrgpv6hzvzmw0	5	4	2026-03-13 02:20:13.111
cmmo9rkxr0006hgpvnwn9hwf3	cmmo9rkxm0000hgpvp25ph3ul	cml4mci8q001xrgpvkhyvra67	6	4	2026-03-13 02:20:13.111
cmmo9rkxr0007hgpv05cboxi6	cmmo9rkxm0000hgpvp25ph3ul	cml4mci8v001yrgpvlrrubb6v	7	4	2026-03-13 02:20:13.111
cmmo9rkxr0008hgpv2c987ywk	cmmo9rkxm0000hgpvp25ph3ul	cml4mci8z001zrgpvkuhii72a	8	4	2026-03-13 02:20:13.111
cmmo9rkxr0009hgpvtcf0p28s	cmmo9rkxm0000hgpvp25ph3ul	cml4mci930020rgpv71dlgdwf	9	4	2026-03-13 02:20:13.111
cmmo9rkxr000ahgpvjyqgxplx	cmmo9rkxm0000hgpvp25ph3ul	cml4mci980021rgpvygkrq73g	10	4	2026-03-13 02:20:13.111
cmmo9rkxr000bhgpv4uzg20iw	cmmo9rkxm0000hgpvp25ph3ul	cml4mci9c0022rgpvyy4h4xbu	11	4	2026-03-13 02:20:13.111
cmmo9rkxr000chgpvtssdw1az	cmmo9rkxm0000hgpvp25ph3ul	cml4mci9g0023rgpvc1iujwzo	12	4	2026-03-13 02:20:13.111
cmmo9rkxr000dhgpv1u3ezexo	cmmo9rkxm0000hgpvp25ph3ul	cml4mci9k0024rgpv0ktf8och	13	4	2026-03-13 02:20:13.111
cmmo9rkxr000ehgpve5zn5x3p	cmmo9rkxm0000hgpvp25ph3ul	cml4mci9p0025rgpvrxib62sx	14	4	2026-03-13 02:20:13.111
cmmo9rkxr000fhgpve1ass5vz	cmmo9rkxm0000hgpvp25ph3ul	cml4mci9u0026rgpv6z79hyp2	15	4	2026-03-13 02:20:13.111
cmmo9rkxr000ghgpvfm44vzyi	cmmo9rkxm0000hgpvp25ph3ul	cml4mci9z0027rgpv3hqw3s43	16	4	2026-03-13 02:20:13.111
cmmo9rkxs000hhgpv6yr2vfip	cmmo9rkxm0000hgpvp25ph3ul	cml4mcia40028rgpv0hjvbqmd	17	4	2026-03-13 02:20:13.111
cmmo9rkxs000ihgpv9rfkefni	cmmo9rkxm0000hgpvp25ph3ul	cml4mcia90029rgpvu5bfgrct	18	4	2026-03-13 02:20:13.111
cmmo9rkxs000jhgpvk3vlloby	cmmo9rkxm0000hgpvp25ph3ul	cml4mciaf002argpvdccm9nof	19	4	2026-03-13 02:20:13.111
cmmo9rkxs000khgpv2b75jx9r	cmmo9rkxm0000hgpvp25ph3ul	cml4mciak002brgpvgqkzu3as	20	4	2026-03-13 02:20:13.111
cmmo9rkxs000lhgpvr7tc1glv	cmmo9rkxm0000hgpvp25ph3ul	cml4mciaq002crgpvfaszib5t	21	2	2026-03-13 02:20:13.111
cmmo9rkxs000mhgpvfxpa82o4	cmmo9rkxm0000hgpvp25ph3ul	cml4mciav002drgpvau6f2jib	22	2	2026-03-13 02:20:13.111
cmmo9rkxs000nhgpvvivqct0e	cmmo9rkxm0000hgpvp25ph3ul	cml4mcib0002ergpvhsb8ywhv	23	2	2026-03-13 02:20:13.111
cmmo9rkxs000ohgpvlo6hxwp3	cmmo9rkxm0000hgpvp25ph3ul	cml4mcib5002frgpv76r2bjsi	24	2	2026-03-13 02:20:13.111
cmmo9rkxs000phgpv1a5jh82y	cmmo9rkxm0000hgpvp25ph3ul	cml4mciba002grgpvgdr5lxlu	25	2	2026-03-13 02:20:13.111
cmmo9rkxs000qhgpvuqcxri9t	cmmo9rkxm0000hgpvp25ph3ul	cml4mcibg002hrgpvp3obcvd1	26	2	2026-03-13 02:20:13.111
cmmo9rkxs000rhgpvji20s0a3	cmmo9rkxm0000hgpvp25ph3ul	cml4mcibl002irgpv4oib878b	27	2	2026-03-13 02:20:13.111
cmmo9rkxs000shgpvv3kyh4va	cmmo9rkxm0000hgpvp25ph3ul	cml4mcibr002jrgpvd7mntrmy	28	2	2026-03-13 02:20:13.111
cmmo9rkxs000thgpvd9xdce8r	cmmo9rkxm0000hgpvp25ph3ul	cml4mcibx002krgpvs0hnsuzy	29	2	2026-03-13 02:20:13.111
cmmo9rkxs000uhgpv16t6ul2o	cmmo9rkxm0000hgpvp25ph3ul	cml4mcic3002lrgpv00zoz162	30	2	2026-03-13 02:20:13.111
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, name, "createdAt", "updatedAt", password, role) FROM stdin;
cmj5cw3cn00004iud971p5w0w	rizky@mail.com	Rizky	2025-12-14 06:40:58.103	2025-12-14 06:40:58.103	$2b$10$jYGpzfeTx.IJASjBGxrVE.tf4kuyrdQIV44CRGUcl3rqUQ2F3zQS2	ADMIN
cmj5gwyql000035udj9kefx0z	abihartowicaksono@cbt.com	ABI HARTO WICAKSONO	2025-12-14 08:33:37.245	2025-12-14 08:33:37.245	$2b$10$5Q7gCiV/cmiDE5o8keIP3O/uyLV3B4aKP8x1iOQNV14fFpJduqXTa	SISWA
cmj5gwysf000235udeqpf8mo9	adamsyahrezagumilang@cbt.com	ADAM SYAHREZA GUMILANG	2025-12-14 08:33:37.311	2025-12-14 08:33:37.311	$2b$10$/Sm6OIJrU9ieTWaMw9yBrOEl8fMLlOFSu3QfCGHSBjLuFZCd.h2MO	SISWA
cmj5gwytz000435ud3k5i6zne	aditiyarizkybayupradika@cbt.com	ADITIYA RIZKY BAYU PRADIKA	2025-12-14 08:33:37.367	2025-12-14 08:33:37.367	$2b$10$QU0HMFDX.FKwgGVz79Wz5.awxbG.TgoepLsRkYqUVFr/yMm5vCh/K	SISWA
cmj5gwyyq000a35udwqnc8ohp	adrianodwipradhita@cbt.com	ADRIANO DWI PRADHITA	2025-12-14 08:33:37.538	2025-12-14 08:33:37.538	$2b$10$mEYbgViYbC9UjLlHcDHf2.LCtSviCMVWt8SByedsrRop.0Xmew/d.	SISWA
cmj5gwz0c000c35udn9g3zoan	agungtrisnadewi@cbt.com	AGUNG TRISNA DEWI	2025-12-14 08:33:37.596	2025-12-14 08:33:37.596	$2b$10$2b5zxWGhxAIK9Arue6427OkSZU3is6UO3XHuEFwujAXR/4lZOj7Fm	SISWA
cmj5gwz3i000g35udydzzmr53	example1@cbt.com	AHMAD DIMAS KURNIAWAN	2025-12-14 08:33:37.71	2025-12-14 08:33:37.71	$2b$10$G0nnig6veHoW2uamT0Ymie512Ddy7NSx0/mXVq8XkyQVlpLlrR10i	SISWA
cmj5gwz53000i35udw6fgqktc	ahmadrianzuhriafandi@cbt.com	AHMAD RIAN ZUHRI AFANDI	2025-12-14 08:33:37.767	2025-12-14 08:33:37.767	$2b$10$qZ0d2joT83a83Wtm8P6eruxx34oID1RPEcscB0iTPBh38zkm/g5yS	SISWA
cmj5gwz6p000k35ud68fsf33i	example2@cbt.com	AINO YOEL	2025-12-14 08:33:37.825	2025-12-14 08:33:37.825	$2b$10$o7MJEfM5PhZvP3CYGi/pVOGoVIc5kWzLrfdwniiKjDWaQEuPi/d8y	SISWA
cmj5gwz88000m35ud5x4ctx7s	ainurrohmah@cbt.com	AINUR ROHMAH	2025-12-14 08:33:37.88	2025-12-14 08:33:37.88	$2b$10$yLDOyWQ0K9.jkzeJ67liu.6FhlSzyY4ePVAtL12xr9/2K6AUNYu82	SISWA
cmj5gwzb9000q35uds8mmj6bl	aldoilfanpratama@cbt.com	ALDO ILFAN PRATAMA	2025-12-14 08:33:37.989	2025-12-14 08:33:37.989	$2b$10$sVsk69s8ge38pHvyYTQrUOEKQ7uN5XTR/3NN5ak4AHybO/dwxprKm	SISWA
cmj5gwzct000s35udllh69h8u	alfatriefendi@cbt.com	ALFA TRI EFENDI	2025-12-14 08:33:38.045	2025-12-14 08:33:38.045	$2b$10$zdiROYH4yUho1R/7imiaHOR9ehhMtQ/a9dH4/4SBgFRZGnqa52dzG	SISWA
cmj5gwzfw000w35udzc26ap9b	alifaturrosikin@cbt.com	ALIFATUR ROSIKIN	2025-12-14 08:33:38.156	2025-12-14 08:33:38.156	$2b$10$UeBkuTY2kaZg7J9UJcCvoOOE8A/wCaEocb.fcvpABsgs.ygG//aUu	SISWA
cmj5gwzhe000y35udg8o4lrsn	ameliadewisinta@cbt.com	AMELIA DEWI SINTA	2025-12-14 08:33:38.21	2025-12-14 08:33:38.21	$2b$10$eNxyiUR7S3f4WtM/ABO.hePWuaOiP1X72yskw/qyWZvK0Ee9C7h0e	SISWA
cmj5gwziy001035udhbgntn1o	example3@cbt.com	ANANDA MAYCKO WIJAYA	2025-12-14 08:33:38.266	2025-12-14 08:33:38.266	$2b$10$MYx8nhclCk67gfBT8ZUJGerRFwxXJ1ixtYzB88R.IbFSvcWmjPBiS	SISWA
cmj5gwzkg001235uda1zowq2b	andhikabayusaputra@cbt.com	ANDHIKA BAYU SAPUTRA	2025-12-14 08:33:38.32	2025-12-14 08:33:38.32	$2b$10$zX8SqUy76c/M68Jqvm87e.oMvj2fSea5vqHIekMDuZ3LbrpteVCbW	SISWA
cmj5gwzlz001435udoar1p1ou	example4@cbt.com	ANGGA CAHYO PRATAMA	2025-12-14 08:33:38.375	2025-12-14 08:33:38.375	$2b$10$gkigz7.ZwvNxDfWJq2tlj.P7pYHj2tdFO.53./zHde097gFqqIIBi	SISWA
cmj5gwzni001635udt2intkub	anggivirnandaputri@cbt.com	ANGGI VIRNANDA PUTRI	2025-12-14 08:33:38.43	2025-12-14 08:33:38.43	$2b$10$o9i2prpTY.dnXWu1ygFZrObK4x4blfSvG2gtgk/t.UuDixr3MkM4u	SISWA
cmj5gwzp2001835udtswr5q1s	awangsetiawan@cbt.com	AWANG SETIAWAN	2025-12-14 08:33:38.486	2025-12-14 08:33:38.486	$2b$10$Dd4dvJtA2.dKgDAog2sMue17h/zkuWD/l1dgQ2nkeQZG.eXqtGZx6	SISWA
cmj5gwzql001a35udfoqzqfcv	example25@cbt.com	AYUNI ARIMBI	2025-12-14 08:33:38.541	2025-12-14 08:33:38.541	$2b$10$bWEqVSCm3XQi9HDhb3bn4uqfQZJz6BFMILYwxaEZe8f6LsAK5eb6u	SISWA
cmj5gwzs4001c35udaqgx22e1	example5@cbt.com	AZAI DENIS SAFARULLAH	2025-12-14 08:33:38.595	2025-12-14 08:33:38.595	$2b$10$8tlweExCNOq5bqKIz16v/uweuUTsCvsXRQcpob51dNx9ed.48puSC	SISWA
cmj5gwzv5001g35ud5bbn2qzz	bagussetiawan@cbt.com	BAGUS SETIAWAN	2025-12-14 08:33:38.705	2025-12-14 08:33:38.705	$2b$10$KKhYJEACdJ2M2er5QJE7T.JKPBKmvV6KBlVcpmoyP8kIFBcwIxE9C	SISWA
cmj5gwzwo001i35uduhbzcboi	example6@cbt.com	CANDRA PRATAMA	2025-12-14 08:33:38.76	2025-12-14 08:33:38.76	$2b$10$31QCDyTLa5GrNMUVuP/UF.LxYqke8GbKRM44Lb7z./pmbBy8FUQ66	SISWA
cmj5gwzy7001k35udjqgqcye1	danubagusprayogo@cbt.com	DANU BAGUS PRAYOGO	2025-12-14 08:33:38.815	2025-12-14 08:33:38.815	$2b$10$gIukZJLlI3dmIimx.J7QU.OLO.7t3SQNAKSWfhAcDAeUWEGVoa8uO	SISWA
cmj5gwzzr001m35udpblpr5c0	davaputraprasetya@cbt.com	DAVA PUTRA PRASETYA	2025-12-14 08:33:38.871	2025-12-14 08:33:38.871	$2b$10$qh5M4U1WeNtmQ86yvJbk7eCOiMsrfcLduBCgyT7mpIT/vInmGUtU2	SISWA
cmj5gx02s001q35udsc32mvtz	dendibayupratama@cbt.com	DENDI BAYU PRATAMA	2025-12-14 08:33:38.98	2025-12-14 08:33:38.98	$2b$10$2dqNuMhEz8Db286yFTgC5.4YFTEBXQNxeZKKfTzdB3hWZTZSGBuN.	SISWA
cmj5gx07b001w35ud6uy774vt	dinarizaayumatussholeha@cbt.com	DINA RIZA AYU MATUSSHOLEHA	2025-12-14 08:33:39.143	2025-12-14 08:33:39.143	$2b$10$N9CmxnGuK.o.mrQI64mixuWu7ICbZaMv4YK8I7ExYgrQGHnWruzJu	SISWA
cmj5gx0ac002035udfnj8z7vm	dizayogayudistia@cbt.com	DIZA YOGA YUDISTIA	2025-12-14 08:33:39.252	2025-12-14 08:33:39.252	$2b$10$HrD9T8JdIAoDtzEGJcYfWemjQZ3HSb.UzjaXo8cfgNRTYS5Moz/pu	SISWA
cmj5gx0ev002635udvv65yg6g	ekadeviainurohma@cbt.com	EKA DEVI AINUROHMA	2025-12-14 08:33:39.415	2025-12-14 08:33:39.415	$2b$10$8hsHdRGP7WMdt.gnP2FSNeX85PMAp0TShPGJuqlFDT9TjowA/v24m	SISWA
cmj5gx0jf002c35udq9gtxbg2	fahmiadliyanto@cbt.com	FAHMI ADLIYANTO	2025-12-14 08:33:39.579	2025-12-14 08:33:39.579	$2b$10$Yo2M7biLLoCR6.rzzVtT6ej.7dBnWQzb7B9o3GRhYPXGV4AkEJCXW	SISWA
cmj5gwzed000u35udlnddwq47	example13@cbt.com	ALFAZA OKTAVINO PRADITIA	2025-12-14 08:33:38.101	2026-01-19 02:56:07.214	$2b$10$JwO5BV0QqSFJ/xou/l6qQusi5k8/NeFSE55W9T28s3Nc4dzZAcSO.	SISWA
cmj5gx0bv002235ud9wy5giy5	example15@cbt.com	DWI AYU MEI JAYANTI	2025-12-14 08:33:39.307	2026-01-19 03:00:28.735	$2b$10$.NqoSUEvLvyesG1f4GI3OOJbM0aJAN2F0zZJRof1IWlXYi4Nn8qaG	SISWA
cmj5gwztn001e35udd3b8c4mg	example14@cbt.com	BADRIA NUR ANISA	2025-12-14 08:33:38.651	2026-01-19 03:00:13.51	$2b$10$oHsWQJeOQ4TukHZTvRRRwu452vGcpe2LCQRH9N3Cx43wYWpAdtxFu	SISWA
cmj5gx08u001y35udh95b095v	dinoabipratama@cbt.com	DINO ABI PRATAMA	2025-12-14 08:33:39.198	2026-01-27 00:17:43.48	$2b$10$ZZy0GgASucFqGEja87o7m.PgvD6C.4b4rLQQx1p.34W3PiYtHF3mK	SISWA
cmj5gwyvj000635udzcqos5da	adityacaturprayogo@cbt.com	ADITYA CATUR PRAYOGO	2025-12-14 08:33:37.423	2026-03-05 01:20:10.034	$2b$10$3Xquxc1M1FTAiG9aQy5NZeEc3P4fAVxv6Mim1DtKYzcO/2OoRx1eC	SISWA
cmj5gwz1y000e35udzacwpk0x	aguswiraadipurnomo@cbt.com	AGUS WIRA ADI PURNOMO	2025-12-14 08:33:37.654	2026-03-05 01:20:23.704	$2b$10$ps05Pgit9.SBq2yIwZxzNO9EFBFvr0EkJ2MMsjiUzStr9O6yGHwYi	SISWA
cmj5gwz9q000o35ud7f7d7ltw	aldiprayatna@cbt.com	ALDI PRAYATNA	2025-12-14 08:33:37.934	2026-03-05 01:20:35.719	$2b$10$/Ac/W9km6UxKYuEAASVZTeyC8lYYrtqMDP3ys3QMNOCiH/zIqRaQ.	SISWA
cmj5gx01a001o35udcz1uye9r	definingtyas@cbt.com	DEFI NINGTYAS	2025-12-14 08:33:38.926	2026-03-05 01:20:45.976	$2b$10$NlS58uFtko114b6vrRcS6.j3fRiy8YG.MuGhwT3tYULqF4HVfamQW	SISWA
cmj5gx05t001u35ud56w1gpg0	dewiwahyuni@cbt.com	DEWI WAHYUNI	2025-12-14 08:33:39.089	2026-03-05 01:20:56.768	$2b$10$58RLBfGR5t7PUTJo9q7om.YwXUx4CQlLku0BuBkg1igointZLblWC	SISWA
cmj5gx0de002435ud24zdsw0s	dwisintiaputri@cbt.com	DWI SINTIA PUTRI	2025-12-14 08:33:39.362	2026-03-05 01:21:08.014	$2b$10$sJfTeRpDO5t4Z.PISOiegeZoX5tgyu9Rj5xSKyJGmgSf/xlVQQ6qi	SISWA
cmj5gx0gd002835udbw0sqmi6	enggardwiprasetyo@cbt.com	ENGGAR DWI PRASETYO	2025-12-14 08:33:39.469	2026-03-05 01:21:18.031	$2b$10$jPQpQLU3oPG/d9LMfjog5uR45h10f8YhMjq5Wx.PlULD22MkMxDmS	SISWA
cmj5gx0hw002a35udavq9oyfo	esaagilputra@cbt.com	ESA AGIL PUTRA	2025-12-14 08:33:39.524	2026-03-05 01:21:28.592	$2b$10$utRcvNE99HU6WdoZKqgpjONpp3fSVjFRT36HgAbL3WIvUtsF57QG6	SISWA
cmj5gx0kw002e35ud03ae2xo1	fareladityaputra@cbt.com	FAREL ADITYA PUTRA	2025-12-14 08:33:39.632	2025-12-14 08:33:39.632	$2b$10$WoYFgE1Pds8tbQ54nMqCnOGDL.2LpBGJ/6LRFYTn0wq3FSVRkXx.S	SISWA
cmj5gx0pi002k35udwebdytrh	fiolaseptianaramadani@cbt.com	FIOLA SEPTIANA RAMADANI	2025-12-14 08:33:39.798	2025-12-14 08:33:39.798	$2b$10$ZWz5tUjK07/tMIraoICc9ex6iFfEQ6yD/sH4Nkl4Fs4Q3JnP9X8qO	SISWA
cmj5gx0si002o35ud2jnff2tj	fitrianaekaamelia@cbt.com	FITRIANA EKA AMELIA	2025-12-14 08:33:39.906	2025-12-14 08:33:39.906	$2b$10$ghsNSpYjxMV//x.5AVleSuNPJisSHQ.TEyX7J5G8qrgS9dRq5SZHW	SISWA
cmj5gx0tz002q35udykvj7rwf	hernandawildanfirdausi@cbt.com	HERNANDA WILDAN FIRDAUSI	2025-12-14 08:33:39.959	2025-12-14 08:33:39.959	$2b$10$Dcpmm3NTQ2Tfi6.COAhcjeGAuySHCrPnmTC2cq5zEwEch0w0Nbxc.	SISWA
cmj5gx0vh002s35udu1n8yl9k	example7@cbt.com	HUMAM FAUZI YANTO	2025-12-14 08:33:40.013	2025-12-14 08:33:40.013	$2b$10$r8qqYovHDfi8YxylzDBFburR934QAnXHppsFB8b/wDI5c5jSntDfO	SISWA
cmj5gx0yj002w35ud8v9qi589	inaazrianadevi@cbt.com	INA AZRIANA DEVI	2025-12-14 08:33:40.123	2025-12-14 08:33:40.123	$2b$10$uffZ51BM366x9JqaQWdpweTJiDoP7sgUla./YPw9aNv/jc.m7o3zG	SISWA
cmj5gx11g003035ud3bx82k5d	jeniekanursabela@cbt.com	JENI EKA NURSABELA	2025-12-14 08:33:40.228	2025-12-14 08:33:40.228	$2b$10$g5xiOdWBYgyqedNbglhyMejmMoAHsWmfJlgmUW8r4z4JVGbvQxLa2	SISWA
cmj5gx12x003235udw6jxtx4r	jesenardiyanto@cbt.com	JESEN ARDIYANTO	2025-12-14 08:33:40.281	2025-12-14 08:33:40.281	$2b$10$L1KLICXq3ZaDTkBO17rOwerxL/PjdMPTjMp42BhVqZF/a.Km.0hTe	SISWA
cmj5gx14g003435ud6w8b4goi	jesikamartaal-zahra@cbt.com	JESIKA MARTA AL-ZAHRA	2025-12-14 08:33:40.336	2025-12-14 08:33:40.336	$2b$10$7qMEekHNAjTJJ499/hp6/uPCKwIZdyJk6d4kRA98hPZKPn7cVHG1.	SISWA
cmj5gx18z003a35udlra3qj4l	example8@cbt.com	KEVIN MAULANA ISHAQ	2025-12-14 08:33:40.499	2025-12-14 08:33:40.499	$2b$10$uBEpt3H35gGkW.hQxwpiZeswyIfQjNzWdtE70xDWtyxhNc.yyn8q.	SISWA
cmj5gx1ai003c35udrndkgaz9	khairulrizalfauzitukimin@cbt.com	KHAIRUL RIZAL FAUZI TUKIMIN	2025-12-14 08:33:40.554	2025-12-14 08:33:40.554	$2b$10$N3N1Xsj3jQwTlz8j30D1uuyds7TGWMKmeXS04/goiUk4sHQEilYUC	SISWA
cmj5gx1dg003g35udnuykpero	lianarantikaputri@cbt.com	LIANA RANTIKA PUTRI	2025-12-14 08:33:40.66	2025-12-14 08:33:40.66	$2b$10$omtSpijg6/nqL.QV0F7bMOuhnKswBMwxk5flJb9Hh8/ov27Nya.d.	SISWA
cmj5gx1ex003i35ud2tmr6ezm	livianayuningutami@cbt.com	LIVIAN AYUNING UTAMI	2025-12-14 08:33:40.713	2025-12-14 08:33:40.713	$2b$10$VLV5/X./8D.qHmC8R04oA.00/ROJj6octo7Iavzq5kph14.jNlzOK	SISWA
cmj5gx1gf003k35udqn4te1zt	luckyadityapratama@cbt.com	LUCKY ADITYA PRATAMA	2025-12-14 08:33:40.767	2025-12-14 08:33:40.767	$2b$10$uAWsVU.zHR6xaCeLnJL71Oa4yr9RW1o.KgHZX21nOMC8bA6LsZwDK	SISWA
cmj5gx1hw003m35udhjaaqojj	lukmanafandi@cbt.com	LUKMAN AFANDI	2025-12-14 08:33:40.82	2025-12-14 08:33:40.82	$2b$10$NXpY4ciXWh/zTT4a2MUikOOK3sIqZy0J5IvBhcsgghc7tAr099UhS	SISWA
cmj5gx1je003o35udc4kp1c2m	mbagassantoso@cbt.com	M. BAGAS SANTOSO	2025-12-14 08:33:40.874	2025-12-14 08:33:40.874	$2b$10$w1M8IJqZarK/H4cTgWOKrep/vxu/uu5EE8s0/u52KdZMswpW16AOS	SISWA
cmj5gx1kx003q35udsvrwk0yg	mbagussatrio@cbt.com	M. BAGUS SATRIO	2025-12-14 08:33:40.929	2025-12-14 08:33:40.929	$2b$10$.ejnfg5wFafLZs./iiALheXJWajy4.TTc2ck6QEIryBZikG9XgYga	SISWA
cmj5gx1mf003s35udmkcekzi3	example9@cbt.com	M. SAIFURROSI	2025-12-14 08:33:40.983	2025-12-14 08:33:40.983	$2b$10$jb3UgkRydpRrwD2XyxSjseIGRZkQAhnEvvd4PIIJZBacStlrhKPly	SISWA
cmj5gx1pg003w35ud8n0lxpp8	marcelgalihginanjar@cbt.com	MARCEL GALIH GINANJAR	2025-12-14 08:33:41.092	2025-12-14 08:33:41.092	$2b$10$t7ldjM39sSAPx0NtzxTDquA4uWING8BwJXs2H8zbIv9Z09PBGiWh6	SISWA
cmj5gx1tz004235udd1rv3ppx	example10000@example.com	MOH. AMAR MA'RUF	2025-12-14 08:33:41.255	2025-12-14 08:33:41.255	$2b$10$XZMxr6ZQsd2FROhu0Kt0gOwqDVmvEGW0wO7E1y4EDAhV6.kUiPvOG	SISWA
cmj5gx1x1004635udvhadbran	example10@cbt.com	MOH. RADITH MUSTOFA	2025-12-14 08:33:41.365	2025-12-14 08:33:41.365	$2b$10$TpsDqHe1q8NOfcmUUzn8UuEmRrdrpTBuMyRMfGNJvysBQ.F3DBIAK	SISWA
cmj5gx1yk004835ud9hcuxcvr	mohammadzidanmaulana@cbt.com	MOHAMMAD ZIDAN MAULANA	2025-12-14 08:33:41.42	2025-12-14 08:33:41.42	$2b$10$iQUGDy82Y/9HoevToUKDFeQ1IjjYmfDKTk0oq86dmJPqngA5l5EoO	SISWA
cmj5gx231004e35udeisgbcya	example11@cbt.com	MUHAMMAD ZAINAL ABIDIN	2025-12-14 08:33:41.581	2025-12-14 08:33:41.581	$2b$10$z5OD4jHLPKfZI1fEgTDskebpK4qF5FVJ833sWNlK/Zz1TzK2NN6g2	SISWA
cmj5gx24i004g35udt6qrnb7l	nadiatuzzahroh@cbt.com	NADIATUZZAHROH	2025-12-14 08:33:41.634	2025-12-14 08:33:41.634	$2b$10$IX/Bgj/B.XProOgGnL34aeIzBSYpF1CXGPa9aMWoysEg0bP7Swawu	SISWA
cmj5gx27h004k35udvdyo2fwy	naysilanadineceyseana@cbt.com	NAYSILA NADINE CEYSEANA	2025-12-14 08:33:41.741	2025-12-14 08:33:41.741	$2b$10$nmv.pU4DbB48VDjsBn46l.1DDdJjBYX3Q3ETWvlLipyvL8euqaXOy	SISWA
cmj5gx28x004m35udws9r11al	nouvalyurisaputra@cbt.com	NOUVAL YURI SAPUTRA	2025-12-14 08:33:41.793	2025-12-14 08:33:41.793	$2b$10$F4qE08pklQZztYE92r9Xxuk2znLAAX1.b/VUIH2clsxB31iF9/Pta	SISWA
cmj5gx2ag004o35udqr0i50ow	nukekusumawardani@cbt.com	NUKE KUSUMA WARDANI	2025-12-14 08:33:41.848	2025-12-14 08:33:41.848	$2b$10$H11ia2GrN8hNWVkJ/cGigu/RHFh.PH6z.7qFfE5SzRinEAjcbZyk2	SISWA
cmj5gx2bx004q35udncso3x1e	example27@cbt.com	NURHASAN	2025-12-14 08:33:41.901	2025-12-14 08:33:41.901	$2b$10$yWbwzV5pZh2VY5cNKmi8yODVdu2UWKzKRO/JiIaEMtLNs5z9h6jt2	SISWA
cmj5gx17g003835uduzmy772u	example17@cbt.com	KETUT DIMAS MUHAMAD RISAL	2025-12-14 08:33:40.444	2026-01-19 03:00:54.013	$2b$10$jXcidVG9zrqRWOnV6Qoiw.vGLVys1fXCVHD05K5Hxr8ebtx4aYgwi	SISWA
cmj5gx1nx003u35udc8a2l13v	example18@cbt.com	M. YUSRON GINANDA	2025-12-14 08:33:41.037	2026-01-19 03:01:15.185	$2b$10$kgGYhg45.bxX1Cggpe7rOeBakU4zFhfM7qj616qOMkwE0NJI1WqXu	SISWA
cmj5gx202004a35uditlzqygw	v4lentino833@gmail.com	Muhammad Riski Neo Valentino 	2025-12-14 08:33:41.474	2026-03-10 02:09:36.311	$2b$10$j5XeviiAoWUA8yXey.vaBe1G8hqv8UObMVwg4N7iOk88Ccz5ZhKgS	SISWA
cmj5gx21k004c35udlo92ywg1	example20@cbt.com	MUHAMMAD RIZKI	2025-12-14 08:33:41.528	2026-01-19 03:01:38.181	$2b$10$1Y3js6rwlGmjd46Ro.WaXOXNtGGwKvWpWTIe/k.W8vh3ks1H/VfqW	SISWA
cmj5gx260004i35udriuw72oc	example21@cbt.com	NAUFAL DZAKI HANIF ABIYYI	2025-12-14 08:33:41.688	2026-01-19 03:01:48.947	$2b$10$79E6EQz0udVSB6w8A8K7H.bQ3X.tgQ6.DoYurhH6rlQAu.JpAH8dW	SISWA
cmj5gx0mf002g35udp7fvgdod	faturrohman@cbt.com	FATURROHMAN	2025-12-14 08:33:39.687	2026-01-27 00:17:56.798	$2b$10$2xynkWvJwWCn0qmyA5d8xO1cb7JYA2Rt6mdnt84eAIjvK72N8pXHe	SISWA
cmj5gx0r0002m35udzu8e92kf	fiqiaditia@cbt.com	FIQI ADITIA	2025-12-14 08:33:39.852	2026-01-27 00:18:07.434	$2b$10$XjrK.0T5tIvnO5BqadJ3Bub0wB1lc/tiOvi2st/6IfMRinK6sS.NS	SISWA
cmj5gx0x0002u35udc7ccpufd	ichajuwita@cbt.com	ICHA JUWITA	2025-12-14 08:33:40.068	2026-01-27 00:18:18.073	$2b$10$WmGM2FA0DNVda9Sg3gbODeOfaK0C1V3ilZIsBOg0L7EN0G2vN7pOi	SISWA
cmj5gx100002y35udilmg1ny8	intanbalqishumairo@cbt.com	INTAN BALQIS HUMAIRO	2025-12-14 08:33:40.176	2026-01-27 00:18:30.968	$2b$10$xhQhJ6jIhXi6c0Crqql3pOLeLH9KEtlp4gMknGJqm7lqDU5Kk/4IS	SISWA
cmj5gx1vi004435ud0rdy53xd	mohbayuainurrohman@cbt.com	MOH. BAYU AINURROHMAN	2025-12-14 08:33:41.31	2026-01-27 00:18:40.973	$2b$10$ltUW0VWKvKemPkfgK59THuSiQ4dQGFVbR1ew3O.nc9BBEGkf.OX/C	SISWA
cmj5gx15y003635udfzfvsnsn	joshuabagusnugroho@cbt.com	JOSHUA BAGUS NUGROHO	2025-12-14 08:33:40.39	2026-03-05 01:21:39.733	$2b$10$Q74P7QZPXgiG6RxERVSJieJfYfsrPX5lDt/Bwk8EKlmUnZ5mOy5N2	SISWA
cmj5gx1bz003e35udkcmtj455	khaludsaifulanwar@cbt.com	KHALUD SAIFUL ANWAR	2025-12-14 08:33:40.607	2026-03-05 01:21:49.409	$2b$10$le2Q.13/1VYFWw0ZG3JTu.U3mQP7Hb4BWAw7kq.6Bb1NDg7RMmm0m	SISWA
cmj5gx1qy003y35udt05qd1id	mazelloitoafrianzie@cbt.com	MAZELLO ITO AFRIANZIE	2025-12-14 08:33:41.146	2026-03-05 01:21:59.029	$2b$10$A/Tv2vHEDYo1u4GsMWQ14.coB/LePBLPpHonAn5ZxdtEusozG1/22	SISWA
cmj5gx1sg004035udzqsyoalc	minelasari@cbt.com	MINEL ASARI	2025-12-14 08:33:41.2	2026-03-05 01:22:08.54	$2b$10$8CFPva.qekkGgsmJZVoFdOxIB6CYReCspBf3I4WMHyndhksBEaL.2	SISWA
cmj5gx2dg004s35udfhoy10rz	philipusjayabalanrakasiwi@cbt.com	PHILIPUS JAYA BALAN RAKASIWI	2025-12-14 08:33:41.956	2025-12-14 08:33:41.956	$2b$10$rakNiN2VvDPskNw1eZ3wVOlUemfSd3csLPrTv5/iQZEGc0K8J97mi	SISWA
cmj5gx2ey004u35udtxb4t3ri	rahmadfirmansyah@cbt.com	RAHMAD FIRMANSYAH	2025-12-14 08:33:42.01	2025-12-14 08:33:42.01	$2b$10$gIqO.dpbA2srgntpay6z6uguqeAP3dqYR30B6Sygzvwm2SYbovk4W	SISWA
cmj5gx2gf004w35udlkyaly82	ravadaladha@cbt.com	RAVADAL ADHA	2025-12-14 08:33:42.063	2025-12-14 08:33:42.063	$2b$10$XV.Pzyw1nc.rYSWR6ZOxMeRjk9av1CR3Q7xEhODf6S6kmz0M.m0rO	SISWA
cmj5gx2jd005035udyuohrs2j	rezyanggarabahari@cbt.com	REZY ANGGARA BAHARI	2025-12-14 08:33:42.169	2025-12-14 08:33:42.169	$2b$10$Zxa2anNIEPVLnwCXwkusceo2RZ3mMPIKIx3VHs1ethbRuC283r32q	SISWA
cmj5gx2mc005435udz2z1c0tg	rivaadityaputra@cbt.com	RIVA ADITYA PUTRA	2025-12-14 08:33:42.276	2025-12-14 08:33:42.276	$2b$10$a2AJfW7d4.WgMCjnMmoQN.3GaQ6SEeR8rnVLHPfauITNrmUnqNDNq	SISWA
cmj5gx2pd005835udp1ug0523	septiairfanramadhan@cbt.com	SEPTIA IRFAN RAMADHAN	2025-12-14 08:33:42.385	2025-12-14 08:33:42.385	$2b$10$fgb96s7bHiJBUAOiPAsGyOdzHP3WRL1BQ3NURlOlnW9QrsxqaxHsm	SISWA
cmj5gx2sd005c35udyl3o8dav	tesyaherliana@cbt.com	TESYA HERLIANA	2025-12-14 08:33:42.493	2025-12-14 08:33:42.493	$2b$10$XvMktoAKg7/oG.txjwJOxOn1jnZbTvuxIwBo8.qhTCoPvVfW/sSjm	SISWA
cmj5gx2tv005e35udpkauz4m3	wisnumaulana@cbt.com	WISNU MAULANA	2025-12-14 08:33:42.547	2025-12-14 08:33:42.547	$2b$10$plpLK1tpmf./clc4mPg6DuUn0AqoYQjGa3eeAPRwbylsquFw7EGpi	SISWA
cmj5gx2vd005g35udsfcg75mb	wulanfebriyanti@cbt.com	WULAN FEBRIYANTI	2025-12-14 08:33:42.601	2025-12-14 08:33:42.601	$2b$10$qJY6kQrkji64LTqKXhlk5u3s2tl2Sr13cxIb82UeFEOu0iObWx2Ea	SISWA
cmj5gx2ye005k35ud0lbk4bs6	yohanesdwiprayoga@cbt.com	YOHANES DWI PRAYOGA	2025-12-14 08:33:42.71	2025-12-14 08:33:42.71	$2b$10$f5ECPVBxrDThgEuRQm7tLeKYyTISCXKsj6CM6Kn1o3a45HNFTggCW	SISWA
cmj5gx2zv005m35ud2aj2o8s7	example28@cbt.com	YUDA WIRASA	2025-12-14 08:33:42.763	2025-12-14 08:33:42.763	$2b$10$kimndO4msuJnUkkv4BoNDuGNABfPBrpZwz5707TApwOzvbgTs92em	SISWA
cmj5gx31d005o35udqv3tt8vd	yuliyatimah@cbt.com	YULI YATIMAH	2025-12-14 08:33:42.817	2025-12-15 09:13:52.78	$2b$10$FIJQKJNU8kn4aaD0mXT7WuT/yPTaLglP6BoZspMgbkYB1wjgNa0ya	SISWA
cmj9z8xto00215dudxiyqcr71	ainiabdcholis.73@gmail.com	Aini Abdul Cholis S.Pd.	2025-12-17 12:17:53.724	2025-12-17 12:17:53.724	$2b$10$8d5eRQzqyaHxvTqdaZ0Xb.KMA9t1CccY0MokoaaCeQDO4JUonsm5u	GURU
cmj9z8xvb00235dudd4xbolii	drasuburhindartin@gmail.com	Dra. Subur Hindartin	2025-12-17 12:17:53.783	2025-12-17 12:17:53.783	$2b$10$zK5uU3Xgn/ac3yU6KKx1a.8rpjn4D1WG.Ou1Tgucb5L4XQR1izT3C	GURU
cmj9z8xws00255dudbgtsplon	yudiaster1922@gmail.com	Dwi Wahyudi, S.T,	2025-12-17 12:17:53.836	2025-12-17 12:17:53.836	$2b$10$YyJs1CrLRs5.2T8BUluBOe7Tj.wvxs2pLYSiyATFXmSTzXj.yGzVe	GURU
cmj9z8xy800275dudsv8ypuim	erlinnoviadiana@gmail.com	Erlin Novia Diana, S.E.	2025-12-17 12:17:53.888	2025-12-17 12:17:53.888	$2b$10$/waGiSyB0t9vwLueL9NmFOC0JGkWUtsttc/SQu1V/ASD5ov8y2b3O	GURU
cmj9z8xzp00295dudiet5g8kd	feramegaharistiana@gmail.com	Fera Mega Haristina, S.Tr.Kom.	2025-12-17 12:17:53.941	2025-12-17 12:17:53.941	$2b$10$O2yNs147SaOWSNADTQw.cOU9NgObwsUIzUy8QqGMZz7zHvAQx1S.q	GURU
cmj9z8y16002b5dudps21lpfm	franceskoyen16@gmail.com	Frances Laurence Setyo Budi, S.Pd.	2025-12-17 12:17:53.994	2025-12-17 12:17:53.994	$2b$10$qTxhgk048vaLAkehVRUGD.gFHI3grpRamVmY4t0uwscnDAUHl9sWW	GURU
cmj9z8y2n002d5dudjgj6nzx4	imtianateguh@gmail.com	Imtiana, S.Pd	2025-12-17 12:17:54.047	2025-12-17 12:17:54.047	$2b$10$YAm0kXZlWHCC31rxS2iAL.aNaX6lrF2E56eA5JGY9PClZApF2PX6G	GURU
cmj9z8y44002f5dudfvho6nza	faizabrahammalik@gmail.com	M. Fais Jainuddin, S.Pd	2025-12-17 12:17:54.1	2025-12-17 12:17:54.1	$2b$10$pG.E6A1wwK8pFBDxijQ9FeAw7fhH.RYsuoceohV1i8yMB9Ywh1KaC	GURU
cmj9z8y5n002h5dud9vb23462	mohrohim02@gmail.com	Moh. Rohim, S.T.	2025-12-17 12:17:54.155	2025-12-17 12:17:54.155	$2b$10$7HH5bidHf8R60YQ1wSPKZOzuLU/PZfNMG0pPwT1GxNl4cDiNXWmlK	GURU
cmj9z8y73002j5dud9ooury49	yunuskacer@gmail.com	Moh. Yunus Ansori, S.Pd.	2025-12-17 12:17:54.207	2025-12-17 12:17:54.207	$2b$10$b.XN.kbU9W.rCAo.NtL/4uEYRtWcNjSv23TWqqlJqofhK0Haw4eK.	GURU
cmj9z8y8l002l5dudo8u4k81t	danzia22@gmail.com	Mulyono, S.Th.	2025-12-17 12:17:54.261	2025-12-17 12:17:54.261	$2b$10$niDbRCJ5f.6DWxmLfDop2ej9J3nXS6natY9K/38fhMo5xLx/iRm.a	GURU
cmj9z8ya2002n5dudxxrmi27p	nunungindrawati437@gmail.com	Nunung Indrawati, S.Pd.	2025-12-17 12:17:54.314	2025-12-17 12:17:54.314	$2b$10$W95AlE618b7g2R0jxnAtFurczP4G2yNzJGpuzoj9GcGDahmaYSiT2	GURU
cmj9z8ybk002p5dudp5man22v	nurmalaevayanti2006@gmail.com	Nurmala Evayanti S.Pd.	2025-12-17 12:17:54.368	2025-12-17 12:17:54.368	$2b$10$JuD9MrSjTnn9JjGXK8s8I.s5gFTVjGYCU/Jl/Sg4A8ZDByCBZSvUa	GURU
cmj9z8ycz002r5duda3p9ojun	nurulhidayahse485@gmail.com	Nurul Hidayah, S.E.	2025-12-17 12:17:54.419	2025-12-17 12:17:54.419	$2b$10$WCSq4rLN4ICBmTocXomrGOeQeRo2wHcv.9VXzzYb4ms0V561eMzuu	GURU
cmj9z8yfy002v5dudvf51yqq4	purwantisiska25@gmail.com	Siska Purwanti, S.E.	2025-12-17 12:17:54.526	2025-12-17 12:17:54.526	$2b$10$sWRMxFzGkLPqKZWFTV5p5.F9yNbQrpSMpBIn4k/ZWipc2GK1oDQpG	GURU
cmj9z8yhh002x5dud9my7ci8i	rizalpecintaseni@gmail.com	Syamsul Rizal, S.Pd.I.	2025-12-17 12:17:54.581	2025-12-17 12:17:54.581	$2b$10$CNuEXEu7LJVQRmA.BgEMG.bGjlD36JsK4DkKLfbBV1T/j0XgPIigq	GURU
cmj9z8yix002z5dudbc4lk8nv	udayaniprayuda@gmail.com	Udayani, S.Pd.	2025-12-17 12:17:54.633	2025-12-17 12:17:54.633	$2b$10$mx2VrBuCGVqaCRIlMCl6kOpaX2BG3iAbUMUB2dijH3rZGl9bMySye	GURU
cmj9z8ykf00315duda3u6niqb	wahyumirnawati30@gmail.com	Wahyu Mirnawati, S.Ak.	2025-12-17 12:17:54.687	2025-12-17 12:17:54.687	$2b$10$dRmoisOlOqhHY5ZTr7ErMeNDuO9E0nIEqWcVVf0qvP30LafIf42r6	GURU
cmj9z8ynd00355dudycn1e6hi	pa717885@gmail.com	Maulida Putri Lesmana	2025-12-17 12:17:54.793	2025-12-17 12:17:54.793	$2b$10$tYhChWCpdqZ/5A1bzHFtcu9LZpKS2bIDhETwVIwgDSN0yRbWdggTG	GURU
cmj9z8you00375dudrf1e71qe	ilafebtisherly@gmail.com	Ila Febti Sherly M., S.E	2025-12-17 12:17:54.846	2025-12-17 12:17:54.846	$2b$10$UB2xcYNx90qbDQQ3LlMkHOCSfQj.XWLldNJ9bmn4LW59GLZvbrYkm	GURU
cmj5gx04c001s35udal7y6kqp	desimustika@esgriba.com	DESY MUSTIKA MAYA SARI	2025-12-14 08:33:39.036	2025-12-22 11:46:55.996	$2b$10$nOCUVw8yH97gwAqDSQhuV.EQOBRd45gtsB79vTyNrDe3dOTi3IP/y	SISWA
cmj9z8ylv00335dudr8tet2na	zulfiamaliyah1306@gmail.com	Zulfi Amaliyah, S.Kom	2025-12-17 12:17:54.739	2025-12-23 07:48:07.524	$2b$10$WFyItfPq96XxeDV9hutJweDwS7mRpoHgdeia06BTGTQVYV.upKDkC	GURU
cmj9z8yej002t5dudlb0wn4mh	rizkielutfi@gmail.com	Rizky Lutfi Romadona, S.Kom	2025-12-17 12:17:54.475	2025-12-25 11:54:51.909	$2b$10$u/GAfkYy./EURPHeBYkbRem3Oro.3AcydU2Ptm3mv0yX1KSB3vnTu	GURU
cmj5gwyx4000835udq2k2tbxp	example12@cbt.com	ADITYA DAMARA PUTRA KRISTIAWAN	2025-12-14 08:33:37.48	2026-01-19 02:55:54.159	$2b$10$kiUoMOKey4kllYhtFaTFb.qSeC7uEnArrZyFj981UIktMY2t7GRXu	SISWA
cmj5gx0nz002i35udbi0v5c4g	example16@cbt.com	FERDIO PUTRA PRASETYA	2025-12-14 08:33:39.743	2026-01-19 03:00:42.146	$2b$10$mKKfXz8i.qI5DqJbSwfmCupkNt1BBXgNEO65pKujxhlz4UsGuMygy	SISWA
cmj5gx2nv005635udhkikfx5c	example23@cbt.com	RIZKY WIDODO	2025-12-14 08:33:42.331	2026-01-19 03:02:09.218	$2b$10$O2D5yhJ5NTnkJRfLpqDR7eMWyvhdbf0mJxmDCjdOkvCp575OtxKmK	SISWA
cmj5gx2qv005a35ud9ybz7pdt	example24@cbt.com	SUPRIYADI	2025-12-14 08:33:42.439	2026-01-19 03:02:19.245	$2b$10$VaDja9Vceryf60YAsyD3jusK2vTuWO1z8V3hu/BNY2PFcAngKjuou	SISWA
cmj8hh49m0000oaudjfiw6g8c	petugasabsensi@mail.com	Hari	2025-12-16 11:12:36.058	2026-01-22 05:41:22.792	$2b$10$a13OrJ/VRhWZsiihZzAn1ui5ZI4y2pa3t7cDwiprI8emMXKjEnfZa	PETUGAS_ABSENSI
cmj5gx2ww005i35udmbp9bp8d	yehezkielkevinraharjo@cbt.com	YEHEZKIEL KEVIN RAHARJO	2025-12-14 08:33:42.656	2026-03-05 01:22:19.825	$2b$10$Je.ZByZvEFt6dB7IzJz99uv5.3rzo6P0zKk7kS9GQqycLvRod9Wi6	SISWA
cmj5gx2hw004y35udh3y17ie4	example22@cbt.com	RAZKY GABRIL WAHYUDI	2025-12-14 08:33:42.116	2026-01-19 03:01:58.836	$2b$10$YjSAAt.cRZz5VA/HQoxI8euul4WYhB1thBm1qp6B/xWdFhJPrPJWy	SISWA
cmj5gx2ku005235udqtgs17js	ridhoirwansyah@cbt.com	RIDHO IRWANSYAH	2025-12-14 08:33:42.222	2026-01-27 00:18:53.234	$2b$10$cj.7dH8iuVvuvyuzbs1qqe51fXRdReCaG9gbnV8OOPvQmOs/6PjEu	SISWA
cml4n1oda005mrgpvj0kf3pav	abil@gmail.com	Abil	2026-02-02 03:56:53.278	2026-02-02 03:57:51.587	$2b$10$QxvXxM1167mR2z0bqJ5D7ugb2k.yx09oeJXh7DnqD0KU6aGyhV/IW	SISWA
\.


--
-- Data for Name: _GuruMataPelajaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_GuruMataPelajaran" ("A", "B") FROM stdin;
cmj9z8yox00385dudt5p2uvo1	cmj9z7q9i001r5dudnscpl8q0
cmj9z8ybn002q5dud7n4058u9	cmj9z7q84001d5dud60yqektg
cmj9z8y4a002g5dudjlq4s2jp	cmj9z7q7y001c5dudu38a65qb
cmj9z8y77002k5dudwjch4365	cmj9z7q8v001k5dudwd0dr0f2
cmj9z8xtu00225dudew59ixr7	cmj9z7q8k001h5dudkou2wtsf
cmj9z8yd4002s5dudqb9lav2o	cmj9z7q9i001r5dudnscpl8q0
cmj9z8y5q002i5dudk3gr40r9	cmj9z7q98001o5dudu8zzru3q
cmj9z8y5q002i5dudk3gr40r9	cmj9z7q9f001q5dud3giiabft
cmj9z8y8o002m5dudwnycw1jf	cmj9z7q8c001f5dudtoyt49tx
cmj9z8y8o002m5dudwnycw1jf	cmj9z7q9n001s5dudxr525koc
cmj9z8yhl002y5dudqly12oc3	cmj9z7q90001m5dud5q6cvaku
cmj9z8yhl002y5dudqly12oc3	cmj9z7qae00205dudqey9zf1h
cmj9z8xyc00285dudgvf5bnnv	cmj9z7q8m001i5dudi334c2ms
cmj9z8xyc00285dudgvf5bnnv	cmj9z7q9i001r5dudnscpl8q0
cmj9z8xyc00285dudgvf5bnnv	cmj9z7q9v001v5dud8r2heab2
cmj9z8ykj00325dudk20mdgjx	cmj9z7q8x001l5dudh15r8ocj
cmj9z8y1b002c5dudh3e7fyuu	cmj9z7q9c001p5dudhh2cp17a
cmj9z8ya7002o5dudm0yzma1k	cmj9z7q8k001h5dudkou2wtsf
cmj9z8ya7002o5dudm0yzma1k	cmj9z7q8x001l5dudh15r8ocj
cmj9z8ya7002o5dudm0yzma1k	cmj9z7q9c001p5dudhh2cp17a
cmj9z8xzs002a5dudw0c717l2	cmj9z7q87001e5dudb1uk5u9j
cmj9z8xzs002a5dudw0c717l2	cmj9z7q9n001s5dudxr525koc
cmj9z8xzs002a5dudw0c717l2	cmj9z7q9v001v5dud8r2heab2
cmj9z8xzs002a5dudw0c717l2	cmj9z7qa0001w5dudmau1sngf
cmj9z8yg3002w5dud29sel0av	cmj9z7q94001n5dudvyt50cow
cmj9z8yg3002w5dud29sel0av	cmj9z7q9i001r5dudnscpl8q0
cmj9z8yj000305dudtwddc0j1	cmj9z7q7y001c5dudu38a65qb
cmj9z8yj000305dudtwddc0j1	cmj9z7qaa001z5dudjfz3mlu8
cmj9z8yem002u5dudolwskcz4	cmj9z7q87001e5dudb1uk5u9j
cmj9z8yem002u5dudolwskcz4	cmj9z7q9n001s5dudxr525koc
cmj9z8ynh00365dudxaiuoy08	cmjof810t000005udgq7bzpjh
cmj9z8yly00345dudadjrqvfh	cmj9z7q8c001f5dudtoyt49tx
cmj9z8yly00345dudadjrqvfh	cmj9z7q90001m5dud5q6cvaku
cmj9z8yly00345dudadjrqvfh	cmj9z7qa0001w5dudmau1sngf
cmj9z8y2q002e5dud69l0gx00	cmj9z7q8h001g5dud3cnj22wr
cmj9z8y2q002e5dud69l0gx00	cmj9z7qa5001x5dudniu477gy
cmj9z8xwv00265dud0w98oh1m	cmj9z7q98001o5dudu8zzru3q
cmj9z8xwv00265dud0w98oh1m	cmj9z7q9f001q5dud3giiabft
cmj9z8xwv00265dud0w98oh1m	cmj9z7qa8001y5dud4gjab2sw
cmj9z8xvg00245duda7dxbp56	cmj9z7q8q001j5dudx5o1zuri
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
a94ee691-6391-4deb-a40d-117d3fcc9da5	8253ad999e290887ee238475c1c7527411794b21d4f6b3473acc7a0b177087fb	2026-03-13 01:59:25.481927+00	20260108134155_add_absensi_kelas_and_jurnal_mengajar	\N	\N	2026-03-13 01:59:25.451063+00	1
d114b2b0-83e0-449e-aafb-c23bc0c21d6d	73bce2da24cb3e565151c0fbdfb562ad0f38c4c56dd7525bb13815b3a565ee3e	2026-03-13 01:59:24.917208+00	20251211102828_init	\N	\N	2026-03-13 01:59:24.905229+00	1
f32a165d-644d-40f1-9853-aab0859d71c4	9202843d6cb86ff0f4049a7dfe6ae89bac3c4af9b80ae11daa2dcb10bcc10135	2026-03-13 01:59:25.136778+00	20251216124905_add_settings_model	\N	\N	2026-03-13 01:59:25.127675+00	1
e4d42bda-f2ee-4fc3-a20a-418cf695189a	d95b1db85b88f71c2b1454aad44f03cb2a5c08a1b0175ad6c359423618b6006a	2026-03-13 01:59:24.931339+00	20251211151758_npm_run_prisma_generate	\N	\N	2026-03-13 01:59:24.919671+00	1
25c7d7e8-9bfa-412c-8f64-549a45642475	cbdbecc3360bab9c4882546aac36beb18127843150ef0a833be8038d128f17e5	2026-03-13 01:59:24.966202+00	20251212095857_add_lms_entities	\N	\N	2026-03-13 01:59:24.933597+00	1
aebbe6ce-1e61-466e-8c59-1951fa390a17	01ca80e1bd5654d6f80e967cf6b09195a526d21bde40e0d440944275c5fb6b57	2026-03-13 01:59:25.368938+00	20251221112959_add_lms_features	\N	\N	2026-03-13 01:59:25.261941+00	1
4a95e15b-33e7-450b-98fe-e04ad1b92364	e01c6e151ddca521002d9bcd565b0aa6f1e1542d70f151ff650c3d5c0ce88312	2026-03-13 01:59:24.988497+00	20251212112639_add_jurusan_and_update_kelas	\N	\N	2026-03-13 01:59:24.968458+00	1
872a0e13-3385-43a7-9672-58f1bd62032a	e6fe4fbb8f9bd4c6ce586b3ffa6d9f173dd50fc7d60108cc5ac467ef4f877703	2026-03-13 01:59:25.146202+00	20251217022933_remove_semester_from_tahun_ajaran	\N	\N	2026-03-13 01:59:25.139063+00	1
d9f39f7b-677d-4c4d-86f3-1765def019a2	3b80192829c2511d28def5eff29e8863c8501f9eadb87a76a4268bbd715f37f0	2026-03-13 01:59:25.006086+00	20251212122610_add_many_to_many_guru_mata_pelajaran	\N	\N	2026-03-13 01:59:24.991507+00	1
44c1428b-8c11-47aa-bb98-69935f9193a2	a38e79bdfd91babc8ab53bba4919ffb82b21990aca20b49e54846e01e87d1333	2026-03-13 01:59:25.019661+00	20251212125923_add_user_integration_to_siswa_guru	\N	\N	2026-03-13 01:59:25.008278+00	1
eaf1db3d-437a-4f79-b3e5-deb4fbbad182	c6bc5694123d14c6c864372740fcfdd7f51e855e996e461a3f97d804c968f750	2026-03-13 01:59:25.032075+00	20251212145913_make_tahun_ajaran_required_in_kelas	\N	\N	2026-03-13 01:59:25.021541+00	1
6d865b7f-4224-481a-9ceb-ca51dbe94936	4857f25f30c1d8863812a18d62f1b61ab0a3c3ee11b832f130ca3b682ad1075c	2026-03-13 01:59:25.186449+00	20251217074227_remove_tingkat_kesulitan	\N	\N	2026-03-13 01:59:25.148257+00	1
ba2a779e-8941-4db9-be6e-05c940b5dec5	a7a3344c5a64bcc4390c9565bcd57c43f94d9f04a0befc0beac14629ab9a7c47	2026-03-13 01:59:25.042257+00	20251214051132	\N	\N	2026-03-13 01:59:25.034162+00	1
b2e50abd-45af-4ec8-9971-975b62ba2349	0e51032017049d11fdeff14e619bd9f49d1762f476abf67608f42e6f4d1a37c1	2026-03-13 01:59:25.065012+00	20251214063132_refactor_tahun_ajaran_to_siswa	\N	\N	2026-03-13 01:59:25.045074+00	1
1e8aa993-df76-42c4-a4c8-adfbd06d9ba7	03c68baa9218fa660eb7c575c1fba31a81a6ca2bc8b7e85fd7d3111eaa9096e4	2026-03-13 01:59:25.092913+00	20251214084212_add_attendance_model	\N	\N	2026-03-13 01:59:25.066954+00	1
a4f03051-51e0-4a47-a9a5-c5cdcac2174e	1e7be7b515e21c97c079f242f2b1e05cf45ff62883ea82ceab9a69e872207f27	2026-03-13 01:59:25.210947+00	20251217091002_add_paket_soal	\N	\N	2026-03-13 01:59:25.188704+00	1
ed852ce2-d567-4050-9f11-7c6defc043f7	da7eada924d10dbd545ab730b45ec7835fd1e6138b8d95f3e04caf67221f1834	2026-03-13 01:59:25.101914+00	20251216110639_add_petugas_absensi_role	\N	\N	2026-03-13 01:59:25.095202+00	1
0f323b0c-ddd3-4ccd-aa22-472063d829bb	94e0a16a6374b7986c25879d0be3bbb5559adbb6dbbafbc2049041bb3fe13ac0	2026-03-13 01:59:25.109347+00	20251216115114_add_magang_status	\N	\N	2026-03-13 01:59:25.103713+00	1
2614a679-2189-4aa0-9f64-a81795cd1b2f	c65922c381d39b7aa3dc1870d8aeb4e2d67cd8b0fe0ef9a9def920f8d2906597	2026-03-13 01:59:25.381034+00	20251227144854	\N	\N	2026-03-13 01:59:25.37082+00	1
adb5c165-db61-4221-9fee-0d31c71ae7f8	5702607ca9d82e3548c857dfc88e1b5c04371be9ee29d5133571677fac0ff59f	2026-03-13 01:59:25.125665+00	20251216115239_rename_magang_to_pkl	\N	\N	2026-03-13 01:59:25.112114+00	1
49a65d36-1854-476a-aa2e-73a7be46da89	2d2e876c1d09314e7cb7bed50be51cc2443c3ff79204686ad80d5360c83b4501	2026-03-13 01:59:25.220423+00	20251217092251_remove_tingkat_kesulitan	\N	\N	2026-03-13 01:59:25.212855+00	1
066f61f7-bc31-4b90-b9bd-ee8300d6c674	e908354aa78e518278a5c46aa63311c95489ff12017551e9b8edf943d64b11f7	2026-03-13 01:59:25.232478+00	20251217092712_add_guru_to_paket_soal	\N	\N	2026-03-13 01:59:25.222291+00	1
428e519f-0f61-4987-bdc0-1dbc9668e476	ddd53f8fe62585a400d15183d5842e13b30e485b9ab83a6456ea5593a8d8567c	2026-03-13 01:59:25.248279+00	20251217114742_add_multi_class_student_selection	\N	\N	2026-03-13 01:59:25.234885+00	1
6d8153b0-ed64-402b-8819-e8be7409f044	58769b18f3537f3a3a2d12ff8c588915d6255fa8a15a04a5b2e54063f83bd1c4	2026-03-13 01:59:25.401872+00	20251228114822_remove_penjelasan_column	\N	\N	2026-03-13 01:59:25.382797+00	1
619d7b09-032e-4ed3-b11f-2bef3c79a96b	dc45ebe70c4ffafea826199570c1e5759050bcbbea28062e6192370dab87c670	2026-03-13 01:59:25.259797+00	20251217120042_add_guru_to_ujian	\N	\N	2026-03-13 01:59:25.250174+00	1
2794b328-65d5-4e50-a9dc-c53e6efb5d7a	f4f291ab06a63027600995d1b7edd238806dabcadf4622afa2600106fc813eb5	2026-03-13 01:59:25.491884+00	20260114124529_add_jenis_ujian	\N	\N	2026-03-13 01:59:25.484386+00	1
f9813477-c2a0-4cb0-9cba-49e7fe0761cd	09cbf7324b8db88ad7f9c30a66b746cee9e11967828533b685a4c9ed0cf2b111	2026-03-13 01:59:25.429397+00	20251230062100_add_rpp_deep_learning	\N	\N	2026-03-13 01:59:25.404716+00	1
166bb92c-e04e-476b-8454-9c310d7ab381	56890b201741ae6e2b536437afd9a5de2ccf1832c20b6393673e1149137e3262	2026-03-13 01:59:25.448489+00	20251230062917_update_rpp_to_official_format	\N	\N	2026-03-13 01:59:25.432166+00	1
9071de5b-764f-450e-a1c9-a3e19f7ca20a	a0170a9c815d12f95e3ea30cbc54fac00b950aaabf5da124b2f1339d4b841ec5	2026-03-13 02:17:18.233433+00	20260313021718_add_violation_count	\N	\N	2026-03-13 02:17:18.222225+00	1
46e1be31-4546-48eb-b4fb-4287e7239c97	fc3e2591603799ee1e8b57aecf61428b325a2ff167012db7fd813e0fb2966563	2026-03-13 01:59:25.511018+00	20260114125102_change_jenis_ujian_to_model	\N	\N	2026-03-13 01:59:25.494039+00	1
647687c2-053d-4924-ab4d-1cec026668f1	c9a4f0e6ab7d0cc561ab240fc338bf212cc18c0fee99780dd072ba374f18aa8e	2026-01-19 01:28:48.769198+00	20260108134155_add_absensi_kelas_and_jurnal_mengajar	\N	\N	2026-01-19 01:28:48.742466+00	1
5c31ea83-da1e-42f2-8d70-eea748e1f48b	e867c3c061786afbaebd920b97345b00a9f93fb973d9f8dd81982b3aab0173da	2026-03-13 01:59:25.518928+00	20260118064520_add_original_filename_to_materi	\N	\N	2026-03-13 01:59:25.513456+00	1
a290256f-3189-4354-b8b8-c5f08c3f644e	609cb3817046359fc62b69f293e3903cd198aae0f3510bf462c59f9ad4035ff7	2026-01-19 01:28:48.377621+00	20251211102828_init	\N	\N	2026-01-19 01:28:48.369361+00	1
bada2042-debb-4ab1-bf88-601b80c60910	0156d098f4db91ff3bbadcc1b79aadb5d97c09871b71938fd4dc6e53391a1532	2026-01-19 01:28:48.528277+00	20251216124905_add_settings_model	\N	\N	2026-01-19 01:28:48.521071+00	1
7e5fc29d-d5eb-4eb6-a92b-8404d4f1f762	2640bf707564a1056f78c31ab21927c3e2ba43ac93d47d3f1ef832ccced34bc8	2026-01-19 01:28:48.383908+00	20251211151758_npm_run_prisma_generate	\N	\N	2026-01-19 01:28:48.379111+00	1
5c328c38-3b52-4a38-9af6-15bf6214eb1e	0c7e0d4e778e1cc415cbfd0b3fbe7fdc91ffeb05229bf7599a2ebb8ceb9ffb3e	2026-01-19 01:28:48.411091+00	20251212095857_add_lms_entities	\N	\N	2026-01-19 01:28:48.385107+00	1
ad60a768-5980-4003-98cb-7b8e525d9bd8	b43cc7d286cb1c9e4eed35a237d4805ddb2ad96144c39cfb102c2eae959a72e4	2026-01-19 01:28:48.687691+00	20251221112959_add_lms_features	\N	\N	2026-01-19 01:28:48.610432+00	1
63bab355-ef1c-495d-8e0a-c8008c4415b3	750d8a254ceaaf152f260f65242d25249ecaaf9678faa3f041f061007f1ee44d	2026-01-19 01:28:48.425231+00	20251212112639_add_jurusan_and_update_kelas	\N	\N	2026-01-19 01:28:48.412222+00	1
854b3c5b-84d9-451b-beb5-1a8777c4c2dd	8334127d9f47b107a04a7d4f45e7b1a9f28120a32076d8418b80a0fbdd0d7fd3	2026-01-19 01:28:48.534731+00	20251217022933_remove_semester_from_tahun_ajaran	\N	\N	2026-01-19 01:28:48.529804+00	1
c60cb3d1-1f3d-47c8-bd93-2e2704b4244e	998edaffc3e7e33bda76f385a440e3df4dbf0428564a2a15763cd5aa26535719	2026-01-19 01:28:48.437668+00	20251212122610_add_many_to_many_guru_mata_pelajaran	\N	\N	2026-01-19 01:28:48.426256+00	1
0ffae982-4052-4f2c-ba6f-008f06b3c454	92f08fc24273bbcd87412a6494250a94461f6da2ba78cc5cc67527b74e451431	2026-01-19 01:28:48.4477+00	20251212125923_add_user_integration_to_siswa_guru	\N	\N	2026-01-19 01:28:48.439068+00	1
46c972fe-c897-444c-a6fa-8b3945849a01	2af40a7de13d912e0dc5428dfaad47807ad86bb19d9b998236759c7c6779f568	2026-01-19 01:28:48.458201+00	20251212145913_make_tahun_ajaran_required_in_kelas	\N	\N	2026-01-19 01:28:48.449564+00	1
aea04a10-55b1-4f1b-b561-0f37b384f86b	ca56657a42dc94fe3aa791065e17521b02eadc0abb8a196bd6d74998eaca7b18	2026-01-19 01:28:48.564285+00	20251217074227_remove_tingkat_kesulitan	\N	\N	2026-01-19 01:28:48.536016+00	1
30cb5ecb-5f72-4cef-8187-4558742cee87	90480c68541aad550a5a12bc2e8485029efc1fb1fa25a9940a1323042c4385e2	2026-01-19 01:28:48.465927+00	20251214051132	\N	\N	2026-01-19 01:28:48.459464+00	1
680682ea-a91c-450d-a8a8-241f500b0c1c	f4eb6ab1a9e0366ad782133ad765d973cb1b2ab0a48a1f7e9034e305b6634ff0	2026-01-19 01:28:48.482259+00	20251214063132_refactor_tahun_ajaran_to_siswa	\N	\N	2026-01-19 01:28:48.46736+00	1
f39185c3-28ec-48eb-83e3-2bc2958d2b29	25d03367cc79cdbff0ec8e1c2d3c33a3b806c75a4e4b1fecd1932f16e476b4e5	2026-01-19 01:28:48.500386+00	20251214084212_add_attendance_model	\N	\N	2026-01-19 01:28:48.483368+00	1
e3c7a862-650e-43d2-854c-eaf8c4003ff6	b49d31efb8891a0baa5b7c1c11b5468cc50c80552ec5a7b78852605d377c5bef	2026-01-19 01:28:48.579273+00	20251217091002_add_paket_soal	\N	\N	2026-01-19 01:28:48.565447+00	1
d18225f8-075a-4750-b8e0-ade3579f67eb	9c5dce6d4875f6332cacf7463b5274add07688e63ce466bb55322ca48798db91	2026-01-19 01:28:48.504732+00	20251216110639_add_petugas_absensi_role	\N	\N	2026-01-19 01:28:48.501466+00	1
9ada774a-b659-4d47-91bf-a34b80fb9c46	750d3916e193e86a376975d2c2776442d2927c8c75e0e51903d350dd990c2f6b	2026-01-19 01:28:48.509652+00	20251216115114_add_magang_status	\N	\N	2026-01-19 01:28:48.505869+00	1
e25398e8-6832-472a-b626-5fd99fd156b8	8b0c125c9e6596cb9e1284407b263669b73ce9632cae5ae62bcf77135a2d8b2a	2026-01-19 01:28:48.696179+00	20251227144854	\N	\N	2026-01-19 01:28:48.688746+00	1
cb09239e-638b-4ff7-ba14-c99cfe21a447	da85a17d1e1e9d2f1e72621609dbf630c551db1a7cb10b87199cd81e646623ef	2026-01-19 01:28:48.520054+00	20251216115239_rename_magang_to_pkl	\N	\N	2026-01-19 01:28:48.510773+00	1
c770445f-a4e7-47d9-83b8-af4d419e978a	c709d568b3e9f35bfae33784143ab1dc0f924ed7188d7682fe83a2230a1ee496	2026-01-19 01:28:48.584003+00	20251217092251_remove_tingkat_kesulitan	\N	\N	2026-01-19 01:28:48.580422+00	1
18182f1f-3557-4cdc-89f9-17024d38f2a5	c8a78ac8421e0546ebf611754745d56f60ef00986d8fbaec0ea700f0b022c21e	2026-01-19 01:28:48.591245+00	20251217092712_add_guru_to_paket_soal	\N	\N	2026-01-19 01:28:48.584979+00	1
ae98c7eb-e7bf-45a3-abc2-e0ed829eae7b	609cb3817046359fc62b69f293e3903cd198aae0f3510bf462c59f9ad4035ff7	2025-12-30 07:52:56.215058+00	20251211102828_init	\N	\N	2025-12-30 07:52:56.208618+00	1
cda01471-7f24-4599-8f92-acc38af0d3cc	39e302b56339b64f0b94a36c409a5271427d4159a7bda50059e41db697152c50	2026-01-19 01:28:48.602575+00	20251217114742_add_multi_class_student_selection	\N	\N	2026-01-19 01:28:48.592393+00	1
161cae71-4e54-40f0-acb2-cae94983702f	dd18dc80c02140eb9c3d3521d8ec38d7b8cebdd8904ed44e14d9253313ecad58	2026-01-19 01:28:48.710834+00	20251228114822_remove_penjelasan_column	\N	\N	2026-01-19 01:28:48.69751+00	1
1eb5159d-ec64-49d9-be61-7983ccc5b063	1e2dc8a2aa1a8521d2ffe0b9e6dc3039cea60c545ec602bdfe0492285e12afd8	2026-01-19 01:28:48.609059+00	20251217120042_add_guru_to_ujian	\N	\N	2026-01-19 01:28:48.603659+00	1
4aea991f-eee6-458d-98ef-d3beb53d2d93	13a3242d9109504ea926faeb00a4c3f93cda8afda5d7ec30113037bd84791a4f	2026-01-19 01:28:48.77495+00	20260114124529_add_jenis_ujian	\N	\N	2026-01-19 01:28:48.770473+00	1
d687a301-669b-4e16-acd9-6827a6fe9dc9	08c45dbcc1c059307cbb748ed2abf7eb27633741c2f3d2848282546515b8643f	2026-01-19 01:28:48.729883+00	20251230062100_add_rpp_deep_learning	\N	\N	2026-01-19 01:28:48.712059+00	1
5e7e59c9-da7e-483c-b790-798606ecae12	421897ab0b79d60efa1cb5f781d0f940f44d4ebf634bc78a85dcbaf9c02eedef	2026-01-19 01:28:48.74129+00	20251230062917_update_rpp_to_official_format	\N	\N	2026-01-19 01:28:48.731198+00	1
8fdc794d-470e-44e8-9193-7f645ae15e34	0156d098f4db91ff3bbadcc1b79aadb5d97c09871b71938fd4dc6e53391a1532	2025-12-30 07:52:56.362528+00	20251216124905_add_settings_model	\N	\N	2025-12-30 07:52:56.356019+00	1
937e5050-a748-41af-9cdd-8bab986f91ba	2640bf707564a1056f78c31ab21927c3e2ba43ac93d47d3f1ef832ccced34bc8	2025-12-30 07:52:56.222546+00	20251211151758_npm_run_prisma_generate	\N	\N	2025-12-30 07:52:56.216567+00	1
2f6ccc03-1380-4fa9-ad5d-e6de2cd8eb5b	5b8743f95c9a28313f3d8506ae3b25f04bbd28dd335623fb3b67453e9da88f44	2026-01-19 01:28:48.787079+00	20260114125102_change_jenis_ujian_to_model	\N	\N	2026-01-19 01:28:48.776102+00	1
b76eef30-e5ee-433c-b6fc-2e84ab8e0a42	0c7e0d4e778e1cc415cbfd0b3fbe7fdc91ffeb05229bf7599a2ebb8ceb9ffb3e	2025-12-30 07:52:56.248765+00	20251212095857_add_lms_entities	\N	\N	2025-12-30 07:52:56.224249+00	1
2e73e6e2-53cf-4656-93da-c33ec025bb91	2ac05db6b9e035884dfd5167fdbea323d8a7c09303f3ecc01bff13ddfd33440d	2026-01-19 01:28:48.792293+00	20260118064520_add_original_filename_to_materi	\N	\N	2026-01-19 01:28:48.788308+00	1
c81da8c7-add8-453a-b20d-a1a181aa85d4	b43cc7d286cb1c9e4eed35a237d4805ddb2ad96144c39cfb102c2eae959a72e4	2025-12-30 07:52:56.516583+00	20251221112959_add_lms_features	\N	\N	2025-12-30 07:52:56.449159+00	1
7d3f37ec-67ff-4314-87f9-683574bc239d	750d8a254ceaaf152f260f65242d25249ecaaf9678faa3f041f061007f1ee44d	2025-12-30 07:52:56.261952+00	20251212112639_add_jurusan_and_update_kelas	\N	\N	2025-12-30 07:52:56.250322+00	1
ad1d39a2-a708-462f-9de6-fb46a9f59e65	8334127d9f47b107a04a7d4f45e7b1a9f28120a32076d8418b80a0fbdd0d7fd3	2025-12-30 07:52:56.370034+00	20251217022933_remove_semester_from_tahun_ajaran	\N	\N	2025-12-30 07:52:56.364081+00	1
338e1430-8098-4f7a-aa3f-1527b7890a67	998edaffc3e7e33bda76f385a440e3df4dbf0428564a2a15763cd5aa26535719	2025-12-30 07:52:56.273583+00	20251212122610_add_many_to_many_guru_mata_pelajaran	\N	\N	2025-12-30 07:52:56.263446+00	1
ba7053b6-fc5a-48ab-8d0a-9be18ea2a9dd	92f08fc24273bbcd87412a6494250a94461f6da2ba78cc5cc67527b74e451431	2025-12-30 07:52:56.283794+00	20251212125923_add_user_integration_to_siswa_guru	\N	\N	2025-12-30 07:52:56.275252+00	1
e2313e93-4441-4961-a123-a9baa31e28f9	2af40a7de13d912e0dc5428dfaad47807ad86bb19d9b998236759c7c6779f568	2025-12-30 07:52:56.291911+00	20251212145913_make_tahun_ajaran_required_in_kelas	\N	\N	2025-12-30 07:52:56.285428+00	1
9705efaa-3135-4b86-b602-c891c226877d	ca56657a42dc94fe3aa791065e17521b02eadc0abb8a196bd6d74998eaca7b18	2025-12-30 07:52:56.397274+00	20251217074227_remove_tingkat_kesulitan	\N	\N	2025-12-30 07:52:56.371914+00	1
b8c8f6c4-34de-4c52-8cc2-1803509ea8d5	90480c68541aad550a5a12bc2e8485029efc1fb1fa25a9940a1323042c4385e2	2025-12-30 07:52:56.300155+00	20251214051132	\N	\N	2025-12-30 07:52:56.293457+00	1
2ef88588-d725-43b7-a869-7507961bdb3c	f4eb6ab1a9e0366ad782133ad765d973cb1b2ab0a48a1f7e9034e305b6634ff0	2025-12-30 07:52:56.314444+00	20251214063132_refactor_tahun_ajaran_to_siswa	\N	\N	2025-12-30 07:52:56.301782+00	1
fa187df7-f8af-43b4-a07d-11c200ec16e6	25d03367cc79cdbff0ec8e1c2d3c33a3b806c75a4e4b1fecd1932f16e476b4e5	2025-12-30 07:52:56.331122+00	20251214084212_add_attendance_model	\N	\N	2025-12-30 07:52:56.316153+00	1
1d4fb474-9796-47b3-88af-1c93a5ae33ae	b49d31efb8891a0baa5b7c1c11b5468cc50c80552ec5a7b78852605d377c5bef	2025-12-30 07:52:56.412813+00	20251217091002_add_paket_soal	\N	\N	2025-12-30 07:52:56.398855+00	1
cf34a161-11cc-41a6-a1a3-9cdf7f86a53f	9c5dce6d4875f6332cacf7463b5274add07688e63ce466bb55322ca48798db91	2025-12-30 07:52:56.33742+00	20251216110639_add_petugas_absensi_role	\N	\N	2025-12-30 07:52:56.332689+00	1
827ca0a9-2a2c-4972-8ca4-d1168c2be6cb	750d3916e193e86a376975d2c2776442d2927c8c75e0e51903d350dd990c2f6b	2025-12-30 07:52:56.343455+00	20251216115114_add_magang_status	\N	\N	2025-12-30 07:52:56.338909+00	1
86b2ccb0-341c-4a2d-82dd-53334f652bb3	8b0c125c9e6596cb9e1284407b263669b73ce9632cae5ae62bcf77135a2d8b2a	2025-12-30 07:52:56.526185+00	20251227144854	\N	\N	2025-12-30 07:52:56.518331+00	1
e56934fa-c926-4522-9791-c5a87f0f06fa	da85a17d1e1e9d2f1e72621609dbf630c551db1a7cb10b87199cd81e646623ef	2025-12-30 07:52:56.354457+00	20251216115239_rename_magang_to_pkl	\N	\N	2025-12-30 07:52:56.345014+00	1
ee4a6955-a494-45c7-a582-1cc4f1907a24	c709d568b3e9f35bfae33784143ab1dc0f924ed7188d7682fe83a2230a1ee496	2025-12-30 07:52:56.419397+00	20251217092251_remove_tingkat_kesulitan	\N	\N	2025-12-30 07:52:56.41443+00	1
de80e5de-2804-4904-9fac-3b2ee66e3011	c8a78ac8421e0546ebf611754745d56f60ef00986d8fbaec0ea700f0b022c21e	2025-12-30 07:52:56.427589+00	20251217092712_add_guru_to_paket_soal	\N	\N	2025-12-30 07:52:56.420973+00	1
af25e687-6c4d-4858-89a9-4a96fffc2488	39e302b56339b64f0b94a36c409a5271427d4159a7bda50059e41db697152c50	2025-12-30 07:52:56.439114+00	20251217114742_add_multi_class_student_selection	\N	\N	2025-12-30 07:52:56.429106+00	1
6d675a3c-690c-4d8e-a57e-06c3d19e44ba	dd18dc80c02140eb9c3d3521d8ec38d7b8cebdd8904ed44e14d9253313ecad58	2025-12-30 07:52:56.539986+00	20251228114822_remove_penjelasan_column	\N	\N	2025-12-30 07:52:56.52764+00	1
22525396-ca63-48ff-b931-e5851d24325b	1e2dc8a2aa1a8521d2ffe0b9e6dc3039cea60c545ec602bdfe0492285e12afd8	2025-12-30 07:52:56.44731+00	20251217120042_add_guru_to_ujian	\N	\N	2025-12-30 07:52:56.440737+00	1
bd7530a8-7e2b-49eb-af45-409890a1a837	08c45dbcc1c059307cbb748ed2abf7eb27633741c2f3d2848282546515b8643f	2025-12-30 07:52:56.558558+00	20251230062100_add_rpp_deep_learning	\N	\N	2025-12-30 07:52:56.541599+00	1
6c137ca6-d349-493c-90a6-7e5d05401118	421897ab0b79d60efa1cb5f781d0f940f44d4ebf634bc78a85dcbaf9c02eedef	2025-12-30 07:52:56.570641+00	20251230062917_update_rpp_to_official_format	\N	\N	2025-12-30 07:52:56.560248+00	1
\.


--
-- Name: AbsensiKelasDetail AbsensiKelasDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelasDetail"
    ADD CONSTRAINT "AbsensiKelasDetail_pkey" PRIMARY KEY (id);


--
-- Name: AbsensiKelas AbsensiKelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelas"
    ADD CONSTRAINT "AbsensiKelas_pkey" PRIMARY KEY (id);


--
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY (id);


--
-- Name: BankSoal BankSoal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankSoal"
    ADD CONSTRAINT "BankSoal_pkey" PRIMARY KEY (id);


--
-- Name: ForumKategori ForumKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumKategori"
    ADD CONSTRAINT "ForumKategori_pkey" PRIMARY KEY (id);


--
-- Name: ForumPost ForumPost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumPost"
    ADD CONSTRAINT "ForumPost_pkey" PRIMARY KEY (id);


--
-- Name: ForumReaction ForumReaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumReaction"
    ADD CONSTRAINT "ForumReaction_pkey" PRIMARY KEY (id);


--
-- Name: ForumThread ForumThread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumThread"
    ADD CONSTRAINT "ForumThread_pkey" PRIMARY KEY (id);


--
-- Name: Guru Guru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Guru"
    ADD CONSTRAINT "Guru_pkey" PRIMARY KEY (id);


--
-- Name: JadwalPelajaran JadwalPelajaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JadwalPelajaran"
    ADD CONSTRAINT "JadwalPelajaran_pkey" PRIMARY KEY (id);


--
-- Name: JenisUjian JenisUjian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JenisUjian"
    ADD CONSTRAINT "JenisUjian_pkey" PRIMARY KEY (id);


--
-- Name: JurnalMengajar JurnalMengajar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JurnalMengajar"
    ADD CONSTRAINT "JurnalMengajar_pkey" PRIMARY KEY (id);


--
-- Name: Jurusan Jurusan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Jurusan"
    ADD CONSTRAINT "Jurusan_pkey" PRIMARY KEY (id);


--
-- Name: Kelas Kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kelas"
    ADD CONSTRAINT "Kelas_pkey" PRIMARY KEY (id);


--
-- Name: MataPelajaran MataPelajaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MataPelajaran"
    ADD CONSTRAINT "MataPelajaran_pkey" PRIMARY KEY (id);


--
-- Name: MateriAttachment MateriAttachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MateriAttachment"
    ADD CONSTRAINT "MateriAttachment_pkey" PRIMARY KEY (id);


--
-- Name: MateriBookmark MateriBookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MateriBookmark"
    ADD CONSTRAINT "MateriBookmark_pkey" PRIMARY KEY (id);


--
-- Name: Materi Materi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materi"
    ADD CONSTRAINT "Materi_pkey" PRIMARY KEY (id);


--
-- Name: Notifikasi Notifikasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifikasi"
    ADD CONSTRAINT "Notifikasi_pkey" PRIMARY KEY (id);


--
-- Name: PaketSoalItem PaketSoalItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoalItem"
    ADD CONSTRAINT "PaketSoalItem_pkey" PRIMARY KEY (id);


--
-- Name: PaketSoalKelas PaketSoalKelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoalKelas"
    ADD CONSTRAINT "PaketSoalKelas_pkey" PRIMARY KEY (id);


--
-- Name: PaketSoal PaketSoal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoal"
    ADD CONSTRAINT "PaketSoal_pkey" PRIMARY KEY (id);


--
-- Name: Pengumuman Pengumuman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pengumuman"
    ADD CONSTRAINT "Pengumuman_pkey" PRIMARY KEY (id);


--
-- Name: ProgressSiswa ProgressSiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProgressSiswa"
    ADD CONSTRAINT "ProgressSiswa_pkey" PRIMARY KEY (id);


--
-- Name: RPPKelas RPPKelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RPPKelas"
    ADD CONSTRAINT "RPPKelas_pkey" PRIMARY KEY (id);


--
-- Name: RPP RPP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RPP"
    ADD CONSTRAINT "RPP_pkey" PRIMARY KEY (id);


--
-- Name: Settings Settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settings"
    ADD CONSTRAINT "Settings_pkey" PRIMARY KEY (id);


--
-- Name: SiswaKelasHistory SiswaKelasHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiswaKelasHistory"
    ADD CONSTRAINT "SiswaKelasHistory_pkey" PRIMARY KEY (id);


--
-- Name: Siswa Siswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siswa"
    ADD CONSTRAINT "Siswa_pkey" PRIMARY KEY (id);


--
-- Name: TahunAjaran TahunAjaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TahunAjaran"
    ADD CONSTRAINT "TahunAjaran_pkey" PRIMARY KEY (id);


--
-- Name: TugasAttachment TugasAttachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasAttachment"
    ADD CONSTRAINT "TugasAttachment_pkey" PRIMARY KEY (id);


--
-- Name: TugasSiswaFile TugasSiswaFile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasSiswaFile"
    ADD CONSTRAINT "TugasSiswaFile_pkey" PRIMARY KEY (id);


--
-- Name: TugasSiswa TugasSiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasSiswa"
    ADD CONSTRAINT "TugasSiswa_pkey" PRIMARY KEY (id);


--
-- Name: Tugas Tugas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tugas"
    ADD CONSTRAINT "Tugas_pkey" PRIMARY KEY (id);


--
-- Name: UjianKelas UjianKelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianKelas"
    ADD CONSTRAINT "UjianKelas_pkey" PRIMARY KEY (id);


--
-- Name: UjianSiswa UjianSiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianSiswa"
    ADD CONSTRAINT "UjianSiswa_pkey" PRIMARY KEY (id);


--
-- Name: UjianSoal UjianSoal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianSoal"
    ADD CONSTRAINT "UjianSoal_pkey" PRIMARY KEY (id);


--
-- Name: Ujian Ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _GuruMataPelajaran _GuruMataPelajaran_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_GuruMataPelajaran"
    ADD CONSTRAINT "_GuruMataPelajaran_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: AbsensiKelasDetail_absensiKelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AbsensiKelasDetail_absensiKelasId_idx" ON public."AbsensiKelasDetail" USING btree ("absensiKelasId");


--
-- Name: AbsensiKelasDetail_absensiKelasId_siswaId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "AbsensiKelasDetail_absensiKelasId_siswaId_key" ON public."AbsensiKelasDetail" USING btree ("absensiKelasId", "siswaId");


--
-- Name: AbsensiKelasDetail_siswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AbsensiKelasDetail_siswaId_idx" ON public."AbsensiKelasDetail" USING btree ("siswaId");


--
-- Name: AbsensiKelas_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AbsensiKelas_guruId_idx" ON public."AbsensiKelas" USING btree ("guruId");


--
-- Name: AbsensiKelas_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AbsensiKelas_kelasId_idx" ON public."AbsensiKelas" USING btree ("kelasId");


--
-- Name: AbsensiKelas_tanggal_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AbsensiKelas_tanggal_idx" ON public."AbsensiKelas" USING btree (tanggal);


--
-- Name: AbsensiKelas_tanggal_jadwalPelajaranId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "AbsensiKelas_tanggal_jadwalPelajaranId_key" ON public."AbsensiKelas" USING btree (tanggal, "jadwalPelajaranId");


--
-- Name: Attendance_siswaId_tanggal_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Attendance_siswaId_tanggal_idx" ON public."Attendance" USING btree ("siswaId", tanggal);


--
-- Name: Attendance_siswaId_tanggal_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Attendance_siswaId_tanggal_key" ON public."Attendance" USING btree ("siswaId", tanggal);


--
-- Name: Attendance_tanggal_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Attendance_tanggal_idx" ON public."Attendance" USING btree (tanggal);


--
-- Name: BankSoal_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BankSoal_guruId_idx" ON public."BankSoal" USING btree ("guruId");


--
-- Name: BankSoal_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BankSoal_kelasId_idx" ON public."BankSoal" USING btree ("kelasId");


--
-- Name: BankSoal_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "BankSoal_kode_key" ON public."BankSoal" USING btree (kode);


--
-- Name: BankSoal_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BankSoal_mataPelajaranId_idx" ON public."BankSoal" USING btree ("mataPelajaranId");


--
-- Name: ForumKategori_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumKategori_kelasId_idx" ON public."ForumKategori" USING btree ("kelasId");


--
-- Name: ForumKategori_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumKategori_mataPelajaranId_idx" ON public."ForumKategori" USING btree ("mataPelajaranId");


--
-- Name: ForumPost_authorId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumPost_authorId_idx" ON public."ForumPost" USING btree ("authorId");


--
-- Name: ForumPost_parentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumPost_parentId_idx" ON public."ForumPost" USING btree ("parentId");


--
-- Name: ForumPost_threadId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumPost_threadId_idx" ON public."ForumPost" USING btree ("threadId");


--
-- Name: ForumReaction_postId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumReaction_postId_idx" ON public."ForumReaction" USING btree ("postId");


--
-- Name: ForumReaction_postId_userId_tipe_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ForumReaction_postId_userId_tipe_key" ON public."ForumReaction" USING btree ("postId", "userId", tipe);


--
-- Name: ForumReaction_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumReaction_userId_idx" ON public."ForumReaction" USING btree ("userId");


--
-- Name: ForumThread_authorId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumThread_authorId_idx" ON public."ForumThread" USING btree ("authorId");


--
-- Name: ForumThread_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumThread_createdAt_idx" ON public."ForumThread" USING btree ("createdAt");


--
-- Name: ForumThread_kategoriId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ForumThread_kategoriId_idx" ON public."ForumThread" USING btree ("kategoriId");


--
-- Name: Guru_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Guru_email_key" ON public."Guru" USING btree (email);


--
-- Name: Guru_nip_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Guru_nip_key" ON public."Guru" USING btree (nip);


--
-- Name: Guru_userId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Guru_userId_key" ON public."Guru" USING btree ("userId");


--
-- Name: JadwalPelajaran_hari_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "JadwalPelajaran_hari_idx" ON public."JadwalPelajaran" USING btree (hari);


--
-- Name: JadwalPelajaran_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "JadwalPelajaran_kelasId_idx" ON public."JadwalPelajaran" USING btree ("kelasId");


--
-- Name: JenisUjian_aktif_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "JenisUjian_aktif_idx" ON public."JenisUjian" USING btree (aktif);


--
-- Name: JenisUjian_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "JenisUjian_kode_key" ON public."JenisUjian" USING btree (kode);


--
-- Name: JenisUjian_nama_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "JenisUjian_nama_key" ON public."JenisUjian" USING btree (nama);


--
-- Name: JenisUjian_urutan_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "JenisUjian_urutan_idx" ON public."JenisUjian" USING btree (urutan);


--
-- Name: JurnalMengajar_absensiKelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "JurnalMengajar_absensiKelasId_idx" ON public."JurnalMengajar" USING btree ("absensiKelasId");


--
-- Name: JurnalMengajar_absensiKelasId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "JurnalMengajar_absensiKelasId_key" ON public."JurnalMengajar" USING btree ("absensiKelasId");


--
-- Name: Jurusan_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Jurusan_kode_key" ON public."Jurusan" USING btree (kode);


--
-- Name: MataPelajaran_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MataPelajaran_kode_key" ON public."MataPelajaran" USING btree (kode);


--
-- Name: MateriAttachment_materiId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MateriAttachment_materiId_idx" ON public."MateriAttachment" USING btree ("materiId");


--
-- Name: MateriBookmark_materiId_siswaId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MateriBookmark_materiId_siswaId_key" ON public."MateriBookmark" USING btree ("materiId", "siswaId");


--
-- Name: MateriBookmark_siswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MateriBookmark_siswaId_idx" ON public."MateriBookmark" USING btree ("siswaId");


--
-- Name: Materi_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Materi_guruId_idx" ON public."Materi" USING btree ("guruId");


--
-- Name: Materi_isPublished_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Materi_isPublished_idx" ON public."Materi" USING btree ("isPublished");


--
-- Name: Materi_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Materi_kelasId_idx" ON public."Materi" USING btree ("kelasId");


--
-- Name: Materi_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Materi_mataPelajaranId_idx" ON public."Materi" USING btree ("mataPelajaranId");


--
-- Name: Notifikasi_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notifikasi_createdAt_idx" ON public."Notifikasi" USING btree ("createdAt");


--
-- Name: Notifikasi_isRead_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notifikasi_isRead_idx" ON public."Notifikasi" USING btree ("isRead");


--
-- Name: Notifikasi_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notifikasi_userId_idx" ON public."Notifikasi" USING btree ("userId");


--
-- Name: PaketSoalItem_paketSoalId_bankSoalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PaketSoalItem_paketSoalId_bankSoalId_key" ON public."PaketSoalItem" USING btree ("paketSoalId", "bankSoalId");


--
-- Name: PaketSoalItem_paketSoalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaketSoalItem_paketSoalId_idx" ON public."PaketSoalItem" USING btree ("paketSoalId");


--
-- Name: PaketSoalKelas_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaketSoalKelas_kelasId_idx" ON public."PaketSoalKelas" USING btree ("kelasId");


--
-- Name: PaketSoalKelas_paketSoalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaketSoalKelas_paketSoalId_idx" ON public."PaketSoalKelas" USING btree ("paketSoalId");


--
-- Name: PaketSoalKelas_paketSoalId_kelasId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PaketSoalKelas_paketSoalId_kelasId_key" ON public."PaketSoalKelas" USING btree ("paketSoalId", "kelasId");


--
-- Name: PaketSoal_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaketSoal_guruId_idx" ON public."PaketSoal" USING btree ("guruId");


--
-- Name: PaketSoal_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PaketSoal_kode_key" ON public."PaketSoal" USING btree (kode);


--
-- Name: PaketSoal_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaketSoal_mataPelajaranId_idx" ON public."PaketSoal" USING btree ("mataPelajaranId");


--
-- Name: ProgressSiswa_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProgressSiswa_mataPelajaranId_idx" ON public."ProgressSiswa" USING btree ("mataPelajaranId");


--
-- Name: ProgressSiswa_siswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProgressSiswa_siswaId_idx" ON public."ProgressSiswa" USING btree ("siswaId");


--
-- Name: ProgressSiswa_siswaId_mataPelajaranId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ProgressSiswa_siswaId_mataPelajaranId_key" ON public."ProgressSiswa" USING btree ("siswaId", "mataPelajaranId");


--
-- Name: RPPKelas_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RPPKelas_kelasId_idx" ON public."RPPKelas" USING btree ("kelasId");


--
-- Name: RPPKelas_rppId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RPPKelas_rppId_idx" ON public."RPPKelas" USING btree ("rppId");


--
-- Name: RPPKelas_rppId_kelasId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RPPKelas_rppId_kelasId_key" ON public."RPPKelas" USING btree ("rppId", "kelasId");


--
-- Name: RPP_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RPP_guruId_idx" ON public."RPP" USING btree ("guruId");


--
-- Name: RPP_isPublished_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RPP_isPublished_idx" ON public."RPP" USING btree ("isPublished");


--
-- Name: RPP_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RPP_kode_key" ON public."RPP" USING btree (kode);


--
-- Name: RPP_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RPP_mataPelajaranId_idx" ON public."RPP" USING btree ("mataPelajaranId");


--
-- Name: RPP_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RPP_status_idx" ON public."RPP" USING btree (status);


--
-- Name: Settings_key_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Settings_key_key" ON public."Settings" USING btree (key);


--
-- Name: SiswaKelasHistory_kelasId_tahunAjaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SiswaKelasHistory_kelasId_tahunAjaranId_idx" ON public."SiswaKelasHistory" USING btree ("kelasId", "tahunAjaranId");


--
-- Name: SiswaKelasHistory_siswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SiswaKelasHistory_siswaId_idx" ON public."SiswaKelasHistory" USING btree ("siswaId");


--
-- Name: Siswa_nisn_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Siswa_nisn_key" ON public."Siswa" USING btree (nisn);


--
-- Name: Siswa_userId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Siswa_userId_key" ON public."Siswa" USING btree ("userId");


--
-- Name: TahunAjaran_tahun_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TahunAjaran_tahun_key" ON public."TahunAjaran" USING btree (tahun);


--
-- Name: TugasAttachment_tugasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TugasAttachment_tugasId_idx" ON public."TugasAttachment" USING btree ("tugasId");


--
-- Name: TugasSiswaFile_tugasSiswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TugasSiswaFile_tugasSiswaId_idx" ON public."TugasSiswaFile" USING btree ("tugasSiswaId");


--
-- Name: TugasSiswa_siswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TugasSiswa_siswaId_idx" ON public."TugasSiswa" USING btree ("siswaId");


--
-- Name: TugasSiswa_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TugasSiswa_status_idx" ON public."TugasSiswa" USING btree (status);


--
-- Name: TugasSiswa_tugasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TugasSiswa_tugasId_idx" ON public."TugasSiswa" USING btree ("tugasId");


--
-- Name: TugasSiswa_tugasId_siswaId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TugasSiswa_tugasId_siswaId_key" ON public."TugasSiswa" USING btree ("tugasId", "siswaId");


--
-- Name: Tugas_deadline_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tugas_deadline_idx" ON public."Tugas" USING btree (deadline);


--
-- Name: Tugas_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tugas_guruId_idx" ON public."Tugas" USING btree ("guruId");


--
-- Name: Tugas_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tugas_kelasId_idx" ON public."Tugas" USING btree ("kelasId");


--
-- Name: Tugas_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tugas_mataPelajaranId_idx" ON public."Tugas" USING btree ("mataPelajaranId");


--
-- Name: UjianKelas_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UjianKelas_kelasId_idx" ON public."UjianKelas" USING btree ("kelasId");


--
-- Name: UjianKelas_ujianId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UjianKelas_ujianId_idx" ON public."UjianKelas" USING btree ("ujianId");


--
-- Name: UjianKelas_ujianId_kelasId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UjianKelas_ujianId_kelasId_key" ON public."UjianKelas" USING btree ("ujianId", "kelasId");


--
-- Name: UjianSiswa_siswaId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UjianSiswa_siswaId_idx" ON public."UjianSiswa" USING btree ("siswaId");


--
-- Name: UjianSiswa_tokenAkses_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UjianSiswa_tokenAkses_key" ON public."UjianSiswa" USING btree ("tokenAkses");


--
-- Name: UjianSiswa_ujianId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UjianSiswa_ujianId_idx" ON public."UjianSiswa" USING btree ("ujianId");


--
-- Name: UjianSiswa_ujianId_siswaId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UjianSiswa_ujianId_siswaId_key" ON public."UjianSiswa" USING btree ("ujianId", "siswaId");


--
-- Name: UjianSoal_ujianId_bankSoalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UjianSoal_ujianId_bankSoalId_key" ON public."UjianSoal" USING btree ("ujianId", "bankSoalId");


--
-- Name: UjianSoal_ujianId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UjianSoal_ujianId_idx" ON public."UjianSoal" USING btree ("ujianId");


--
-- Name: Ujian_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ujian_guruId_idx" ON public."Ujian" USING btree ("guruId");


--
-- Name: Ujian_jenisUjianId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ujian_jenisUjianId_idx" ON public."Ujian" USING btree ("jenisUjianId");


--
-- Name: Ujian_kelasId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ujian_kelasId_idx" ON public."Ujian" USING btree ("kelasId");


--
-- Name: Ujian_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Ujian_kode_key" ON public."Ujian" USING btree (kode);


--
-- Name: Ujian_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ujian_mataPelajaranId_idx" ON public."Ujian" USING btree ("mataPelajaranId");


--
-- Name: Ujian_tanggalMulai_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ujian_tanggalMulai_idx" ON public."Ujian" USING btree ("tanggalMulai");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: _GuruMataPelajaran_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_GuruMataPelajaran_B_index" ON public."_GuruMataPelajaran" USING btree ("B");


--
-- Name: AbsensiKelasDetail AbsensiKelasDetail_absensiKelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelasDetail"
    ADD CONSTRAINT "AbsensiKelasDetail_absensiKelasId_fkey" FOREIGN KEY ("absensiKelasId") REFERENCES public."AbsensiKelas"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: AbsensiKelasDetail AbsensiKelasDetail_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelasDetail"
    ADD CONSTRAINT "AbsensiKelasDetail_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: AbsensiKelas AbsensiKelas_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelas"
    ADD CONSTRAINT "AbsensiKelas_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: AbsensiKelas AbsensiKelas_jadwalPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelas"
    ADD CONSTRAINT "AbsensiKelas_jadwalPelajaranId_fkey" FOREIGN KEY ("jadwalPelajaranId") REFERENCES public."JadwalPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: AbsensiKelas AbsensiKelas_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelas"
    ADD CONSTRAINT "AbsensiKelas_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: AbsensiKelas AbsensiKelas_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelas"
    ADD CONSTRAINT "AbsensiKelas_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BankSoal BankSoal_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankSoal"
    ADD CONSTRAINT "BankSoal_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: BankSoal BankSoal_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankSoal"
    ADD CONSTRAINT "BankSoal_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: BankSoal BankSoal_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankSoal"
    ADD CONSTRAINT "BankSoal_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ForumKategori ForumKategori_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumKategori"
    ADD CONSTRAINT "ForumKategori_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ForumKategori ForumKategori_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumKategori"
    ADD CONSTRAINT "ForumKategori_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ForumPost ForumPost_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumPost"
    ADD CONSTRAINT "ForumPost_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."ForumPost"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ForumPost ForumPost_threadId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumPost"
    ADD CONSTRAINT "ForumPost_threadId_fkey" FOREIGN KEY ("threadId") REFERENCES public."ForumThread"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ForumReaction ForumReaction_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumReaction"
    ADD CONSTRAINT "ForumReaction_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."ForumPost"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ForumThread ForumThread_kategoriId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ForumThread"
    ADD CONSTRAINT "ForumThread_kategoriId_fkey" FOREIGN KEY ("kategoriId") REFERENCES public."ForumKategori"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Guru Guru_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Guru"
    ADD CONSTRAINT "Guru_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JadwalPelajaran JadwalPelajaran_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JadwalPelajaran"
    ADD CONSTRAINT "JadwalPelajaran_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: JadwalPelajaran JadwalPelajaran_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JadwalPelajaran"
    ADD CONSTRAINT "JadwalPelajaran_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: JadwalPelajaran JadwalPelajaran_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JadwalPelajaran"
    ADD CONSTRAINT "JadwalPelajaran_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: JurnalMengajar JurnalMengajar_absensiKelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."JurnalMengajar"
    ADD CONSTRAINT "JurnalMengajar_absensiKelasId_fkey" FOREIGN KEY ("absensiKelasId") REFERENCES public."AbsensiKelas"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kelas Kelas_jurusanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kelas"
    ADD CONSTRAINT "Kelas_jurusanId_fkey" FOREIGN KEY ("jurusanId") REFERENCES public."Jurusan"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Kelas Kelas_waliKelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kelas"
    ADD CONSTRAINT "Kelas_waliKelasId_fkey" FOREIGN KEY ("waliKelasId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: MateriAttachment MateriAttachment_materiId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MateriAttachment"
    ADD CONSTRAINT "MateriAttachment_materiId_fkey" FOREIGN KEY ("materiId") REFERENCES public."Materi"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MateriBookmark MateriBookmark_materiId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MateriBookmark"
    ADD CONSTRAINT "MateriBookmark_materiId_fkey" FOREIGN KEY ("materiId") REFERENCES public."Materi"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MateriBookmark MateriBookmark_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MateriBookmark"
    ADD CONSTRAINT "MateriBookmark_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Materi Materi_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materi"
    ADD CONSTRAINT "Materi_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Materi Materi_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materi"
    ADD CONSTRAINT "Materi_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Materi Materi_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materi"
    ADD CONSTRAINT "Materi_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PaketSoalItem PaketSoalItem_bankSoalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoalItem"
    ADD CONSTRAINT "PaketSoalItem_bankSoalId_fkey" FOREIGN KEY ("bankSoalId") REFERENCES public."BankSoal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaketSoalItem PaketSoalItem_paketSoalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoalItem"
    ADD CONSTRAINT "PaketSoalItem_paketSoalId_fkey" FOREIGN KEY ("paketSoalId") REFERENCES public."PaketSoal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaketSoalKelas PaketSoalKelas_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoalKelas"
    ADD CONSTRAINT "PaketSoalKelas_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaketSoalKelas PaketSoalKelas_paketSoalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoalKelas"
    ADD CONSTRAINT "PaketSoalKelas_paketSoalId_fkey" FOREIGN KEY ("paketSoalId") REFERENCES public."PaketSoal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaketSoal PaketSoal_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoal"
    ADD CONSTRAINT "PaketSoal_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaketSoal PaketSoal_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaketSoal"
    ADD CONSTRAINT "PaketSoal_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Pengumuman Pengumuman_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pengumuman"
    ADD CONSTRAINT "Pengumuman_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ProgressSiswa ProgressSiswa_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProgressSiswa"
    ADD CONSTRAINT "ProgressSiswa_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ProgressSiswa ProgressSiswa_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProgressSiswa"
    ADD CONSTRAINT "ProgressSiswa_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RPPKelas RPPKelas_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RPPKelas"
    ADD CONSTRAINT "RPPKelas_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RPPKelas RPPKelas_rppId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RPPKelas"
    ADD CONSTRAINT "RPPKelas_rppId_fkey" FOREIGN KEY ("rppId") REFERENCES public."RPP"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RPP RPP_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RPP"
    ADD CONSTRAINT "RPP_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RPP RPP_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RPP"
    ADD CONSTRAINT "RPP_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SiswaKelasHistory SiswaKelasHistory_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiswaKelasHistory"
    ADD CONSTRAINT "SiswaKelasHistory_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SiswaKelasHistory SiswaKelasHistory_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiswaKelasHistory"
    ADD CONSTRAINT "SiswaKelasHistory_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SiswaKelasHistory SiswaKelasHistory_tahunAjaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiswaKelasHistory"
    ADD CONSTRAINT "SiswaKelasHistory_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES public."TahunAjaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Siswa Siswa_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siswa"
    ADD CONSTRAINT "Siswa_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Siswa Siswa_tahunAjaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siswa"
    ADD CONSTRAINT "Siswa_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES public."TahunAjaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Siswa Siswa_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siswa"
    ADD CONSTRAINT "Siswa_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: TugasAttachment TugasAttachment_tugasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasAttachment"
    ADD CONSTRAINT "TugasAttachment_tugasId_fkey" FOREIGN KEY ("tugasId") REFERENCES public."Tugas"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TugasSiswaFile TugasSiswaFile_tugasSiswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasSiswaFile"
    ADD CONSTRAINT "TugasSiswaFile_tugasSiswaId_fkey" FOREIGN KEY ("tugasSiswaId") REFERENCES public."TugasSiswa"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TugasSiswa TugasSiswa_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasSiswa"
    ADD CONSTRAINT "TugasSiswa_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TugasSiswa TugasSiswa_tugasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TugasSiswa"
    ADD CONSTRAINT "TugasSiswa_tugasId_fkey" FOREIGN KEY ("tugasId") REFERENCES public."Tugas"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tugas Tugas_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tugas"
    ADD CONSTRAINT "Tugas_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Tugas Tugas_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tugas"
    ADD CONSTRAINT "Tugas_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tugas Tugas_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tugas"
    ADD CONSTRAINT "Tugas_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UjianKelas UjianKelas_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianKelas"
    ADD CONSTRAINT "UjianKelas_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UjianKelas UjianKelas_ujianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianKelas"
    ADD CONSTRAINT "UjianKelas_ujianId_fkey" FOREIGN KEY ("ujianId") REFERENCES public."Ujian"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UjianSiswa UjianSiswa_siswaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianSiswa"
    ADD CONSTRAINT "UjianSiswa_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES public."Siswa"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UjianSiswa UjianSiswa_ujianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianSiswa"
    ADD CONSTRAINT "UjianSiswa_ujianId_fkey" FOREIGN KEY ("ujianId") REFERENCES public."Ujian"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UjianSoal UjianSoal_bankSoalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianSoal"
    ADD CONSTRAINT "UjianSoal_bankSoalId_fkey" FOREIGN KEY ("bankSoalId") REFERENCES public."BankSoal"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UjianSoal UjianSoal_ujianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UjianSoal"
    ADD CONSTRAINT "UjianSoal_ujianId_fkey" FOREIGN KEY ("ujianId") REFERENCES public."Ujian"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Ujian Ujian_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Ujian Ujian_jenisUjianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_jenisUjianId_fkey" FOREIGN KEY ("jenisUjianId") REFERENCES public."JenisUjian"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Ujian Ujian_kelasId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES public."Kelas"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Ujian Ujian_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Ujian Ujian_paketSoalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_paketSoalId_fkey" FOREIGN KEY ("paketSoalId") REFERENCES public."PaketSoal"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: _GuruMataPelajaran _GuruMataPelajaran_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_GuruMataPelajaran"
    ADD CONSTRAINT "_GuruMataPelajaran_A_fkey" FOREIGN KEY ("A") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _GuruMataPelajaran _GuruMataPelajaran_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_GuruMataPelajaran"
    ADD CONSTRAINT "_GuruMataPelajaran_B_fkey" FOREIGN KEY ("B") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict hEFuwH2iSCutVjOVSTJmY3pDtGjNFdMHYuYxaGNzmQbQ4q7G1N2qXQSHzyOfw4P

