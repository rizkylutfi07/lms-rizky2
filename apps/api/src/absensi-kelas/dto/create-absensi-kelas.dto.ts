import { IsString, IsArray, IsOptional, IsEnum, IsDateString, ValidateNested } from 'class-validator';
import { Type } from 'class-transformer';
import { AbsensiKelasStatus } from '@prisma/client';

export class AbsensiSiswaDto {
    @IsString()
    siswaId: string;

    @IsEnum(AbsensiKelasStatus)
    status: AbsensiKelasStatus;

    @IsString()
    @IsOptional()
    keterangan?: string;
}

export class JurnalMengajarDto {
    @IsString()
    materiPembelajaran: string;

    @IsString()
    kegiatanPembelajaran: string;

    @IsString()
    @IsOptional()
    catatan?: string;
}

export class CreateAbsensiKelasDto {
    @IsDateString()
    tanggal: string;

    @IsString()
    jadwalPelajaranId: string;

    @IsArray()
    @ValidateNested({ each: true })
    @Type(() => AbsensiSiswaDto)
    detailAbsensi: AbsensiSiswaDto[];

    @ValidateNested()
    @Type(() => JurnalMengajarDto)
    @IsOptional()
    jurnalMengajar?: JurnalMengajarDto;
}
