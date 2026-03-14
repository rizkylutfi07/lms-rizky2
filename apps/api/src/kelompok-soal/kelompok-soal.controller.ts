import {
    Controller, Get, Post, Body, Patch, Param, Delete, Query, UseGuards, Req,
} from '@nestjs/common';
import { KelompokSoalService } from './kelompok-soal.service';
import { CreateKelompokSoalDto } from './dto/create-kelompok-soal.dto';
import { UpdateKelompokSoalDto } from './dto/update-kelompok-soal.dto';
import { FilterKelompokSoalDto } from './dto/filter-kelompok-soal.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';
import { Role } from '@prisma/client';

@Controller('kelompok-soal')
@UseGuards(JwtAuthGuard, RolesGuard)
export class KelompokSoalController {
    constructor(private readonly kelompokSoalService: KelompokSoalService) { }

    @Post()
    @Roles(Role.ADMIN, Role.GURU)
    create(@Body() dto: CreateKelompokSoalDto, @Req() req: any) {
        // Auto-set guruId for GURU role
        if (req.user.role === Role.GURU && req.user.guruId) {
            dto.guruId = req.user.guruId;
        }
        return this.kelompokSoalService.create(dto);
    }

    @Get()
    @Roles(Role.ADMIN, Role.GURU)
    findAll(@Query() filter: FilterKelompokSoalDto, @Req() req: any) {
        if (req.user.role === Role.GURU && req.user.guruId) {
            filter.guruId = req.user.guruId;
        }
        return this.kelompokSoalService.findAll(filter);
    }

    @Get(':id')
    @Roles(Role.ADMIN, Role.GURU)
    findOne(@Param('id') id: string) {
        return this.kelompokSoalService.findOne(id);
    }

    @Patch(':id')
    @Roles(Role.ADMIN, Role.GURU)
    update(@Param('id') id: string, @Body() dto: UpdateKelompokSoalDto) {
        return this.kelompokSoalService.update(id, dto);
    }

    @Delete(':id')
    @Roles(Role.ADMIN, Role.GURU)
    remove(@Param('id') id: string) {
        return this.kelompokSoalService.remove(id);
    }
}
