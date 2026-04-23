import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Between } from 'typeorm';
import { Location } from '../entities/location.entity';

@Injectable()
export class LocationService {
  constructor(
    @InjectRepository(Location)
    private locationRepo: Repository<Location>,
  ) {}

  async saveLocation(data: {
    deviceId: string; latitude: number; longitude: number;
    speed?: number; direction?: number; locationType?: string;
    address?: string; altitude?: number; satellites?: number;
  }) {
    const location = this.locationRepo.create(data);
    return this.locationRepo.save(location);
  }

  async getLatestLocation(deviceId: string) {
    return this.locationRepo.findOne({
      where: { deviceId },
      order: { createdAt: 'DESC' },
    });
  }

  async getLocationHistory(deviceId: string, startTime: Date, endTime: Date) {
    return this.locationRepo.find({
      where: {
        deviceId,
        createdAt: Between(startTime, endTime),
      },
      order: { createdAt: 'ASC' },
    });
  }

  async getDailyMileage(deviceId: string, date: string) {
    const start = new Date(date + 'T00:00:00');
    const end = new Date(date + 'T23:59:59');
    const locations = await this.locationRepo.find({
      where: { deviceId, createdAt: Between(start, end) },
      order: { createdAt: 'ASC' },
    });

    let totalDistance = 0;
    for (let i = 1; i < locations.length; i++) {
      totalDistance += this.calculateDistance(
        locations[i - 1].latitude, locations[i - 1].longitude,
        locations[i].latitude, locations[i].longitude,
      );
    }
    return { date, mileage: Math.round(totalDistance * 100) / 100 };
  }

  private calculateDistance(lat1: number, lon1: number, lat2: number, lon2: number): number {
    const R = 6371;
    const dLat = this.deg2rad(lat2 - lat1);
    const dLon = this.deg2rad(lon2 - lon1);
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) *
      Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }

  private deg2rad(deg: number): number {
    return deg * (Math.PI / 180);
  }
}
