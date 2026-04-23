import { Controller, Get, Param, Query, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { LocationService } from './location.service';

@Controller('location')
@UseGuards(AuthGuard('jwt'))
export class LocationController {
  constructor(private locationService: LocationService) {}

  @Get(':deviceId/latest')
  getLatestLocation(@Param('deviceId') deviceId: string) {
    return this.locationService.getLatestLocation(deviceId);
  }

  @Get(':deviceId/history')
  getLocationHistory(
    @Param('deviceId') deviceId: string,
    @Query('startTime') startTime: string,
    @Query('endTime') endTime: string,
  ) {
    return this.locationService.getLocationHistory(
      deviceId, new Date(startTime), new Date(endTime),
    );
  }

  @Get(':deviceId/mileage')
  getDailyMileage(
    @Param('deviceId') deviceId: string,
    @Query('date') date: string,
  ) {
    return this.locationService.getDailyMileage(deviceId, date);
  }
}
