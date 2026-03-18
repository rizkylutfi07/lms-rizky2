-- CreateEnum
CREATE TYPE "Semester" AS ENUM ('GANJIL', 'GENAP');

-- AlterTable
ALTER TABLE "AbsensiKelas" ADD COLUMN     "semester" "Semester",
ADD COLUMN     "tahunAjaranId" TEXT;

-- AlterTable
ALTER TABLE "Materi" ADD COLUMN     "semester" "Semester",
ADD COLUMN     "tahunAjaranId" TEXT;

-- AlterTable
ALTER TABLE "TahunAjaran" ADD COLUMN     "semester" "Semester";

-- AlterTable
ALTER TABLE "Tugas" ADD COLUMN     "semester" "Semester",
ADD COLUMN     "tahunAjaranId" TEXT;

-- AlterTable
ALTER TABLE "Ujian" ADD COLUMN     "semester" "Semester",
ADD COLUMN     "tahunAjaranId" TEXT;

-- CreateIndex
CREATE INDEX "AbsensiKelas_tahunAjaranId_idx" ON "AbsensiKelas"("tahunAjaranId");

-- CreateIndex
CREATE INDEX "Materi_tahunAjaranId_idx" ON "Materi"("tahunAjaranId");

-- CreateIndex
CREATE INDEX "Tugas_tahunAjaranId_idx" ON "Tugas"("tahunAjaranId");

-- CreateIndex
CREATE INDEX "Ujian_tahunAjaranId_idx" ON "Ujian"("tahunAjaranId");

-- AddForeignKey
ALTER TABLE "Ujian" ADD CONSTRAINT "Ujian_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES "TahunAjaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materi" ADD CONSTRAINT "Materi_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES "TahunAjaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tugas" ADD CONSTRAINT "Tugas_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES "TahunAjaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AbsensiKelas" ADD CONSTRAINT "AbsensiKelas_tahunAjaranId_fkey" FOREIGN KEY ("tahunAjaranId") REFERENCES "TahunAjaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;
