import { Module } from '@nestjs/common';
import { MateriController } from './materi.controller';
import { MateriService } from './materi.service';
import { AiMateriService } from './ai-materi.service';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
    imports: [PrismaModule],
    controllers: [MateriController],
    providers: [MateriService, AiMateriService],
    exports: [MateriService, AiMateriService],
})
export class MateriModule { }
