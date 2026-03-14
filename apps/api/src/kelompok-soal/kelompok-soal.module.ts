import { Module } from '@nestjs/common';
import { KelompokSoalService } from './kelompok-soal.service';
import { KelompokSoalController } from './kelompok-soal.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
    imports: [PrismaModule],
    controllers: [KelompokSoalController],
    providers: [KelompokSoalService],
    exports: [KelompokSoalService],
})
export class KelompokSoalModule { }
