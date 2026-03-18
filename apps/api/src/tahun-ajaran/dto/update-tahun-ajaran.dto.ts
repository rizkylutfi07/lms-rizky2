import { IsDateString, IsEnum, IsOptional, IsString } from 'class-validator';
import { StatusTahunAjaran, Semester } from './create-tahun-ajaran.dto';

export class UpdateTahunAjaranDto {
    @IsString()
    @IsOptional()
    tahun?: string;

    @IsDateString()
    @IsOptional()
    tanggalMulai?: string;

    @IsDateString()
    @IsOptional()
    tanggalSelesai?: string;

    @IsEnum(StatusTahunAjaran)
    @IsOptional()
    status?: StatusTahunAjaran;

    @IsEnum(Semester)
    @IsOptional()
    semester?: Semester;
}
