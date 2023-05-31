/* eslint-disable prettier/prettier */
import { Body, Controller, Get, HttpCode, HttpStatus, Param, Patch, UseGuards } from '@nestjs/common';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';
import { StartupService } from './startup.service';
import { StartupProfileDto } from './dto/profile.dto';
import { UserRole } from 'src/common/roles/user.role';
import { Roles } from 'src/common/decorators/roles.decorator';
import { RolesGuard } from 'src/common/guards/roles.guard';

@Controller('api/v1/startup')
export class StartupController {
    constructor(private startupService:StartupService){

    }
    @Roles(UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Patch("profile")
    @HttpCode(HttpStatus.OK)
    async updateProfile(@GetCurrentUser("email") email:string,@Body() dto:StartupProfileDto){
        this.startupService.updateProfile(email,dto)
    }
    @Roles(UserRole.INVESTOR)
    @UseGuards(RolesGuard)
    @Get("profile")
    async getProfile(@GetCurrentUser("email") email:string){
        return this.startupService.getProfile(email)
    }
    @Get("search:name")
    async searchStartup(@Param("name") name:string){
        return this.startupService.searchStartup(name)
    }

}
