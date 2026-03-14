import { IsString, IsOptional, IsInt, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class FilterKelompokSoalDto {
    @IsString()
    @IsOptional()
    search?: string;

    @IsString()
    @IsOptional()
    mataPelajaranId?: string;

    @IsString()
    @IsOptional()
    guruId?: string;

    @IsInt()
    @Min(1)
    @Type(() => Number)
    @IsOptional()
    page?: number = 1;

    @IsInt()
    @Min(1)
    @Type(() => Number)
    @IsOptional()
    limit?: number = 10;
}
