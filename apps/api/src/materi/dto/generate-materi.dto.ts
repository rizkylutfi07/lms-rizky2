import { IsString, IsOptional, IsEnum, IsNumber, Min } from 'class-validator';

export enum TipeMateri {
    DOKUMEN = 'DOKUMEN',
    VIDEO = 'VIDEO',
    LINK = 'LINK',
    GAMBAR = 'GAMBAR',
    TEKS = 'TEKS',
}

export class GenerateMateriDto {
    @IsString()
    mataPelajaran: string;

    @IsString()
    topik: string;

    @IsString()
    tingkat: string;

    @IsEnum(TipeMateri)
    tipeMateri: TipeMateri;

    @IsOptional()
    @IsNumber()
    @Min(1)
    durasi?: number;

    @IsOptional()
    @IsString()
    targetAudience?: string;
}
