import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Geofence } from '../entities/geofence.entity';

@Injectable()
export class GeofenceService {
  constructor(
    @InjectRepository(Geofence)
    private geofenceRepo: Repository<Geofence>,
  ) {}

  async create(deviceId: string, data: {
    name: string; type?: string; centerLat: number; centerLng: number;
    radius?: number; points?: string; entryAlarm?: boolean; exitAlarm?: boolean;
  }) {
    const geofence = this.geofenceRepo.create({ deviceId, ...data });
    return this.geofenceRepo.save(geofence);
  }

  async getByDevice(deviceId: string) {
    return this.geofenceRepo.find({ where: { deviceId } });
  }

  async update(id: number, data: Partial<Geofence>) {
    await this.geofenceRepo.update(id, data);
    return this.geofenceRepo.findOne({ where: { id } });
  }

  async remove(id: number) {
    const geofence = await this.geofenceRepo.findOne({ where: { id } });
    if (!geofence) throw new NotFoundException('围栏不存在');
    await this.geofenceRepo.remove(geofence);
    return { message: '围栏已删除' };
  }

  async checkGeofence(deviceId: string, lat: number, lng: number): Promise<Geofence[]> {
    const fences = await this.geofenceRepo.find({ where: { deviceId, enabled: true } });
    const triggered: Geofence[] = [];
    for (const fence of fences) {
      if (fence.type === 'circle') {
        const dist = this.getDistance(lat, lng, fence.centerLat, fence.centerLng);
        if (dist <= fence.radius) {
          triggered.push(fence);
        }
      }
    }
    return triggered;
  }

  private getDistance(lat1: number, lon1: number, lat2: number, lon2: number): number {
    const R = 6371000;
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
      Math.sin(dLon / 2) * Math.sin(dLon / 2);
    return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  }
}
