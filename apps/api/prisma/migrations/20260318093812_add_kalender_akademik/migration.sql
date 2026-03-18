-- CreateEnum
CREATE TYPE "TipeKalender" AS ENUM ('LIBUR_NASIONAL', 'LIBUR_SEKOLAH', 'UJIAN', 'ULANGAN', 'KEGIATAN', 'RAPAT', 'LAINNYA');

-- CreateTable
CREATE TABLE "KalenderAkademik" (
    "id" TEXT NOT NULL,
    "judul" TEXT NOT NULL,
    "deskripsi" TEXT,
    "tanggalMulai" TIMESTAMP(3) NOT NULL,
    "tanggalSelesai" TIMESTAMP(3) NOT NULL,
    "tipe" "TipeKalender" NOT NULL DEFAULT 'LAINNYA',
    "warna" TEXT DEFAULT '#3b82f6',
    "isAllDay" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KalenderAkademik_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "KalenderAkademik_tanggalMulai_idx" ON "KalenderAkademik"("tanggalMulai");

-- CreateIndex
CREATE INDEX "KalenderAkademik_tanggalSelesai_idx" ON "KalenderAkademik"("tanggalSelesai");
