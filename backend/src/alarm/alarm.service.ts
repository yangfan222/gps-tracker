import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Alarm } from '../entities/alarm.entity';

@Injectable()
export class AlarmService {
  constructor(
    @InjectRepository(Alarm)
    private alarmRepo: Repository<Alarm>,
  ) {}

  async create(data: {
    deviceId: string; type: string; message?: string;
    latitude?: number; longitude?: number; address?: string;
  }) {
    const alarm = this.alarmRepo.create(data);
    return this.alarmRepo.save(alarm);
  }

  async getByDevice(deviceId: string, page = 1, limit = 20) {
    const [items, total] = await this.alarmRepo.findAndCount({
      where: { deviceId },
      order: { createdAt: 'DESC' },
      skip: (page - 1) * limit,
      take: limit,
    });
    return { items, total, page, limit };
  }

  async markAsRead(id: number) {
    await this.alarmRepo.update(id, { isRead: true });
    return { message: '已标记为已读' };
  }

  async getUnreadCount(deviceId: string) {
    const count = await this.alarmRepo.count({ where: { deviceId, isRead: false } });
    return { count };
  }
}
