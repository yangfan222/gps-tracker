import { Controller, Get, Param, Query, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { LocationService } from '../location/location.service';

@Controller('track')
@UseGuards(AuthGuard('jwt'))
export class TrackController {
  constructor(private locationService: LocationService) {}

  @Get(':deviceId')
  getTrack(
    @Param('deviceId') deviceId: string,
    @Query('startTime') startTime: string,
    @Query('endTime') endTime: string,
  ) {
    return this.locationService.getLocationHistory(
      deviceId, new Date(startTime), new Date(endTime),
    );
  }
}
