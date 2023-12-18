import { Module } from '@nestjs/common';
import { PatientsService } from './patients.service';
import { PatientsController } from './patients.controller';
import { PrismaService } from '../prisma.service';
import { AppointmentService } from '../appointment/appointment.service';

@Module({
  controllers: [PatientsController],
  providers: [PatientsService, PrismaService, AppointmentService],
  exports: [PatientsService],
})
export class PatientsModule {}
