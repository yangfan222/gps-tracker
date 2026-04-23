import { WebSocketGateway, WebSocketServer, OnGatewayConnection, OnGatewayDisconnect } from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';

@WebSocketGateway({ cors: true })
export class WebsocketGateway implements OnGatewayConnection, OnGatewayDisconnect {
  @WebSocketServer()
  server: Server;

  private deviceSubscriptions = new Map<string, Set<string>>(); // deviceId -> Set<socketId>

  handleConnection(client: Socket) {
    const deviceId = client.handshake.query.deviceId as string;
    if (deviceId) {
      if (!this.deviceSubscriptions.has(deviceId)) {
        this.deviceSubscriptions.set(deviceId, new Set());
      }
      this.deviceSubscriptions.get(deviceId).add(client.id);
    }
  }

  handleDisconnect(client: Socket) {
    this.deviceSubscriptions.forEach((sockets, deviceId) => {
      sockets.delete(client.id);
      if (sockets.size === 0) {
        this.deviceSubscriptions.delete(deviceId);
      }
    });
  }

  pushLocationUpdate(deviceId: string, data: any) {
    this.server.emit(`location:${deviceId}`, data);
  }

  pushAlarm(deviceId: string, data: any) {
    this.server.emit(`alarm:${deviceId}`, data);
  }

  pushDeviceStatus(deviceId: string, data: any) {
    this.server.emit(`status:${deviceId}`, data);
  }
}
