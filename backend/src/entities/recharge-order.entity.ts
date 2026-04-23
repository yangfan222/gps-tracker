import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

/**
 * SIM卡充值订单实体
 *
 * 充值流程说明:
 * 1. 用户选择套餐，前端调用 POST /api/sim-card/:deviceId/recharge 创建订单
 * 2. 后端创建 pending 状态订单，返回订单信息
 * 3. (对接支付后) 前端调用支付SDK，支付成功后调用确认接口
 * 4. 后端验证支付结果，更新订单状态为 paid，并更新SIM卡套餐信息
 *
 * TODO: 对接实际支付渠道时需要补充:
 * - 微信支付: 调用统一下单API，获取 prepay_id
 * - 支付宝: 调用交易创建API
 * - 支付回调验签逻辑
 * - 运营商充值接口对接 (向运营商提交充值请求)
 */
@Entity('recharge_orders')
export class RechargeOrder {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  userId: number;

  @Column()
  deviceId: string;

  @Column()
  packageId: string; // 套餐ID，如 pkg_month_30m

  @Column()
  packageName: string; // 套餐名称

  @Column({ type: 'float' })
  amount: number; // 支付金额(元)

  @Column({ type: 'float' })
  dataAmount: number; // 充值流量(MB)

  @Column({ type: 'int', default: 0 })
  duration: number; // 套餐时长(天)

  @Column({ default: 'pending' })
  status: string; // pending | paid | failed | refunded

  @Column({ nullable: true })
  paymentMethod: string; // wechat | alipay

  @Column({ nullable: true })
  transactionId: string; // 第三方支付流水号

  @CreateDateColumn()
  createdAt: Date;

  @Column({ nullable: true })
  paidAt: Date;
}
