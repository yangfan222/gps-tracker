import { Injectable, NotFoundException, ConflictException, ForbiddenException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Device } from '../entities/device.entity';
import { AddDeviceDto, UpdateDeviceDto, ActivateDeviceDto } from './device.dto';

@Injectable()
export class DeviceService {
  constructor(
    @InjectRepository(Device)
    private deviceRepo: Repository<Device>,
  ) {}

  async addDevice(userId: number, dto: AddDeviceDto) {
    const exists = await this.deviceRepo.findOne({ where: { deviceId: dto.deviceId } });
    if (exists) {
      throw new ConflictException('设备已被绑定');
    }
    const device = this.deviceRepo.create({
      deviceId: dto.deviceId,
      deviceName: dto.deviceName || '定位器',
      simNumber: dto.simNumber,
      userId,
    });
    return this.deviceRepo.save(device);
  }

  async getDevices(userId: number) {
    return this.deviceRepo.find({ where: { userId } });
  }

  async getDevice(userId: number, deviceId: string) {
    const device = await this.deviceRepo.findOne({ where: { deviceId, userId } });
    if (!device) throw new NotFoundException('设备不存在');
    return device;
  }

  async updateDevice(userId: number, deviceId: string, dto: UpdateDeviceDto) {
    const device = await this.getDevice(userId, deviceId);
    Object.assign(device, dto);
    return this.deviceRepo.save(device);
  }

  async removeDevice(userId: number, deviceId: string) {
    const device = await this.getDevice(userId, deviceId);
    await this.deviceRepo.remove(device);
    return { message: '设备已删除' };
  }

  async activateDevice(userId: number, dto: ActivateDeviceDto) {
    const device = await this.getDevice(userId, dto.deviceId);
    device.isActivated = true;
    if (dto.simNumber) device.simNumber = dto.simNumber;
    if (dto.iccid) device.iccid = dto.iccid;
    return this.deviceRepo.save(device);
  }

  // Internal: update device location from TCP data
  async updateDeviceLocation(deviceId: string, data: {
    latitude: number; longitude: number; speed: number;
    direction: number; locationType: string; batteryLevel?: number;
    signalStrength?: number; address?: string;
  }) {
    const device = await this.deviceRepo.findOne({ where: { deviceId } });
    if (!device) return null;
    Object.assign(device, {
      latitude: data.latitude,
      longitude: data.longitude,
      speed: data.speed,
      direction: data.direction,
      locationType: data.locationType,
      status: 'online',
      lastOnlineTime: new Date(),
      ...(data.batteryLevel !== undefined && { batteryLevel: data.batteryLevel }),
      ...(data.signalStrength !== undefined && { signalStrength: data.signalStrength }),
      ...(data.address && { address: data.address }),
    });
    return this.deviceRepo.save(device);
  }

  async getDeviceByDeviceId(deviceId: string) {
    return this.deviceRepo.findOne({ where: { deviceId } });
  }
}
