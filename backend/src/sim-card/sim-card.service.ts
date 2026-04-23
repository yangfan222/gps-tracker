import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { SimCard } from '../entities/sim-card.entity';

@Injectable()
export class SimCardService {
  constructor(
    @InjectRepository(SimCard)
    private simCardRepo: Repository<SimCard>,
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
}
