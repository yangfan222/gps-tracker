import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';

@Entity('devices')
export class Device {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  deviceId: string;

  @Column({ default: '定位器' })
  deviceName: string;

  @Column({ nullable: true })
  deviceIcon: string;

  @Column()
  userId: number;

  @ManyToOne(() => User)
  @JoinColumn({ name: 'userId' })
  user: User;

  @Column({ nullable: true })
  simNumber: string;

  @Column({ nullable: true })
  iccid: string;

  @Column({ nullable: true })
  deviceModel: string; // e.g. F36

  @Column({ nullable: true })
  protocolType: string; // e.g. HL

  @Column({ default: 'offline' })
  status: string; // online | offline

  @Column({ type: 'float', default: 0 })
  batteryLevel: number;

  @Column({ type: 'int', default: 0 })
  signalStrength: number;

  @Column({ default: 'normal' })
  workMode: string; // normal | powersave | superPowersave

  @Column({ type: 'float', default: 0 })
  latitude: number;

  @Column({ type: 'float', default: 0 })
  longitude: number;

  @Column({ type: 'float', default: 0 })
  speed: number;

  @Column({ type: 'float', default: 0 })
  direction: number;

  @Column({ nullable: true })
  address: string;

  @Column({ nullable: true })
  locationType: string; // GPS | WiFi | LBS

  @Column({ type: 'float', default: 0 })
  totalMileage: number;

  @Column({ type: 'float', default: 0 })
  dailyMileage: number;

  @Column({ default: false })
  isActivated: boolean;

  @Column({ nullable: true })
  lastOnlineTime: Date;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
