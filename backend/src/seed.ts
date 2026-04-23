import 'reflect-metadata';
import { DataSource } from 'typeorm';
import { User } from './entities/user.entity';
import { Device } from './entities/device.entity';
import { Location } from './entities/location.entity';
import { Geofence } from './entities/geofence.entity';
import { Alarm } from './entities/alarm.entity';
import { SimCard } from './entities/sim-card.entity';

const dataSource = new DataSource({
  type: 'sqljs',
  location: 'gps_tracker.db',
  autoSave: true,
  entities: [User, Device, Location, Geofence, Alarm, SimCard],
  synchronize: false,
});

async function seed() {
  await dataSource.initialize();
  console.log('Database connected');

  const deviceRepo = dataSource.getRepository(Device);
  const locationRepo = dataSource.getRepository(Location);
  const geofenceRepo = dataSource.getRepository(Geofence);
  const alarmRepo = dataSource.getRepository(Alarm);
  const simCardRepo = dataSource.getRepository(SimCard);

  // === 更新设备状态 ===
  const device1 = await deviceRepo.findOne({ where: { deviceId: 'T808202401' } });
  if (device1) {
    Object.assign(device1, {
      status: 'online', batteryLevel: 78, signalStrength: 85,
      latitude: 39.9219, longitude: 116.4435, speed: 32.5, direction: 180,
      address: '北京市朝阳区建国路88号', locationType: 'GPS',
      totalMileage: 15680.5, dailyMileage: 45.2, isActivated: true,
      deviceModel: 'T808', protocolType: 'JT808', workMode: 'normal',
      lastOnlineTime: new Date(),
    });
    await deviceRepo.save(device1);
    console.log('Device 1 updated: 小杨的车');
  }

  const device2 = await deviceRepo.findOne({ where: { deviceId: 'T808202402' } });
  if (device2) {
    Object.assign(device2, {
      status: 'online', batteryLevel: 45, signalStrength: 62,
      latitude: 39.9085, longitude: 116.3975, speed: 0, direction: 90,
      address: '北京市东城区王府井大街218号', locationType: 'GPS',
      totalMileage: 3250.8, dailyMileage: 0, isActivated: true,
      deviceModel: 'T808', protocolType: 'JT808', workMode: 'powersave',
      lastOnlineTime: new Date(),
    });
    await deviceRepo.save(device2);
    console.log('Device 2 updated: 电动车');
  }

  const device3 = await deviceRepo.findOne({ where: { deviceId: 'F36GPS0001' } });
  if (device3) {
    Object.assign(device3, {
      status: 'online', batteryLevel: 92, signalStrength: 70,
      latitude: 39.9342, longitude: 116.4178, speed: 2.1, direction: 45,
      address: '北京市朝阳区朝阳公园南路', locationType: 'WiFi',
      totalMileage: 125.3, dailyMileage: 3.8, isActivated: true,
      deviceModel: 'F36', protocolType: 'HL', workMode: 'normal',
      lastOnlineTime: new Date(),
    });
    await deviceRepo.save(device3);
    console.log('Device 3 updated: 豆豆(宠物)');
  }

  // === 插入位置历史数据 (设备1 - 模拟一天的行车轨迹) ===
  const now = new Date();
  const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const locations: Partial<Location>[] = [];

  // 设备1: 早上从家出发到公司的轨迹 (8:00 - 8:45)
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

  for (const point of route1) {
    const time = new Date(today.getTime() + (8 * 60 + point.time) * 60 * 1000);
    locations.push({
      deviceId: 'T808202401', latitude: point.lat, longitude: point.lng,
      speed: point.speed, direction: 180, locationType: 'GPS',
      address: point.addr, altitude: 45, satellites: 12,
      createdAt: time,
    });
  }

  // 设备1: 中午出去吃饭 (12:00 - 12:30)
  const route2 = [
    { lat: 39.9219, lng: 116.4435, speed: 0, time: 0, addr: '建国路88号' },
    { lat: 39.9230, lng: 116.4420, speed: 20, time: 5, addr: '建国路' },
    { lat: 39.9245, lng: 116.4390, speed: 15, time: 10, addr: '金地中心' },
    { lat: 39.9260, lng: 116.4380, speed: 0, time: 15, addr: '华贸商业街' },
  ];

  for (const point of route2) {
    const time = new Date(today.getTime() + (12 * 60 + point.time) * 60 * 1000);
    locations.push({
      deviceId: 'T808202401', latitude: point.lat, longitude: point.lng,
      speed: point.speed, direction: 0, locationType: 'GPS',
      address: point.addr, altitude: 45, satellites: 10,
      createdAt: time,
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

  for (const point of route3) {
    const time = new Date(today.getTime() + (18 * 60 + point.time) * 60 * 1000);
    locations.push({
      deviceId: 'T808202401', latitude: point.lat, longitude: point.lng,
      speed: point.speed, direction: 0, locationType: 'GPS',
      address: point.addr, altitude: 45, satellites: 11,
      createdAt: time,
    });
  }

  // 设备2: 电动车 - 停放位置偶尔更新
  const ev_points = [
    { lat: 39.9085, lng: 116.3975, time: 7 * 60, addr: '王府井大街218号' },
    { lat: 39.9085, lng: 116.3975, time: 12 * 60, addr: '王府井大街218号' },
    { lat: 39.9085, lng: 116.3975, time: 18 * 60, addr: '王府井大街218号' },
  ];
  for (const point of ev_points) {
    const time = new Date(today.getTime() + point.time * 60 * 1000);
    locations.push({
      deviceId: 'T808202402', latitude: point.lat, longitude: point.lng,
      speed: 0, direction: 90, locationType: 'GPS',
      address: point.addr, altitude: 42, satellites: 8,
      createdAt: time,
    });
  }

  // 设备3: 宠物 - 公园里活动
  const pet_points = [
    { lat: 39.9330, lng: 116.4160, speed: 0, time: 9 * 60, addr: '朝阳公园' },
    { lat: 39.9335, lng: 116.4165, speed: 3, time: 9 * 60 + 15, addr: '朝阳公园草坪' },
    { lat: 39.9340, lng: 116.4170, speed: 5, time: 9 * 60 + 30, addr: '朝阳公园湖边' },
    { lat: 39.9345, lng: 116.4178, speed: 4, time: 10 * 60, addr: '朝阳公园南路' },
    { lat: 39.9342, lng: 116.4185, speed: 2, time: 10 * 60 + 30, addr: '朝阳公园东门' },
    { lat: 39.9338, lng: 116.4175, speed: 3.5, time: 11 * 60, addr: '朝阳公园' },
    { lat: 39.9342, lng: 116.4178, speed: 2.1, time: 11 * 60 + 30, addr: '朝阳公园南路' },
  ];
  for (const point of pet_points) {
    const time = new Date(today.getTime() + point.time * 60 * 1000);
    locations.push({
      deviceId: 'F36GPS0001', latitude: point.lat, longitude: point.lng,
      speed: point.speed, direction: 45, locationType: 'WiFi',
      address: point.addr, altitude: 40, satellites: 0,
      createdAt: time,
    });
  }

  await locationRepo.save(locations);
  console.log(`Inserted ${locations.length} location records`);

  // === 插入电子围栏 ===
  const geofences = [
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
  ];
  await geofenceRepo.save(geofences);
  console.log(`Inserted ${geofences.length} geofences`);

  // === 插入告警记录 ===
  const alarms = [
    {
      deviceId: 'T808202401', type: 'speed',
      message: '超速报警：当前速度 55km/h，限速 50km/h',
      latitude: 39.9190, longitude: 116.4230, address: '京顺路',
      isRead: true, createdAt: new Date(today.getTime() + 18 * 60 * 60 * 1000 + 15 * 60 * 1000),
    },
    {
      deviceId: 'T808202401', type: 'geofence_exit',
      message: '设备离开围栏"公司"',
      latitude: 39.9210, longitude: 116.4380, address: '国贸',
      isRead: false, createdAt: new Date(today.getTime() + 18 * 60 * 60 * 1000 + 5 * 60 * 1000),
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
      isRead: false, createdAt: new Date(today.getTime() + 15 * 60 * 60 * 1000 + 30 * 60 * 1000),
    },
    {
      deviceId: 'F36GPS0001', type: 'geofence_exit',
      message: '宠物离开围栏"朝阳公园活动范围"',
      latitude: 39.9360, longitude: 116.4220, address: '朝阳公园东门外',
      isRead: false, createdAt: new Date(today.getTime() + 10 * 60 * 60 * 1000 + 45 * 60 * 1000),
    },
  ];
  await alarmRepo.save(alarms);
  console.log(`Inserted ${alarms.length} alarms`);

  // === 插入 SIM 卡数据 ===
  const simCards = [
    {
      deviceId: 'T808202401', simNumber: '14712345678', iccid: '89860121801234567890',
      packageName: '30M*36月', totalData: 1080, usedData: 356.5,
      status: 'active', totalSms: 100, usedSms: 12,
      activationTime: new Date('2025-06-15'),
      expiryTime: new Date('2028-06-15'),
    },
    {
      deviceId: 'T808202402', simNumber: '14787654321', iccid: '89860121809876543210',
      packageName: '30M*12月', totalData: 360, usedData: 180.2,
      status: 'active', totalSms: 50, usedSms: 8,
      activationTime: new Date('2026-01-01'),
      expiryTime: new Date('2027-01-01'),
    },
    {
      deviceId: 'F36GPS0001', simNumber: '14700001111', iccid: '89860121800001111000',
      packageName: '50M*24月', totalData: 1200, usedData: 89.7,
      status: 'active', totalSms: 200, usedSms: 5,
      activationTime: new Date('2026-03-01'),
      expiryTime: new Date('2028-03-01'),
    },
  ];
  await simCardRepo.save(simCards);
  console.log(`Inserted ${simCards.length} SIM cards`);

  console.log('\n=== Seed completed successfully! ===');
  console.log('Users: 123/123456, admin/admin123, testuser1/123456');
  console.log('Devices: T808202401(小杨的车), T808202402(电动车), F36GPS0001(豆豆宠物)');

  await dataSource.destroy();
}

seed().catch(err => {
  console.error('Seed failed:', err);
  process.exit(1);
});
