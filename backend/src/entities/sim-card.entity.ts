import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('sim_cards')
export class SimCard {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  deviceId: string;

  @Column({ nullable: true })
  simNumber: string;

  @Column({ nullable: true })
  iccid: string;

  @Column({ nullable: true })
  packageName: string; // e.g. 30M*36月

  @Column({ type: 'float', default: 0 })
  totalData: number; // MB

  @Column({ type: 'float', default: 0 })
  usedData: number; // MB

  @Column({ default: 'inactive' })
  status: string; // inactive | active | expired

  @Column({ nullable: true })
  activationTime: Date;

  @Column({ nullable: true })
  expiryTime: Date;

  @Column({ type: 'int', default: 0 })
  totalSms: number;

  @Column({ type: 'int', default: 0 })
  usedSms: number;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
