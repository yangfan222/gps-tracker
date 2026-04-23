import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GeofenceController } from './geofence.controller';
import { GeofenceService } from './geofence.service';
import { Geofence } from '../entities/geofence.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Geofence])],
  controllers: [GeofenceController],
  providers: [GeofenceService],
  exports: [GeofenceService],
})
export class GeofenceModule {}
