/* eslint-disable prettier/prettier */
import { Body, Controller, Get, HttpCode, HttpStatus, Patch } from '@nestjs/common';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';
import { StartupService } from './startup.service';
import { StartupProfileDto } from './dto/profile.dto';

@Controller('api/v1/startup')
export class StartupController {
    constructor(private startupService:StartupService){

    }
    @Patch("profile")
    @HttpCode(HttpStatus.OK)
    async updateProfile(@GetCurrentUser("email") email:string,@Body() dto:StartupProfileDto){
        this.startupService.updateProfile(email,dto)
    }
    @Get("profile")
    async getProfile(@GetCurrentUser("email") email:string){
        return this.startupService.getProfile(email)
    }
    @Get("searchStartup")
    async searchStartup(@Body("name") name:string){
        return this.startupService.searchStartup(name)
    }

}
