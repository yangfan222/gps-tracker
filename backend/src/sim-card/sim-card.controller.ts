import { Controller, Get, Post, Put, Param, Body, UseGuards, Request } from '@nestjs/common';
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

  /** 创建充值订单 */
  @Post(':deviceId/recharge')
  createRechargeOrder(
    @Request() req,
    @Param('deviceId') deviceId: string,
    @Body() body: { packageId: string },
  ) {
    return this.simCardService.createRechargeOrder(req.user.id, deviceId, body.packageId);
  }

  /** 确认充值订单(模拟支付回调) */
  @Put('recharge/:orderId/confirm')
  confirmRechargeOrder(@Param('orderId') orderId: number) {
    return this.simCardService.confirmRechargeOrder(orderId);
  }

  /** 获取充值记录 */
  @Get(':deviceId/recharge-orders')
  getRechargeOrders(@Request() req, @Param('deviceId') deviceId: string) {
    return this.simCardService.getRechargeOrders(req.user.id, deviceId);
  }
}
