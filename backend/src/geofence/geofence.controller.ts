import { Controller, Get, Post, Put, Delete, Body, Param, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { GeofenceService } from './geofence.service';

@Controller('geofence')
@UseGuards(AuthGuard('jwt'))
export class GeofenceController {
  constructor(private geofenceService: GeofenceService) {}

  @Post(':deviceId')
  create(
    @Param('deviceId') deviceId: string,
    @Body() body: { name: string; type?: string; centerLat: number; centerLng: number; radius?: number; entryAlarm?: boolean; exitAlarm?: boolean },
  ) {
    return this.geofenceService.create(deviceId, body);
  }

  @Get(':deviceId')
  getByDevice(@Param('deviceId') deviceId: string) {
    return this.geofenceService.getByDevice(deviceId);
  }

  @Put(':id')
  update(@Param('id') id: number, @Body() body: any) {
    return this.geofenceService.update(id, body);
  }

  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.geofenceService.remove(id);
  }
}
