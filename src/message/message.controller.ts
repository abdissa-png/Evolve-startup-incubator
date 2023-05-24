/* eslint-disable prettier/prettier */
import { Body, Controller, Get, HttpCode, HttpStatus, Post, UseGuards } from '@nestjs/common';
import { Roles } from 'src/common/decorators/roles.decorator';
import { RolesGuard } from 'src/common/guards/roles.guard';
import { UserRole } from 'src/common/roles/user.role';
import { MessageService } from './message.service';
import { AnnouncementDto } from './dto/announcement.dto';
import { ComplaintDto } from './dto/Complaint.dto';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';

@Controller('api/v1/message')
export class MessageController {
    constructor(private messageService:MessageService){

    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Post("announcement")
    @HttpCode(HttpStatus.OK)
    async postAnnouncement(@Body() dto:AnnouncementDto){
        this.messageService.postAnnouncement(dto)
    }
    @Roles(UserRole.INVESTOR,UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Post("submitComplaint")
    @HttpCode(HttpStatus.OK)
    async submitComplaint(@GetCurrentUser("email") email:string,@Body("message") message:string){
        this.messageService.submitComplaint(email,message)
    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Post("replyToComplaint")
    async receiveComplaint(@Body() dto:ComplaintDto){
        this.messageService.replyToComplaint(dto)
    }
    @Roles(UserRole.INVESTOR,UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Get("announcement")
    async getAnnouncements(@GetCurrentUser("email") email:string){
        return this.messageService.getAnnouncements(email);
    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Get("posts")
    async getPosts(){
        return this.messageService.getPosts();
    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Get("complaint")
    async getComplaint(){
        return this.messageService.getComplaint();
    }
}
