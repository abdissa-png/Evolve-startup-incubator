/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { InvestorController } from './investor.controller';
import { InvestorService } from './investor.service';

@Module({
  controllers: [InvestorController],
  providers: [InvestorService]
})
export class InvestorModule {}