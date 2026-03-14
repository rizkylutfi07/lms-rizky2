import { IsString, IsNotEmpty, IsOptional, IsBoolean, IsInt } from 'class-validator';

export class CreateJenisUjianDto {
    @IsString()
    @IsNotEmpty()
    nama: string;

    @IsString()
    @IsOptional()
    kode?: string;

    @IsString()
    @IsOptional()
    deskripsi?: string;

    @IsBoolean()
    @IsOptional()
    aktif?: boolean = true;

    @IsInt()
    @IsOptional()
    urutan?: number = 0;
}
