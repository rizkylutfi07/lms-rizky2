import { Module } from '@nestjs/common';
import { KalenderAkademikService } from './kalender-akademik.service';
import { KalenderAkademikController } from './kalender-akademik.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
    imports: [PrismaModule],
    controllers: [KalenderAkademikController],
    providers: [KalenderAkademikService],
    exports: [KalenderAkademikService],
})
export class KalenderAkademikModule {}
