-- Insert default jenis ujian
INSERT INTO "JenisUjian" (id, nama, kode, deskripsi, aktif, urutan, "createdAt", "updatedAt")
VALUES 
    (gen_random_uuid(), 'Ulangan Harian', 'UH', 'Ulangan Harian untuk evaluasi materi per bab', true, 1, NOW(), NOW()),
    (gen_random_uuid(), 'Ujian Tengah Semester', 'UTS', 'Ujian Tengah Semester', true, 2, NOW(), NOW()),
    (gen_random_uuid(), 'Ujian Akhir Semester', 'UAS', 'Ujian Akhir Semester', true, 3, NOW(), NOW()),
    (gen_random_uuid(), 'Quiz', 'QUIZ', 'Kuis singkat untuk evaluasi cepat', true, 4, NOW(), NOW()),
    (gen_random_uuid(), 'Remidi', 'REMIDI', 'Ujian perbaikan nilai', true, 5, NOW(), NOW()),
    (gen_random_uuid(), 'Pengayaan', 'PENGAYAAN', 'Ujian pengayaan untuk siswa berprestasi', true, 6, NOW(), NOW()),
    (gen_random_uuid(), 'Ujian Sekolah', 'US', 'Ujian Sekolah', true, 7, NOW(), NOW()),
    (gen_random_uuid(), 'Lainnya', 'LAINNYA', 'Jenis ujian lainnya', true, 8, NOW(), NOW())
ON CONFLICT (nama) DO NOTHING;
