/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { APP_GUARD } from '@nestjs/core';
import { AtGuard } from './common/guards/at.guard';
import { StartupModule } from './startup/startup.module';
import { AuthModule } from './auth/auth.module';
import { MessageModule } from './message/message.module';
import { InvestorModule } from './investor/investor.module';
import { ConfigModule,ConfigService } from '@nestjs/config';
import { Role } from './entities/Roles.entity';
import { PairingModule } from './pairing/pairing.module';
import { Assistance } from './entities/Assistance.entity';
import { IndustryStage } from './entities/IndustryStage.entity';
@Module({
  imports:[
    TypeOrmModule.forFeature([Role,Assistance,IndustryStage]),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        type: 'sqlite',
        database: configService.get<string>('DATABASE_PATH'),
        entities: [__dirname + '/**/*.entity{.ts,.js}'],
        synchronize: true,
      }),
      inject: [ConfigService],
    }),

    AuthModule,
    MessageModule,
    InvestorModule,
    StartupModule,
    PairingModule,
    ConfigModule.forRoot({isGlobal:true}),
  ],
  controllers:[AppController],
  providers:[AppService,
    {
      provide: APP_GUARD,
      useClass: AtGuard,
    },]
})
export class AppModule {}
