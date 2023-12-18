import { Injectable } from '@nestjs/common';
import { CreateStaffDto } from './dto/create-staff.dto';
import { UpdateStaffDto } from './dto/update-staff.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class StaffService {
  constructor(private prisma: PrismaService) {}
  create(createStaffDto: CreateStaffDto) {
    return this.prisma.staff.create({
      data: createStaffDto,
    });
  }

  findAll(type: 'Doctor' | 'Nurse') {
    let args = {};
    if (type) {
      args = {
        where: {
          type,
        },
      };
    }
    return this.prisma.staff.findMany(args);
  }

  findOne(id: number) {
    return this.prisma.staff.findUnique({
      where: {
        id,
      },
    });
  }

  update(id: number, updateStaffDto: UpdateStaffDto) {
    return this.prisma.staff.update({
      data: updateStaffDto,
      where: {
        id,
      },
    });
  }

  remove(id: number) {
    return this.prisma.staff.delete({
      where: {
        id,
      }
    });
  }
}
