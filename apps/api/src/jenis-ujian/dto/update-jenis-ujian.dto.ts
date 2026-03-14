import { PartialType } from '@nestjs/mapped-types';
import { CreateJenisUjianDto } from './create-jenis-ujian.dto';

export class UpdateJenisUjianDto extends PartialType(CreateJenisUjianDto) { }
