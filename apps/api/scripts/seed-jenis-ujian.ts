import { PrismaClient } from '@prisma/client';
import 'dotenv/config';

const prisma = new PrismaClient();

async function seedJenisUjian() {
    console.log('Seeding jenis ujian...');

    const jenisUjianData = [
        { nama: 'Ulangan Harian', kode: 'UH', deskripsi: 'Ulangan Harian untuk evaluasi materi per bab', urutan: 1 },
        { nama: 'Ujian Tengah Semester', kode: 'UTS', deskripsi: 'Ujian Tengah Semester', urutan: 2 },
        { nama: 'Ujian Akhir Semester', kode: 'UAS', deskripsi: 'Ujian Akhir Semester', urutan: 3 },
        { nama: 'Quiz', kode: 'QUIZ', deskripsi: 'Kuis singkat untuk evaluasi cepat', urutan: 4 },
        { nama: 'Remidi', kode: 'REMIDI', deskripsi: 'Ujian perbaikan nilai', urutan: 5 },
        { nama: 'Pengayaan', kode: 'PENGAYAAN', deskripsi: 'Ujian pengayaan untuk siswa berprestasi', urutan: 6 },
        { nama: 'Ujian Sekolah', kode: 'US', deskripsi: 'Ujian Sekolah', urutan: 7 },
        { nama: 'Lainnya', kode: 'LAINNYA', deskripsi: 'Jenis ujian lainnya', urutan: 8 },
    ];

    for (const data of jenisUjianData) {
        await prisma.jenisUjian.upsert({
            where: { nama: data.nama },
            update: {},
            create: data,
        });
    }

    console.log('Jenis ujian seeded successfully!');
}

seedJenisUjian()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
