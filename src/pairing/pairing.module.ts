/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { PairingController } from './pairing.controller';
import { PairingService } from './pairing.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Pairing } from 'src/entities/Pairing.entity';
import { JwtModule } from '@nestjs/jwt';
import { Startup } from 'src/entities/Startup.entity';
import { Investor } from 'src/entities/Investor.entity';

@Module({
  imports:[TypeOrmModule.forFeature([Pairing,Startup,Investor]),JwtModule.register({})],
  controllers: [PairingController],
  providers: [PairingService]
})
export class PairingModule {}