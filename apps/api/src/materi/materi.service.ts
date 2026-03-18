import { Injectable, NotFoundException, ForbiddenException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateMateriDto, UpdateMateriDto } from './dto/materi.dto';
import { Prisma } from '@prisma/client';
import { TahunAjaranService } from '../tahun-ajaran/tahun-ajaran.service';

@Injectable()
export class MateriService {
    constructor(
        private readonly prisma: PrismaService,
        private readonly tahunAjaranService: TahunAjaranService,
    ) { }

    async create(guruId: string, createMateriDto: CreateMateriDto) {
        const activeTahunAjaran = await this.tahunAjaranService.getActiveOrNull();
        return this.prisma.materi.create({
            data: {
                ...createMateriDto,
                guruId,
                tahunAjaranId: activeTahunAjaran?.id ?? null,
                semester: activeTahunAjaran?.semester ?? null,
            },
            include: {
                mataPelajaran: true,
                guru: true,
                kelas: true,
                attachments: true,
            },
        });
    }

    async findAll(filters?: {
        mataPelajaranId?: string;
        kelasId?: string;
        guruId?: string;
        isPublished?: boolean;
        search?: string;
        tahunAjaranId?: string;
    }) {
        const where: any = {
            deletedAt: null,
        };

        if (filters?.mataPelajaranId) {
            where.mataPelajaranId = filters.mataPelajaranId;
        }

        if (filters?.kelasId) {
            where.kelasId = filters.kelasId;
        }

        if (filters?.guruId) {
            where.guruId = filters.guruId;
        }

        if (filters?.isPublished !== undefined) {
            where.isPublished = filters.isPublished;
        }

        if (filters?.tahunAjaranId) {
            where.tahunAjaranId = filters.tahunAjaranId;
        }

        if (filters?.search) {
            where.OR = [
                { judul: { contains: filters.search, mode: 'insensitive' } },
                { deskripsi: { contains: filters.search, mode: 'insensitive' } },
            ];
        }

        return this.prisma.materi.findMany({
            where,
            include: {
                mataPelajaran: { select: { id: true, nama: true, kode: true } },
                guru: { select: { id: true, nama: true } },
                kelas: { select: { id: true, nama: true } },
                attachments: true,
                _count: {
                    select: {
                        bookmarks: true,
                    },
                },
            },
            orderBy: [
                { isPinned: 'desc' },
                { createdAt: 'desc' },
            ],
        });
    }

    async findOne(id: string, incrementView: boolean = false, siswaId: string | null = null) {
        const materi = await this.prisma.materi.findUnique({
            where: { id, deletedAt: null },
            include: {
                mataPelajaran: true,
                guru: { 
                    select: { 
                        id: true, 
                        nama: true, 
                        email: true,
                        user: {
                            select: {
                                name: true,
                            }
                        }
                    } 
                },
                kelas: true,
                attachments: true,
                bookmarks: siswaId ? {
                    where: { siswaId },
                    select: { id: true }
                } : false,
                _count: {
                    select: {
                        bookmarks: true,
                    },
                },
            },
        });

        if (!materi) {
            throw new NotFoundException('Materi tidak ditemukan');
        }

        // Increment view count if requested
        if (incrementView) {
            await this.prisma.materi.update({
                where: { id },
                data: { viewCount: { increment: 1 } },
            });
        }

        // Add isBookmarked flag for siswa
        const result: any = { ...materi };
        if (siswaId && materi.bookmarks) {
            result.isBookmarked = (materi.bookmarks as any[]).length > 0;
            delete result.bookmarks; // Remove bookmarks array from response
        }

        return result;
    }

    async update(id: string, guruId: string | null, updateMateriDto: UpdateMateriDto, skipOwnershipCheck: boolean = false) {
        const materi = await this.prisma.materi.findUnique({
            where: { id, deletedAt: null },
        });

        if (!materi) {
            throw new NotFoundException('Materi tidak ditemukan');
        }

        // Check ownership (skip for ADMIN)
        if (!skipOwnershipCheck && guruId && materi.guruId !== guruId) {
            throw new ForbiddenException('Anda tidak memiliki akses untuk mengubah materi ini');
        }

        return this.prisma.materi.update({
            where: { id },
            data: updateMateriDto,
            include: {
                mataPelajaran: true,
                guru: true,
                kelas: true,
                attachments: true,
            },
        });
    }

    async remove(id: string, guruId: string | null, skipOwnershipCheck: boolean = false) {
        const materi = await this.findOne(id);

        // Check ownership (skip for ADMIN)
        if (!skipOwnershipCheck && guruId && materi.guruId !== guruId) {
            throw new ForbiddenException('Anda tidak memiliki akses untuk menghapus materi ini');
        }

        return this.prisma.materi.update({
            where: { id },
            data: { deletedAt: new Date() },
        });
    }

    // Bookmark operations
    async toggleBookmark(materiId: string, siswaId: string) {
        // Check if bookmark exists
        const existing = await this.prisma.materiBookmark.findUnique({
            where: {
                materiId_siswaId: {
                    materiId,
                    siswaId,
                },
            },
        });

        if (existing) {
            // Remove bookmark
            await this.prisma.materiBookmark.delete({
                where: { id: existing.id },
            });
            return { bookmarked: false };
        } else {
            // Add bookmark
            await this.prisma.materiBookmark.create({
                data: {
                    materiId,
                    siswaId,
                },
            });
            return { bookmarked: true };
        }
    }

    async getBookmarkedMateri(siswaId: string) {
        return this.prisma.materiBookmark.findMany({
            where: { siswaId },
            include: {
                materi: {
                    include: {
                        mataPelajaran: { select: { id: true, nama: true } },
                        guru: { select: { id: true, nama: true } },
                        attachments: true,
                    },
                },
            },
            orderBy: { createdAt: 'desc' },
        });
    }

    // File attachment operations
    async addAttachment(materiId: string, fileData: {
        namaFile: string;
        ukuranFile: number;
        tipeFile: string;
        urlFile: string;
    }) {
        return this.prisma.materiAttachment.create({
            data: {
                ...fileData,
                materiId,
            },
        });
    }

    async removeAttachment(attachmentId: string) {
        return this.prisma.materiAttachment.delete({
            where: { id: attachmentId },
        });
    }
}
