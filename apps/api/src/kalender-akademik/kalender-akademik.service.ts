import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { TipeKalender } from '@prisma/client';

@Injectable()
export class KalenderAkademikService {
    constructor(private prisma: PrismaService) {}

    async create(data: {
        judul: string;
        deskripsi?: string;
        tanggalMulai: string;
        tanggalSelesai: string;
        tipe?: TipeKalender;
        warna?: string;
        isAllDay?: boolean;
    }) {
        return this.prisma.kalenderAkademik.create({
            data: {
                judul: data.judul,
                deskripsi: data.deskripsi,
                tanggalMulai: new Date(data.tanggalMulai),
                tanggalSelesai: new Date(data.tanggalSelesai),
                tipe: data.tipe ?? TipeKalender.LAINNYA,
                warna: data.warna ?? '#3b82f6',
                isAllDay: data.isAllDay ?? true,
            },
        });
    }

    async findAll(params?: { bulan?: number; tahun?: number }) {
        const where: any = {};

        if (params?.bulan && params?.tahun) {
            const startOfMonth = new Date(params.tahun, params.bulan - 1, 1);
            const endOfMonth = new Date(params.tahun, params.bulan, 0, 23, 59, 59);
            where.OR = [
                {
                    tanggalMulai: { gte: startOfMonth, lte: endOfMonth },
                },
                {
                    tanggalSelesai: { gte: startOfMonth, lte: endOfMonth },
                },
                {
                    tanggalMulai: { lte: startOfMonth },
                    tanggalSelesai: { gte: endOfMonth },
                },
            ];
        }

        return this.prisma.kalenderAkademik.findMany({
            where,
            orderBy: { tanggalMulai: 'asc' },
        });
    }

    async findOne(id: string) {
        return this.prisma.kalenderAkademik.findUnique({ where: { id } });
    }

    async update(
        id: string,
        data: {
            judul?: string;
            deskripsi?: string;
            tanggalMulai?: string;
            tanggalSelesai?: string;
            tipe?: TipeKalender;
            warna?: string;
            isAllDay?: boolean;
        },
    ) {
        return this.prisma.kalenderAkademik.update({
            where: { id },
            data: {
                ...data,
                tanggalMulai: data.tanggalMulai ? new Date(data.tanggalMulai) : undefined,
                tanggalSelesai: data.tanggalSelesai ? new Date(data.tanggalSelesai) : undefined,
            },
        });
    }

    async remove(id: string) {
        return this.prisma.kalenderAkademik.delete({ where: { id } });
    }
}
