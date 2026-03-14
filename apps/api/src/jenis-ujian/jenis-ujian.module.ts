import { Module } from '@nestjs/common';
import { JenisUjianController } from './jenis-ujian.controller';
import { JenisUjianService } from './jenis-ujian.service';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
    imports: [PrismaModule],
    controllers: [JenisUjianController],
    providers: [JenisUjianService],
    exports: [JenisUjianService],
})
export class JenisUjianModule { }
