import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAbsensiKelasDto, UpdateAbsensiKelasDto } from './dto';
import { Hari } from '@prisma/client';
import { TahunAjaranService } from '../tahun-ajaran/tahun-ajaran.service';

@Injectable()
export class AbsensiKelasService {
    constructor(
        private prisma: PrismaService,
        private tahunAjaranService: TahunAjaranService,
    ) { }

    // Jakarta timezone offset in milliseconds (UTC+7)
    private readonly JAKARTA_OFFSET_MS = 7 * 60 * 60 * 1000;

    // Helper method to get current time adjusted to Jakarta timezone
    private getJakartaTime(): Date {
        const now = new Date();
        const jakartaTime = new Date(now.getTime() + this.JAKARTA_OFFSET_MS);
        return jakartaTime;
    }

    // Helper method to get today's date for Jakarta timezone
    private getTodayJakarta(): Date {
        const jakartaTime = this.getJakartaTime();
        const year = jakartaTime.getUTCFullYear();
        const month = jakartaTime.getUTCMonth();
        const day = jakartaTime.getUTCDate();
        // Use 18:00 UTC to survive offset
        const today = new Date(Date.UTC(year, month, day, 18, 0, 0, 0));
        return today;
    }

    // Get today's day name in Indonesia format matching Hari enum
    private getHariToday(): Hari {
        const jakartaTime = this.getJakartaTime();
        const dayIndex = jakartaTime.getUTCDay(); // 0=Sunday, 1=Monday, etc.
        const hariMap: { [key: number]: Hari } = {
            1: 'SENIN',
            2: 'SELASA',
            3: 'RABU',
            4: 'KAMIS',
            5: 'JUMAT',
            6: 'SABTU',
        };
        return hariMap[dayIndex] || 'SENIN';
    }

    // Get jadwal pelajaran for today with absensi status
    // Groups jadwal with same kelas+mapel+guru on same day into single entry (even if separated by break)
    async getMyJadwalToday(guruId: string) {
        const hari = this.getHariToday();
        const today = this.getTodayJakarta();

        // Get guru by userId first
        const guru = await this.prisma.guru.findUnique({
            where: { userId: guruId },
        });

        if (!guru) {
            throw new NotFoundException('Guru tidak ditemukan');
        }

        const jadwalList = await this.prisma.jadwalPelajaran.findMany({
            where: {
                guruId: guru.id,
                hari: hari,
            },
            include: {
                kelas: true,
                mataPelajaran: true,
                absensiKelas: {
                    where: {
                        tanggal: today,
                    },
                    include: {
                        jurnalMengajar: true,
                        _count: {
                            select: { detailAbsensi: true },
                        },
                    },
                },
            },
            orderBy: { jamMulai: 'asc' },
        });

        // Group jadwal by kelas + mataPelajaran (merge even if separated by break time)
        const groupedJadwal: any[] = [];
        for (const jadwal of jadwalList) {
            // Find existing group with same kelas and mapel
            const existingGroup = groupedJadwal.find(
                (g) => g.kelasId === jadwal.kelasId && g.mataPelajaranId === jadwal.mataPelajaranId
            );

            if (existingGroup) {
                // Merge: extend end time and add jadwalId to list
                existingGroup.jamSelesai = jadwal.jamSelesai;
                existingGroup.jadwalIds.push(jadwal.id);
                existingGroup.jumlahJP++;
                // Merge absensi status (if any of the jadwal has absensi, mark as filled)
                if (jadwal.absensiKelas.length > 0 && !existingGroup.absensi) {
                    const absensi = jadwal.absensiKelas[0];
                    existingGroup.absensi = {
                        id: absensi.id,
                        tanggal: absensi.tanggal,
                        jumlahSiswa: absensi._count.detailAbsensi,
                        hasJurnal: !!absensi.jurnalMengajar,
                    };
                    existingGroup.sudahAbsen = true;
                }
            } else {
                // Create new group
                const absensi = jadwal.absensiKelas[0] || null;
                groupedJadwal.push({
                    ...jadwal,
                    jadwalIds: [jadwal.id], // Array of jadwal IDs in this group
                    jumlahJP: 1,
                    absensi: absensi
                        ? {
                            id: absensi.id,
                            tanggal: absensi.tanggal,
                            jumlahSiswa: absensi._count.detailAbsensi,
                            hasJurnal: !!absensi.jurnalMengajar,
                        }
                        : null,
                    sudahAbsen: !!absensi,
                });
            }
        }

        return groupedJadwal;
    }


    // Get students for a specific jadwal (kelas)
    async getStudentsForJadwal(jadwalId: string) {
        const jadwal = await this.prisma.jadwalPelajaran.findUnique({
            where: { id: jadwalId },
            include: {
                kelas: {
                    include: {
                        siswa: {
                            where: {
                                deletedAt: null,
                                status: 'AKTIF',
                            },
                            orderBy: { nama: 'asc' },
                        },
                    },
                },
                mataPelajaran: true,
                guru: true,
            },
        });

        if (!jadwal) {
            throw new NotFoundException('Jadwal tidak ditemukan');
        }

        return {
            jadwal: {
                id: jadwal.id,
                hari: jadwal.hari,
                jamMulai: jadwal.jamMulai,
                jamSelesai: jadwal.jamSelesai,
                kelas: jadwal.kelas,
                mataPelajaran: jadwal.mataPelajaran,
                guru: jadwal.guru,
            },
            students: jadwal.kelas.siswa,
        };
    }

    // Create absensi kelas with detail and optional jurnal
    async create(dto: CreateAbsensiKelasDto, userId: string) {
        // Get guru by userId
        const guru = await this.prisma.guru.findUnique({
            where: { userId: userId },
        });

        if (!guru) {
            throw new NotFoundException('Guru tidak ditemukan');
        }

        // Get jadwal to extract kelasId and mataPelajaranId
        const jadwal = await this.prisma.jadwalPelajaran.findUnique({
            where: { id: dto.jadwalPelajaranId },
        });

        if (!jadwal) {
            throw new NotFoundException('Jadwal tidak ditemukan');
        }

        // Parse tanggal
        const [year, month, day] = dto.tanggal.split('-').map(Number);
        const tanggal = new Date(Date.UTC(year, month - 1, day, 18, 0, 0, 0));

        // Check if absensi already exists
        const existing = await this.prisma.absensiKelas.findUnique({
            where: {
                tanggal_jadwalPelajaranId: {
                    tanggal,
                    jadwalPelajaranId: dto.jadwalPelajaranId,
                },
            },
        });

        if (existing) {
            throw new BadRequestException('Absensi untuk jadwal ini sudah ada');
        }

        // Create absensi with details and optional jurnal using transaction
        const absensi = await this.prisma.$transaction(async (tx) => {
            // Auto-fetch active tahun ajaran
            const activeTahunAjaran = await this.tahunAjaranService.getActiveOrNull();

            // Create main absensi
            const newAbsensi = await tx.absensiKelas.create({
                data: {
                    tanggal,
                    jadwalPelajaranId: dto.jadwalPelajaranId,
                    guruId: guru.id,
                    kelasId: jadwal.kelasId,
                    mataPelajaranId: jadwal.mataPelajaranId,
                    tahunAjaranId: activeTahunAjaran?.id ?? null,
                    semester: activeTahunAjaran?.semester ?? null,
                },
            });

            // Create detail absensi for each siswa
            for (const detail of dto.detailAbsensi) {
                await tx.absensiKelasDetail.create({
                    data: {
                        absensiKelasId: newAbsensi.id,
                        siswaId: detail.siswaId,
                        status: detail.status,
                        keterangan: detail.keterangan,
                    },
                });
            }

            // Create jurnal if provided
            if (dto.jurnalMengajar) {
                await tx.jurnalMengajar.create({
                    data: {
                        absensiKelasId: newAbsensi.id,
                        materiPembelajaran: dto.jurnalMengajar.materiPembelajaran,
                        kegiatanPembelajaran: dto.jurnalMengajar.kegiatanPembelajaran,
                        catatan: dto.jurnalMengajar.catatan,
                    },
                });
            }

            return newAbsensi;
        });

        return this.findOne(absensi.id);
    }

    // Get absensi by ID with full details
    async findOne(id: string) {
        const absensi = await this.prisma.absensiKelas.findUnique({
            where: { id },
            include: {
                jadwalPelajaran: true,
                guru: true,
                kelas: true,
                mataPelajaran: true,
                detailAbsensi: {
                    include: {
                        siswa: true,
                    },
                    orderBy: {
                        siswa: { nama: 'asc' },
                    },
                },
                jurnalMengajar: true,
            },
        });

        if (!absensi) {
            throw new NotFoundException('Absensi tidak ditemukan');
        }

        return absensi;
    }

    // Get all absensi with filters
    async findAll(query: {
        guruId?: string;
        kelasId?: string;
        mataPelajaranId?: string;
        jadwalPelajaranId?: string;
        tahunAjaranId?: string;
        startDate?: string;
        endDate?: string;
    }) {
        const where: any = {};

        if (query.guruId) {
            // Get guru by userId
            const guru = await this.prisma.guru.findUnique({
                where: { userId: query.guruId },
            });
            if (guru) {
                where.guruId = guru.id;
            }
        }

        if (query.kelasId) {
            where.kelasId = query.kelasId;
        }

        if (query.mataPelajaranId) {
            where.mataPelajaranId = query.mataPelajaranId;
        }

        if (query.jadwalPelajaranId) {
            where.jadwalPelajaranId = query.jadwalPelajaranId;
        }

        if (query.tahunAjaranId) {
            where.tahunAjaranId = query.tahunAjaranId;
        }

        if (query.startDate || query.endDate) {
            where.tanggal = {};
            if (query.startDate) {
                const [year, month, day] = query.startDate.split('-').map(Number);
                where.tanggal.gte = new Date(Date.UTC(year, month - 1, day, 0, 0, 0, 0));
            }
            if (query.endDate) {
                const [year, month, day] = query.endDate.split('-').map(Number);
                where.tanggal.lte = new Date(Date.UTC(year, month - 1, day, 23, 59, 59, 999));
            }
        }

        const absensiList = await this.prisma.absensiKelas.findMany({
            where,
            include: {
                jadwalPelajaran: true,
                guru: true,
                kelas: true,
                mataPelajaran: true,
                jurnalMengajar: true,
                _count: {
                    select: { detailAbsensi: true },
                },
            },
            orderBy: { tanggal: 'desc' },
        });

        // Format tanggal to string
        return absensiList.map((a) => ({
            ...a,
            tanggal: this.formatDate(a.tanggal),
        }));
    }

    // Update absensi
    async update(id: string, dto: UpdateAbsensiKelasDto, userId: string) {
        const absensi = await this.prisma.absensiKelas.findUnique({
            where: { id },
            include: {
                guru: true,
            },
        });

        if (!absensi) {
            throw new NotFoundException('Absensi tidak ditemukan');
        }

        // Get guru by userId
        const guru = await this.prisma.guru.findUnique({
            where: { userId: userId },
        });

        if (!guru || absensi.guruId !== guru.id) {
            throw new BadRequestException('Anda tidak memiliki akses untuk mengubah absensi ini');
        }

        // Update using transaction
        await this.prisma.$transaction(async (tx) => {
            // Update detail absensi if provided
            if (dto.detailAbsensi) {
                // Delete old detail
                await tx.absensiKelasDetail.deleteMany({
                    where: { absensiKelasId: id },
                });

                // Create new detail
                for (const detail of dto.detailAbsensi) {
                    await tx.absensiKelasDetail.create({
                        data: {
                            absensiKelasId: id,
                            siswaId: detail.siswaId,
                            status: detail.status,
                            keterangan: detail.keterangan,
                        },
                    });
                }
            }

            // Update jurnal if provided
            if (dto.jurnalMengajar) {
                await tx.jurnalMengajar.upsert({
                    where: { absensiKelasId: id },
                    update: {
                        materiPembelajaran: dto.jurnalMengajar.materiPembelajaran,
                        kegiatanPembelajaran: dto.jurnalMengajar.kegiatanPembelajaran,
                        catatan: dto.jurnalMengajar.catatan,
                    },
                    create: {
                        absensiKelasId: id,
                        materiPembelajaran: dto.jurnalMengajar.materiPembelajaran,
                        kegiatanPembelajaran: dto.jurnalMengajar.kegiatanPembelajaran,
                        catatan: dto.jurnalMengajar.catatan,
                    },
                });
            }
        });

        return this.findOne(id);
    }

    // Get rekap absensi per siswa
    async getRekap(query: {
        kelasId?: string;
        mataPelajaranId?: string;
        startDate?: string;
        endDate?: string;
    }) {
        const where: any = {};

        if (query.kelasId) {
            where.kelasId = query.kelasId;
        }

        if (query.mataPelajaranId) {
            where.mataPelajaranId = query.mataPelajaranId;
        }

        if (query.startDate || query.endDate) {
            where.tanggal = {};
            if (query.startDate) {
                const [year, month, day] = query.startDate.split('-').map(Number);
                where.tanggal.gte = new Date(Date.UTC(year, month - 1, day, 0, 0, 0, 0));
            }
            if (query.endDate) {
                const [year, month, day] = query.endDate.split('-').map(Number);
                where.tanggal.lte = new Date(Date.UTC(year, month - 1, day, 23, 59, 59, 999));
            }
        }

        // Get all absensi details with the filter
        const details = await this.prisma.absensiKelasDetail.findMany({
            where: {
                absensiKelas: where,
            },
            include: {
                siswa: {
                    include: { kelas: true },
                },
                absensiKelas: {
                    include: {
                        mataPelajaran: true,
                    },
                },
            },
        });

        // Group by siswa
        const siswaMap = new Map<
            string,
            {
                siswa: any;
                hadir: number;
                izin: number;
                sakit: number;
                alpha: number;
                total: number;
            }
        >();

        for (const detail of details) {
            if (!siswaMap.has(detail.siswaId)) {
                siswaMap.set(detail.siswaId, {
                    siswa: detail.siswa,
                    hadir: 0,
                    izin: 0,
                    sakit: 0,
                    alpha: 0,
                    total: 0,
                });
            }

            const rec = siswaMap.get(detail.siswaId)!;
            rec.total++;
            switch (detail.status) {
                case 'HADIR':
                    rec.hadir++;
                    break;
                case 'IZIN':
                    rec.izin++;
                    break;
                case 'SAKIT':
                    rec.sakit++;
                    break;
                case 'ALPHA':
                    rec.alpha++;
                    break;
            }
        }

        return Array.from(siswaMap.values()).map((rec) => ({
            ...rec,
            persentaseHadir: rec.total > 0 ? ((rec.hadir / rec.total) * 100).toFixed(1) : '0',
        }));
    }

    private formatDate(date: Date): string {
        const d = new Date(date);
        const year = d.getUTCFullYear();
        const month = String(d.getUTCMonth() + 1).padStart(2, '0');
        const day = String(d.getUTCDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }
}
