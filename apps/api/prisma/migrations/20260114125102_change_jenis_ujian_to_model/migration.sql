/*
  Warnings:

  - You are about to drop the column `jenisUjian` on the `Ujian` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Ujian" DROP COLUMN "jenisUjian",
ADD COLUMN     "jenisUjianId" TEXT;

-- DropEnum
DROP TYPE "JenisUjian";

-- CreateTable
CREATE TABLE "JenisUjian" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "kode" TEXT,
    "deskripsi" TEXT,
    "aktif" BOOLEAN NOT NULL DEFAULT true,
    "urutan" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JenisUjian_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "JenisUjian_nama_key" ON "JenisUjian"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "JenisUjian_kode_key" ON "JenisUjian"("kode");

-- CreateIndex
CREATE INDEX "JenisUjian_aktif_idx" ON "JenisUjian"("aktif");

-- CreateIndex
CREATE INDEX "JenisUjian_urutan_idx" ON "JenisUjian"("urutan");

-- CreateIndex
CREATE INDEX "Ujian_jenisUjianId_idx" ON "Ujian"("jenisUjianId");

-- AddForeignKey
ALTER TABLE "Ujian" ADD CONSTRAINT "Ujian_jenisUjianId_fkey" FOREIGN KEY ("jenisUjianId") REFERENCES "JenisUjian"("id") ON DELETE SET NULL ON UPDATE CASCADE;
