import { Module } from '@nestjs/common';
import { AbsensiKelasController } from './absensi-kelas.controller';
import { AbsensiKelasService } from './absensi-kelas.service';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
    imports: [PrismaModule],
    controllers: [AbsensiKelasController],
    providers: [AbsensiKelasService],
    exports: [AbsensiKelasService],
})
export class AbsensiKelasModule { }
