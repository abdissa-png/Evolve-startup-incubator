/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository} from 'typeorm';
import { Message } from 'src/entities/Message.entity';
import { AnnouncementDto } from './dto/announcement.dto';
import { ComplaintDto } from './dto/Complaint.dto';
import { UserRole } from 'src/common/roles/user.role';

@Injectable()
export class MessageService {
    constructor(
        @InjectRepository(Message) private messageRepository:Repository<Message>,
    ){}
    async postAnnouncement(announcementDto:AnnouncementDto){
        const announcement=this.messageRepository.create({
            from:UserRole.ADMIN,
            to:"All",
            message:announcementDto.message
        });
        await this.messageRepository.save(announcement);
    }
    async submitComplaint(email:string,message:string){
        const complaint=this.messageRepository.create({
            from:email,
            to:UserRole.ADMIN,
            message:message
        })
        await this.messageRepository.save(complaint)
    }
    async replyToComplaint(complaintDto:ComplaintDto){
        const complaint=this.messageRepository.create({
            from:UserRole.ADMIN,
            to:complaintDto.receiver,
            message:complaintDto.message
        })
        await this.messageRepository.save(complaint)
    }
    async getAnnouncements(email:string){
        const messages = await this.messageRepository
                                .createQueryBuilder('message')
                                .where('message.to = :to OR message.to = :toEmail', {
                                        to: 'All',
                                        toEmail:email,
                            })
                            .getMany();
        return messages;
    }
    async getComplaint(){
        const complaint=await this.messageRepository.find({where:{to:UserRole.ADMIN}})
        return complaint;
    }
}
