/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { InvestorController } from './investor.controller';
import { InvestorService } from './investor.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Investor } from 'src/entities/Investor.entity';
import { IndustryStage } from 'src/entities/IndustryStage.entity';
import { User } from 'src/entities/User.entity';
import { Assistance } from 'src/entities/Assistance.entity';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [TypeOrmModule.forFeature([Investor,IndustryStage,Assistance,User]),JwtModule.register({})],
  controllers: [InvestorController],
  providers: [InvestorService]
})
export class InvestorModule {}