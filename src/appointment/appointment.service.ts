import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CreateAppointmentDto } from './dto/create-appointment.dto';

@Injectable()
export class AppointmentService {
  constructor(private prisma: PrismaService) {}

  create(id: number, createPatientDto: CreateAppointmentDto) {
    return this.prisma.appointment.create({
      data: {
        ...createPatientDto,
        patientId: id,
      },
    });
  }

  findAllByPatientId(id: number) {
    return this.prisma.appointment.findMany({
      where: {
        patientId: id,
      },
    });
  }
}
