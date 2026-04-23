import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, Index } from 'typeorm';

@Entity('locations')
@Index(['deviceId', 'createdAt'])
export class Location {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  deviceId: string;

  @Column({ type: 'float' })
  latitude: number;

  @Column({ type: 'float' })
  longitude: number;

  @Column({ type: 'float', default: 0 })
  speed: number;

  @Column({ type: 'float', default: 0 })
  direction: number;

  @Column({ nullable: true })
  locationType: string; // GPS | WiFi | LBS

  @Column({ nullable: true })
  address: string;

  @Column({ type: 'float', default: 0 })
  altitude: number;

  @Column({ type: 'int', default: 0 })
  satellites: number;

  @CreateDateColumn()
  createdAt: Date;
}
