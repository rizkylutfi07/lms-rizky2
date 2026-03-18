import {
    Controller,
    Get,
    Post,
    Put,
    Delete,
    Body,
    Param,
    Query,
    UseGuards,
} from '@nestjs/common';
import { TahunAjaranService } from './tahun-ajaran.service';
import { CreateTahunAjaranDto } from './dto/create-tahun-ajaran.dto';
import { UpdateTahunAjaranDto } from './dto/update-tahun-ajaran.dto';
import { QueryTahunAjaranDto } from './dto/query-tahun-ajaran.dto';
import { SetSemesterDto } from './dto/set-semester.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';
import { Role } from '@prisma/client';

@Controller('tahun-ajaran')
@UseGuards(JwtAuthGuard, RolesGuard)
export class TahunAjaranController {
    constructor(private readonly tahunAjaranService: TahunAjaranService) { }

    @Get()
    @Roles(Role.ADMIN)
    findAll(@Query() query: QueryTahunAjaranDto) {
        return this.tahunAjaranService.findAll(query);
    }

    @Get('active/current')
    // Accessible by all authenticated roles (ADMIN, GURU, SISWA, PETUGAS_ABSENSI)
    @Roles(Role.ADMIN, Role.GURU, Role.SISWA, Role.PETUGAS_ABSENSI)
    getActive() {
        return this.tahunAjaranService.getActive();
    }

    @Get(':id')
    @Roles(Role.ADMIN)
    findOne(@Param('id') id: string) {
        return this.tahunAjaranService.findOne(id);
    }

    @Post()
    @Roles(Role.ADMIN)
    create(@Body() createDto: CreateTahunAjaranDto) {
        return this.tahunAjaranService.create(createDto);
    }

    @Put(':id')
    @Roles(Role.ADMIN)
    update(@Param('id') id: string, @Body() updateDto: UpdateTahunAjaranDto) {
        return this.tahunAjaranService.update(id, updateDto);
    }

    @Delete(':id')
    @Roles(Role.ADMIN)
    remove(@Param('id') id: string) {
        return this.tahunAjaranService.remove(id);
    }

    @Post(':id/set-active')
    @Roles(Role.ADMIN)
    setActive(@Param('id') id: string, @Body() dto: SetSemesterDto) {
        return this.tahunAjaranService.setActive(id, dto.semester);
    }

    @Post(':id/set-semester')
    @Roles(Role.ADMIN)
    setSemester(@Param('id') id: string, @Body() dto: SetSemesterDto) {
        return this.tahunAjaranService.setSemester(id, dto.semester);
    }
}
