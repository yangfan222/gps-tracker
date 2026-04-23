import { Injectable, OnModuleInit, Logger } from '@nestjs/common';
import * as net from 'net';
import { DeviceService } from '../device/device.service';
import { LocationService } from '../location/location.service';
import { WebsocketGateway } from '../websocket/websocket.gateway';
import { AlarmService } from '../alarm/alarm.service';
import { GeofenceService } from '../geofence/geofence.service';

@Injectable()
export class TcpServerService implements OnModuleInit {
  private readonly logger = new Logger(TcpServerService.name);
  private server: net.Server;
  private readonly TCP_PORT = 7700;

  constructor(
    private deviceService: DeviceService,
    private locationService: LocationService,
    private wsGateway: WebsocketGateway,
    private alarmService: AlarmService,
    private geofenceService: GeofenceService,
  ) {}

  onModuleInit() {
    this.startTcpServer();
  }

  private startTcpServer() {
    this.server = net.createServer((socket) => {
      this.logger.log(`Device connected: ${socket.remoteAddress}:${socket.remotePort}`);

      let buffer = '';

      socket.on('data', (data) => {
        buffer += data.toString();
        const messages = buffer.split('\n');
        buffer = messages.pop() || '';

        for (const msg of messages) {
          if (msg.trim()) {
            this.handleMessage(msg.trim(), socket);
          }
        }
      });

      socket.on('close', () => {
        this.logger.log(`Device disconnected: ${socket.remoteAddress}`);
      });

      socket.on('error', (err) => {
        this.logger.error(`Socket error: ${err.message}`);
      });
    });

    this.server.listen(this.TCP_PORT, () => {
      this.logger.log(`TCP Server listening on port ${this.TCP_PORT}`);
    });
  }

  private async handleMessage(message: string, socket: net.Socket) {
    try {
      // Support multiple protocols
      // Protocol 1: JSON format {"deviceId":"xxx","lat":xx,"lng":xx,...}
      if (message.startsWith('{')) {
        const data = JSON.parse(message);
        await this.processLocationData(data);
        socket.write('OK\n');
        return;
      }

      // Protocol 2: Simple CSV format - deviceId,lat,lng,speed,direction,battery,signal,locationType
      const parts = message.split(',');
      if (parts.length >= 3) {
        const data = {
          deviceId: parts[0],
          latitude: parseFloat(parts[1]),
          longitude: parseFloat(parts[2]),
          speed: parts[3] ? parseFloat(parts[3]) : 0,
          direction: parts[4] ? parseFloat(parts[4]) : 0,
          batteryLevel: parts[5] ? parseFloat(parts[5]) : undefined,
          signalStrength: parts[6] ? parseInt(parts[6]) : undefined,
          locationType: parts[7] || 'GPS',
        };
        await this.processLocationData(data);
        socket.write('OK\n');
        return;
      }

      this.logger.warn(`Unknown message format: ${message}`);
    } catch (err) {
      this.logger.error(`Error handling message: ${err.message}`);
    }
  }

  private async processLocationData(data: any) {
    const { deviceId, latitude, longitude, speed, direction, batteryLevel, signalStrength, locationType } = data;

    if (!deviceId || !latitude || !longitude) return;

    // Save location history
    await this.locationService.saveLocation({
      deviceId, latitude, longitude, speed, direction, locationType,
    });

    // Update device current state
    await this.deviceService.updateDeviceLocation(deviceId, {
      latitude, longitude, speed: speed || 0, direction: direction || 0,
      locationType: locationType || 'GPS', batteryLevel, signalStrength,
    });

    // Push real-time location via WebSocket
    this.wsGateway.pushLocationUpdate(deviceId, {
      deviceId, latitude, longitude, speed, direction,
      locationType, batteryLevel, signalStrength,
      timestamp: new Date().toISOString(),
    });

    // Check geofences
    const triggered = await this.geofenceService.checkGeofence(deviceId, latitude, longitude);
    for (const fence of triggered) {
      const alarm = await this.alarmService.create({
        deviceId,
        type: 'geofence_entry',
        message: `设备进入围栏: ${fence.name}`,
        latitude, longitude,
      });
      this.wsGateway.pushAlarm(deviceId, alarm);
    }
  }
}
