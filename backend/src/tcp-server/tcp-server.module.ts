import { Module } from '@nestjs/common';
import { TcpServerService } from './tcp-server.service';
import { DeviceModule } from '../device/device.module';
import { LocationModule } from '../location/location.module';
import { AlarmModule } from '../alarm/alarm.module';
import { GeofenceModule } from '../geofence/geofence.module';

@Module({
  imports: [DeviceModule, LocationModule, AlarmModule, GeofenceModule],
  providers: [TcpServerService],
})
export class TcpServerModule {}
