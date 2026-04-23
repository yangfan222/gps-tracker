import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('commands')
export class Command {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  deviceId: string;

  @Column()
  commandType: string; // locate | restart | factory_reset | set_mode | power_off | power_on | set_speed_threshold

  @Column({ nullable: true })
  commandData: string; // JSON string with command parameters

  @Column({ default: 'pending' })
  status: string; // pending | sent | executed | failed

  @Column({ nullable: true })
  response: string;

  @CreateDateColumn()
  createdAt: Date;
}
