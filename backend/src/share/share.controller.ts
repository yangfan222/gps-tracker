import { Controller, Get, Post, Put, Param, Body, Query, UseGuards, Request } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ShareService } from './share.service';
import { LocationService } from '../location/location.service';

@Controller('share')
export class ShareController {
  constructor(
    private shareService: ShareService,
    private locationService: LocationService,
  ) {}

  /** 创建分享(需登录) */
  @Post(':deviceId')
  @UseGuards(AuthGuard('jwt'))
  createShare(
    @Request() req,
    @Param('deviceId') deviceId: string,
    @Body() body: { hours?: number },
  ) {
    return this.shareService.createShare(req.user.id, deviceId, body.hours || 24);
  }

  /** 停止分享(需登录) */
  @Put(':deviceId/stop')
  @UseGuards(AuthGuard('jwt'))
  stopShare(@Request() req, @Param('deviceId') deviceId: string) {
    return this.shareService.stopShare(req.user.id, deviceId);
  }

  /** 获取当前分享状态(需登录) */
  @Get(':deviceId/status')
  @UseGuards(AuthGuard('jwt'))
  getShareStatus(@Request() req, @Param('deviceId') deviceId: string) {
    return this.shareService.getActiveShare(req.user.id, deviceId);
  }

  /** 访客通过token查看分享的设备位置(无需登录) */
  @Get('view/:token')
  async viewShare(@Param('token') token: string) {
    const share = await this.shareService.getShareByToken(token);
    const location = await this.locationService.getLatestLocation(share.deviceId);
    return {
      deviceId: share.deviceId,
      expiresAt: share.expiresAt,
      location,
    };
  }
}
