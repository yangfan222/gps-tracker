import { Module } from '@nestjs/common';
import { TrackController } from './track.controller';
import { LocationModule } from '../location/location.module';

@Module({
  imports: [LocationModule],
  controllers: [TrackController],
})
export class TrackModule {}
