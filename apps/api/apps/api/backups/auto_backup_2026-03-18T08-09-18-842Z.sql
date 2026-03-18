--
-- PostgreSQL database dump
--

\restrict mjlR6YGO6lBVxPQd1sjr28gZeJNTTqUZudZ8Z4xgedTMh46fyavdrOyQeKImaBZ

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
ALTER TABLE IF EXISTS ONLY public."Ujian" DROP CONSTRAINT IF EXISTS "Ujian_tahunAjaranId_fkey";
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
ALTER TABLE IF EXISTS ONLY public."Tugas" DROP CONSTRAINT IF EXISTS "Tugas_tahunAjaranId_fkey";
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
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_tahunAjaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."Materi" DROP CONSTRAINT IF EXISTS "Materi_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."MateriBookmark" DROP CONSTRAINT IF EXISTS "MateriBookmark_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."MateriBookmark" DROP CONSTRAINT IF EXISTS "MateriBookmark_materiId_fkey";
ALTER TABLE IF EXISTS ONLY public."MateriAttachment" DROP CONSTRAINT IF EXISTS "MateriAttachment_materiId_fkey";
ALTER TABLE IF EXISTS ONLY public."KelompokSoal" DROP CONSTRAINT IF EXISTS "KelompokSoal_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."KelompokSoal" DROP CONSTRAINT IF EXISTS "KelompokSoal_guruId_fkey";
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
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_kelompokSoalId_fkey";
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."BankSoal" DROP CONSTRAINT IF EXISTS "BankSoal_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."Attendance" DROP CONSTRAINT IF EXISTS "Attendance_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_tahunAjaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_mataPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_kelasId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_jadwalPelajaranId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelas" DROP CONSTRAINT IF EXISTS "AbsensiKelas_guruId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelasDetail" DROP CONSTRAINT IF EXISTS "AbsensiKelasDetail_siswaId_fkey";
ALTER TABLE IF EXISTS ONLY public."AbsensiKelasDetail" DROP CONSTRAINT IF EXISTS "AbsensiKelasDetail_absensiKelasId_fkey";
DROP INDEX IF EXISTS public."_GuruMataPelajaran_B_index";
DROP INDEX IF EXISTS public."User_email_key";
DROP INDEX IF EXISTS public."Ujian_tanggalMulai_idx";
DROP INDEX IF EXISTS public."Ujian_tahunAjaranId_idx";
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
DROP INDEX IF EXISTS public."Tugas_tahunAjaranId_idx";
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
DROP INDEX IF EXISTS public."Materi_tahunAjaranId_idx";
DROP INDEX IF EXISTS public."Materi_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."Materi_kelasId_idx";
DROP INDEX IF EXISTS public."Materi_isPublished_idx";
DROP INDEX IF EXISTS public."Materi_guruId_idx";
DROP INDEX IF EXISTS public."MateriBookmark_siswaId_idx";
DROP INDEX IF EXISTS public."MateriBookmark_materiId_siswaId_key";
DROP INDEX IF EXISTS public."MateriAttachment_materiId_idx";
DROP INDEX IF EXISTS public."MataPelajaran_kode_key";
DROP INDEX IF EXISTS public."KelompokSoal_mataPelajaranId_idx";
DROP INDEX IF EXISTS public."KelompokSoal_guruId_idx";
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
DROP INDEX IF EXISTS public."BankSoal_kelompokSoalId_idx";
DROP INDEX IF EXISTS public."BankSoal_kelasId_idx";
DROP INDEX IF EXISTS public."BankSoal_guruId_idx";
DROP INDEX IF EXISTS public."Attendance_tanggal_idx";
DROP INDEX IF EXISTS public."Attendance_siswaId_tanggal_key";
DROP INDEX IF EXISTS public."Attendance_siswaId_tanggal_idx";
DROP INDEX IF EXISTS public."AbsensiKelas_tanggal_jadwalPelajaranId_key";
DROP INDEX IF EXISTS public."AbsensiKelas_tanggal_idx";
DROP INDEX IF EXISTS public."AbsensiKelas_tahunAjaranId_idx";
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
ALTER TABLE IF EXISTS ONLY public."KelompokSoal" DROP CONSTRAINT IF EXISTS "KelompokSoal_pkey";
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
DROP TABLE IF EXISTS public."KelompokSoal";
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
DROP TYPE IF EXISTS public."Semester";
DROP TYPE IF EXISTS public."Role";
DROP TYPE IF EXISTS public."Hari";
DROP TYPE IF EXISTS public."DimensiProfilLulusan";
DROP TYPE IF EXISTS public."AttendanceStatus";
DROP TYPE IF EXISTS public."AbsensiKelasStatus";
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


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
-- Name: Semester; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Semester" AS ENUM (
    'GANJIL',
    'GENAP'
);


ALTER TYPE public."Semester" OWNER TO postgres;

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
    "updatedAt" timestamp(3) without time zone NOT NULL,
    semester public."Semester",
    "tahunAjaranId" text
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
    "kelasId" text,
    "kelompokSoalId" text
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
-- Name: KelompokSoal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KelompokSoal" (
    id text NOT NULL,
    judul text,
    wacana text NOT NULL,
    "mataPelajaranId" text,
    "guruId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."KelompokSoal" OWNER TO postgres;

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
    "originalFileName" text,
    semester public."Semester",
    "tahunAjaranId" text
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
    "deletedAt" timestamp(3) without time zone,
    semester public."Semester"
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
    "deletedAt" timestamp(3) without time zone,
    semester public."Semester",
    "tahunAjaranId" text
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
    "jenisUjianId" text,
    semester public."Semester",
    "tahunAjaranId" text
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

COPY public."AbsensiKelas" (id, tanggal, "jadwalPelajaranId", "guruId", "kelasId", "mataPelajaranId", "createdAt", "updatedAt", semester, "tahunAjaranId") FROM stdin;
\.


--
-- Data for Name: AbsensiKelasDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AbsensiKelasDetail" (id, "absensiKelasId", "siswaId", status, keterangan, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Attendance" (id, "siswaId", tanggal, "jamMasuk", "jamKeluar", status, keterangan, "scanBy", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: BankSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BankSoal" (id, kode, pertanyaan, tipe, "mataPelajaranId", "pilihanJawaban", "jawabanBenar", bobot, "createdAt", "updatedAt", "deletedAt", "guruId", "kelasId", "kelompokSoalId") FROM stdin;
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
\.


--
-- Data for Name: JadwalPelajaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JadwalPelajaran" (id, hari, "jamMulai", "jamSelesai", "kelasId", "mataPelajaranId", "guruId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: JenisUjian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JenisUjian" (id, nama, kode, deskripsi, aktif, urutan, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: JurnalMengajar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."JurnalMengajar" (id, "absensiKelasId", "materiPembelajaran", "kegiatanPembelajaran", catatan, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Jurusan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Jurusan" (id, kode, nama, deskripsi, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: Kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kelas" (id, nama, tingkat, kapasitas, "createdAt", "updatedAt", "deletedAt", "waliKelasId", "jurusanId") FROM stdin;
\.


--
-- Data for Name: KelompokSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KelompokSoal" (id, judul, wacana, "mataPelajaranId", "guruId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MataPelajaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MataPelajaran" (id, kode, nama, "jamPelajaran", deskripsi, tingkat, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: Materi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Materi" (id, judul, deskripsi, tipe, konten, "mataPelajaranId", "guruId", "kelasId", "isPinned", "isPublished", "viewCount", "createdAt", "updatedAt", "deletedAt", "originalFileName", semester, "tahunAjaranId") FROM stdin;
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
\.


--
-- Data for Name: PaketSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaketSoal" (id, kode, nama, deskripsi, "mataPelajaranId", "totalSoal", "createdAt", "updatedAt", "deletedAt", "guruId") FROM stdin;
\.


--
-- Data for Name: PaketSoalItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaketSoalItem" (id, "paketSoalId", "bankSoalId", urutan, "createdAt") FROM stdin;
\.


--
-- Data for Name: PaketSoalKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaketSoalKelas" (id, "paketSoalId", "kelasId", "createdAt") FROM stdin;
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
\.


--
-- Data for Name: RPPKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RPPKelas" (id, "rppId", "kelasId", "createdAt") FROM stdin;
\.


--
-- Data for Name: Settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Settings" (id, key, value, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Siswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Siswa" (id, nisn, nama, "tanggalLahir", alamat, "nomorTelepon", email, status, "createdAt", "updatedAt", "deletedAt", "kelasId", "userId", "tahunAjaranId", agama) FROM stdin;
\.


--
-- Data for Name: SiswaKelasHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SiswaKelasHistory" (id, "siswaId", "kelasId", "tahunAjaranId", "tanggalMulai", "tanggalSelesai", status, catatan, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TahunAjaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TahunAjaran" (id, tahun, "tanggalMulai", "tanggalSelesai", status, "createdAt", "updatedAt", "deletedAt", semester) FROM stdin;
6d5625b9-ba19-452d-87fb-2840702ed5ba	2024/2025	2024-07-01 00:00:00	2024-12-31 00:00:00	AKTIF	2026-03-18 08:08:47.881	2026-03-18 08:08:47.881	\N	\N
\.


--
-- Data for Name: Tugas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tugas" (id, judul, deskripsi, instruksi, "mataPelajaranId", "guruId", "kelasId", deadline, "maxScore", "tipePenilaian", "allowLateSubmit", "isPublished", "createdAt", "updatedAt", "deletedAt", semester, "tahunAjaranId") FROM stdin;
\.


--
-- Data for Name: TugasAttachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TugasAttachment" (id, "tugasId", "namaFile", "ukuranFile", "tipeFile", "urlFile", "createdAt") FROM stdin;
\.


--
-- Data for Name: TugasSiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TugasSiswa" (id, "tugasId", "siswaId", status, "submittedAt", "gradedAt", konten, score, feedback, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TugasSiswaFile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TugasSiswaFile" (id, "tugasSiswaId", "namaFile", "ukuranFile", "tipeFile", "urlFile", "createdAt") FROM stdin;
\.


--
-- Data for Name: Ujian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ujian" (id, kode, judul, deskripsi, "mataPelajaranId", "kelasId", durasi, "tanggalMulai", "tanggalSelesai", "nilaiMinimal", "acakSoal", "tampilkanNilai", status, "createdBy", "createdAt", "updatedAt", "deletedAt", "paketSoalId", "guruId", "deteksiKecurangan", "jenisUjianId", semester, "tahunAjaranId") FROM stdin;
\.


--
-- Data for Name: UjianKelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UjianKelas" (id, "ujianId", "kelasId", "createdAt") FROM stdin;
\.


--
-- Data for Name: UjianSiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UjianSiswa" (id, "ujianId", "siswaId", "tokenAkses", "waktuMulai", "waktuSelesai", durasi, status, "nilaiTotal", "isPassed", jawaban, "createdAt", "updatedAt", "manualGrades", "violationCount") FROM stdin;
\.


--
-- Data for Name: UjianSoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UjianSoal" (id, "ujianId", "bankSoalId", "nomorUrut", bobot, "createdAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, name, "createdAt", "updatedAt", password, role) FROM stdin;
\.


--
-- Data for Name: _GuruMataPelajaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_GuruMataPelajaran" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
10f8235e-aeec-4667-a4e3-2fea88d18da7	8253ad999e290887ee238475c1c7527411794b21d4f6b3473acc7a0b177087fb	2026-03-18 08:08:48.295803+00	20260108134155_add_absensi_kelas_and_jurnal_mengajar	\N	\N	2026-03-18 08:08:48.266383+00	1
a95d4743-06ff-4ee3-bdf9-16c24533b4da	73bce2da24cb3e565151c0fbdfb562ad0f38c4c56dd7525bb13815b3a565ee3e	2026-03-18 08:08:47.786757+00	20251211102828_init	\N	\N	2026-03-18 08:08:47.77749+00	1
d183e8eb-a08a-4c97-a0b2-31c4c4415d73	9202843d6cb86ff0f4049a7dfe6ae89bac3c4af9b80ae11daa2dcb10bcc10135	2026-03-18 08:08:47.982354+00	20251216124905_add_settings_model	\N	\N	2026-03-18 08:08:47.972347+00	1
be937b9d-6b86-4dad-b119-7776c98ddbc7	d95b1db85b88f71c2b1454aad44f03cb2a5c08a1b0175ad6c359423618b6006a	2026-03-18 08:08:47.795727+00	20251211151758_npm_run_prisma_generate	\N	\N	2026-03-18 08:08:47.788722+00	1
3f52339d-cf31-4cc5-981a-75a111ca096e	cbdbecc3360bab9c4882546aac36beb18127843150ef0a833be8038d128f17e5	2026-03-18 08:08:47.825667+00	20251212095857_add_lms_entities	\N	\N	2026-03-18 08:08:47.798012+00	1
68d7d2af-539d-4ed3-ba8b-bacf8ab529a2	01ca80e1bd5654d6f80e967cf6b09195a526d21bde40e0d440944275c5fb6b57	2026-03-18 08:08:48.190369+00	20251221112959_add_lms_features	\N	\N	2026-03-18 08:08:48.096713+00	1
3e2946f8-53c9-40cd-9334-2960d71116ed	e01c6e151ddca521002d9bcd565b0aa6f1e1542d70f151ff650c3d5c0ce88312	2026-03-18 08:08:47.844791+00	20251212112639_add_jurusan_and_update_kelas	\N	\N	2026-03-18 08:08:47.828188+00	1
07d42d60-9d7b-45d8-a062-96497c6b41a8	e6fe4fbb8f9bd4c6ce586b3ffa6d9f173dd50fc7d60108cc5ac467ef4f877703	2026-03-18 08:08:47.992514+00	20251217022933_remove_semester_from_tahun_ajaran	\N	\N	2026-03-18 08:08:47.984621+00	1
934821d7-fb5d-43dd-97a0-75ea0c6cd693	3b80192829c2511d28def5eff29e8863c8501f9eadb87a76a4268bbd715f37f0	2026-03-18 08:08:47.860911+00	20251212122610_add_many_to_many_guru_mata_pelajaran	\N	\N	2026-03-18 08:08:47.846989+00	1
56c219e8-8a67-43de-84e1-2dd43e888885	a38e79bdfd91babc8ab53bba4919ffb82b21990aca20b49e54846e01e87d1333	2026-03-18 08:08:47.873817+00	20251212125923_add_user_integration_to_siswa_guru	\N	\N	2026-03-18 08:08:47.863371+00	1
dc1e0d41-c147-46bf-860d-87ab9b1691b5	c6bc5694123d14c6c864372740fcfdd7f51e855e996e461a3f97d804c968f750	2026-03-18 08:08:47.885408+00	20251212145913_make_tahun_ajaran_required_in_kelas	\N	\N	2026-03-18 08:08:47.876206+00	1
12d1e1f6-6161-4fea-8dc6-9f15ca7efff9	4857f25f30c1d8863812a18d62f1b61ab0a3c3ee11b832f130ca3b682ad1075c	2026-03-18 08:08:48.028504+00	20251217074227_remove_tingkat_kesulitan	\N	\N	2026-03-18 08:08:47.994869+00	1
599e6386-f2b4-4815-82d4-aa27f484c4eb	a7a3344c5a64bcc4390c9565bcd57c43f94d9f04a0befc0beac14629ab9a7c47	2026-03-18 08:08:47.896704+00	20251214051132	\N	\N	2026-03-18 08:08:47.887785+00	1
fead4240-404d-43e0-a978-80aa474035a5	0e51032017049d11fdeff14e619bd9f49d1762f476abf67608f42e6f4d1a37c1	2026-03-18 08:08:47.915536+00	20251214063132_refactor_tahun_ajaran_to_siswa	\N	\N	2026-03-18 08:08:47.898698+00	1
c82ec350-0310-421a-baed-5d4bb285288a	03c68baa9218fa660eb7c575c1fba31a81a6ca2bc8b7e85fd7d3111eaa9096e4	2026-03-18 08:08:47.938225+00	20251214084212_add_attendance_model	\N	\N	2026-03-18 08:08:47.917577+00	1
500a6711-8852-4ad7-a65c-ae396ec5adde	1e7be7b515e21c97c079f242f2b1e05cf45ff62883ea82ceab9a69e872207f27	2026-03-18 08:08:48.050467+00	20251217091002_add_paket_soal	\N	\N	2026-03-18 08:08:48.03096+00	1
f4800745-7738-4790-85cf-e38fc597e42a	da7eada924d10dbd545ab730b45ec7835fd1e6138b8d95f3e04caf67221f1834	2026-03-18 08:08:47.94699+00	20251216110639_add_petugas_absensi_role	\N	\N	2026-03-18 08:08:47.940655+00	1
bdf2f25c-9221-4404-8a27-eb133a36e123	94e0a16a6374b7986c25879d0be3bbb5559adbb6dbbafbc2049041bb3fe13ac0	2026-03-18 08:08:47.955386+00	20251216115114_add_magang_status	\N	\N	2026-03-18 08:08:47.949085+00	1
99cd18b5-051c-4904-ba99-db288bbed244	c65922c381d39b7aa3dc1870d8aeb4e2d67cd8b0fe0ef9a9def920f8d2906597	2026-03-18 08:08:48.20367+00	20251227144854	\N	\N	2026-03-18 08:08:48.192714+00	1
4139e690-5592-47ec-8ef7-bb4a3f45f571	5702607ca9d82e3548c857dfc88e1b5c04371be9ee29d5133571677fac0ff59f	2026-03-18 08:08:47.970095+00	20251216115239_rename_magang_to_pkl	\N	\N	2026-03-18 08:08:47.95761+00	1
9c7c4419-127a-4a1e-9e1e-84ee4393de28	2d2e876c1d09314e7cb7bed50be51cc2443c3ff79204686ad80d5360c83b4501	2026-03-18 08:08:48.05912+00	20251217092251_remove_tingkat_kesulitan	\N	\N	2026-03-18 08:08:48.052558+00	1
55751d18-1645-4649-b832-862afa5e4d61	e908354aa78e518278a5c46aa63311c95489ff12017551e9b8edf943d64b11f7	2026-03-18 08:08:48.069844+00	20251217092712_add_guru_to_paket_soal	\N	\N	2026-03-18 08:08:48.061432+00	1
921b2084-ac3c-48a0-a47c-105e80e3bc10	ddd53f8fe62585a400d15183d5842e13b30e485b9ab83a6456ea5593a8d8567c	2026-03-18 08:08:48.084348+00	20251217114742_add_multi_class_student_selection	\N	\N	2026-03-18 08:08:48.071901+00	1
2c436cde-3de8-476a-b6dc-001c887e92d8	58769b18f3537f3a3a2d12ff8c588915d6255fa8a15a04a5b2e54063f83bd1c4	2026-03-18 08:08:48.222097+00	20251228114822_remove_penjelasan_column	\N	\N	2026-03-18 08:08:48.205768+00	1
213fe586-1227-42d6-b469-a033b61ec019	dc45ebe70c4ffafea826199570c1e5759050bcbbea28062e6192370dab87c670	2026-03-18 08:08:48.094391+00	20251217120042_add_guru_to_ujian	\N	\N	2026-03-18 08:08:48.086369+00	1
0b889352-3d8a-411f-9f4a-3f8d8e672182	f4f291ab06a63027600995d1b7edd238806dabcadf4622afa2600106fc813eb5	2026-03-18 08:08:48.305809+00	20260114124529_add_jenis_ujian	\N	\N	2026-03-18 08:08:48.298135+00	1
b7261eaf-84c0-480b-978b-9320789a90e5	09cbf7324b8db88ad7f9c30a66b746cee9e11967828533b685a4c9ed0cf2b111	2026-03-18 08:08:48.247665+00	20251230062100_add_rpp_deep_learning	\N	\N	2026-03-18 08:08:48.22442+00	1
9919b942-b65e-4bb9-9858-8837f15943c6	56890b201741ae6e2b536437afd9a5de2ccf1832c20b6393673e1149137e3262	2026-03-18 08:08:48.264186+00	20251230062917_update_rpp_to_official_format	\N	\N	2026-03-18 08:08:48.250044+00	1
06aebabd-9c89-49e9-b096-c9cced9c8dfc	4afcea7b69368e215caae8af35f770538f7d6e3ff8e180e4c60aad2265a39c9f	2026-03-18 08:08:48.340033+00	20260313021718_add_violation_count	\N	\N	2026-03-18 08:08:48.333323+00	1
5e211a38-1fd2-459a-a6a4-745b309f650e	fc3e2591603799ee1e8b57aecf61428b325a2ff167012db7fd813e0fb2966563	2026-03-18 08:08:48.322333+00	20260114125102_change_jenis_ujian_to_model	\N	\N	2026-03-18 08:08:48.307943+00	1
a10a676d-5347-4c01-b4ae-2676a09f8f10	9b33f745810f2ccba8f2a52c9faf887631e2426e3a32318426d2c0b630bd42bb	2026-03-18 08:08:48.376468+00	20260318071418_add_semester_tahun_ajaran	\N	\N	2026-03-18 08:08:48.358648+00	1
f81fd260-9c0e-4825-83e8-88bca6faa253	e867c3c061786afbaebd920b97345b00a9f93fb973d9f8dd81982b3aab0173da	2026-03-18 08:08:48.330883+00	20260118064520_add_original_filename_to_materi	\N	\N	2026-03-18 08:08:48.32456+00	1
e8b51015-5272-492f-93a8-701fbf0a5430	4bcf65fe6f4eeaa27a0659a70a0c5ebdbfd437a7fe4eef9f237389adc6602cee	2026-03-18 08:08:48.356666+00	20260314062618_add_kelompok_soal	\N	\N	2026-03-18 08:08:48.342309+00	1
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
-- Name: KelompokSoal KelompokSoal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KelompokSoal"
    ADD CONSTRAINT "KelompokSoal_pkey" PRIMARY KEY (id);


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
-- Name: AbsensiKelas_tahunAjaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AbsensiKelas_tahunAjaranId_idx" ON public."AbsensiKelas" USING btree ("tahunAjaranId");


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
-- Name: BankSoal_kelompokSoalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BankSoal_kelompokSoalId_idx" ON public."BankSoal" USING btree ("kelompokSoalId");


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
-- Name: KelompokSoal_guruId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KelompokSoal_guruId_idx" ON public."KelompokSoal" USING btree ("guruId");


--
-- Name: KelompokSoal_mataPelajaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KelompokSoal_mataPelajaranId_idx" ON public."KelompokSoal" USING btree ("mataPelajaranId");


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
-- Name: Materi_tahunAjaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Materi_tahunAjaranId_idx" ON public."Materi" USING btree ("tahunAjaranId");


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
-- Name: Tugas_tahunAjaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tugas_tahunAjaranId_idx" ON public."Tugas" USING btree ("tahunAjaranId");


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
-- Name: Ujian_tahunAjaranId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ujian_tahunAjaranId_idx" ON public."Ujian" USING btree ("tahunAjaranId");


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
-- Name: AbsensiKelas AbsensiKelas_tahunAjaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AbsensiKelas"
    ADD CONSTRAINT "AbsensiKelas_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES public."TahunAjaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: BankSoal BankSoal_kelompokSoalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankSoal"
    ADD CONSTRAINT "BankSoal_kelompokSoalId_fkey" FOREIGN KEY ("kelompokSoalId") REFERENCES public."KelompokSoal"(id) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: KelompokSoal KelompokSoal_guruId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KelompokSoal"
    ADD CONSTRAINT "KelompokSoal_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES public."Guru"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: KelompokSoal KelompokSoal_mataPelajaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KelompokSoal"
    ADD CONSTRAINT "KelompokSoal_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES public."MataPelajaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: Materi Materi_tahunAjaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materi"
    ADD CONSTRAINT "Materi_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES public."TahunAjaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: Tugas Tugas_tahunAjaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tugas"
    ADD CONSTRAINT "Tugas_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES public."TahunAjaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: Ujian Ujian_tahunAjaranId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ujian"
    ADD CONSTRAINT "Ujian_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES public."TahunAjaran"(id) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict mjlR6YGO6lBVxPQd1sjr28gZeJNTTqUZudZ8Z4xgedTMh46fyavdrOyQeKImaBZ

