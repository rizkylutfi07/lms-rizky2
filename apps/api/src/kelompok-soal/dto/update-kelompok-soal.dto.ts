import { PartialType } from '@nestjs/mapped-types';
import { CreateKelompokSoalDto } from './create-kelompok-soal.dto';

export class UpdateKelompokSoalDto extends PartialType(CreateKelompokSoalDto) { }
