import { Module } from '@nestjs/common';
import { AbsensiKelasController } from './absensi-kelas.controller';
import { AbsensiKelasService } from './absensi-kelas.service';
import { PrismaModule } from '../prisma/prisma.module';
import { TahunAjaranModule } from '../tahun-ajaran/tahun-ajaran.module';

@Module({
    imports: [PrismaModule, TahunAjaranModule],
    controllers: [AbsensiKelasController],
    providers: [AbsensiKelasService],
    exports: [AbsensiKelasService],
})
export class AbsensiKelasModule { }
