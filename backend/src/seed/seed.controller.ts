import { Controller, Post } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Device } from '../entities/device.entity';
import { Location } from '../entities/location.entity';
import { Geofence } from '../entities/geofence.entity';
import { Alarm } from '../entities/alarm.entity';
import { SimCard } from '../entities/sim-card.entity';

@Controller('seed')
export class SeedController {
  constructor(
    @InjectRepository(Device) private deviceRepo: Repository<Device>,
    @InjectRepository(Location) private locationRepo: Repository<Location>,
    @InjectRepository(Geofence) private geofenceRepo: Repository<Geofence>,
    @InjectRepository(Alarm) private alarmRepo: Repository<Alarm>,
    @InjectRepository(SimCard) private simCardRepo: Repository<SimCard>,
  ) {}

  @Post()
  async seed() {
    // === 更新设备状态 ===
    const device1 = await this.deviceRepo.findOne({ where: { deviceId: 'T808202401' } });
    if (device1) {
      Object.assign(device1, {
        status: 'online', batteryLevel: 78, signalStrength: 85,
        latitude: 39.9219, longitude: 116.4435, speed: 32.5, direction: 180,
        address: '北京市朝阳区建国路88号', locationType: 'GPS',
        totalMileage: 15680.5, dailyMileage: 45.2, isActivated: true,
        deviceModel: 'T808', protocolType: 'JT808', workMode: 'normal',
        lastOnlineTime: new Date(),
      });
      await this.deviceRepo.save(device1);
    }

    const device2 = await this.deviceRepo.findOne({ where: { deviceId: 'T808202402' } });
    if (device2) {
      Object.assign(device2, {
        status: 'online', batteryLevel: 45, signalStrength: 62,
        latitude: 39.9085, longitude: 116.3975, speed: 0, direction: 90,
        address: '北京市东城区王府井大街218号', locationType: 'GPS',
        totalMileage: 3250.8, dailyMileage: 0, isActivated: true,
        deviceModel: 'T808', protocolType: 'JT808', workMode: 'powersave',
        lastOnlineTime: new Date(),
      });
      await this.deviceRepo.save(device2);
    }

    const device3 = await this.deviceRepo.findOne({ where: { deviceId: 'F36GPS0001' } });
    if (device3) {
      Object.assign(device3, {
        status: 'online', batteryLevel: 92, signalStrength: 70,
        latitude: 39.9342, longitude: 116.4178, speed: 2.1, direction: 45,
        address: '北京市朝阳区朝阳公园南路', locationType: 'WiFi',
        totalMileage: 125.3, dailyMileage: 3.8, isActivated: true,
        deviceModel: 'F36', protocolType: 'HL', workMode: 'normal',
        lastOnlineTime: new Date(),
      });
      await this.deviceRepo.save(device3);
    }

    // === 位置历史 ===
    const now = new Date();
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    const locations: Partial<Location>[] = [];

    // 设备1: 早上从家出发到公司 (8:00 - 8:45)
    const route1 = [
      { lat: 39.9150, lng: 116.4050, speed: 0, time: 0, addr: '北京市朝阳区望京西园' },
      { lat: 39.9165, lng: 116.4080, speed: 15, time: 5, addr: '望京西路' },
      { lat: 39.9180, lng: 116.4120, speed: 35, time: 10, addr: '望京街' },
      { lat: 39.9195, lng: 116.4180, speed: 45, time: 15, addr: '阜通东大街' },
      { lat: 39.9210, lng: 116.4230, speed: 50, time: 20, addr: '京顺路' },
      { lat: 39.9220, lng: 116.4300, speed: 42, time: 25, addr: '东三环北路' },
      { lat: 39.9215, lng: 116.4350, speed: 38, time: 30, addr: '东三环' },
      { lat: 39.9210, lng: 116.4400, speed: 25, time: 35, addr: '国贸桥' },
      { lat: 39.9219, lng: 116.4435, speed: 0, time: 45, addr: '北京市朝阳区建国路88号' },
    ];
    for (const p of route1) {
      locations.push({
        deviceId: 'T808202401', latitude: p.lat, longitude: p.lng,
        speed: p.speed, direction: 180, locationType: 'GPS',
        address: p.addr, altitude: 45, satellites: 12,
        createdAt: new Date(today.getTime() + (8 * 60 + p.time) * 60 * 1000),
      });
    }

    // 设备1: 中午外出 (12:00 - 12:15)
    const route2 = [
      { lat: 39.9219, lng: 116.4435, speed: 0, time: 0, addr: '建国路88号' },
      { lat: 39.9230, lng: 116.4420, speed: 20, time: 5, addr: '建国路' },
      { lat: 39.9245, lng: 116.4390, speed: 15, time: 10, addr: '金地中心' },
      { lat: 39.9260, lng: 116.4380, speed: 0, time: 15, addr: '华贸商业街' },
    ];
    for (const p of route2) {
      locations.push({
        deviceId: 'T808202401', latitude: p.lat, longitude: p.lng,
        speed: p.speed, direction: 0, locationType: 'GPS',
        address: p.addr, altitude: 45, satellites: 10,
        createdAt: new Date(today.getTime() + (12 * 60 + p.time) * 60 * 1000),
      });
    }

    // 设备1: 下班回家 (18:00 - 18:50)
    const route3 = [
      { lat: 39.9219, lng: 116.4435, speed: 0, time: 0, addr: '建国路88号' },
      { lat: 39.9210, lng: 116.4380, speed: 20, time: 5, addr: '国贸' },
      { lat: 39.9200, lng: 116.4300, speed: 40, time: 10, addr: '东三环' },
      { lat: 39.9190, lng: 116.4230, speed: 55, time: 15, addr: '京顺路' },
      { lat: 39.9180, lng: 116.4180, speed: 48, time: 20, addr: '阜通东大街' },
      { lat: 39.9165, lng: 116.4120, speed: 35, time: 30, addr: '望京街' },
      { lat: 39.9155, lng: 116.4070, speed: 15, time: 40, addr: '望京西路' },
      { lat: 39.9150, lng: 116.4050, speed: 0, time: 50, addr: '望京西园' },
    ];
    for (const p of route3) {
      locations.push({
        deviceId: 'T808202401', latitude: p.lat, longitude: p.lng,
        speed: p.speed, direction: 0, locationType: 'GPS',
        address: p.addr, altitude: 45, satellites: 11,
        createdAt: new Date(today.getTime() + (18 * 60 + p.time) * 60 * 1000),
      });
    }

    // 设备2: 电动车 - 停放
    for (const h of [7, 12, 18]) {
      locations.push({
        deviceId: 'T808202402', latitude: 39.9085, longitude: 116.3975,
        speed: 0, direction: 90, locationType: 'GPS',
        address: '王府井大街218号', altitude: 42, satellites: 8,
        createdAt: new Date(today.getTime() + h * 60 * 60 * 1000),
      });
    }

    // 设备3: 宠物公园活动
    const petPoints = [
      { lat: 39.9330, lng: 116.4160, speed: 0, h: 9, m: 0, addr: '朝阳公园' },
      { lat: 39.9335, lng: 116.4165, speed: 3, h: 9, m: 15, addr: '朝阳公园草坪' },
      { lat: 39.9340, lng: 116.4170, speed: 5, h: 9, m: 30, addr: '朝阳公园湖边' },
      { lat: 39.9345, lng: 116.4178, speed: 4, h: 10, m: 0, addr: '朝阳公园南路' },
      { lat: 39.9342, lng: 116.4185, speed: 2, h: 10, m: 30, addr: '朝阳公园东门' },
      { lat: 39.9338, lng: 116.4175, speed: 3.5, h: 11, m: 0, addr: '朝阳公园' },
      { lat: 39.9342, lng: 116.4178, speed: 2.1, h: 11, m: 30, addr: '朝阳公园南路' },
    ];
    for (const p of petPoints) {
      locations.push({
        deviceId: 'F36GPS0001', latitude: p.lat, longitude: p.lng,
        speed: p.speed, direction: 45, locationType: 'WiFi',
        address: p.addr, altitude: 40, satellites: 0,
        createdAt: new Date(today.getTime() + (p.h * 60 + p.m) * 60 * 1000),
      });
    }

    await this.locationRepo.save(locations);

    // === 电子围栏 ===
    await this.geofenceRepo.save([
      {
        deviceId: 'T808202401', name: '公司', type: 'circle',
        centerLat: 39.9219, centerLng: 116.4435, radius: 500,
        entryAlarm: false, exitAlarm: true, enabled: true,
      },
      {
        deviceId: 'T808202401', name: '家', type: 'circle',
        centerLat: 39.9150, centerLng: 116.4050, radius: 300,
        entryAlarm: true, exitAlarm: false, enabled: true,
      },
      {
        deviceId: 'F36GPS0001', name: '朝阳公园活动范围', type: 'circle',
        centerLat: 39.9340, centerLng: 116.4175, radius: 800,
        entryAlarm: false, exitAlarm: true, enabled: true,
      },
    ]);

    // === 告警 ===
    await this.alarmRepo.save([
      {
        deviceId: 'T808202401', type: 'speed',
        message: '超速报警：当前速度 55km/h，限速 50km/h',
        latitude: 39.9190, longitude: 116.4230, address: '京顺路',
        isRead: true, createdAt: new Date(today.getTime() + (18 * 60 + 15) * 60 * 1000),
      },
      {
        deviceId: 'T808202401', type: 'geofence_exit',
        message: '设备离开围栏"公司"',
        latitude: 39.9210, longitude: 116.4380, address: '国贸',
        isRead: false, createdAt: new Date(today.getTime() + (18 * 60 + 5) * 60 * 1000),
      },
      {
        deviceId: 'T808202402', type: 'low_battery',
        message: '设备电量低：当前电量 45%',
        latitude: 39.9085, longitude: 116.3975, address: '王府井大街218号',
        isRead: false, createdAt: new Date(today.getTime() + 14 * 60 * 60 * 1000),
      },
      {
        deviceId: 'T808202402', type: 'vibration',
        message: '震动报警：检测到异常震动',
        latitude: 39.9085, longitude: 116.3975, address: '王府井大街218号',
        isRead: false, createdAt: new Date(today.getTime() + (15 * 60 + 30) * 60 * 1000),
      },
      {
        deviceId: 'F36GPS0001', type: 'geofence_exit',
        message: '宠物离开围栏"朝阳公园活动范围"',
        latitude: 39.9360, longitude: 116.4220, address: '朝阳公园东门外',
        isRead: false, createdAt: new Date(today.getTime() + (10 * 60 + 45) * 60 * 1000),
      },
    ]);

    // === SIM 卡 ===
    await this.simCardRepo.save([
      {
        deviceId: 'T808202401', simNumber: '14712345678', iccid: '89860121801234567890',
        packageName: '30M*36月', totalData: 1080, usedData: 356.5,
        status: 'active', totalSms: 100, usedSms: 12,
        activationTime: new Date('2025-06-15'), expiryTime: new Date('2028-06-15'),
      },
      {
        deviceId: 'T808202402', simNumber: '14787654321', iccid: '89860121809876543210',
        packageName: '30M*12月', totalData: 360, usedData: 180.2,
        status: 'active', totalSms: 50, usedSms: 8,
        activationTime: new Date('2026-01-01'), expiryTime: new Date('2027-01-01'),
      },
      {
        deviceId: 'F36GPS0001', simNumber: '14700001111', iccid: '89860121800001111000',
        packageName: '50M*24月', totalData: 1200, usedData: 89.7,
        status: 'active', totalSms: 200, usedSms: 5,
        activationTime: new Date('2026-03-01'), expiryTime: new Date('2028-03-01'),
      },
    ]);

    return {
      message: 'Seed completed!',
      devices: 3,
      locations: locations.length,
      geofences: 3,
      alarms: 5,
      simCards: 3,
    };
  }
}
