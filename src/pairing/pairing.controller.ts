/* eslint-disable prettier/prettier */
import { Body, Controller, Get, HttpCode, HttpStatus, Patch, Post, UseGuards } from '@nestjs/common';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';
import { PairingService } from './pairing.service';
import { PairingDto } from './dto/pairing.dto';
import { Roles } from 'src/common/decorators/roles.decorator';
import { UserRole } from 'src/common/roles/user.role';
import { RolesGuard } from 'src/common/guards/roles.guard';

@Controller('api/v1/pairing')
export class PairingController {
    constructor(private pairingService:PairingService){

    }
    @Roles(UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Post("request/investor")
    @HttpCode(HttpStatus.CREATED)
    async requestInvestor(@GetCurrentUser("email") startupEmail:string,@Body("email") email:string){
        this.pairingService.requestInvestor(startupEmail,email)
    }
    @Roles(UserRole.INVESTOR)
    @UseGuards(RolesGuard)
    @Post("request/startup")
    @HttpCode(HttpStatus.CREATED)
    async requestStartup(@GetCurrentUser("email") investorEmail:string,@Body("email")email:string){
        this.pairingService.requestStartup(investorEmail,email)
    }
    @Roles(UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Get("pairedInvestors")
    async pairedInvestors(@GetCurrentUser("email") email:string){
        return this.pairingService.pairedInvestors(email)
    }
    @Roles(UserRole.INVESTOR)
    @UseGuards(RolesGuard)    
    @Get("pairedStartups")
    async pairedStartups(@GetCurrentUser("email") email:string){
        return this.pairingService.pairedStartups(email)
    }
    @Roles(UserRole.INVESTOR,UserRole.STARTUP)
    @UseGuards(RolesGuard)    
    @Patch("response")
    @HttpCode(HttpStatus.OK)
    async updateResponse(@Body() dto:PairingDto){
        this.pairingService.updateResponse(dto)
    }
    @Roles(UserRole.INVESTOR,UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Get("requests")
    async getRequests(@GetCurrentUser("email") email:string,@GetCurrentUser("role") role:string){
        return this.pairingService.getRequests(email,role)
    }
    @Roles(UserRole.INVESTOR,UserRole.STARTUP)
    @UseGuards(RolesGuard)
    @Get("responses")
    async getResponses(@GetCurrentUser("email") email:string,@GetCurrentUser("role") role:string){
        return this.pairingService.getResponses(email,role)
    }


}
