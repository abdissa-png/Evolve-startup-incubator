/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { StartupController } from './startup.controller';
import { StartupService } from './startup.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Startup } from 'src/entities/Startup.entity';
import { IndustryStage } from 'src/entities/IndustryStage.entity';
import { Assistance } from 'src/entities/Assistance.entity';
import { JwtModule } from '@nestjs/jwt';
import { User } from 'src/entities/User.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Startup,IndustryStage,Assistance,User]),JwtModule.register({})],
  controllers: [StartupController],
  providers: [StartupService]
})
export class StartupModule {}