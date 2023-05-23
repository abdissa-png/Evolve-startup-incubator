/* eslint-disable prettier/prettier */
import { Body, Controller, Get, HttpCode, HttpStatus, Patch } from '@nestjs/common';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';
import { InvestorService } from './investor.service';
import { InvestorProfileDto } from './dto/profile.dto';

@Controller('api/v1/investor')
export class InvestorController {
    constructor(private startupService:InvestorService){

    }
    @Patch("profile")
    @HttpCode(HttpStatus.OK)
    async updateProfile(@GetCurrentUser("email") email:string,@Body() dto:InvestorProfileDto){
        this.startupService.updateProfile(email,dto)
    }
    @Get("profile")
    async getProfile(@GetCurrentUser("email") email:string){
        return this.startupService.getProfile(email)
    }
    @Get("searchInvestor")
    async searchInvestor(@Body("name") name:string){
        return this.startupService.searchInvestor(name)
    }
}
