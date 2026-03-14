-- CreateEnum
CREATE TYPE "AbsensiKelasStatus" AS ENUM ('HADIR', 'IZIN', 'SAKIT', 'ALPHA');

-- CreateTable
CREATE TABLE "AbsensiKelas" (
    "id" TEXT NOT NULL,
    "tanggal" DATE NOT NULL,
    "jadwalPelajaranId" TEXT NOT NULL,
    "guruId" TEXT NOT NULL,
    "kelasId" TEXT NOT NULL,
    "mataPelajaranId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AbsensiKelas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AbsensiKelasDetail" (
    "id" TEXT NOT NULL,
    "absensiKelasId" TEXT NOT NULL,
    "siswaId" TEXT NOT NULL,
    "status" "AbsensiKelasStatus" NOT NULL DEFAULT 'HADIR',
    "keterangan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AbsensiKelasDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JurnalMengajar" (
    "id" TEXT NOT NULL,
    "absensiKelasId" TEXT NOT NULL,
    "materiPembelajaran" TEXT NOT NULL,
    "kegiatanPembelajaran" TEXT NOT NULL,
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JurnalMengajar_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "AbsensiKelas_guruId_idx" ON "AbsensiKelas"("guruId");

-- CreateIndex
CREATE INDEX "AbsensiKelas_kelasId_idx" ON "AbsensiKelas"("kelasId");

-- CreateIndex
CREATE INDEX "AbsensiKelas_tanggal_idx" ON "AbsensiKelas"("tanggal");

-- CreateIndex
CREATE UNIQUE INDEX "AbsensiKelas_tanggal_jadwalPelajaranId_key" ON "AbsensiKelas"("tanggal", "jadwalPelajaranId");

-- CreateIndex
CREATE INDEX "AbsensiKelasDetail_absensiKelasId_idx" ON "AbsensiKelasDetail"("absensiKelasId");

-- CreateIndex
CREATE INDEX "AbsensiKelasDetail_siswaId_idx" ON "AbsensiKelasDetail"("siswaId");

-- CreateIndex
CREATE UNIQUE INDEX "AbsensiKelasDetail_absensiKelasId_siswaId_key" ON "AbsensiKelasDetail"("absensiKelasId", "siswaId");

-- CreateIndex
CREATE UNIQUE INDEX "JurnalMengajar_absensiKelasId_key" ON "JurnalMengajar"("absensiKelasId");

-- CreateIndex
CREATE INDEX "JurnalMengajar_absensiKelasId_idx" ON "JurnalMengajar"("absensiKelasId");

-- AddForeignKey
ALTER TABLE "AbsensiKelas" ADD CONSTRAINT "AbsensiKelas_jadwalPelajaranId_fkey" FOREIGN KEY ("jadwalPelajaranId") REFERENCES "JadwalPelajaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AbsensiKelas" ADD CONSTRAINT "AbsensiKelas_guruId_fkey" FOREIGN KEY ("guruId") REFERENCES "Guru"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AbsensiKelas" ADD CONSTRAINT "AbsensiKelas_kelasId_fkey" FOREIGN KEY ("kelasId") REFERENCES "Kelas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AbsensiKelas" ADD CONSTRAINT "AbsensiKelas_mataPelajaranId_fkey" FOREIGN KEY ("mataPelajaranId") REFERENCES "MataPelajaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AbsensiKelasDetail" ADD CONSTRAINT "AbsensiKelasDetail_absensiKelasId_fkey" FOREIGN KEY ("absensiKelasId") REFERENCES "AbsensiKelas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AbsensiKelasDetail" ADD CONSTRAINT "AbsensiKelasDetail_siswaId_fkey" FOREIGN KEY ("siswaId") REFERENCES "Siswa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JurnalMengajar" ADD CONSTRAINT "JurnalMengajar_absensiKelasId_fkey" FOREIGN KEY ("absensiKelasId") REFERENCES "AbsensiKelas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
