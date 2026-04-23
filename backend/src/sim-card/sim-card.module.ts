import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SimCardController } from './sim-card.controller';
import { SimCardService } from './sim-card.service';
import { SimCard } from '../entities/sim-card.entity';
import { RechargeOrder } from '../entities/recharge-order.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SimCard, RechargeOrder])],
  controllers: [SimCardController],
  providers: [SimCardService],
  exports: [SimCardService],
})
export class SimCardModule {}
