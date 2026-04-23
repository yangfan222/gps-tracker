import { Controller, Get, Post, Put, Param, Body, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { SimCardService } from './sim-card.service';

@Controller('sim-card')
@UseGuards(AuthGuard('jwt'))
export class SimCardController {
  constructor(private simCardService: SimCardService) {}

  @Get(':deviceId')
  getByDevice(@Param('deviceId') deviceId: string) {
    return this.simCardService.getByDevice(deviceId);
  }

  @Post(':deviceId')
  create(
    @Param('deviceId') deviceId: string,
    @Body() body: { simNumber?: string; iccid?: string; packageName?: string; totalData?: number },
  ) {
    return this.simCardService.create({ deviceId, ...body });
  }

  @Put(':deviceId/activate')
  activate(@Param('deviceId') deviceId: string) {
    return this.simCardService.activate(deviceId);
  }
}
