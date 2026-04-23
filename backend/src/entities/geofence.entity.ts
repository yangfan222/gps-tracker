import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('geofences')
export class Geofence {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  deviceId: string;

  @Column()
  name: string;

  @Column({ default: 'circle' })
  type: string; // circle | polygon

  @Column({ type: 'float' })
  centerLat: number;

  @Column({ type: 'float' })
  centerLng: number;

  @Column({ type: 'float', default: 500 })
  radius: number; // meters, for circle type

  @Column({ nullable: true })
  points: string; // JSON string for polygon vertices

  @Column({ default: true })
  entryAlarm: boolean;

  @Column({ default: true })
  exitAlarm: boolean;

  @Column({ default: true })
  enabled: boolean;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
