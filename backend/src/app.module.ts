import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { AuthModule } from './auth/auth.module';
import { DeviceModule } from './device/device.module';
import { LocationModule } from './location/location.module';
import { TrackModule } from './track/track.module';
import { CommandModule } from './command/command.module';
import { GeofenceModule } from './geofence/geofence.module';
import { AlarmModule } from './alarm/alarm.module';
import { SimCardModule } from './sim-card/sim-card.module';
import { ReportModule } from './report/report.module';
import { TcpServerModule } from './tcp-server/tcp-server.module';
import { WebsocketModule } from './websocket/websocket.module';
import { SeedController } from './seed/seed.controller';
import { Device } from './entities/device.entity';
import { Location } from './entities/location.entity';
import { Alarm } from './entities/alarm.entity';

@Module({
  imports: [
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', '..', 'frontend', 'dist'),
      exclude: ['/api/(.*)'],
    }),
    TypeOrmModule.forRoot({
      type: 'sqljs',
      location: 'gps_tracker.db',
      autoSave: true,
      entities: [__dirname + '/entities/*.entity{.ts,.js}'],
      synchronize: true,
    }),
    TypeOrmModule.forFeature([Device, Location, Alarm]),
    AuthModule,
    DeviceModule,
    LocationModule,
    TrackModule,
    CommandModule,
    GeofenceModule,
    AlarmModule,
    SimCardModule,
    ReportModule,
    TcpServerModule,
    WebsocketModule,
  ],
  controllers: [SeedController],
})
export class AppModule {}
