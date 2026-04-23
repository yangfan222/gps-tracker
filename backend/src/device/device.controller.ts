import { Controller, Get, Post, Put, Delete, Body, Param, UseGuards, Request } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { DeviceService } from './device.service';
import { AddDeviceDto, UpdateDeviceDto, ActivateDeviceDto } from './device.dto';

@Controller('device')
@UseGuards(AuthGuard('jwt'))
export class DeviceController {
  constructor(private deviceService: DeviceService) {}

  @Post()
  addDevice(@Request() req, @Body() dto: AddDeviceDto) {
    return this.deviceService.addDevice(req.user.id, dto);
  }

  @Get()
  getDevices(@Request() req) {
    return this.deviceService.getDevices(req.user.id);
  }

  @Get(':deviceId')
  getDevice(@Request() req, @Param('deviceId') deviceId: string) {
    return this.deviceService.getDevice(req.user.id, deviceId);
  }

  @Put(':deviceId')
  updateDevice(@Request() req, @Param('deviceId') deviceId: string, @Body() dto: UpdateDeviceDto) {
    return this.deviceService.updateDevice(req.user.id, deviceId, dto);
  }

  @Delete(':deviceId')
  removeDevice(@Request() req, @Param('deviceId') deviceId: string) {
    return this.deviceService.removeDevice(req.user.id, deviceId);
  }

  @Post('activate')
  activateDevice(@Request() req, @Body() dto: ActivateDeviceDto) {
    return this.deviceService.activateDevice(req.user.id, dto);
  }
}
