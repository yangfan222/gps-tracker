import { Controller, Get, Param, Query, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Between } from 'typeorm';
import { Location } from '../entities/location.entity';

@Controller('report')
@UseGuards(AuthGuard('jwt'))
export class ReportController {
  constructor(
    @InjectRepository(Location)
    private locationRepo: Repository<Location>,
  ) {}

  @Get(':deviceId/driving')
  async getDrivingReport(
    @Param('deviceId') deviceId: string,
    @Query('startTime') startTime: string,
    @Query('endTime') endTime: string,
  ) {
    const locations = await this.locationRepo.find({
      where: { deviceId, createdAt: Between(new Date(startTime), new Date(endTime)) },
      order: { createdAt: 'ASC' },
    });
    return locations.map(l => ({
      time: l.createdAt,
      speed: l.speed,
      latitude: l.latitude,
      longitude: l.longitude,
    }));
  }

  @Get(':deviceId/parking')
  async getParkingReport(
    @Param('deviceId') deviceId: string,
    @Query('startTime') startTime: string,
    @Query('endTime') endTime: string,
  ) {
    const locations = await this.locationRepo.find({
      where: { deviceId, createdAt: Between(new Date(startTime), new Date(endTime)) },
      order: { createdAt: 'ASC' },
    });

    const parkingEvents: any[] = [];
    let parkStart: any = null;

    for (let i = 0; i < locations.length; i++) {
      if (locations[i].speed === 0 && !parkStart) {
        parkStart = locations[i];
      } else if (locations[i].speed > 0 && parkStart) {
        const duration = (new Date(locations[i].createdAt).getTime() - new Date(parkStart.createdAt).getTime()) / 60000;
        if (duration >= 5) {
          parkingEvents.push({
            startTime: parkStart.createdAt,
            endTime: locations[i].createdAt,
            duration: Math.round(duration),
            latitude: parkStart.latitude,
            longitude: parkStart.longitude,
            address: parkStart.address,
          });
        }
        parkStart = null;
      }
    }
    return parkingEvents;
  }

  @Get(':deviceId/mileage')
  async getDailyMileageReport(
    @Param('deviceId') deviceId: string,
    @Query('startDate') startDate: string,
    @Query('endDate') endDate: string,
  ) {
    const start = new Date(startDate);
    const end = new Date(endDate);
    const result: any[] = [];

    for (let d = new Date(start); d <= end; d.setDate(d.getDate() + 1)) {
      const dayStr = d.toISOString().split('T')[0];
      const dayStart = new Date(dayStr + 'T00:00:00');
      const dayEnd = new Date(dayStr + 'T23:59:59');

      const locations = await this.locationRepo.find({
        where: { deviceId, createdAt: Between(dayStart, dayEnd) },
        order: { createdAt: 'ASC' },
      });

      let mileage = 0;
      for (let i = 1; i < locations.length; i++) {
        mileage += this.calcDist(
          locations[i - 1].latitude, locations[i - 1].longitude,
          locations[i].latitude, locations[i].longitude,
        );
      }
      result.push({ date: dayStr, mileage: Math.round(mileage * 100) / 100 });
    }
    return result;
  }

  private calcDist(lat1: number, lon1: number, lat2: number, lon2: number): number {
    const R = 6371;
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat / 2) ** 2 +
      Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2) ** 2;
    return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  }
}
