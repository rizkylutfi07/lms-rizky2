import {
    Controller,
    Post,
    UseGuards,
    UseInterceptors,
    UploadedFile,
    BadRequestException,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';
import { Role } from '@prisma/client';
import { UploadService } from './upload.service';

@Controller('upload')
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles(Role.ADMIN, Role.GURU, Role.SISWA)
export class UploadController {
    constructor(private readonly uploadService: UploadService) {}

    @Post('image')
    @UseInterceptors(FileInterceptor('image', {
        limits: { fileSize: 5 * 1024 * 1024 }, // 5MB
        fileFilter: (_req, file, cb) => {
            if (!file.mimetype.startsWith('image/')) {
                return cb(new BadRequestException('Only image files are allowed'), false);
            }
            cb(null, true);
        },
    }))
    async uploadImage(@UploadedFile() file: Express.Multer.File) {
        if (!file) throw new BadRequestException('No image file provided');
        const url = await this.uploadService.saveImage(file.buffer, file.originalname, file.mimetype);
        return { url };
    }
}
