import { IsEnum, IsNotEmpty } from 'class-validator';
import { Semester } from './create-tahun-ajaran.dto';

export class SetSemesterDto {
    @IsEnum(Semester)
    @IsNotEmpty()
    semester: Semester;
}
