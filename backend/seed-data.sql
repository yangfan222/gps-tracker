INSERT OR IGNORE INTO devices (deviceId, deviceName, userId, simNumber, iccid, deviceModel, protocolType, status, batteryLevel, signalStrength, workMode, latitude, longitude, speed, direction, address, locationType, totalMileage, dailyMileage, isActivated, lastOnlineTime, createdAt, updatedAt)
VALUES ('GT06-A001', '粤B·888888 轿车', 3, '13800001001', '89860001234567890001', 'GT06N', 'GT06', 'online', 85, 78, 'normal', 22.5431, 114.0579, 0, 180, '深圳市南山区科技南路深圳湾科技生态园', 'GPS', 12680.5, 45.3, 1, '2026-04-22T08:38:31.968Z', datetime('now'), datetime('now'));
INSERT OR IGNORE INTO devices (deviceId, deviceName, userId, simNumber, iccid, deviceModel, protocolType, status, batteryLevel, signalStrength, workMode, latitude, longitude, speed, direction, address, locationType, totalMileage, dailyMileage, isActivated, lastOnlineTime, createdAt, updatedAt)
VALUES ('GT06-B002', '粤B·666666 SUV', 3, '13800001002', '89860001234567890002', 'F36', 'HL', 'online', 62, 55, 'normal', 22.555, 114.046, 35.5, 270, '深圳市南山区深南大道9966号', 'GPS', 8920.1, 78.6, 1, '2026-04-22T08:38:31.968Z', datetime('now'), datetime('now'));
INSERT OR IGNORE INTO devices (deviceId, deviceName, userId, simNumber, iccid, deviceModel, protocolType, status, batteryLevel, signalStrength, workMode, latitude, longitude, speed, direction, address, locationType, totalMileage, dailyMileage, isActivated, lastOnlineTime, createdAt, updatedAt)
VALUES ('GT06-C003', '电动车', 3, '13800001003', '89860001234567890003', 'S20', 'GT06', 'offline', 15, 20, 'powersave', 22.528, 114.068, 0, 0, '深圳市福田区华强北街道振兴路', 'LBS', 562.3, 0, 1, '2026-04-22T02:38:31.968Z', datetime('now'), datetime('now'));
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 38.4, 8, '2026-04-22T00:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.52869, 114.035773, 53.4, 56.6, 'GPS', NULL, 43.5, 12, '2026-04-22T00:00:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.529367, 114.036535, 33.4, 56.6, 'GPS', NULL, 33.5, 10, '2026-04-22T00:01:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530016, 114.037275, 65.5, 56.6, 'GPS', NULL, 30.2, 10, '2026-04-22T00:02:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530624, 114.037982, 59.9, 56.6, 'GPS', NULL, 32.2, 13, '2026-04-22T00:03:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.531181, 114.038649, 30.2, 56.6, 'GPS', NULL, 24.1, 11, '2026-04-22T00:04:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.531678, 114.039267, 69.5, 56.6, 'GPS', NULL, 36.6, 10, '2026-04-22T00:04:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 36.3, 56.6, 'GPS', NULL, 26.4, 11, '2026-04-22T00:05:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532464, 114.040338, 45.6, 56.6, 'GPS', NULL, 46.1, 10, '2026-04-22T00:06:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532748, 114.040786, 36.1, 56.6, 'GPS', NULL, 37.0, 12, '2026-04-22T00:07:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532959, 114.041175, 50.7, 56.6, 'GPS', NULL, 20.3, 11, '2026-04-22T00:08:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5331, 114.041509, 24.1, 56.6, 'GPS', NULL, 20.7, 9, '2026-04-22T00:08:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533179, 114.041793, 79.5, 56.6, 'GPS', NULL, 48.5, 13, '2026-04-22T00:09:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533202, 114.042032, 77.1, 56.6, 'GPS', NULL, 35.2, 12, '2026-04-22T00:10:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 52.5, 56.6, 'GPS', NULL, 32.7, 11, '2026-04-22T00:11:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53313, 114.042416, 77.7, 56.6, 'GPS', NULL, 34.0, 8, '2026-04-22T00:12:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533059, 114.04258, 63.2, 56.6, 'GPS', NULL, 20.6, 11, '2026-04-22T00:12:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532983, 114.04274, 30.6, 56.6, 'GPS', NULL, 42.4, 9, '2026-04-22T00:13:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532917, 114.042908, 41.1, 56.6, 'GPS', NULL, 49.8, 12, '2026-04-22T00:14:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532874, 114.043094, 51.8, 56.6, 'GPS', NULL, 28.2, 13, '2026-04-22T00:15:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532867, 114.04331, 43.1, 56.6, 'GPS', NULL, 36.4, 14, '2026-04-22T00:16:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 42.8, 56.6, 'GPS', NULL, 34.1, 11, '2026-04-22T00:16:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533006, 114.043863, 35.2, 56.6, 'GPS', NULL, 28.7, 12, '2026-04-22T00:17:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53317, 114.044215, 78.5, 56.6, 'GPS', NULL, 47.1, 14, '2026-04-22T00:18:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533405, 114.044624, 21.1, 56.6, 'GPS', NULL, 43.1, 12, '2026-04-22T00:19:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533713, 114.045091, 71, 56.6, 'GPS', NULL, 30.5, 12, '2026-04-22T00:20:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.534095, 114.045617, 43.6, 56.6, 'GPS', NULL, 46.8, 11, '2026-04-22T00:20:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.534547, 114.0462, 26.3, 56.6, 'GPS', NULL, 47.5, 14, '2026-04-22T00:21:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 54.7, 56.6, 'GPS', NULL, 34.1, 8, '2026-04-22T00:22:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53564, 114.047516, 31.4, 56.6, 'GPS', NULL, 23.4, 9, '2026-04-22T00:23:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.536263, 114.048235, 75.2, 56.6, 'GPS', NULL, 34.5, 10, '2026-04-22T00:24:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.536923, 114.048984, 49.4, 56.6, 'GPS', NULL, 25.1, 8, '2026-04-22T00:24:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537605, 114.04975, 35.9, 56.6, 'GPS', NULL, 41.4, 12, '2026-04-22T00:25:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.538298, 114.050525, 76.4, 56.6, 'GPS', NULL, 23.1, 9, '2026-04-22T00:26:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.538985, 114.051296, 77.6, 56.6, 'GPS', NULL, 38.3, 13, '2026-04-22T00:27:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 68.8, 56.6, 'GPS', NULL, 36.6, 13, '2026-04-22T00:28:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.54029, 114.052781, 57.9, 56.6, 'GPS', NULL, 47.3, 12, '2026-04-22T00:28:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.540883, 114.053476, 43.1, 56.6, 'GPS', NULL, 29.5, 9, '2026-04-22T00:29:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.54142, 114.054127, 79.9, 56.6, 'GPS', NULL, 25.5, 11, '2026-04-22T00:30:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541895, 114.054728, 30.1, 56.6, 'GPS', NULL, 27.6, 8, '2026-04-22T00:31:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542301, 114.055273, 79.9, 56.6, 'GPS', NULL, 28.5, 13, '2026-04-22T00:32:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542634, 114.05576, 71.9, 56.6, 'GPS', NULL, 36.4, 12, '2026-04-22T00:32:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 45.6, 56.6, 'GPS', NULL, 47.9, 10, '2026-04-22T00:33:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.54308, 114.056559, 28.6, 56.6, 'GPS', NULL, 31.8, 14, '2026-04-22T00:34:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5432, 114.056876, 58, 56.6, 'GPS', NULL, 43.6, 12, '2026-04-22T00:35:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543259, 114.057144, 32.6, 56.6, 'GPS', NULL, 41.9, 13, '2026-04-22T00:36:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543267, 114.057371, 25.3, 56.6, 'GPS', NULL, 27.4, 13, '2026-04-22T00:36:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543234, 114.057566, 26.6, 56.6, 'GPS', NULL, 24.2, 11, '2026-04-22T00:37:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543174, 114.057739, 72.1, 56.6, 'GPS', NULL, 35.3, 14, '2026-04-22T00:38:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 48.5, 12, '2026-04-22T00:39:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 54.7, 'GPS', NULL, 24.8, 11, '2026-04-22T04:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.544554, 114.05919, 55.1, 54.7, 'GPS', NULL, 49.0, 12, '2026-04-22T04:01:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.545464, 114.060046, 66.2, 54.7, 'GPS', NULL, 21.1, 9, '2026-04-22T04:02:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.545523, 114.06022, 42.1, 54.7, 'GPS', NULL, 42.7, 8, '2026-04-22T04:03:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.544796, 114.059766, 31.9, 54.7, 'GPS', NULL, 35.9, 8, '2026-04-22T04:04:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543691, 114.059008, 29.8, 54.7, 'GPS', NULL, 42.0, 12, '2026-04-22T04:05:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542779, 114.058406, 31.5, 54.7, 'GPS', NULL, 20.1, 10, '2026-04-22T04:06:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.54255, 114.05835, 64.2, 54.7, 'GPS', NULL, 27.0, 10, '2026-04-22T04:07:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543193, 114.058992, 51.3, 54.7, 'GPS', NULL, 26.2, 13, '2026-04-22T04:08:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.544519, 114.06018, 59.4, 54.7, 'GPS', NULL, 38.1, 13, '2026-04-22T04:09:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.546039, 114.061523, 48.9, 54.7, 'GPS', NULL, 22.0, 9, '2026-04-22T04:10:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.547181, 114.062563, 47.3, 54.7, 'GPS', NULL, 39.9, 14, '2026-04-22T04:11:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.547536, 114.062974, 42, 54.7, 'GPS', NULL, 41.1, 11, '2026-04-22T04:12:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.54704, 114.062705, 78.8, 54.7, 'GPS', NULL, 23.5, 9, '2026-04-22T04:13:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.546, 114.062, 0, 54.7, 'GPS', NULL, 39.0, 9, '2026-04-22T04:14:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.546, 114.062, 0, 234.7, 'GPS', NULL, 45.4, 10, '2026-04-22T05:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.547248, 114.062836, 79.2, 234.7, 'GPS', NULL, 42.8, 13, '2026-04-22T05:00:50.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.547452, 114.062838, 31.1, 234.7, 'GPS', NULL, 39.9, 8, '2026-04-22T05:01:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.54629, 114.061747, 73.7, 234.7, 'GPS', NULL, 40.2, 10, '2026-04-22T05:02:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.544382, 114.060058, 65.6, 234.7, 'GPS', NULL, 41.0, 10, '2026-04-22T05:03:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542863, 114.058681, 26.9, 234.7, 'GPS', NULL, 27.7, 14, '2026-04-22T05:04:10.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542599, 114.058308, 75.9, 234.7, 'GPS', NULL, 31.1, 14, '2026-04-22T05:05:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543591, 114.05894, 42.5, 234.7, 'GPS', NULL, 31.9, 8, '2026-04-22T05:05:50.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.544972, 114.059883, 62.2, 234.7, 'GPS', NULL, 35.6, 12, '2026-04-22T05:06:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.545607, 114.060229, 45.9, 234.7, 'GPS', NULL, 43.7, 9, '2026-04-22T05:07:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.544875, 114.059482, 24.5, 234.7, 'GPS', NULL, 28.0, 14, '2026-04-22T05:08:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 234.7, 'GPS', NULL, 29.6, 13, '2026-04-22T05:09:10.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 23.5, 10, '2026-04-22T10:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543168, 114.057754, 35.8, 236.6, 'GPS', NULL, 45.0, 12, '2026-04-22T10:00:54.545Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543225, 114.057599, 69.8, 236.6, 'GPS', NULL, 23.4, 12, '2026-04-22T10:01:49.090Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543261, 114.057428, 60.4, 236.6, 'GPS', NULL, 49.8, 9, '2026-04-22T10:02:43.636Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543267, 114.057232, 74.5, 236.6, 'GPS', NULL, 41.4, 10, '2026-04-22T10:03:38.181Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543234, 114.057005, 49.5, 236.6, 'GPS', NULL, 37.3, 14, '2026-04-22T10:04:32.727Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543154, 114.056741, 57, 236.6, 'GPS', NULL, 43.3, 10, '2026-04-22T10:05:27.272Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543022, 114.056435, 45.3, 236.6, 'GPS', NULL, 40.8, 10, '2026-04-22T10:06:21.818Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542833, 114.056083, 21.2, 236.6, 'GPS', NULL, 21.6, 9, '2026-04-22T10:07:16.363Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542583, 114.055683, 45.1, 236.6, 'GPS', NULL, 20.7, 11, '2026-04-22T10:08:10.909Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542273, 114.055235, 36.3, 236.6, 'GPS', NULL, 34.1, 12, '2026-04-22T10:09:05.454Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541903, 114.054739, 61, 236.6, 'GPS', NULL, 43.1, 12, '2026-04-22T10:10:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541476, 114.054197, 36.8, 236.6, 'GPS', NULL, 21.8, 13, '2026-04-22T10:10:54.545Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.540997, 114.053613, 45.5, 236.6, 'GPS', NULL, 47.7, 14, '2026-04-22T10:11:49.090Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.540471, 114.052991, 65.4, 236.6, 'GPS', NULL, 48.0, 11, '2026-04-22T10:12:43.636Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539906, 114.052339, 69.9, 236.6, 'GPS', NULL, 36.1, 9, '2026-04-22T10:13:38.181Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53931, 114.051662, 50.8, 236.6, 'GPS', NULL, 29.0, 8, '2026-04-22T10:14:32.727Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.538694, 114.050969, 67.9, 236.6, 'GPS', NULL, 46.4, 10, '2026-04-22T10:15:27.272Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.538067, 114.050267, 39.2, 236.6, 'GPS', NULL, 26.3, 11, '2026-04-22T10:16:21.818Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53744, 114.049565, 64.9, 236.6, 'GPS', NULL, 21.1, 11, '2026-04-22T10:17:16.363Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.536823, 114.048871, 27.8, 236.6, 'GPS', NULL, 24.2, 12, '2026-04-22T10:18:10.909Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.536228, 114.048194, 49.2, 236.6, 'GPS', NULL, 32.7, 8, '2026-04-22T10:19:05.454Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535663, 114.047542, 59.5, 236.6, 'GPS', NULL, 45.2, 10, '2026-04-22T10:20:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535136, 114.046921, 35.4, 236.6, 'GPS', NULL, 28.1, 9, '2026-04-22T10:20:54.545Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.534657, 114.046337, 28.6, 236.6, 'GPS', NULL, 33.3, 13, '2026-04-22T10:21:49.090Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53423, 114.045795, 51.3, 236.6, 'GPS', NULL, 29.3, 13, '2026-04-22T10:22:43.636Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53386, 114.045298, 60.4, 236.6, 'GPS', NULL, 21.9, 13, '2026-04-22T10:23:38.181Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 37.9, 236.6, 'GPS', NULL, 24.7, 14, '2026-04-22T10:24:32.727Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533301, 114.04445, 51.6, 236.6, 'GPS', NULL, 48.3, 8, '2026-04-22T10:25:27.272Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533111, 114.044098, 52.9, 236.6, 'GPS', NULL, 24.6, 12, '2026-04-22T10:26:21.818Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532979, 114.043792, 67.2, 236.6, 'GPS', NULL, 41.6, 13, '2026-04-22T10:27:16.363Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532899, 114.043528, 44.4, 236.6, 'GPS', NULL, 37.1, 8, '2026-04-22T10:28:10.909Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532866, 114.043301, 69, 236.6, 'GPS', NULL, 20.8, 9, '2026-04-22T10:29:05.454Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532872, 114.043106, 75.3, 236.6, 'GPS', NULL, 27.0, 10, '2026-04-22T10:30:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532909, 114.042934, 43.7, 236.6, 'GPS', NULL, 32.3, 8, '2026-04-22T10:30:54.545Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532966, 114.04278, 28.1, 236.6, 'GPS', NULL, 34.9, 9, '2026-04-22T10:31:49.090Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533033, 114.042633, 27.4, 236.6, 'GPS', NULL, 25.1, 8, '2026-04-22T10:32:43.636Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533101, 114.042487, 77.4, 236.6, 'GPS', NULL, 33.5, 9, '2026-04-22T10:33:38.181Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533158, 114.042332, 50, 236.6, 'GPS', NULL, 37.8, 12, '2026-04-22T10:34:32.727Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533194, 114.042161, 79.4, 236.6, 'GPS', NULL, 42.5, 12, '2026-04-22T10:35:27.272Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5332, 114.041965, 62.8, 236.6, 'GPS', NULL, 22.1, 12, '2026-04-22T10:36:21.818Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533167, 114.041739, 32.1, 236.6, 'GPS', NULL, 32.9, 10, '2026-04-22T10:37:16.363Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533088, 114.041475, 27.9, 236.6, 'GPS', NULL, 29.5, 11, '2026-04-22T10:38:10.909Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532955, 114.041168, 78.5, 236.6, 'GPS', NULL, 44.8, 12, '2026-04-22T10:39:05.454Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532766, 114.040816, 30.2, 236.6, 'GPS', NULL, 38.1, 13, '2026-04-22T10:40:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532517, 114.040417, 65.6, 236.6, 'GPS', NULL, 39.4, 13, '2026-04-22T10:40:54.545Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532207, 114.039968, 25.4, 236.6, 'GPS', NULL, 30.9, 10, '2026-04-22T10:41:49.090Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.531837, 114.039472, 75, 236.6, 'GPS', NULL, 37.5, 8, '2026-04-22T10:42:43.636Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53141, 114.03893, 56.3, 236.6, 'GPS', NULL, 33.1, 14, '2026-04-22T10:43:38.181Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53093, 114.038346, 65.9, 236.6, 'GPS', NULL, 44.9, 11, '2026-04-22T10:44:32.727Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530404, 114.037725, 68.1, 236.6, 'GPS', NULL, 27.4, 8, '2026-04-22T10:45:27.272Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.529839, 114.037072, 73.3, 236.6, 'GPS', NULL, 36.2, 11, '2026-04-22T10:46:21.818Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.529243, 114.036395, 29, 236.6, 'GPS', NULL, 35.0, 12, '2026-04-22T10:47:16.363Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528627, 114.035702, 44.6, 236.6, 'GPS', NULL, 22.3, 14, '2026-04-22T10:48:10.909Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 46.7, 11, '2026-04-22T10:49:05.454Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 309.8, 'GPS', NULL, 48.9, 14, '2026-04-22T01:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555989, 114.045908, 47.6, 309.8, 'GPS', NULL, 22.9, 9, '2026-04-22T01:00:51.428Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556935, 114.045783, 69.2, 309.8, 'GPS', NULL, 38.1, 14, '2026-04-22T01:01:42.857Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.557802, 114.045594, 34.6, 309.8, 'GPS', NULL, 29.1, 8, '2026-04-22T01:02:34.285Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.558555, 114.045315, 49.9, 309.8, 'GPS', NULL, 46.7, 14, '2026-04-22T01:03:25.714Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559172, 114.044926, 22.7, 309.8, 'GPS', NULL, 26.1, 11, '2026-04-22T01:04:17.142Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559639, 114.044417, 70.3, 309.8, 'GPS', NULL, 31.7, 10, '2026-04-22T01:05:08.571Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559953, 114.043786, 54.8, 309.8, 'GPS', NULL, 34.7, 10, '2026-04-22T01:06:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.560125, 114.043042, 20.9, 309.8, 'GPS', NULL, 35.1, 14, '2026-04-22T01:06:51.428Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.560176, 114.0422, 28.4, 309.8, 'GPS', NULL, 25.9, 14, '2026-04-22T01:07:42.857Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.560134, 114.041284, 42.6, 309.8, 'GPS', NULL, 30.0, 12, '2026-04-22T01:08:34.285Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.560037, 114.040324, 78.6, 309.8, 'GPS', NULL, 38.4, 9, '2026-04-22T01:09:25.714Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559927, 114.039353, 39.5, 309.8, 'GPS', NULL, 42.8, 14, '2026-04-22T01:10:17.142Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559844, 114.038404, 27.7, 309.8, 'GPS', NULL, 43.3, 12, '2026-04-22T01:11:08.571Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559829, 114.03751, 27, 309.8, 'GPS', NULL, 40.6, 11, '2026-04-22T01:12:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559917, 114.036698, 29.1, 309.8, 'GPS', NULL, 43.7, 11, '2026-04-22T01:12:51.428Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.560135, 114.03599, 58.5, 309.8, 'GPS', NULL, 28.9, 14, '2026-04-22T01:13:42.857Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.5605, 114.0354, 77.5, 309.8, 'GPS', NULL, 31.5, 9, '2026-04-22T01:14:34.285Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.561018, 114.034932, 66.4, 309.8, 'GPS', NULL, 28.0, 11, '2026-04-22T01:15:25.714Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.561682, 114.034581, 55.2, 309.8, 'GPS', NULL, 22.0, 12, '2026-04-22T01:16:17.142Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.562476, 114.034334, 73.1, 309.8, 'GPS', NULL, 37.5, 14, '2026-04-22T01:17:08.571Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.563373, 114.034169, 44.8, 309.8, 'GPS', NULL, 30.4, 10, '2026-04-22T01:18:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.564338, 114.034059, 38.9, 309.8, 'GPS', NULL, 30.7, 9, '2026-04-22T01:18:51.428Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.565332, 114.033971, 57.1, 309.8, 'GPS', NULL, 27.2, 10, '2026-04-22T01:19:42.857Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.566311, 114.033872, 40.1, 309.8, 'GPS', NULL, 33.3, 14, '2026-04-22T01:20:34.285Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.567235, 114.033729, 38.6, 309.8, 'GPS', NULL, 37.8, 11, '2026-04-22T01:21:25.714Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.568067, 114.033512, 37.9, 309.8, 'GPS', NULL, 39.3, 13, '2026-04-22T01:22:17.142Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.568777, 114.033198, 28.3, 309.8, 'GPS', NULL, 35.7, 13, '2026-04-22T01:23:08.571Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.569344, 114.03277, 29.6, 309.8, 'GPS', NULL, 26.8, 13, '2026-04-22T01:24:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.56976, 114.03222, 32.3, 309.8, 'GPS', NULL, 40.5, 12, '2026-04-22T01:24:51.428Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.570026, 114.03155, 29.5, 309.8, 'GPS', NULL, 42.8, 9, '2026-04-22T01:25:42.857Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.570154, 114.030771, 59.4, 309.8, 'GPS', NULL, 49.4, 10, '2026-04-22T01:26:34.285Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.570171, 114.029901, 62.1, 309.8, 'GPS', NULL, 21.9, 13, '2026-04-22T01:27:25.714Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.570106, 114.028967, 75, 309.8, 'GPS', NULL, 27.0, 13, '2026-04-22T01:28:17.142Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.57, 114.028, 0, 309.8, 'GPS', NULL, 33.8, 12, '2026-04-22T01:29:08.571Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.57, 114.028, 0, 110.1, 'GPS', NULL, 28.0, 8, '2026-04-22T02:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.56977, 114.029979, 59.1, 110.1, 'GPS', NULL, 30.1, 12, '2026-04-22T02:00:54.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.569526, 114.031947, 29.3, 110.1, 'GPS', NULL, 42.8, 13, '2026-04-22T02:01:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.569254, 114.033893, 42.3, 110.1, 'GPS', NULL, 25.9, 13, '2026-04-22T02:02:42.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.568942, 114.035807, 23.4, 110.1, 'GPS', NULL, 43.1, 10, '2026-04-22T02:03:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.568579, 114.03768, 28.4, 110.1, 'GPS', NULL, 37.7, 10, '2026-04-22T02:04:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.568155, 114.039504, 47.2, 110.1, 'GPS', NULL, 48.8, 10, '2026-04-22T02:05:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.567664, 114.041274, 32.2, 110.1, 'GPS', NULL, 47.9, 13, '2026-04-22T02:06:18.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.567101, 114.042987, 64.1, 110.1, 'GPS', NULL, 44.6, 10, '2026-04-22T02:07:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.566464, 114.044641, 65.3, 110.1, 'GPS', NULL, 31.4, 14, '2026-04-22T02:08:06.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.565754, 114.046236, 33, 110.1, 'GPS', NULL, 20.1, 9, '2026-04-22T02:09:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.564976, 114.047776, 66.2, 110.1, 'GPS', NULL, 49.7, 13, '2026-04-22T02:09:54.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.564134, 114.049266, 39.3, 110.1, 'GPS', NULL, 41.5, 12, '2026-04-22T02:10:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.563237, 114.050712, 57.8, 110.1, 'GPS', NULL, 38.8, 12, '2026-04-22T02:11:42.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.562296, 114.052123, 73.1, 110.1, 'GPS', NULL, 30.9, 11, '2026-04-22T02:12:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.561324, 114.053508, 43.1, 110.1, 'GPS', NULL, 25.9, 12, '2026-04-22T02:13:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.560332, 114.054878, 41.7, 110.1, 'GPS', NULL, 43.5, 13, '2026-04-22T02:14:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.559336, 114.056244, 39.9, 110.1, 'GPS', NULL, 45.0, 13, '2026-04-22T02:15:18.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.558349, 114.057618, 68.8, 110.1, 'GPS', NULL, 47.8, 14, '2026-04-22T02:16:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.557386, 114.059011, 57.9, 110.1, 'GPS', NULL, 38.6, 13, '2026-04-22T02:17:06.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556459, 114.060432, 71.7, 110.1, 'GPS', NULL, 37.5, 11, '2026-04-22T02:18:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555579, 114.061892, 70, 110.1, 'GPS', NULL, 38.5, 10, '2026-04-22T02:18:54.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554757, 114.063398, 32.2, 110.1, 'GPS', NULL, 49.6, 8, '2026-04-22T02:19:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554001, 114.064956, 52.7, 110.1, 'GPS', NULL, 21.7, 12, '2026-04-22T02:20:42.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553315, 114.066571, 77, 110.1, 'GPS', NULL, 41.7, 12, '2026-04-22T02:21:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552703, 114.068244, 57.8, 110.1, 'GPS', NULL, 40.5, 13, '2026-04-22T02:22:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552164, 114.069976, 58, 110.1, 'GPS', NULL, 25.3, 11, '2026-04-22T02:23:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551696, 114.071765, 46.7, 110.1, 'GPS', NULL, 41.4, 8, '2026-04-22T02:24:18.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551293, 114.073606, 76.4, 110.1, 'GPS', NULL, 24.6, 9, '2026-04-22T02:25:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550948, 114.075493, 24.9, 110.1, 'GPS', NULL, 43.5, 11, '2026-04-22T02:26:06.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550651, 114.077419, 37.3, 110.1, 'GPS', NULL, 20.7, 14, '2026-04-22T02:27:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55039, 114.079373, 59.8, 110.1, 'GPS', NULL, 21.9, 9, '2026-04-22T02:27:54.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550152, 114.081346, 74.8, 110.1, 'GPS', NULL, 32.7, 14, '2026-04-22T02:28:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549924, 114.083327, 54, 110.1, 'GPS', NULL, 37.7, 11, '2026-04-22T02:29:42.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549691, 114.085304, 47.2, 110.1, 'GPS', NULL, 36.4, 14, '2026-04-22T02:30:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549439, 114.087266, 58.2, 110.1, 'GPS', NULL, 22.8, 8, '2026-04-22T02:31:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549155, 114.089202, 64.5, 110.1, 'GPS', NULL, 24.2, 14, '2026-04-22T02:32:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548827, 114.091103, 31.2, 110.1, 'GPS', NULL, 25.6, 12, '2026-04-22T02:33:18.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548445, 114.09296, 77.6, 110.1, 'GPS', NULL, 39.6, 10, '2026-04-22T02:34:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.547999, 114.094767, 73.1, 110.1, 'GPS', NULL, 40.5, 12, '2026-04-22T02:35:06.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.547485, 114.096518, 39.1, 110.1, 'GPS', NULL, 45.9, 11, '2026-04-22T02:36:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546897, 114.098211, 38.1, 110.1, 'GPS', NULL, 22.6, 11, '2026-04-22T02:36:54.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546236, 114.099846, 42.9, 110.1, 'GPS', NULL, 40.2, 10, '2026-04-22T02:37:48.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.545502, 114.101422, 41, 110.1, 'GPS', NULL, 21.6, 14, '2026-04-22T02:38:42.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.544702, 114.102945, 54.5, 110.1, 'GPS', NULL, 23.4, 10, '2026-04-22T02:39:36.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.54384, 114.104419, 44.1, 110.1, 'GPS', NULL, 27.2, 9, '2026-04-22T02:40:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.542928, 114.105852, 51.6, 110.1, 'GPS', NULL, 21.4, 14, '2026-04-22T02:41:24.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.541975, 114.107253, 56.6, 110.1, 'GPS', NULL, 37.7, 9, '2026-04-22T02:42:18.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.540995, 114.108632, 48.9, 110.1, 'GPS', NULL, 21.2, 10, '2026-04-22T02:43:12.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.54, 114.11, 0, 110.1, 'GPS', NULL, 39.5, 10, '2026-04-22T02:44:06.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.54, 114.11, 0, 244.5, 'GPS', NULL, 22.2, 9, '2026-04-22T06:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.539966, 114.109306, 49.4, 244.5, 'GPS', NULL, 39.9, 8, '2026-04-22T06:00:52.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.539904, 114.10859, 64.2, 244.5, 'GPS', NULL, 20.8, 10, '2026-04-22T06:01:45.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.539788, 114.10783, 60.7, 244.5, 'GPS', NULL, 34.2, 14, '2026-04-22T06:02:37.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.539595, 114.107009, 65.5, 244.5, 'GPS', NULL, 21.3, 8, '2026-04-22T06:03:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.539306, 114.106111, 64.8, 244.5, 'GPS', NULL, 30.0, 12, '2026-04-22T06:04:22.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.538908, 114.105127, 57.5, 244.5, 'GPS', NULL, 43.8, 8, '2026-04-22T06:05:15.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.538396, 114.10405, 79.4, 244.5, 'GPS', NULL, 43.8, 11, '2026-04-22T06:06:07.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.537767, 114.102881, 70.1, 244.5, 'GPS', NULL, 34.8, 10, '2026-04-22T06:07:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.537031, 114.101624, 75.2, 244.5, 'GPS', NULL, 31.9, 14, '2026-04-22T06:07:52.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.536198, 114.100292, 31.6, 244.5, 'GPS', NULL, 30.3, 13, '2026-04-22T06:08:45.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.535288, 114.098897, 35.5, 244.5, 'GPS', NULL, 36.2, 8, '2026-04-22T06:09:37.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.534325, 114.09746, 24.8, 244.5, 'GPS', NULL, 31.7, 9, '2026-04-22T06:10:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.533333, 114.096, 60.9, 244.5, 'GPS', NULL, 21.2, 12, '2026-04-22T06:11:22.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.532342, 114.09454, 28.7, 244.5, 'GPS', NULL, 35.2, 10, '2026-04-22T06:12:15.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.531378, 114.093103, 29.8, 244.5, 'GPS', NULL, 31.1, 13, '2026-04-22T06:13:07.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.530469, 114.091708, 70.4, 244.5, 'GPS', NULL, 34.0, 12, '2026-04-22T06:14:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.529636, 114.090376, 25.5, 244.5, 'GPS', NULL, 31.6, 14, '2026-04-22T06:14:52.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.528899, 114.089119, 53.4, 244.5, 'GPS', NULL, 22.5, 14, '2026-04-22T06:15:45.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.528271, 114.08795, 40, 244.5, 'GPS', NULL, 43.6, 11, '2026-04-22T06:16:37.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.527758, 114.086873, 67.6, 244.5, 'GPS', NULL, 35.8, 10, '2026-04-22T06:17:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.527361, 114.085889, 60.5, 244.5, 'GPS', NULL, 40.0, 11, '2026-04-22T06:18:22.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.527072, 114.084991, 30.3, 244.5, 'GPS', NULL, 26.9, 12, '2026-04-22T06:19:15.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526879, 114.08417, 64.3, 244.5, 'GPS', NULL, 40.3, 13, '2026-04-22T06:20:07.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526763, 114.08341, 68.6, 244.5, 'GPS', NULL, 46.7, 8, '2026-04-22T06:21:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526701, 114.082694, 45.1, 244.5, 'GPS', NULL, 23.0, 14, '2026-04-22T06:21:52.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526667, 114.082, 41.6, 244.5, 'GPS', NULL, 40.5, 13, '2026-04-22T06:22:45.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526632, 114.081306, 75.4, 244.5, 'GPS', NULL, 31.7, 12, '2026-04-22T06:23:37.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.52657, 114.08059, 25.2, 244.5, 'GPS', NULL, 43.9, 9, '2026-04-22T06:24:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526454, 114.07983, 67.7, 244.5, 'GPS', NULL, 45.4, 12, '2026-04-22T06:25:22.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526261, 114.079009, 40.2, 244.5, 'GPS', NULL, 22.0, 11, '2026-04-22T06:26:15.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.525973, 114.078111, 47, 244.5, 'GPS', NULL, 42.1, 12, '2026-04-22T06:27:07.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.525575, 114.077127, 53.4, 244.5, 'GPS', NULL, 32.9, 10, '2026-04-22T06:28:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.525062, 114.07605, 78.9, 244.5, 'GPS', NULL, 25.6, 11, '2026-04-22T06:28:52.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.524434, 114.074881, 53.1, 244.5, 'GPS', NULL, 41.4, 9, '2026-04-22T06:29:45.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.523697, 114.073624, 27.3, 244.5, 'GPS', NULL, 31.8, 13, '2026-04-22T06:30:37.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.522865, 114.072292, 24.3, 244.5, 'GPS', NULL, 45.2, 14, '2026-04-22T06:31:30.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.521955, 114.070897, 70.7, 244.5, 'GPS', NULL, 42.9, 12, '2026-04-22T06:32:22.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.520991, 114.06946, 33.8, 244.5, 'GPS', NULL, 40.3, 10, '2026-04-22T06:33:15.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.52, 114.068, 0, 244.5, 'GPS', NULL, 39.3, 8, '2026-04-22T06:34:07.500Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.52, 114.068, 0, 327.8, 'GPS', NULL, 32.4, 10, '2026-04-22T08:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.521221, 114.06784, 38.4, 327.8, 'GPS', NULL, 27.3, 14, '2026-04-22T08:00:53.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.522422, 114.067665, 41.4, 327.8, 'GPS', NULL, 45.8, 10, '2026-04-22T08:01:46.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.523585, 114.067459, 61, 327.8, 'GPS', NULL, 47.7, 11, '2026-04-22T08:02:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.524693, 114.067209, 22.5, 327.8, 'GPS', NULL, 34.9, 10, '2026-04-22T08:03:33.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.525733, 114.066904, 32.5, 327.8, 'GPS', NULL, 25.7, 13, '2026-04-22T08:04:26.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.526692, 114.066535, 72.8, 327.8, 'GPS', NULL, 30.5, 14, '2026-04-22T08:05:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.527563, 114.066096, 43.5, 327.8, 'GPS', NULL, 23.7, 12, '2026-04-22T08:06:13.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.528343, 114.065584, 67.7, 327.8, 'GPS', NULL, 37.6, 13, '2026-04-22T08:07:06.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.529033, 114.064999, 79.3, 327.8, 'GPS', NULL, 20.2, 9, '2026-04-22T08:08:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.529637, 114.064346, 25, 327.8, 'GPS', NULL, 34.6, 8, '2026-04-22T08:08:53.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.530164, 114.063631, 28.7, 327.8, 'GPS', NULL, 36.4, 8, '2026-04-22T08:09:46.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.530627, 114.062865, 38, 327.8, 'GPS', NULL, 49.4, 14, '2026-04-22T08:10:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.53104, 114.062059, 68.5, 327.8, 'GPS', NULL, 20.3, 11, '2026-04-22T08:11:33.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.531421, 114.061228, 25.5, 327.8, 'GPS', NULL, 29.1, 11, '2026-04-22T08:12:26.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.531789, 114.060386, 66.6, 327.8, 'GPS', NULL, 28.6, 8, '2026-04-22T08:13:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.532164, 114.059549, 74.4, 327.8, 'GPS', NULL, 22.0, 13, '2026-04-22T08:14:13.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.532564, 114.058733, 26.8, 327.8, 'GPS', NULL, 36.4, 10, '2026-04-22T08:15:06.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.533008, 114.057952, 33.4, 327.8, 'GPS', NULL, 47.5, 11, '2026-04-22T08:16:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.533513, 114.057219, 44.4, 327.8, 'GPS', NULL, 24.7, 12, '2026-04-22T08:16:53.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.53409, 114.056545, 56.7, 327.8, 'GPS', NULL, 48.5, 8, '2026-04-22T08:17:46.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.53475, 114.055937, 38.3, 327.8, 'GPS', NULL, 40.4, 13, '2026-04-22T08:18:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.5355, 114.0554, 57.6, 327.8, 'GPS', NULL, 42.6, 8, '2026-04-22T08:19:33.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.536341, 114.054937, 26.2, 327.8, 'GPS', NULL, 39.8, 8, '2026-04-22T08:20:26.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.537272, 114.054545, 71.6, 327.8, 'GPS', NULL, 32.8, 14, '2026-04-22T08:21:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.538285, 114.054219, 73.3, 327.8, 'GPS', NULL, 48.3, 13, '2026-04-22T08:22:13.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.539372, 114.053952, 20.6, 327.8, 'GPS', NULL, 34.3, 8, '2026-04-22T08:23:06.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.540519, 114.053733, 38.4, 327.8, 'GPS', NULL, 34.5, 8, '2026-04-22T08:24:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.541709, 114.053549, 67.3, 327.8, 'GPS', NULL, 21.6, 11, '2026-04-22T08:24:53.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.542926, 114.053386, 38.8, 327.8, 'GPS', NULL, 21.1, 12, '2026-04-22T08:25:46.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.544148, 114.053228, 48.7, 327.8, 'GPS', NULL, 23.1, 8, '2026-04-22T08:26:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.545358, 114.053059, 28.6, 327.8, 'GPS', NULL, 24.2, 10, '2026-04-22T08:27:33.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546536, 114.052865, 27, 327.8, 'GPS', NULL, 28.5, 11, '2026-04-22T08:28:26.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.547664, 114.052631, 52, 327.8, 'GPS', NULL, 25.7, 9, '2026-04-22T08:29:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548728, 114.052346, 41.6, 327.8, 'GPS', NULL, 28.8, 11, '2026-04-22T08:30:13.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549715, 114.051999, 68.2, 327.8, 'GPS', NULL, 27.0, 9, '2026-04-22T08:31:06.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550616, 114.051584, 43.2, 327.8, 'GPS', NULL, 25.9, 9, '2026-04-22T08:32:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551427, 114.051096, 34.4, 327.8, 'GPS', NULL, 41.7, 10, '2026-04-22T08:32:53.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552146, 114.050535, 20.2, 327.8, 'GPS', NULL, 42.2, 9, '2026-04-22T08:33:46.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552778, 114.049904, 57.8, 327.8, 'GPS', NULL, 49.9, 11, '2026-04-22T08:34:40.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55333, 114.049209, 38.8, 327.8, 'GPS', NULL, 30.1, 13, '2026-04-22T08:35:33.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553812, 114.048459, 68.4, 327.8, 'GPS', NULL, 21.9, 9, '2026-04-22T08:36:26.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55424, 114.047665, 28.9, 327.8, 'GPS', NULL, 34.3, 9, '2026-04-22T08:37:20.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55463, 114.04684, 62.6, 327.8, 'GPS', NULL, 22.0, 14, '2026-04-22T08:38:13.333Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 327.8, 'GPS', NULL, 25.6, 13, '2026-04-22T08:39:06.666Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.528, 114.068, 0, 35.5, 'GPS', NULL, 45.2, 11, '2026-04-22T11:00:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.52932, 114.069025, 33.5, 35.5, 'GPS', NULL, 26.9, 8, '2026-04-22T11:01:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.530411, 114.069866, 25.7, 35.5, 'GPS', NULL, 49.1, 14, '2026-04-22T11:02:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.531098, 114.070384, 48.7, 35.5, 'GPS', NULL, 45.2, 11, '2026-04-22T11:03:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.531305, 114.070518, 58.6, 35.5, 'GPS', NULL, 48.2, 9, '2026-04-22T11:04:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.531071, 114.070299, 56.5, 35.5, 'GPS', NULL, 34.6, 14, '2026-04-22T11:05:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.53054, 114.069842, 30.7, 35.5, 'GPS', NULL, 27.8, 14, '2026-04-22T11:06:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.52993, 114.069323, 33.1, 35.5, 'GPS', NULL, 41.2, 9, '2026-04-22T11:07:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.529476, 114.068928, 55.8, 35.5, 'GPS', NULL, 32.7, 11, '2026-04-22T11:08:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.529377, 114.068817, 52.7, 35.5, 'GPS', NULL, 36.3, 14, '2026-04-22T11:09:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.529745, 114.069081, 60.2, 35.5, 'GPS', NULL, 25.8, 9, '2026-04-22T11:10:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.530581, 114.069718, 33.7, 35.5, 'GPS', NULL, 40.4, 12, '2026-04-22T11:11:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.531772, 114.070638, 24.1, 35.5, 'GPS', NULL, 48.6, 13, '2026-04-22T11:12:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.533119, 114.071684, 67.4, 35.5, 'GPS', NULL, 23.5, 12, '2026-04-22T11:13:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.534386, 114.072667, 23.2, 35.5, 'GPS', NULL, 21.5, 11, '2026-04-22T11:14:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.535358, 114.073413, 28, 35.5, 'GPS', NULL, 26.6, 14, '2026-04-22T11:15:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.535888, 114.073805, 41.8, 35.5, 'GPS', NULL, 50.0, 9, '2026-04-22T11:16:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.535937, 114.073813, 67.7, 35.5, 'GPS', NULL, 26.3, 14, '2026-04-22T11:17:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.535583, 114.073498, 60.9, 35.5, 'GPS', NULL, 46.5, 12, '2026-04-22T11:18:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-C003', 22.535, 114.073, 0, 35.5, 'GPS', NULL, 20.9, 10, '2026-04-22T11:19:00.000Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 39.6, 13, '2026-04-21T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 46.4, 56.6, 'GPS', NULL, 32.3, 11, '2026-04-21T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 55.7, 56.6, 'GPS', NULL, 44.2, 11, '2026-04-21T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 36.4, 56.6, 'GPS', NULL, 48.4, 12, '2026-04-21T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 23.7, 56.6, 'GPS', NULL, 40.3, 11, '2026-04-21T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 26.6, 56.6, 'GPS', NULL, 23.6, 14, '2026-04-21T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 55.9, 56.6, 'GPS', NULL, 22.5, 12, '2026-04-21T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 38, 56.6, 'GPS', NULL, 30.5, 11, '2026-04-21T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 69.8, 56.6, 'GPS', NULL, 24.4, 11, '2026-04-21T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 32.7, 56.6, 'GPS', NULL, 41.3, 8, '2026-04-21T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 70, 56.6, 'GPS', NULL, 26.4, 9, '2026-04-21T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 66.7, 56.6, 'GPS', NULL, 23.3, 8, '2026-04-21T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 63.8, 56.6, 'GPS', NULL, 35.6, 11, '2026-04-21T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 24.3, 56.6, 'GPS', NULL, 25.3, 14, '2026-04-21T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 47.7, 13, '2026-04-21T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 37.8, 11, '2026-04-21T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 62.4, 236.6, 'GPS', NULL, 23.8, 12, '2026-04-21T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 23.6, 236.6, 'GPS', NULL, 36.0, 12, '2026-04-21T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 30.8, 236.6, 'GPS', NULL, 28.0, 8, '2026-04-21T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 76.5, 236.6, 'GPS', NULL, 41.1, 12, '2026-04-21T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 65.8, 236.6, 'GPS', NULL, 25.1, 13, '2026-04-21T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 50.5, 236.6, 'GPS', NULL, 33.8, 9, '2026-04-21T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 50.3, 236.6, 'GPS', NULL, 46.4, 13, '2026-04-21T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 23.2, 236.6, 'GPS', NULL, 34.4, 11, '2026-04-21T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 68.2, 236.6, 'GPS', NULL, 30.7, 10, '2026-04-21T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 49.2, 236.6, 'GPS', NULL, 25.4, 13, '2026-04-21T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 59.6, 236.6, 'GPS', NULL, 39.8, 13, '2026-04-21T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 59, 236.6, 'GPS', NULL, 32.2, 8, '2026-04-21T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 29.4, 236.6, 'GPS', NULL, 23.1, 13, '2026-04-21T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 21.6, 13, '2026-04-21T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 108.4, 'GPS', NULL, 35.7, 9, '2026-04-21T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555493, 114.048136, 61.8, 108.4, 'GPS', NULL, 30.1, 8, '2026-04-21T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555757, 114.050088, 24.1, 108.4, 'GPS', NULL, 29.9, 11, '2026-04-21T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555618, 114.051718, 48.8, 108.4, 'GPS', NULL, 39.1, 10, '2026-04-21T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554997, 114.052963, 29.1, 108.4, 'GPS', NULL, 46.4, 13, '2026-04-21T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553936, 114.053855, 58, 108.4, 'GPS', NULL, 45.1, 12, '2026-04-21T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552578, 114.05451, 47.2, 108.4, 'GPS', NULL, 27.6, 11, '2026-04-21T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551141, 114.055102, 39.7, 108.4, 'GPS', NULL, 46.8, 11, '2026-04-21T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.54986, 114.055819, 57, 108.4, 'GPS', NULL, 33.8, 10, '2026-04-21T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548934, 114.05682, 20.4, 108.4, 'GPS', NULL, 43.3, 10, '2026-04-21T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548476, 114.058194, 59.9, 108.4, 'GPS', NULL, 35.6, 11, '2026-04-21T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548484, 114.059942, 28.8, 108.4, 'GPS', NULL, 21.2, 14, '2026-04-21T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548848, 114.061975, 59.9, 108.4, 'GPS', NULL, 23.4, 10, '2026-04-21T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549368, 114.064132, 47.4, 108.4, 'GPS', NULL, 34.2, 10, '2026-04-21T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549809, 114.066226, 78.2, 108.4, 'GPS', NULL, 45.8, 10, '2026-04-21T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549953, 114.068083, 26, 108.4, 'GPS', NULL, 49.6, 8, '2026-04-21T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549656, 114.069587, 69.6, 108.4, 'GPS', NULL, 20.9, 8, '2026-04-21T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548879, 114.070706, 61.7, 108.4, 'GPS', NULL, 24.6, 14, '2026-04-21T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.547698, 114.071503, 33.3, 108.4, 'GPS', NULL, 40.6, 10, '2026-04-21T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546288, 114.072116, 0, 108.4, 'GPS', NULL, 38.4, 12, '2026-04-21T01:57:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 24.1, 12, '2026-04-20T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 60.5, 56.6, 'GPS', NULL, 34.4, 11, '2026-04-20T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 65.1, 56.6, 'GPS', NULL, 41.7, 13, '2026-04-20T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 30.2, 56.6, 'GPS', NULL, 20.6, 13, '2026-04-20T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 31, 56.6, 'GPS', NULL, 27.2, 10, '2026-04-20T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 50.4, 56.6, 'GPS', NULL, 49.1, 8, '2026-04-20T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 74, 56.6, 'GPS', NULL, 27.1, 14, '2026-04-20T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 36.6, 56.6, 'GPS', NULL, 45.7, 12, '2026-04-20T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 50.4, 56.6, 'GPS', NULL, 23.4, 12, '2026-04-20T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 27.9, 56.6, 'GPS', NULL, 33.6, 14, '2026-04-20T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 68.2, 56.6, 'GPS', NULL, 38.1, 11, '2026-04-20T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 70.2, 56.6, 'GPS', NULL, 28.1, 13, '2026-04-20T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 52.7, 56.6, 'GPS', NULL, 26.9, 12, '2026-04-20T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 56.5, 56.6, 'GPS', NULL, 41.8, 9, '2026-04-20T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 42.9, 10, '2026-04-20T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 42.5, 12, '2026-04-20T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 50.4, 236.6, 'GPS', NULL, 42.4, 10, '2026-04-20T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 28.1, 236.6, 'GPS', NULL, 25.1, 10, '2026-04-20T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 65.2, 236.6, 'GPS', NULL, 24.1, 8, '2026-04-20T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 60.3, 236.6, 'GPS', NULL, 27.9, 14, '2026-04-20T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 42.6, 236.6, 'GPS', NULL, 39.0, 11, '2026-04-20T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 45, 236.6, 'GPS', NULL, 30.6, 13, '2026-04-20T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 42.8, 236.6, 'GPS', NULL, 33.6, 9, '2026-04-20T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 20.5, 236.6, 'GPS', NULL, 22.7, 11, '2026-04-20T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 53.2, 236.6, 'GPS', NULL, 30.5, 11, '2026-04-20T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 73.9, 236.6, 'GPS', NULL, 24.2, 9, '2026-04-20T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 33.2, 236.6, 'GPS', NULL, 49.6, 9, '2026-04-20T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 33.5, 236.6, 'GPS', NULL, 32.0, 10, '2026-04-20T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 36.3, 236.6, 'GPS', NULL, 26.0, 12, '2026-04-20T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 35.3, 10, '2026-04-20T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 98.1, 'GPS', NULL, 23.4, 11, '2026-04-20T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55564, 114.04895, 72.6, 98.1, 'GPS', NULL, 34.6, 13, '2026-04-20T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556052, 114.051717, 60.2, 98.1, 'GPS', NULL, 47.5, 8, '2026-04-20T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556059, 114.054161, 46.4, 98.1, 'GPS', NULL, 30.2, 13, '2026-04-20T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555586, 114.05622, 49.6, 98.1, 'GPS', NULL, 38.9, 8, '2026-04-20T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554671, 114.057927, 60.6, 98.1, 'GPS', NULL, 29.3, 11, '2026-04-20T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553461, 114.059396, 25.9, 98.1, 'GPS', NULL, 32.2, 12, '2026-04-20T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552171, 114.060802, 25.6, 98.1, 'GPS', NULL, 23.2, 13, '2026-04-20T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551037, 114.062333, 68, 98.1, 'GPS', NULL, 24.4, 11, '2026-04-20T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550259, 114.064148, 56.7, 98.1, 'GPS', NULL, 38.3, 11, '2026-04-20T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549947, 114.066337, 42, 98.1, 'GPS', NULL, 30.3, 13, '2026-04-20T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550103, 114.0689, 73.6, 98.1, 'GPS', NULL, 22.5, 10, '2026-04-20T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550614, 114.071746, 46.7, 98.1, 'GPS', NULL, 38.4, 14, '2026-04-20T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551281, 114.074718, 76.3, 98.1, 'GPS', NULL, 41.2, 10, '2026-04-20T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551869, 114.077626, 63.7, 98.1, 'GPS', NULL, 46.5, 10, '2026-04-20T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55216, 114.080297, 27.2, 98.1, 'GPS', NULL, 42.8, 13, '2026-04-20T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552011, 114.082615, 28.4, 98.1, 'GPS', NULL, 41.5, 13, '2026-04-20T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55138, 114.084549, 48.9, 98.1, 'GPS', NULL, 22.0, 10, '2026-04-20T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550347, 114.08616, 21.1, 98.1, 'GPS', NULL, 25.1, 14, '2026-04-20T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549083, 114.087587, 0, 98.1, 'GPS', NULL, 41.8, 14, '2026-04-20T01:57:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 48.9, 13, '2026-04-19T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 59.2, 56.6, 'GPS', NULL, 22.9, 8, '2026-04-19T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 55.7, 56.6, 'GPS', NULL, 42.3, 14, '2026-04-19T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 61.4, 56.6, 'GPS', NULL, 26.5, 14, '2026-04-19T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 45.7, 56.6, 'GPS', NULL, 40.6, 11, '2026-04-19T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 70.9, 56.6, 'GPS', NULL, 20.7, 10, '2026-04-19T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 41, 56.6, 'GPS', NULL, 26.9, 10, '2026-04-19T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 48.5, 56.6, 'GPS', NULL, 25.3, 14, '2026-04-19T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 73.3, 56.6, 'GPS', NULL, 36.8, 12, '2026-04-19T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 67.7, 56.6, 'GPS', NULL, 20.5, 13, '2026-04-19T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 65.9, 56.6, 'GPS', NULL, 42.1, 10, '2026-04-19T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 46.8, 56.6, 'GPS', NULL, 25.3, 9, '2026-04-19T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 37.1, 56.6, 'GPS', NULL, 39.7, 12, '2026-04-19T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 41.9, 56.6, 'GPS', NULL, 33.0, 9, '2026-04-19T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 38.9, 9, '2026-04-19T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 42.1, 11, '2026-04-19T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 24.6, 236.6, 'GPS', NULL, 47.0, 12, '2026-04-19T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 61.9, 236.6, 'GPS', NULL, 23.9, 11, '2026-04-19T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 31.7, 236.6, 'GPS', NULL, 49.7, 10, '2026-04-19T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 70, 236.6, 'GPS', NULL, 26.2, 12, '2026-04-19T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 54.4, 236.6, 'GPS', NULL, 42.1, 10, '2026-04-19T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 48.3, 236.6, 'GPS', NULL, 25.6, 12, '2026-04-19T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 72.7, 236.6, 'GPS', NULL, 28.0, 8, '2026-04-19T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 35.2, 236.6, 'GPS', NULL, 43.1, 11, '2026-04-19T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 78.4, 236.6, 'GPS', NULL, 38.5, 14, '2026-04-19T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 45.7, 236.6, 'GPS', NULL, 43.8, 9, '2026-04-19T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 54.6, 236.6, 'GPS', NULL, 46.4, 8, '2026-04-19T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 74.6, 236.6, 'GPS', NULL, 44.1, 13, '2026-04-19T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 36.3, 236.6, 'GPS', NULL, 37.2, 8, '2026-04-19T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 44.8, 14, '2026-04-19T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 95.9, 'GPS', NULL, 41.8, 13, '2026-04-19T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555823, 114.048006, 60.4, 95.9, 'GPS', NULL, 24.4, 12, '2026-04-19T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556417, 114.049828, 71.8, 95.9, 'GPS', NULL, 23.1, 8, '2026-04-19T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556608, 114.051327, 32.5, 95.9, 'GPS', NULL, 35.3, 12, '2026-04-19T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556317, 114.052441, 69.1, 95.9, 'GPS', NULL, 20.2, 9, '2026-04-19T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555586, 114.053203, 50.2, 95.9, 'GPS', NULL, 47.0, 14, '2026-04-19T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554558, 114.053728, 69.1, 95.9, 'GPS', NULL, 26.5, 10, '2026-04-19T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553451, 114.054189, 70.6, 95.9, 'GPS', NULL, 24.5, 8, '2026-04-19T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.5525, 114.054775, 49.4, 95.9, 'GPS', NULL, 33.5, 11, '2026-04-19T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551905, 114.055645, 34.7, 95.9, 'GPS', NULL, 27.0, 14, '2026-04-19T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551776, 114.056889, 43.2, 95.9, 'GPS', NULL, 35.6, 12, '2026-04-19T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552115, 114.058507, 23.8, 95.9, 'GPS', NULL, 44.2, 13, '2026-04-19T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552808, 114.060409, 46.4, 95.9, 'GPS', NULL, 42.1, 14, '2026-04-19T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553658, 114.062436, 28, 95.9, 'GPS', NULL, 33.0, 14, '2026-04-19T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554429, 114.064399, 61.6, 95.9, 'GPS', NULL, 49.6, 14, '2026-04-19T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554904, 114.066126, 34.9, 95.9, 'GPS', NULL, 26.4, 9, '2026-04-19T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554937, 114.067499, 55.7, 95.9, 'GPS', NULL, 44.3, 10, '2026-04-19T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554489, 114.068488, 58.4, 95.9, 'GPS', NULL, 39.3, 12, '2026-04-19T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553639, 114.069154, 75.6, 95.9, 'GPS', NULL, 30.3, 8, '2026-04-19T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552558, 114.069637, 0, 95.9, 'GPS', NULL, 30.8, 10, '2026-04-19T01:57:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 34.3, 14, '2026-04-18T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 60.4, 56.6, 'GPS', NULL, 29.1, 13, '2026-04-18T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 24.9, 56.6, 'GPS', NULL, 32.8, 11, '2026-04-18T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 28.5, 56.6, 'GPS', NULL, 42.4, 10, '2026-04-18T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 46.7, 56.6, 'GPS', NULL, 24.8, 11, '2026-04-18T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 78.9, 56.6, 'GPS', NULL, 27.8, 12, '2026-04-18T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 41.6, 56.6, 'GPS', NULL, 22.5, 13, '2026-04-18T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 35, 56.6, 'GPS', NULL, 20.0, 12, '2026-04-18T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 74.4, 56.6, 'GPS', NULL, 22.7, 14, '2026-04-18T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 66.7, 56.6, 'GPS', NULL, 38.7, 8, '2026-04-18T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 59.5, 56.6, 'GPS', NULL, 48.8, 14, '2026-04-18T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 79.3, 56.6, 'GPS', NULL, 26.9, 9, '2026-04-18T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 44.5, 56.6, 'GPS', NULL, 40.5, 14, '2026-04-18T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 67, 56.6, 'GPS', NULL, 44.7, 8, '2026-04-18T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 21.8, 11, '2026-04-18T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 42.4, 9, '2026-04-18T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 34.8, 236.6, 'GPS', NULL, 25.5, 10, '2026-04-18T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 44.6, 236.6, 'GPS', NULL, 45.8, 11, '2026-04-18T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 62.7, 236.6, 'GPS', NULL, 25.8, 14, '2026-04-18T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 48.1, 236.6, 'GPS', NULL, 47.8, 11, '2026-04-18T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 58.3, 236.6, 'GPS', NULL, 30.0, 12, '2026-04-18T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 34.6, 236.6, 'GPS', NULL, 38.8, 10, '2026-04-18T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 66.6, 236.6, 'GPS', NULL, 21.7, 11, '2026-04-18T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 21, 236.6, 'GPS', NULL, 42.6, 10, '2026-04-18T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 45.8, 236.6, 'GPS', NULL, 48.1, 9, '2026-04-18T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 68.4, 236.6, 'GPS', NULL, 47.1, 11, '2026-04-18T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 68.5, 236.6, 'GPS', NULL, 45.7, 13, '2026-04-18T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 66.4, 236.6, 'GPS', NULL, 29.9, 14, '2026-04-18T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 27, 236.6, 'GPS', NULL, 31.0, 13, '2026-04-18T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 47.2, 12, '2026-04-18T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 99.4, 'GPS', NULL, 31.0, 8, '2026-04-18T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555451, 114.04978, 61.1, 99.4, 'GPS', NULL, 27.7, 13, '2026-04-18T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555673, 114.053377, 61.2, 99.4, 'GPS', NULL, 33.6, 14, '2026-04-18T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555492, 114.056651, 69.7, 99.4, 'GPS', NULL, 46.1, 14, '2026-04-18T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554829, 114.059541, 34.6, 99.4, 'GPS', NULL, 28.7, 13, '2026-04-18T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553726, 114.062078, 27.4, 99.4, 'GPS', NULL, 35.6, 11, '2026-04-18T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552326, 114.064377, 69.7, 99.4, 'GPS', NULL, 41.0, 14, '2026-04-18T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550847, 114.066613, 71.3, 99.4, 'GPS', NULL, 41.1, 14, '2026-04-18T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549524, 114.068975, 32.5, 99.4, 'GPS', NULL, 48.7, 10, '2026-04-18T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548556, 114.07162, 57.9, 99.4, 'GPS', NULL, 49.4, 14, '2026-04-18T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548056, 114.074639, 41, 99.4, 'GPS', NULL, 44.2, 12, '2026-04-18T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548023, 114.078032, 25.2, 99.4, 'GPS', NULL, 30.4, 8, '2026-04-18T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548344, 114.081708, 50.2, 99.4, 'GPS', NULL, 27.7, 12, '2026-04-18T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548822, 114.08551, 52.7, 99.4, 'GPS', NULL, 21.2, 14, '2026-04-18T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549221, 114.089248, 78.1, 99.4, 'GPS', NULL, 33.8, 11, '2026-04-18T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549323, 114.09275, 30.4, 99.4, 'GPS', NULL, 27.6, 11, '2026-04-18T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548984, 114.095898, 46.1, 99.4, 'GPS', NULL, 30.0, 9, '2026-04-18T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548165, 114.098662, 49.4, 99.4, 'GPS', NULL, 36.4, 14, '2026-04-18T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546942, 114.101103, 34.5, 99.4, 'GPS', NULL, 24.1, 10, '2026-04-18T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.54549, 114.10336, 0, 99.4, 'GPS', NULL, 28.6, 8, '2026-04-18T01:57:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 21.6, 13, '2026-04-17T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 35.6, 56.6, 'GPS', NULL, 48.8, 12, '2026-04-17T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 52.3, 56.6, 'GPS', NULL, 30.1, 14, '2026-04-17T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 78.2, 56.6, 'GPS', NULL, 24.6, 10, '2026-04-17T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 71.2, 56.6, 'GPS', NULL, 20.5, 12, '2026-04-17T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 68.9, 56.6, 'GPS', NULL, 24.2, 9, '2026-04-17T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 70.8, 56.6, 'GPS', NULL, 41.3, 13, '2026-04-17T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 72.6, 56.6, 'GPS', NULL, 42.0, 11, '2026-04-17T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 67, 56.6, 'GPS', NULL, 36.5, 9, '2026-04-17T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 29.7, 56.6, 'GPS', NULL, 46.6, 14, '2026-04-17T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 40.3, 56.6, 'GPS', NULL, 29.2, 13, '2026-04-17T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 57.1, 56.6, 'GPS', NULL, 23.2, 8, '2026-04-17T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 43.4, 56.6, 'GPS', NULL, 23.6, 8, '2026-04-17T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 76.9, 56.6, 'GPS', NULL, 27.3, 14, '2026-04-17T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 21.1, 8, '2026-04-17T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 36.7, 11, '2026-04-17T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 35, 236.6, 'GPS', NULL, 48.2, 11, '2026-04-17T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 72.7, 236.6, 'GPS', NULL, 32.7, 10, '2026-04-17T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 61.6, 236.6, 'GPS', NULL, 41.8, 8, '2026-04-17T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 27.5, 236.6, 'GPS', NULL, 26.6, 10, '2026-04-17T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 20.9, 236.6, 'GPS', NULL, 49.4, 13, '2026-04-17T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 53.5, 236.6, 'GPS', NULL, 35.6, 14, '2026-04-17T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 21.7, 236.6, 'GPS', NULL, 46.3, 10, '2026-04-17T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 78.3, 236.6, 'GPS', NULL, 34.3, 11, '2026-04-17T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 79.7, 236.6, 'GPS', NULL, 22.1, 8, '2026-04-17T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 34.4, 236.6, 'GPS', NULL, 46.0, 14, '2026-04-17T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 26.3, 236.6, 'GPS', NULL, 22.2, 13, '2026-04-17T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 43.4, 236.6, 'GPS', NULL, 24.5, 14, '2026-04-17T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 53.1, 236.6, 'GPS', NULL, 28.2, 11, '2026-04-17T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 23.6, 9, '2026-04-17T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 108, 'GPS', NULL, 27.9, 14, '2026-04-17T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55529, 114.048799, 62.5, 108, 'GPS', NULL, 36.0, 14, '2026-04-17T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555351, 114.051415, 21.4, 108, 'GPS', NULL, 21.1, 8, '2026-04-17T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555008, 114.053708, 21.1, 108, 'GPS', NULL, 22.7, 8, '2026-04-17T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554185, 114.055616, 61.2, 108, 'GPS', NULL, 39.7, 9, '2026-04-17T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55292, 114.057172, 62.9, 108, 'GPS', NULL, 21.6, 9, '2026-04-17T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551359, 114.05849, 36.2, 108, 'GPS', NULL, 24.6, 12, '2026-04-17T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.549719, 114.059745, 47.8, 108, 'GPS', NULL, 40.4, 11, '2026-04-17T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.548235, 114.061125, 27.9, 108, 'GPS', NULL, 48.3, 9, '2026-04-17T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.547106, 114.062789, 29.1, 108, 'GPS', NULL, 20.9, 10, '2026-04-17T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546445, 114.064827, 50.8, 108, 'GPS', NULL, 42.9, 8, '2026-04-17T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.54625, 114.067238, 72.9, 108, 'GPS', NULL, 20.3, 11, '2026-04-17T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546411, 114.069934, 25.1, 108, 'GPS', NULL, 30.7, 9, '2026-04-17T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546728, 114.072754, 27.9, 108, 'GPS', NULL, 43.7, 9, '2026-04-17T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546965, 114.075512, 71.9, 108, 'GPS', NULL, 23.0, 14, '2026-04-17T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546907, 114.078032, 74.8, 108, 'GPS', NULL, 44.7, 10, '2026-04-17T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.546407, 114.080199, 60.2, 108, 'GPS', NULL, 33.7, 14, '2026-04-17T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.545426, 114.081982, 37.1, 108, 'GPS', NULL, 23.3, 12, '2026-04-17T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.544042, 114.083441, 23.4, 108, 'GPS', NULL, 25.2, 14, '2026-04-17T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.542428, 114.084718, 0, 108, 'GPS', NULL, 41.1, 11, '2026-04-17T01:57:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 23.9, 8, '2026-04-16T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 78.3, 56.6, 'GPS', NULL, 42.4, 14, '2026-04-16T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 66.2, 56.6, 'GPS', NULL, 26.2, 8, '2026-04-16T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 48.1, 56.6, 'GPS', NULL, 29.3, 11, '2026-04-16T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 21.3, 56.6, 'GPS', NULL, 46.5, 13, '2026-04-16T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 49.2, 56.6, 'GPS', NULL, 46.8, 8, '2026-04-16T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 55.6, 56.6, 'GPS', NULL, 48.9, 13, '2026-04-16T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 77.1, 56.6, 'GPS', NULL, 26.3, 14, '2026-04-16T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 34.8, 56.6, 'GPS', NULL, 28.1, 13, '2026-04-16T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 73.8, 56.6, 'GPS', NULL, 41.8, 13, '2026-04-16T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 62.6, 56.6, 'GPS', NULL, 20.2, 8, '2026-04-16T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 41.8, 56.6, 'GPS', NULL, 37.2, 11, '2026-04-16T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 62.2, 56.6, 'GPS', NULL, 37.7, 10, '2026-04-16T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 79.5, 56.6, 'GPS', NULL, 48.2, 10, '2026-04-16T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 30.1, 14, '2026-04-16T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 29.9, 14, '2026-04-16T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 26.7, 236.6, 'GPS', NULL, 39.5, 11, '2026-04-16T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 75, 236.6, 'GPS', NULL, 26.6, 13, '2026-04-16T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 50.6, 236.6, 'GPS', NULL, 20.2, 10, '2026-04-16T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 70.4, 236.6, 'GPS', NULL, 29.7, 13, '2026-04-16T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 66.5, 236.6, 'GPS', NULL, 46.2, 8, '2026-04-16T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 23.1, 236.6, 'GPS', NULL, 38.8, 12, '2026-04-16T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 35.8, 236.6, 'GPS', NULL, 27.1, 8, '2026-04-16T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 36.4, 236.6, 'GPS', NULL, 25.8, 8, '2026-04-16T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 78.2, 236.6, 'GPS', NULL, 44.7, 11, '2026-04-16T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 22.1, 236.6, 'GPS', NULL, 23.3, 12, '2026-04-16T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 44.9, 236.6, 'GPS', NULL, 45.4, 9, '2026-04-16T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 54.4, 236.6, 'GPS', NULL, 27.2, 10, '2026-04-16T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 78.6, 236.6, 'GPS', NULL, 30.0, 14, '2026-04-16T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 48.4, 13, '2026-04-16T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 89.1, 'GPS', NULL, 45.9, 8, '2026-04-16T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555964, 114.047504, 55.9, 89.1, 'GPS', NULL, 30.6, 14, '2026-04-16T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556698, 114.048825, 37.8, 89.1, 'GPS', NULL, 40.0, 14, '2026-04-16T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.557028, 114.049823, 38.7, 89.1, 'GPS', NULL, 24.7, 10, '2026-04-16T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556878, 114.050436, 26.5, 89.1, 'GPS', NULL, 43.3, 11, '2026-04-16T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556286, 114.050696, 30.7, 89.1, 'GPS', NULL, 20.7, 8, '2026-04-16T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555399, 114.050719, 32.2, 89.1, 'GPS', NULL, 46.0, 9, '2026-04-16T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554432, 114.050679, 51.3, 89.1, 'GPS', NULL, 49.3, 13, '2026-04-16T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553621, 114.050764, 73.7, 89.1, 'GPS', NULL, 31.4, 9, '2026-04-16T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553166, 114.051133, 22.4, 89.1, 'GPS', NULL, 33.9, 11, '2026-04-16T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553177, 114.051876, 59.4, 89.1, 'GPS', NULL, 44.4, 12, '2026-04-16T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553656, 114.052992, 79.9, 89.1, 'GPS', NULL, 24.6, 12, '2026-04-16T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55449, 114.054393, 30.1, 89.1, 'GPS', NULL, 24.7, 12, '2026-04-16T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55548, 114.055918, 54.5, 89.1, 'GPS', NULL, 27.0, 14, '2026-04-16T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556391, 114.05738, 59.3, 89.1, 'GPS', NULL, 23.7, 9, '2026-04-16T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.557006, 114.058606, 59.2, 89.1, 'GPS', NULL, 34.4, 8, '2026-04-16T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.557179, 114.059478, 34, 89.1, 'GPS', NULL, 35.7, 12, '2026-04-16T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556872, 114.059965, 61.7, 89.1, 'GPS', NULL, 27.3, 13, '2026-04-16T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556161, 114.06013, 30.9, 89.1, 'GPS', NULL, 28.5, 11, '2026-04-16T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555221, 114.060111, 0, 89.1, 'GPS', NULL, 26.9, 8, '2026-04-16T01:57:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 56.6, 'GPS', NULL, 40.0, 13, '2026-04-15T00:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 33, 56.6, 'GPS', NULL, 42.9, 13, '2026-04-15T00:02:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 33.6, 56.6, 'GPS', NULL, 43.8, 8, '2026-04-15T00:05:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 66.4, 56.6, 'GPS', NULL, 37.6, 10, '2026-04-15T00:08:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 63.4, 56.6, 'GPS', NULL, 44.4, 14, '2026-04-15T00:10:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 52.6, 56.6, 'GPS', NULL, 38.9, 11, '2026-04-15T00:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 61.9, 56.6, 'GPS', NULL, 44.9, 11, '2026-04-15T00:16:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 58.5, 56.6, 'GPS', NULL, 32.7, 11, '2026-04-15T00:18:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 25.5, 56.6, 'GPS', NULL, 22.1, 9, '2026-04-15T00:21:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 34.2, 56.6, 'GPS', NULL, 41.2, 14, '2026-04-15T00:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 53.3, 56.6, 'GPS', NULL, 35.4, 11, '2026-04-15T00:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 28.1, 56.6, 'GPS', NULL, 31.9, 10, '2026-04-15T00:29:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 52.9, 56.6, 'GPS', NULL, 46.4, 14, '2026-04-15T00:32:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 35.1, 56.6, 'GPS', NULL, 36.3, 8, '2026-04-15T00:34:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 56.6, 'GPS', NULL, 31.9, 11, '2026-04-15T00:37:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.5431, 114.0579, 0, 236.6, 'GPS', NULL, 37.8, 9, '2026-04-15T10:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.543268, 114.057262, 33.8, 236.6, 'GPS', NULL, 40.0, 10, '2026-04-15T10:03:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.542893, 114.056188, 59.6, 236.6, 'GPS', NULL, 23.4, 14, '2026-04-15T10:06:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.541666, 114.054434, 24.5, 236.6, 'GPS', NULL, 23.4, 9, '2026-04-15T10:10:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.539653, 114.052051, 68.3, 236.6, 'GPS', NULL, 39.5, 14, '2026-04-15T10:13:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.537262, 114.049365, 27.4, 236.6, 'GPS', NULL, 36.1, 12, '2026-04-15T10:16:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.535065, 114.046835, 66, 236.6, 'GPS', NULL, 38.4, 10, '2026-04-15T10:20:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.53355, 114.04485, 57.2, 236.6, 'GPS', NULL, 38.8, 14, '2026-04-15T10:23:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532908, 114.043563, 44.5, 236.6, 'GPS', NULL, 44.6, 9, '2026-04-15T10:26:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532948, 114.042823, 55.1, 236.6, 'GPS', NULL, 28.1, 11, '2026-04-15T10:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533182, 114.042237, 50.2, 236.6, 'GPS', NULL, 31.9, 12, '2026-04-15T10:33:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.533038, 114.041349, 38.6, 236.6, 'GPS', NULL, 33.5, 8, '2026-04-15T10:36:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.532107, 114.039831, 59, 236.6, 'GPS', NULL, 41.3, 14, '2026-04-15T10:40:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.530326, 114.037633, 59.7, 236.6, 'GPS', NULL, 46.0, 8, '2026-04-15T10:43:20.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-A001', 22.528, 114.035, 0, 236.6, 'GPS', NULL, 48.7, 13, '2026-04-15T10:46:40.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555, 114.046, 0, 94.4, 'GPS', NULL, 34.3, 8, '2026-04-15T01:00:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555698, 114.050057, 39.7, 94.4, 'GPS', NULL, 42.9, 8, '2026-04-15T01:03:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556168, 114.053931, 27.6, 94.4, 'GPS', NULL, 25.6, 13, '2026-04-15T01:06:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.556233, 114.057481, 25.3, 94.4, 'GPS', NULL, 34.1, 10, '2026-04-15T01:09:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.555818, 114.060648, 73.8, 94.4, 'GPS', NULL, 26.3, 9, '2026-04-15T01:12:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.554961, 114.063461, 23.9, 94.4, 'GPS', NULL, 24.7, 14, '2026-04-15T01:15:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553809, 114.066037, 79.9, 94.4, 'GPS', NULL, 39.5, 10, '2026-04-15T01:18:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552577, 114.068549, 68.9, 94.4, 'GPS', NULL, 36.1, 11, '2026-04-15T01:21:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551501, 114.071187, 66.1, 94.4, 'GPS', NULL, 34.4, 12, '2026-04-15T01:24:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550781, 114.074109, 20.5, 94.4, 'GPS', NULL, 31.2, 14, '2026-04-15T01:27:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550527, 114.077405, 47, 94.4, 'GPS', NULL, 27.4, 14, '2026-04-15T01:30:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550741, 114.081074, 71.6, 94.4, 'GPS', NULL, 20.1, 9, '2026-04-15T01:33:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.55131, 114.085027, 32.8, 94.4, 'GPS', NULL, 30.5, 13, '2026-04-15T01:36:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552035, 114.089106, 42, 94.4, 'GPS', NULL, 21.4, 10, '2026-04-15T01:39:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552681, 114.093121, 29.2, 94.4, 'GPS', NULL, 39.0, 11, '2026-04-15T01:42:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.553031, 114.096899, 57.6, 94.4, 'GPS', NULL, 48.0, 14, '2026-04-15T01:45:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552939, 114.100324, 69.5, 94.4, 'GPS', NULL, 34.9, 14, '2026-04-15T01:48:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.552367, 114.103364, 45.2, 94.4, 'GPS', NULL, 25.3, 11, '2026-04-15T01:51:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.551391, 114.106082, 42.8, 94.4, 'GPS', NULL, 32.0, 13, '2026-04-15T01:54:00.968Z');
INSERT INTO locations (deviceId, latitude, longitude, speed, direction, locationType, address, altitude, satellites, createdAt)
VALUES ('GT06-B002', 22.550185, 114.108616, 0, 94.4, 'GPS', NULL, 48.3, 9, '2026-04-15T01:57:00.968Z');
INSERT INTO geofences (deviceId, name, type, centerLat, centerLng, radius, entryAlarm, exitAlarm, enabled, createdAt, updatedAt)
VALUES ('GT06-A001', '公司范围', 'circle', 22.5431, 114.0579, 300, 0, 1, 1, datetime('now'), datetime('now'));
INSERT INTO geofences (deviceId, name, type, centerLat, centerLng, radius, entryAlarm, exitAlarm, enabled, createdAt, updatedAt)
VALUES ('GT06-A001', '家庭区域', 'circle', 22.528, 114.035, 500, 1, 1, 1, datetime('now'), datetime('now'));
INSERT INTO geofences (deviceId, name, type, centerLat, centerLng, radius, entryAlarm, exitAlarm, enabled, createdAt, updatedAt)
VALUES ('GT06-B002', '深圳市区', 'circle', 22.55, 114.06, 15000, 0, 1, 1, datetime('now'), datetime('now'));
INSERT INTO geofences (deviceId, name, type, centerLat, centerLng, radius, entryAlarm, exitAlarm, enabled, createdAt, updatedAt)
VALUES ('GT06-C003', '停车位', 'circle', 22.528, 114.068, 100, 0, 1, 1, datetime('now'), datetime('now'));
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-A001', 'speed', '超速告警: 当前速度 92km/h，超过限速 80km/h', 22.538, 114.048, '深圳市南山区滨海大道', 0, '2026-04-22T06:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-A001', 'geofence_exit', '设备离开围栏「公司范围」', 22.546, 114.062, '深圳市南山区科技中二路', 0, '2026-04-22T03:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-B002', 'vibration', '异常振动告警', 22.56, 114.05, '深圳市南山区粤海街道', 0, '2026-04-22T05:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-C003', 'low_battery', '电量过低: 当前电量 15%', 22.528, 114.068, '深圳市福田区华强北', 0, '2026-04-22T02:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-C003', 'geofence_exit', '设备离开围栏「停车位」', 22.531, 114.071, '深圳市福田区振兴路', 0, '2026-04-21T08:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-A001', 'speed', '超速告警: 当前速度 88km/h，超过限速 80km/h', 22.535, 114.042, '深圳市南山区北环大道', 1, '2026-04-21T04:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-B002', 'sos', 'SOS紧急求救', 22.55, 114.1, '深圳市福田区福华三路', 1, '2026-04-21T02:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-A001', 'geofence_entry', '设备进入围栏「家庭区域」', 22.5285, 114.0355, '深圳市南山区南光路', 1, '2026-04-21T00:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-B002', 'power_off', '设备断电告警', 22.555, 114.046, '深圳市南山区深南大道', 1, '2026-04-19T08:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-A001', 'low_battery', '电量过低: 当前电量 18%', 22.543, 114.0578, '深圳市南山区科技南路', 1, '2026-04-18T08:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-C003', 'vibration', '异常振动告警', 22.528, 114.068, '深圳市福田区华强北', 1, '2026-04-17T08:38:31.968Z');
INSERT INTO alarms (deviceId, type, message, latitude, longitude, address, isRead, createdAt)
VALUES ('GT06-B002', 'speed', '超速告警: 当前速度 105km/h', 22.565, 114.03, '深圳市南山区月亮湾大道', 1, '2026-04-20T08:38:31.968Z');
INSERT INTO sim_cards (deviceId, simNumber, iccid, packageName, totalData, usedData, status, activationTime, expiryTime, totalSms, usedSms, createdAt, updatedAt)
VALUES ('GT06-A001', '13800001001', '89860001234567890001', '30M/月 · 36个月套餐', 1080, 456.8, 'active', '2025-10-24T08:38:31.968Z', '2028-10-08T08:38:31.968Z', 100, 23, datetime('now'), datetime('now'));
INSERT INTO sim_cards (deviceId, simNumber, iccid, packageName, totalData, usedData, status, activationTime, expiryTime, totalSms, usedSms, createdAt, updatedAt)
VALUES ('GT06-B002', '13800001002', '89860001234567890002', '100M/月 · 12个月套餐', 1200, 890.2, 'active', '2025-08-25T08:38:31.968Z', '2026-08-25T08:38:31.968Z', 200, 67, datetime('now'), datetime('now'));
INSERT INTO sim_cards (deviceId, simNumber, iccid, packageName, totalData, usedData, status, activationTime, expiryTime, totalSms, usedSms, createdAt, updatedAt)
VALUES ('GT06-C003', '13800001003', '89860001234567890003', '10M/月 · 24个月套餐', 240, 198.5, 'active', '2025-04-22T08:38:31.968Z', '2027-04-22T08:38:31.968Z', 50, 12, datetime('now'), datetime('now'));
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-A001', 'locate', '{}', 'executed', '定位成功', '2026-04-22T07:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-A001', 'set_mode', '{"mode":"normal"}', 'executed', '设置成功', '2026-04-20T08:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-B002', 'locate', '{}', 'executed', '定位成功', '2026-04-22T05:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-B002', 'set_speed_threshold', '{"speed":80}', 'executed', '超速阈值已设为80km/h', '2026-04-19T08:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-B002', 'restart', '{}', 'executed', '设备已重启', '2026-04-15T08:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-C003', 'locate', '{}', 'failed', '设备离线，无法定位', '2026-04-22T06:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-C003', 'set_mode', '{"mode":"powersave"}', 'executed', '已切换至省电模式', '2026-04-18T08:38:31.968Z');
INSERT INTO commands (deviceId, commandType, commandData, status, response, createdAt)
VALUES ('GT06-A001', 'locate', '{}', 'pending', NULL, '2026-04-22T08:38:31.968Z');