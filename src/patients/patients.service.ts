import { Injectable } from '@nestjs/common';
import { CreatePatientDto } from './dto/create-patient.dto';
import { UpdatePatientDto } from './dto/update-patient.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class PatientsService {
  constructor(private prisma: PrismaService) {}
  create(createPatientDto: CreatePatientDto) {
    return this.prisma.patient.create({
      data: createPatientDto,
    });
  }

  findAll() {
    return `This action returns all patients`;
  }

  findOne(id: number) {
    return this.prisma.patient.findUnique({
      where: {
        id,
      },
    });
  }

  update(id: number, updatePatientDto: UpdatePatientDto) {
    return this.prisma.patient.update({
      data: updatePatientDto,
      where: {
        id,
      },
    });
  }

  remove(id: number) {
    return `This action removes a #${id} patient`;
  }
}
