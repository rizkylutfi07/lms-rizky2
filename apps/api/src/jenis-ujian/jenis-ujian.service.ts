import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateJenisUjianDto } from './dto/create-jenis-ujian.dto';
import { UpdateJenisUjianDto } from './dto/update-jenis-ujian.dto';

@Injectable()
export class JenisUjianService {
    constructor(private prisma: PrismaService) { }

    async create(dto: CreateJenisUjianDto) {
        // Check if nama already exists
        const existing = await this.prisma.jenisUjian.findFirst({
            where: { nama: dto.nama, deletedAt: null },
        });

        if (existing) {
            throw new BadRequestException('Jenis ujian dengan nama ini sudah ada');
        }

        // Check if kode already exists (if provided)
        if (dto.kode) {
            const existingKode = await this.prisma.jenisUjian.findFirst({
                where: { kode: dto.kode, deletedAt: null },
            });

            if (existingKode) {
                throw new BadRequestException('Kode jenis ujian sudah digunakan');
            }
        }

        return this.prisma.jenisUjian.create({
            data: dto,
        });
    }

    async findAll() {
        return this.prisma.jenisUjian.findMany({
            where: { deletedAt: null },
            orderBy: [
                { urutan: 'asc' },
                { nama: 'asc' },
            ],
            include: {
                _count: {
                    select: { ujian: true },
                },
            },
        });
    }

    async findOne(id: string) {
        const jenisUjian = await this.prisma.jenisUjian.findUnique({
            where: { id },
            include: {
                _count: {
                    select: { ujian: true },
                },
            },
        });

        if (!jenisUjian || jenisUjian.deletedAt) {
            throw new NotFoundException('Jenis ujian tidak ditemukan');
        }

        return jenisUjian;
    }

    async update(id: string, dto: UpdateJenisUjianDto) {
        await this.findOne(id); // Check existence

        // Check if nama already exists (excluding current)
        if (dto.nama) {
            const existing = await this.prisma.jenisUjian.findFirst({
                where: {
                    nama: dto.nama,
                    id: { not: id },
                    deletedAt: null,
                },
            });

            if (existing) {
                throw new BadRequestException('Jenis ujian dengan nama ini sudah ada');
            }
        }

        // Check if kode already exists (excluding current)
        if (dto.kode) {
            const existingKode = await this.prisma.jenisUjian.findFirst({
                where: {
                    kode: dto.kode,
                    id: { not: id },
                    deletedAt: null,
                },
            });

            if (existingKode) {
                throw new BadRequestException('Kode jenis ujian sudah digunakan');
            }
        }

        return this.prisma.jenisUjian.update({
            where: { id },
            data: dto,
        });
    }

    async remove(id: string) {
        const jenisUjian = await this.findOne(id);

        // Check if used by any ujian
        const ujianCount = await this.prisma.ujian.count({
            where: { jenisUjianId: id, deletedAt: null },
        });

        if (ujianCount > 0) {
            throw new BadRequestException(
                `Tidak dapat menghapus. Jenis ujian ini digunakan oleh ${ujianCount} ujian`
            );
        }

        // Soft delete
        return this.prisma.jenisUjian.update({
            where: { id },
            data: { deletedAt: new Date() },
        });
    }

    async reorder(ids: string[]) {
        // Update urutan for each id
        const updates = ids.map((id, index) =>
            this.prisma.jenisUjian.update({
                where: { id },
                data: { urutan: index },
            })
        );

        await Promise.all(updates);
        return { message: 'Urutan berhasil diupdate' };
    }
}
