// seed-test-data.js - 生成完整测试数据
const path = require('path');
const fs = require('fs');
const sqlStatements = [];

const now = new Date();
const adminUserId = 3; // admin user ID from registration

// ========== 1. 设备数据 (3台设备) ==========
const devices = [
  {
    deviceId: 'GT06-A001',
    deviceName: '粤B·888888 轿车',
    userId: adminUserId,
    simNumber: '13800001001',
    iccid: '89860001234567890001',
    deviceModel: 'GT06N',
    protocolType: 'GT06',
    status: 'online',
    batteryLevel: 85,
    signalStrength: 78,
    workMode: 'normal',
    latitude: 22.5431,
    longitude: 114.0579,
    speed: 0,
    direction: 180,
    address: '深圳市南山区科技南路深圳湾科技生态园',
    locationType: 'GPS',
    totalMileage: 12680.5,
    dailyMileage: 45.3,
    isActivated: 1,
    lastOnlineTime: now.toISOString(),
  },
  {
    deviceId: 'GT06-B002',
    deviceName: '粤B·666666 SUV',
    userId: adminUserId,
    simNumber: '13800001002',
    iccid: '89860001234567890002',
    deviceModel: 'F36',
    protocolType: 'HL',
    status: 'online',
    batteryLevel: 62,
    signalStrength: 55,
    workMode: 'normal',
    latitude: 22.5550,
    longitude: 114.0460,
    speed: 35.5,
    direction: 270,
    address: '深圳市南山区深南大道9966号',
    locationType: 'GPS',
    totalMileage: 8920.1,
    dailyMileage: 78.6,
    isActivated: 1,
    lastOnlineTime: now.toISOString(),
  },
  {
    deviceId: 'GT06-C003',
    deviceName: '电动车',
    userId: adminUserId,
    simNumber: '13800001003',
    iccid: '89860001234567890003',
    deviceModel: 'S20',
    protocolType: 'GT06',
    status: 'offline',
    batteryLevel: 15,
    signalStrength: 20,
    workMode: 'powersave',
    latitude: 22.5280,
    longitude: 114.0680,
    speed: 0,
    direction: 0,
    address: '深圳市福田区华强北街道振兴路',
    locationType: 'LBS',
    totalMileage: 562.3,
    dailyMileage: 0,
    isActivated: 1,
    lastOnlineTime: new Date(now.getTime() - 6 * 3600000).toISOString(), // 6小时前
  },
];

for (const d of devices) {
  sqlStatements.push(`INSERT OR IGNORE INTO devices (deviceId, deviceName, userId, simNumber, iccid, deviceModel, protocolType, status, batteryLevel, signalStrength, workMode, latitude, longitude, speed, direction, address, locationType, totalMileage, dailyMileage, isActivated, lastOnlineTime, createdAt, updatedAt)
VALUES ('${d.deviceId}', '${d.deviceName}', ${d.userId}, '${d.simNumber}', '${d.iccid}', '${d.deviceModel}', '${d.protocolType}', '${d.status}', ${d.batteryLevel}, ${d.signalStrength}, '${d.workMode}', ${d.latitude}, ${d.longitude}, ${d.speed}, ${d.direction}, '${d.address}', '${d.locationType}', ${d.totalMileage}, ${d.dailyMileage}, ${d.isActivated}, '${d.lastOnlineTime}', datetime('now'), datetime('now'));`);
}

// ========== 2. 位置历史数据 (模拟今天的行车轨迹) ==========
// 设备A: 模拟从家到公司的通勤路线 (深圳南山)
function generateTrack(deviceId, startLat, startLng, endLat, endLng, startHour, durationMinutes, pointCount) {
  const points = [];
  const baseDate = new Date(now);
  baseDate.setHours(startHour, 0, 0, 0);

  for (let i = 0; i < pointCount; i++) {
    const progress = i / (pointCount - 1);
    // 加一点随机弯曲
    const noise = Math.sin(progress * Math.PI * 3) * 0.002;
    const lat = startLat + (endLat - startLat) * progress + noise;
    const lng = startLng + (endLng - startLng) * progress + noise * 0.8;
    const time = new Date(baseDate.getTime() + (durationMinutes * 60000 * i) / pointCount);
    const speed = i === 0 || i === pointCount - 1 ? 0 : 20 + Math.random() * 60;
    const dir = Math.atan2(endLng - startLng, endLat - startLat) * (180 / Math.PI);

    points.push({
      deviceId,
      latitude: parseFloat(lat.toFixed(6)),
      longitude: parseFloat(lng.toFixed(6)),
      speed: parseFloat(speed.toFixed(1)),
      direction: parseFloat(((dir + 360) % 360).toFixed(1)),
      locationType: 'GPS',
      address: null,
      altitude: 20 + Math.random() * 30,
      satellites: 8 + Math.floor(Math.random() * 7),
      createdAt: time.toISOString(),
    });
  }
  return points;
}

// 设备A: 早上通勤 (8:00-8:40, 南山家 -> 科技园公司)
const trackA1 = generateTrack('GT06-A001', 22.5280, 114.0350, 22.5431, 114.0579, 8, 40, 50);
// 设备A: 中午外出吃饭 (12:00-12:15)
const trackA2 = generateTrack('GT06-A001', 22.5431, 114.0579, 22.5460, 114.0620, 12, 15, 15);
// 设备A: 回公司 (13:00-13:10)
const trackA3 = generateTrack('GT06-A001', 22.5460, 114.0620, 22.5431, 114.0579, 13, 10, 12);
// 设备A: 下班回家 (18:00-18:50)
const trackA4 = generateTrack('GT06-A001', 22.5431, 114.0579, 22.5280, 114.0350, 18, 50, 55);

// 设备B: 全天在外跑业务 (9:00-17:00, 多个地点)
const trackB1 = generateTrack('GT06-B002', 22.5550, 114.0460, 22.5700, 114.0280, 9, 30, 35);
const trackB2 = generateTrack('GT06-B002', 22.5700, 114.0280, 22.5400, 114.1100, 10, 45, 50);
const trackB3 = generateTrack('GT06-B002', 22.5400, 114.1100, 22.5200, 114.0680, 14, 35, 40);
const trackB4 = generateTrack('GT06-B002', 22.5200, 114.0680, 22.5550, 114.0460, 16, 40, 45);

// 设备C: 短途骑行 (昨天)
const yesterday = new Date(now);
yesterday.setDate(yesterday.getDate() - 1);
const trackC1 = generateTrack('GT06-C003', 22.5280, 114.0680, 22.5350, 114.0730, 19, 20, 20);

const allTracks = [...trackA1, ...trackA2, ...trackA3, ...trackA4, ...trackB1, ...trackB2, ...trackB3, ...trackB4, ...trackC1];

for (const p of allTracks) {
  const addr = p.address ? `'${p.address}'` : 'NULL';
  sqlStatements.push(`INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('${p.deviceId}', ${p.latitude}, ${p.longitude}, ${p.speed}, ${p.direction}, '${p.locationType}', ${addr}, ${p.altitude.toFixed(1)}, ${p.satellites}, '${p.createdAt}');`);
}

// ========== 3. 再补上过去几天的数据，让报表有内容 ==========
for (let dayOffset = 1; dayOffset <= 7; dayOffset++) {
  const d = new Date(now);
  d.setDate(d.getDate() - dayOffset);

  // 设备A每天通勤
  const morningTrack = generateTrack('GT06-A001', 22.5280, 114.0350, 22.5431, 114.0579, 8, 40, 15);
  const eveningTrack = generateTrack('GT06-A001', 22.5431, 114.0579, 22.5280, 114.0350, 18, 50, 15);

  for (const p of [...morningTrack, ...eveningTrack]) {
    const pDate = new Date(d);
    const origDate = new Date(p.createdAt);
    pDate.setHours(origDate.getHours(), origDate.getMinutes(), origDate.getSeconds());
    sqlStatements.push(`INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('${p.deviceId}', ${p.latitude}, ${p.longitude}, ${p.speed}, ${p.direction}, '${p.locationType}', NULL, ${p.altitude.toFixed(1)}, ${p.satellites}, '${pDate.toISOString()}');`);
  }

  // 设备B也有每天数据
  const bizTrack = generateTrack('GT06-B002', 22.5550, 114.0460, 22.5400 + Math.random() * 0.02, 114.0600 + Math.random() * 0.05, 9, 60, 20);
  for (const p of bizTrack) {
    const pDate = new Date(d);
    const origDate = new Date(p.createdAt);
    pDate.setHours(origDate.getHours(), origDate.getMinutes(), origDate.getSeconds());
    sqlStatements.push(`INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('${p.deviceId}', ${p.latitude}, ${p.longitude}, ${p.speed}, ${p.direction}, '${p.locationType}', NULL, ${p.altitude.toFixed(1)}, ${p.satellites}, '${pDate.toISOString()}');`);
  }
}

// ========== 4. 电子围栏 ==========
const geofences = [
  {
    deviceId: 'GT06-A001',
    name: '公司范围',
    type: 'circle',
    centerLat: 22.5431,
    centerLng: 114.0579,
    radius: 300,
    entryAlarm: 0,
    exitAlarm: 1,
    enabled: 1,
  },
  {
    deviceId: 'GT06-A001',
    name: '家庭区域',
    type: 'circle',
    centerLat: 22.5280,
    centerLng: 114.0350,
    radius: 500,
    entryAlarm: 1,
    exitAlarm: 1,
    enabled: 1,
  },
  {
    deviceId: 'GT06-B002',
    name: '深圳市区',
    type: 'circle',
    centerLat: 22.5500,
    centerLng: 114.0600,
    radius: 15000,
    entryAlarm: 0,
    exitAlarm: 1,
    enabled: 1,
  },
  {
    deviceId: 'GT06-C003',
    name: '停车位',
    type: 'circle',
    centerLat: 22.5280,
    centerLng: 114.0680,
    radius: 100,
    entryAlarm: 0,
    exitAlarm: 1,
    enabled: 1,
  },
];

for (const g of geofences) {
  sqlStatements.push(`INSERT INTO geofences (deviceId, name, type, centerLat, centerLng, radius, entryAlarm, exitAlarm, enabled, createdAt, updatedAt)
VALUES ('${g.deviceId}', '${g.name}', '${g.type}', ${g.centerLat}, ${g.centerLng}, ${g.radius}, ${g.entryAlarm}, ${g.exitAlarm}, ${g.enabled}, datetime('now'), datetime('now'));`);
}

// ========== 5. 告警记录 ==========
const alarms = [
  // 今天
  { deviceId: 'GT06-A001', type: 'speed', message: '超速告警: 当前速度 92km/h，超过限速 80km/h', latitude: 22.5380, longitude: 114.0480, address: '深圳市南山区滨海大道', isRead: 0, hoursAgo: 2 },
  { deviceId: 'GT06-A001', type: 'geofence_exit', message: '设备离开围栏「公司范围」', latitude: 22.5460, longitude: 114.0620, address: '深圳市南山区科技中二路', isRead: 0, hoursAgo: 5 },
  { deviceId: 'GT06-B002', type: 'vibration', message: '异常振动告警', latitude: 22.5600, longitude: 114.0500, address: '深圳市南山区粤海街道', isRead: 0, hoursAgo: 3 },
  { deviceId: 'GT06-C003', type: 'low_battery', message: '电量过低: 当前电量 15%', latitude: 22.5280, longitude: 114.0680, address: '深圳市福田区华强北', isRead: 0, hoursAgo: 6 },
  { deviceId: 'GT06-C003', type: 'geofence_exit', message: '设备离开围栏「停车位」', latitude: 22.5310, longitude: 114.0710, address: '深圳市福田区振兴路', isRead: 0, hoursAgo: 24 },
  // 昨天
  { deviceId: 'GT06-A001', type: 'speed', message: '超速告警: 当前速度 88km/h，超过限速 80km/h', latitude: 22.5350, longitude: 114.0420, address: '深圳市南山区北环大道', isRead: 1, hoursAgo: 28 },
  { deviceId: 'GT06-B002', type: 'sos', message: 'SOS紧急求救', latitude: 22.5500, longitude: 114.1000, address: '深圳市福田区福华三路', isRead: 1, hoursAgo: 30 },
  { deviceId: 'GT06-A001', type: 'geofence_entry', message: '设备进入围栏「家庭区域」', latitude: 22.5285, longitude: 114.0355, address: '深圳市南山区南光路', isRead: 1, hoursAgo: 32 },
  // 更早
  { deviceId: 'GT06-B002', type: 'power_off', message: '设备断电告警', latitude: 22.5550, longitude: 114.0460, address: '深圳市南山区深南大道', isRead: 1, hoursAgo: 72 },
  { deviceId: 'GT06-A001', type: 'low_battery', message: '电量过低: 当前电量 18%', latitude: 22.5430, longitude: 114.0578, address: '深圳市南山区科技南路', isRead: 1, hoursAgo: 96 },
  { deviceId: 'GT06-C003', type: 'vibration', message: '异常振动告警', latitude: 22.5280, longitude: 114.0680, address: '深圳市福田区华强北', isRead: 1, hoursAgo: 120 },
  { deviceId: 'GT06-B002', type: 'speed', message: '超速告警: 当前速度 105km/h', latitude: 22.5650, longitude: 114.0300, address: '深圳市南山区月亮湾大道', isRead: 1, hoursAgo: 48 },
];

for (const a of alarms) {
  const alarmTime = new Date(now.getTime() - a.hoursAgo * 3600000);
  sqlStatements.push(`INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('${a.deviceId}', '${a.type}', '${a.message}', ${a.latitude}, ${a.longitude}, '${a.address}', ${a.isRead}, '${alarmTime.toISOString()}');`);
}

// ========== 6. SIM卡数据 ==========
const simCards = [
  {
    deviceId: 'GT06-A001',
    simNumber: '13800001001',
    iccid: '89860001234567890001',
    packageName: '30M/月 · 36个月套餐',
    totalData: 1080, // 30M * 36
    usedData: 456.8,
    status: 'active',
    activationTime: new Date(now.getTime() - 180 * 86400000).toISOString(), // 6个月前
    expiryTime: new Date(now.getTime() + 900 * 86400000).toISOString(), // 30个月后
    totalSms: 100,
    usedSms: 23,
  },
  {
    deviceId: 'GT06-B002',
    simNumber: '13800001002',
    iccid: '89860001234567890002',
    packageName: '100M/月 · 12个月套餐',
    totalData: 1200,
    usedData: 890.2,
    status: 'active',
    activationTime: new Date(now.getTime() - 240 * 86400000).toISOString(),
    expiryTime: new Date(now.getTime() + 125 * 86400000).toISOString(),
    totalSms: 200,
    usedSms: 67,
  },
  {
    deviceId: 'GT06-C003',
    simNumber: '13800001003',
    iccid: '89860001234567890003',
    packageName: '10M/月 · 24个月套餐',
    totalData: 240,
    usedData: 198.5,
    status: 'active',
    activationTime: new Date(now.getTime() - 365 * 86400000).toISOString(),
    expiryTime: new Date(now.getTime() + 365 * 86400000).toISOString(),
    totalSms: 50,
    usedSms: 12,
  },
];

for (const s of simCards) {
  sqlStatements.push(`INSERT INTO sim_cards (deviceId, simNumber, iccid, packageName, totalData, usedData, status, activationTime, expiryTime, totalSms, usedSms, createdAt, updatedAt)
VALUES ('${s.deviceId}', '${s.simNumber}', '${s.iccid}', '${s.packageName}', ${s.totalData}, ${s.usedData}, '${s.status}', '${s.activationTime}', '${s.expiryTime}', ${s.totalSms}, ${s.usedSms}, datetime('now'), datetime('now'));`);
}

// ========== 7. 指令记录 ==========
const commands = [
  { deviceId: 'GT06-A001', commandType: 'locate', commandData: '{}', status: 'executed', response: '定位成功', hoursAgo: 1 },
  { deviceId: 'GT06-A001', commandType: 'set_mode', commandData: '{"mode":"normal"}', status: 'executed', response: '设置成功', hoursAgo: 48 },
  { deviceId: 'GT06-B002', commandType: 'locate', commandData: '{}', status: 'executed', response: '定位成功', hoursAgo: 3 },
  { deviceId: 'GT06-B002', commandType: 'set_speed_threshold', commandData: '{"speed":80}', status: 'executed', response: '超速阈值已设为80km/h', hoursAgo: 72 },
  { deviceId: 'GT06-B002', commandType: 'restart', commandData: '{}', status: 'executed', response: '设备已重启', hoursAgo: 168 },
  { deviceId: 'GT06-C003', commandType: 'locate', commandData: '{}', status: 'failed', response: '设备离线，无法定位', hoursAgo: 2 },
  { deviceId: 'GT06-C003', commandType: 'set_mode', commandData: '{"mode":"powersave"}', status: 'executed', response: '已切换至省电模式', hoursAgo: 96 },
  { deviceId: 'GT06-A001', commandType: 'locate', commandData: '{}', status: 'pending', response: null, hoursAgo: 0 },
];

for (const c of commands) {
  const cmdTime = new Date(now.getTime() - c.hoursAgo * 3600000);
  const resp = c.response ? `'${c.response}'` : 'NULL';
  sqlStatements.push(`INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('${c.deviceId}', '${c.commandType}', '${c.commandData}', '${c.status}', ${resp}, '${cmdTime.toISOString()}');`);
}

// ========== 输出 SQL 文件 ==========
const sqlContent = sqlStatements.join('\n');
fs.writeFileSync(path.join(__dirname, 'seed-data.sql'), sqlContent, 'utf-8');
console.log(`Generated ${sqlStatements.length} SQL statements`);
console.log(`  - ${devices.length} devices`);
console.log(`  - ${allTracks.length} location points (today)`);
console.log(`  - 7 days historical data`);
console.log(`  - ${geofences.length} geofences`);
console.log(`  - ${alarms.length} alarms`);
console.log(`  - ${simCards.length} SIM cards`);
console.log(`  - ${commands.length} commands`);
