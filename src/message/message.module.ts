/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { MessageController } from './message.controller';
import { MessageService } from './message.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Message } from 'src/entities/Message.entity';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports:[TypeOrmModule.forFeature([Message]),JwtModule.register({})],
  controllers: [MessageController],
  providers: [MessageService]
})
export class MessageModule {}