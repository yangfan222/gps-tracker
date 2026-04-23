import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ShareController } from './share.controller';
import { ShareService } from './share.service';
import { LocationShare } from '../entities/location-share.entity';
import { LocationModule } from '../location/location.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([LocationShare]),
    LocationModule,
  ],
  controllers: [ShareController],
  providers: [ShareService],
})
export class ShareModule {}
