import { Module } from '@nestjs/common';
import { TugasController } from './tugas.controller';
import { TugasService } from './tugas.service';
import { PrismaModule } from '../prisma/prisma.module';
import { NotifikasiModule } from '../notifikasi/notifikasi.module';
import { TahunAjaranModule } from '../tahun-ajaran/tahun-ajaran.module';

@Module({
    imports: [PrismaModule, NotifikasiModule, TahunAjaranModule],
    controllers: [TugasController],
    providers: [TugasService],
    exports: [TugasService],
})
export class TugasModule { }
