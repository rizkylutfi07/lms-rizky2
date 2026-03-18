import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    UseGuards,
    Query,
} from '@nestjs/common';
import { KalenderAkademikService } from './kalender-akademik.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';
import { Role, TipeKalender } from '@prisma/client';

@Controller('kalender-akademik')
@UseGuards(JwtAuthGuard, RolesGuard)
export class KalenderAkademikController {
    constructor(private readonly kalenderAkademikService: KalenderAkademikService) {}

    @Post()
    @Roles(Role.ADMIN)
    create(
        @Body()
        body: {
            judul: string;
            deskripsi?: string;
            tanggalMulai: string;
            tanggalSelesai: string;
            tipe?: TipeKalender;
            warna?: string;
            isAllDay?: boolean;
        },
    ) {
        return this.kalenderAkademikService.create(body);
    }

    @Get()
    findAll(
        @Query('bulan') bulan?: string,
        @Query('tahun') tahun?: string,
    ) {
        return this.kalenderAkademikService.findAll({
            bulan: bulan ? parseInt(bulan) : undefined,
            tahun: tahun ? parseInt(tahun) : undefined,
        });
    }

    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.kalenderAkademikService.findOne(id);
    }

    @Patch(':id')
    @Roles(Role.ADMIN)
    update(
        @Param('id') id: string,
        @Body()
        body: {
            judul?: string;
            deskripsi?: string;
            tanggalMulai?: string;
            tanggalSelesai?: string;
            tipe?: TipeKalender;
            warna?: string;
            isAllDay?: boolean;
        },
    ) {
        return this.kalenderAkademikService.update(id, body);
    }

    @Delete(':id')
    @Roles(Role.ADMIN)
    remove(@Param('id') id: string) {
        return this.kalenderAkademikService.remove(id);
    }
}
