/* eslint-disable prettier/prettier */
import { Controller, Get, HttpCode, HttpStatus, Patch, Post } from '@nestjs/common';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';
import { PairingService } from './pairing.service';
import { PairingDto } from './dto/pairing.dto';

@Controller('api/v1/pairing')
export class PairingController {
    constructor(private pairingService:PairingService){

    }
    @Post("requestInvestor")
    @HttpCode(HttpStatus.CREATED)
    async requestInvestor(@GetCurrentUser("email") startupEmail:string,email:string){
        this.pairingService.requestInvestor(startupEmail,email)
    }
    @Post("requestStartup")
    @HttpCode(HttpStatus.CREATED)
    async requestStartup(@GetCurrentUser("email") investorEmail:string,email:string){
        this.pairingService.requestStartup(investorEmail,email)
    }
    @Get("pairedInvestors")
    async pairedInvestors(@GetCurrentUser("email") email:string){
        return this.pairingService.pairedInvestors(email)
    }    
    @Get("pairedStartups")
    async pairedStartups(@GetCurrentUser("email") email:string){
        return this.pairingService.pairedStartups(email)
    }    
    @Patch("response")
    @HttpCode(HttpStatus.OK)
    async updateResponse(dto:PairingDto){
        this.pairingService.updateResponse(dto)
    }
    @Get("requests")
    async getRequests(@GetCurrentUser("email") email:string,@GetCurrentUser("role") role:string){
        return this.pairingService.getRequests(email,role)
    }
    @Get("responses")
    async getResponses(@GetCurrentUser("email") email:string,@GetCurrentUser("role") role:string){
        return this.pairingService.getResponses(email,role)
    }


}
