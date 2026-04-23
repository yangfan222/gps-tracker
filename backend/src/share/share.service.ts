import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, MoreThan } from 'typeorm';
import { LocationShare } from '../entities/location-share.entity';
import { randomUUID } from 'crypto';

@Injectable()
export class ShareService {
  constructor(
    @InjectRepository(LocationShare)
    private shareRepo: Repository<LocationShare>,
  ) {}

  /**
   * 创建分享链接
   * @param userId 用户ID
   * @param deviceId 设备ID
   * @param hours 有效时长(小时)，默认24
   */
  async createShare(userId: number, deviceId: string, hours = 24) {
    // 停止该设备之前的有效分享
    await this.shareRepo.update(
      { userId, deviceId, active: true },
      { active: false },
    );

    const share = this.shareRepo.create({
      userId,
      deviceId,
      shareToken: randomUUID(),
      active: true,
      expiresAt: new Date(Date.now() + hours * 60 * 60 * 1000),
    });

    return this.shareRepo.save(share);
  }

  /** 停止分享 */
  async stopShare(userId: number, deviceId: string) {
    await this.shareRepo.update(
      { userId, deviceId, active: true },
      { active: false },
    );
    return { message: '已停止分享' };
  }

  /** 获取当前有效分享 */
  async getActiveShare(userId: number, deviceId: string) {
    return this.shareRepo.findOne({
      where: {
        userId,
        deviceId,
        active: true,
        expiresAt: MoreThan(new Date()),
      },
    });
  }

  /**
   * 通过 token 获取分享信息(访客使用，无需登录)
   * 返回 deviceId 供前端查询设备位置
   */
  async getShareByToken(token: string) {
    const share = await this.shareRepo.findOne({
      where: {
        shareToken: token,
        active: true,
        expiresAt: MoreThan(new Date()),
      },
    });
    if (!share) throw new NotFoundException('分享链接已失效或不存在');
    return { deviceId: share.deviceId, expiresAt: share.expiresAt };
  }
}
