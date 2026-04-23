import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Command } from '../entities/command.entity';

@Injectable()
export class CommandService {
  constructor(
    @InjectRepository(Command)
    private commandRepo: Repository<Command>,
  ) {}

  async sendCommand(deviceId: string, commandType: string, commandData?: any) {
    const command = this.commandRepo.create({
      deviceId,
      commandType,
      commandData: commandData ? JSON.stringify(commandData) : null,
      status: 'pending',
    });
    return this.commandRepo.save(command);
  }

  async getCommands(deviceId: string) {
    return this.commandRepo.find({
      where: { deviceId },
      order: { createdAt: 'DESC' },
      take: 50,
    });
  }

  async getPendingCommands(deviceId: string) {
    return this.commandRepo.find({
      where: { deviceId, status: 'pending' },
      order: { createdAt: 'ASC' },
    });
  }

  async updateCommandStatus(id: number, status: string, response?: string) {
    await this.commandRepo.update(id, { status, response });
  }
}
