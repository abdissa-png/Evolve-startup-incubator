/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { JwtModule } from '@nestjs/jwt';
import { RtStrategy } from './strategies/rt.strategy';
import { AtStrategy } from './strategies/at.strategy';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/User.entity';
import { Startup } from 'src/entities/Startup.entity';
import { Investor } from 'src/entities/Investor.entity';
import { IndustryStage } from 'src/entities/IndustryStage.entity';
import { Assistance } from 'src/entities/Assistance.entity';
import { Role } from 'src/entities/Roles.entity';
import { Pairing } from 'src/entities/Pairing.entity';


@Module({
  imports: [TypeOrmModule.forFeature([User,Startup,Investor,IndustryStage,Assistance,Role,Pairing]),JwtModule.register({})],
  controllers: [AuthController],
  providers: [AuthService,AtStrategy,RtStrategy]
})
export class AuthModule {}