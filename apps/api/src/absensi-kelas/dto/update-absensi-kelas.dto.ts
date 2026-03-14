import { PartialType } from '@nestjs/mapped-types';
import { CreateAbsensiKelasDto } from './create-absensi-kelas.dto';

export class UpdateAbsensiKelasDto extends PartialType(CreateAbsensiKelasDto) { }
