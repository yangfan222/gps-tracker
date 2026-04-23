import { Controller, Get, Put, Param, Query, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AlarmService } from './alarm.service';

@Controller('alarm')
@UseGuards(AuthGuard('jwt'))
export class AlarmController {
  constructor(private alarmService: AlarmService) {}

  @Get(':deviceId')
  getAlarms(
    @Param('deviceId') deviceId: string,
    @Query('page') page = 1,
    @Query('limit') limit = 20,
  ) {
    return this.alarmService.getByDevice(deviceId, +page, +limit);
  }

  @Get(':deviceId/unread')
  getUnreadCount(@Param('deviceId') deviceId: string) {
    return this.alarmService.getUnreadCount(deviceId);
  }

  @Put(':id/read')
  markAsRead(@Param('id') id: number) {
    return this.alarmService.markAsRead(id);
  }
}
