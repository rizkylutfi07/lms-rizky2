import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateKelompokSoalDto } from './dto/create-kelompok-soal.dto';
import { UpdateKelompokSoalDto } from './dto/update-kelompok-soal.dto';
import { FilterKelompokSoalDto } from './dto/filter-kelompok-soal.dto';

@Injectable()
export class KelompokSoalService {
    constructor(private prisma: PrismaService) { }

    async create(dto: CreateKelompokSoalDto) {
        return this.prisma.kelompokSoal.create({
            data: dto,
            include: { mataPelajaran: true, guru: true },
        });
    }

    async findAll(filter: FilterKelompokSoalDto) {
        const { search, mataPelajaranId, guruId, page = 1, limit = 10 } = filter;
        const skip = (page - 1) * limit;

        const where: any = {};

        if (search) {
            where.OR = [
                { judul: { contains: search, mode: 'insensitive' } },
                { wacana: { contains: search, mode: 'insensitive' } },
            ];
        }

        if (mataPelajaranId) {
            where.mataPelajaranId = mataPelajaranId;
        }

        if (guruId) {
            where.guruId = guruId;
        }

        const [data, total] = await Promise.all([
            this.prisma.kelompokSoal.findMany({
                where,
                skip,
                take: limit,
                include: {
                    mataPelajaran: true,
                    guru: true,
                    _count: { select: { bankSoal: true } },
                },
                orderBy: { createdAt: 'desc' },
            }),
            this.prisma.kelompokSoal.count({ where }),
        ]);

        return {
            data,
            meta: { total, page, limit, totalPages: Math.ceil(total / limit) },
        };
    }

    async findOne(id: string) {
        const item = await this.prisma.kelompokSoal.findUnique({
            where: { id },
            include: {
                mataPelajaran: true,
                guru: true,
                bankSoal: {
                    where: { deletedAt: null },
                    select: { id: true, kode: true, pertanyaan: true, tipe: true, bobot: true },
                },
            },
        });

        if (!item) {
            throw new NotFoundException('Kelompok soal tidak ditemukan');
        }

        return item;
    }

    async update(id: string, dto: UpdateKelompokSoalDto) {
        await this.findOne(id);
        return this.prisma.kelompokSoal.update({
            where: { id },
            data: dto,
            include: { mataPelajaran: true, guru: true },
        });
    }

    async remove(id: string) {
        await this.findOne(id);
        // Unlink bankSoal before deleting
        await this.prisma.bankSoal.updateMany({
            where: { kelompokSoalId: id },
            data: { kelompokSoalId: null },
        });
        return this.prisma.kelompokSoal.delete({ where: { id } });
    }
}
