import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PatientsModule } from './patients/patients.module';
import { AppointmentService } from './appointment/appointment.service';
import { PrismaService } from './prisma.service';
import { StaffModule } from './staff/staff.module';

@Module({
  imports: [PatientsModule, StaffModule],
  controllers: [AppController],
  providers: [AppService, PrismaService, AppointmentService],
})
export class AppModule {
  constructor() {}
}
