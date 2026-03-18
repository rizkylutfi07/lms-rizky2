import { IsDateString, IsEnum, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export enum StatusTahunAjaran {
    AKTIF = 'AKTIF',
    SELESAI = 'SELESAI',
    AKAN_DATANG = 'AKAN_DATANG',
}

export enum Semester {
    GANJIL = 'GANJIL',
    GENAP = 'GENAP',
}

export class CreateTahunAjaranDto {
    @IsString()
    @IsNotEmpty()
    tahun: string; // e.g., "2024/2025"

    @IsDateString()
    tanggalMulai: string;

    @IsDateString()
    tanggalSelesai: string;

    @IsEnum(StatusTahunAjaran)
    status: StatusTahunAjaran;

    @IsEnum(Semester)
    @IsOptional()
    semester?: Semester; // Semester aktif (GANJIL/GENAP)
}
