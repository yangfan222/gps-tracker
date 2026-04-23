import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { SimCard } from '../entities/sim-card.entity';
import { RechargeOrder } from '../entities/recharge-order.entity';

/** 可用套餐定义 */
const PACKAGES = {
  pkg_month_30m: { name: '月套餐', data: 30, duration: 30, price: 5 },
  pkg_quarter_100m: { name: '季套餐', data: 100, duration: 90, price: 12 },
  pkg_year_300m: { name: '年套餐', data: 300, duration: 365, price: 36 },
  pkg_year_1g: { name: '大流量年套餐', data: 1024, duration: 365, price: 68 },
};

@Injectable()
export class SimCardService {
  constructor(
    @InjectRepository(SimCard)
    private simCardRepo: Repository<SimCard>,
    @InjectRepository(RechargeOrder)
    private rechargeOrderRepo: Repository<RechargeOrder>,
  ) {}

  async create(data: {
    deviceId: string; simNumber?: string; iccid?: string;
    packageName?: string; totalData?: number;
  }) {
    const simCard = this.simCardRepo.create(data);
    return this.simCardRepo.save(simCard);
  }

  async getByDevice(deviceId: string) {
    return this.simCardRepo.findOne({ where: { deviceId } });
  }

  async getByIccid(iccid: string) {
    return this.simCardRepo.findOne({ where: { iccid } });
  }

  async activate(deviceId: string) {
    const simCard = await this.simCardRepo.findOne({ where: { deviceId } });
    if (!simCard) throw new NotFoundException('SIM卡不存在');
    simCard.status = 'active';
    simCard.activationTime = new Date();
    return this.simCardRepo.save(simCard);
  }

  async updateUsage(deviceId: string, usedData: number) {
    const simCard = await this.simCardRepo.findOne({ where: { deviceId } });
    if (!simCard) return;
    simCard.usedData = usedData;
    return this.simCardRepo.save(simCard);
  }

  /**
   * 创建充值订单
   *
   * TODO: 实际对接支付时需要:
   * 1. 调用微信/支付宝统一下单API
   * 2. 返回支付参数给前端
   * 3. 前端调起支付SDK
   */
  async createRechargeOrder(userId: number, deviceId: string, packageId: string) {
    const pkg = PACKAGES[packageId];
    if (!pkg) throw new BadRequestException('无效的套餐');

    const simCard = await this.simCardRepo.findOne({ where: { deviceId } });
    if (!simCard) throw new NotFoundException('SIM卡不存在');

    const order = this.rechargeOrderRepo.create({
      userId,
      deviceId,
      packageId,
      packageName: pkg.name,
      amount: pkg.price,
      dataAmount: pkg.data,
      duration: pkg.duration,
      status: 'pending',
    });

    return this.rechargeOrderRepo.save(order);
  }

  /**
   * 确认充值订单(模拟支付成功)
   *
   * TODO: 实际对接时此方法应由支付回调触发:
   * 1. 验证支付平台回调签名
   * 2. 校验订单金额是否一致
   * 3. 更新订单状态
   * 4. 调用运营商API为SIM卡充值
   * 5. 更新SIM卡套餐信息
   */
  async confirmRechargeOrder(orderId: number) {
    const order = await this.rechargeOrderRepo.findOne({ where: { id: orderId } });
    if (!order) throw new NotFoundException('订单不存在');
    if (order.status !== 'pending') throw new BadRequestException('订单状态无效');

    order.status = 'paid';
    order.paidAt = new Date();
    await this.rechargeOrderRepo.save(order);

    // 更新SIM卡套餐
    const simCard = await this.simCardRepo.findOne({ where: { deviceId: order.deviceId } });
    if (simCard) {
      simCard.totalData = (simCard.totalData || 0) + order.dataAmount;
      simCard.packageName = order.packageName;
      const now = new Date();
      simCard.expiryTime = new Date(now.getTime() + order.duration * 24 * 60 * 60 * 1000);
      if (simCard.status === 'expired') simCard.status = 'active';
      await this.simCardRepo.save(simCard);
    }

    return { message: '充值成功', order };
  }

  /** 获取用户的充值记录 */
  async getRechargeOrders(userId: number, deviceId: string) {
    return this.rechargeOrderRepo.find({
      where: { userId, deviceId },
      order: { createdAt: 'DESC' },
    });
  }
}
