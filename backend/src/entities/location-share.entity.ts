import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

/**
 * 位置分享实体
 *
 * 功能说明:
 * - 用户可以生成一个临时分享链接，让他人查看设备实时位置
 * - 分享链接有有效期限制(默认24小时)
 * - 可以随时停止分享
 *
 * 分享链接格式: /share-view?token={shareToken}
 * 访客通过 token 获取设备位置，无需登录
 */
@Entity('location_shares')
export class LocationShare {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  userId: number;

  @Column()
  deviceId: string;

  @Column({ unique: true })
  shareToken: string; // 分享令牌，UUID格式

  @Column({ default: true })
  active: boolean; // 是否有效

  @Column()
  expiresAt: Date; // 过期时间

  @CreateDateColumn()
  createdAt: Date;
}
