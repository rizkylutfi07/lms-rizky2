import {
    Injectable,
    NotFoundException,
    BadRequestException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateTahunAjaranDto, Semester } from './dto/create-tahun-ajaran.dto';
import { UpdateTahunAjaranDto } from './dto/update-tahun-ajaran.dto';
import { QueryTahunAjaranDto } from './dto/query-tahun-ajaran.dto';

@Injectable()
export class TahunAjaranService {
    constructor(private readonly prisma: PrismaService) { }

    async findAll(query: QueryTahunAjaranDto) {
        const { page = 1, limit = 10, search, status } = query;
        const skip = (page - 1) * limit;

        const where: any = {
            deletedAt: null, // Only non-deleted records
        };

        if (search) {
            where.tahun = { contains: search, mode: 'insensitive' };
        }

        if (status) {
            where.status = status;
        }

        const [data, total] = await Promise.all([
            this.prisma.tahunAjaran.findMany({
                where,
                skip,
                take: limit,
                orderBy: { createdAt: 'desc' },
                include: {
                    _count: {
                        select: { siswa: true },
                    },
                },
            }),
            this.prisma.tahunAjaran.count({ where }),
        ]);

        return {
            data,
            meta: {
                total,
                page,
                limit,
                totalPages: Math.ceil(total / limit),
            },
        };
    }

    async findOne(id: string) {
        const tahunAjaran = await this.prisma.tahunAjaran.findFirst({
            where: { id, deletedAt: null },
            include: {
                _count: {
                    select: { siswa: true },
                },
            },
        });

        if (!tahunAjaran) {
            throw new NotFoundException(`Tahun Ajaran dengan ID ${id} tidak ditemukan`);
        }

        return tahunAjaran;
    }

    async create(dto: CreateTahunAjaranDto) {
        // Check if tahun already exists
        const exists = await this.prisma.tahunAjaran.findFirst({
            where: {
                tahun: dto.tahun,
                deletedAt: null,
            },
        });

        if (exists) {
            throw new BadRequestException(
                `Tahun Ajaran ${dto.tahun} sudah ada`,
            );
        }

        // If creating an AKTIF tahun ajaran, semester is required
        if (dto.status === 'AKTIF' && !dto.semester) {
            throw new BadRequestException('Semester wajib diisi saat mengaktifkan tahun ajaran');
        }

        return this.prisma.tahunAjaran.create({
            data: {
                tahun: dto.tahun,
                tanggalMulai: new Date(dto.tanggalMulai),
                tanggalSelesai: new Date(dto.tanggalSelesai),
                status: dto.status,
                semester: dto.semester ?? null,
            },
        });
    }

    async update(id: string, dto: UpdateTahunAjaranDto) {
        await this.findOne(id); // Check if exists

        const updateData: any = {};
        if (dto.tahun) updateData.tahun = dto.tahun;
        if (dto.tanggalMulai) updateData.tanggalMulai = new Date(dto.tanggalMulai);
        if (dto.tanggalSelesai) updateData.tanggalSelesai = new Date(dto.tanggalSelesai);
        if (dto.status) updateData.status = dto.status;
        if (dto.semester !== undefined) updateData.semester = dto.semester;

        return this.prisma.tahunAjaran.update({
            where: { id },
            data: updateData,
        });
    }

    async remove(id: string) {
        await this.findOne(id); // Check if exists

        // Soft delete
        await this.prisma.tahunAjaran.update({
            where: { id },
            data: { deletedAt: new Date() },
        });

        return { message: 'Tahun Ajaran berhasil dihapus' };
    }

    async getActive() {
        const activeTahunAjaran = await this.prisma.tahunAjaran.findFirst({
            where: {
                status: 'AKTIF',
                deletedAt: null,
            },
            include: {
                _count: {
                    select: { siswa: true },
                },
            },
        });

        if (!activeTahunAjaran) {
            throw new NotFoundException('Tidak ada Tahun Ajaran yang aktif');
        }

        return activeTahunAjaran;
    }

    async setActive(id: string, semester?: Semester) {
        // Verify tahun ajaran exists
        await this.findOne(id);

        // semester is required when activating
        if (!semester) {
            throw new BadRequestException('Semester wajib dipilih saat mengaktifkan tahun ajaran (GANJIL atau GENAP)');
        }

        // Deactivate all other tahun ajaran (set to SELESAI if they were AKTIF)
        await this.prisma.tahunAjaran.updateMany({
            where: {
                status: 'AKTIF',
                deletedAt: null,
                id: { not: id },
            },
            data: { status: 'SELESAI' },
        });

        // Set this one as active with the chosen semester
        const updated = await this.prisma.tahunAjaran.update({
            where: { id },
            data: { status: 'AKTIF', semester },
            include: {
                _count: {
                    select: { siswa: true },
                },
            },
        });

        return {
            message: `Tahun Ajaran ${updated.tahun} Semester ${updated.semester} berhasil diaktifkan`,
            data: updated,
        };
    }

    async setSemester(id: string, semester: Semester) {
        const tahunAjaran = await this.findOne(id);

        if (tahunAjaran.status !== 'AKTIF') {
            throw new BadRequestException('Hanya tahun ajaran yang aktif yang bisa diganti semesternya');
        }

        const updated = await this.prisma.tahunAjaran.update({
            where: { id },
            data: { semester },
            include: {
                _count: {
                    select: { siswa: true },
                },
            },
        });

        return {
            message: `Semester Tahun Ajaran ${updated.tahun} berhasil diubah ke ${semester}`,
            data: updated,
        };
    }

    async getActiveOrNull() {
        return this.prisma.tahunAjaran.findFirst({
            where: {
                status: 'AKTIF',
                deletedAt: null,
            },
        });
    }
}
