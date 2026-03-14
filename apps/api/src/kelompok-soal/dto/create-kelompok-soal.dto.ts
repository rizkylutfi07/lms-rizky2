import { IsString, IsOptional, IsNotEmpty } from 'class-validator';

export class CreateKelompokSoalDto {
    @IsString()
    @IsOptional()
    judul?: string;

    @IsString()
    @IsNotEmpty()
    wacana: string;

    @IsString()
    @IsOptional()
    mataPelajaranId?: string;

    @IsString()
    @IsOptional()
    guruId?: string;
}
