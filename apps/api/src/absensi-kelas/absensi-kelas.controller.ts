import {
    Controller,
    Get,
    Post,
    Put,
    Body,
    Param,
    Query,
    UseGuards,
    Request,
} from '@nestjs/common';
import { AbsensiKelasService } from './absensi-kelas.service';
import { CreateAbsensiKelasDto, UpdateAbsensiKelasDto } from './dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';

@Controller('absensi-kelas')
@UseGuards(JwtAuthGuard, RolesGuard)
export class AbsensiKelasController {
    constructor(private readonly absensiKelasService: AbsensiKelasService) { }

    @Get('my-today')
    @Roles('GURU')
    async getMyJadwalToday(@Request() req: any) {
        return this.absensiKelasService.getMyJadwalToday(req.user.userId);
    }

    @Get('jadwal/:jadwalId/students')
    @Roles('GURU')
    async getStudentsForJadwal(@Param('jadwalId') jadwalId: string) {
        return this.absensiKelasService.getStudentsForJadwal(jadwalId);
    }

    @Get('rekap')
    @Roles('GURU', 'ADMIN')
    async getRekap(
        @Query('kelasId') kelasId?: string,
        @Query('mataPelajaranId') mataPelajaranId?: string,
        @Query('startDate') startDate?: string,
        @Query('endDate') endDate?: string,
    ) {
        return this.absensiKelasService.getRekap({
            kelasId,
            mataPelajaranId,
            startDate,
            endDate,
        });
    }

    @Get()
    @Roles('GURU', 'ADMIN')
    async findAll(
        @Request() req: any,
        @Query('kelasId') kelasId?: string,
        @Query('mataPelajaranId') mataPelajaranId?: string,
        @Query('jadwalId') jadwalId?: string,
        @Query('tahunAjaranId') tahunAjaranId?: string,
        @Query('startDate') startDate?: string,
        @Query('endDate') endDate?: string,
    ) {
        // For GURU, auto-filter to only their own
        const guruId = req.user.role === 'GURU' ? req.user.userId : undefined;
        return this.absensiKelasService.findAll({
            guruId,
            kelasId,
            mataPelajaranId,
            jadwalPelajaranId: jadwalId,
            tahunAjaranId,
            startDate,
            endDate,
        });
    }

    @Get(':id')
    @Roles('GURU', 'ADMIN')
    async findOne(@Param('id') id: string) {
        return this.absensiKelasService.findOne(id);
    }

    @Post()
    @Roles('GURU')
    async create(@Body() dto: CreateAbsensiKelasDto, @Request() req: any) {
        return this.absensiKelasService.create(dto, req.user.userId);
    }

    @Put(':id')
    @Roles('GURU')
    async update(
        @Param('id') id: string,
        @Body() dto: UpdateAbsensiKelasDto,
        @Request() req: any,
    ) {
        return this.absensiKelasService.update(id, dto, req.user.userId);
    }
}
