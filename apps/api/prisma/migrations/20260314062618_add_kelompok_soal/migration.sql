-- AlterTable
ALTER TABLE "BankSoal" ADD COLUMN     "kelompokSoalId" TEXT;

-- CreateTable
CREATE TABLE "KelompokSoal" (
    "id" TEXT NOT NULL,
    "judul" TEXT,
    "wacana" TEXT NOT NULL,
    "mataPelajaranId" TEXT,
    "guruId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KelompokSoal_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "KelompokSoal_mataPelajaranId_idx" ON "KelompokSoal"("mataPelajaranId");

-- CreateIndex
CREATE INDEX "KelompokSoal_guruId_idx" ON "KelompokSoal"("guruId");

-- CreateIndex
CREATE INDEX "BankSoal_kelompokSoalId_idx" ON "BankSoal"("kelompokSoalId");

-- AddForeignKey
ALTER TABLE "BankSoal" ADD CONSTRAINT "BankSoal_kelompokSoalId_fkey" FOREIGN KEY ("kelompokSoalId") REFERENCES "KelompokSoal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KelompokSoal" ADD CONSTRAINT "KelompokSoal_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES "MataPelajaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KelompokSoal" ADD CONSTRAINT "KelompokSoal_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES "Guru"("id") ON DELETE SET NULL ON UPDATE CASCADE;
