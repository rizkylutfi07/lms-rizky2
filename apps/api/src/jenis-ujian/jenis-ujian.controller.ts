import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { JenisUjianService } from './jenis-ujian.service';
import { CreateJenisUjianDto } from './dto/create-jenis-ujian.dto';
import { UpdateJenisUjianDto } from './dto/update-jenis-ujian.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';

@Controller('jenis-ujian')
@UseGuards(JwtAuthGuard, RolesGuard)
export class JenisUjianController {
    constructor(private readonly jenisUjianService: JenisUjianService) { }

    @Post()
    @Roles('ADMIN')
    create(@Body() createJenisUjianDto: CreateJenisUjianDto) {
        return this.jenisUjianService.create(createJenisUjianDto);
    }

    @Get()
    findAll() {
        return this.jenisUjianService.findAll();
    }

    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.jenisUjianService.findOne(id);
    }

    @Patch(':id')
    @Roles('ADMIN')
    update(@Param('id') id: string, @Body() updateJenisUjianDto: UpdateJenisUjianDto) {
        return this.jenisUjianService.update(id, updateJenisUjianDto);
    }

    @Delete(':id')
    @Roles('ADMIN')
    remove(@Param('id') id: string) {
        return this.jenisUjianService.remove(id);
    }

    @Post('reorder')
    @Roles('ADMIN')
    reorder(@Body() body: { ids: string[] }) {
        return this.jenisUjianService.reorder(body.ids);
    }
}
