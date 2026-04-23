import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SimCardController } from './sim-card.controller';
import { SimCardService } from './sim-card.service';
import { SimCard } from '../entities/sim-card.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SimCard])],
  controllers: [SimCardController],
  providers: [SimCardService],
  exports: [SimCardService],
})
export class SimCardModule {}
