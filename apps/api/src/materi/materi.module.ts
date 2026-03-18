import { Module } from '@nestjs/common';
import { MateriController } from './materi.controller';
import { MateriService } from './materi.service';
import { AiMateriService } from './ai-materi.service';
import { PrismaModule } from '../prisma/prisma.module';
import { TahunAjaranModule } from '../tahun-ajaran/tahun-ajaran.module';

@Module({
    imports: [PrismaModule, TahunAjaranModule],
    controllers: [MateriController],
    providers: [MateriService, AiMateriService],
    exports: [MateriService, AiMateriService],
})
export class MateriModule { }
