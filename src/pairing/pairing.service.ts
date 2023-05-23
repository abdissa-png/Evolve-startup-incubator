/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { PairingDto } from './dto/pairing.dto';
import { UserRole } from 'src/common/roles/user.role';
import { Pairing } from 'src/entities/Pairing.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from "typeorm";
import { Startup } from 'src/entities/Startup.entity';
import { PairingStatus } from 'src/common/pairingStatus/pairing.status';
import { Investor } from 'src/entities/Investor.entity';

@Injectable()
export class PairingService {
    constructor(
        @InjectRepository(Pairing) private pairingRepository:Repository<Pairing>,
        @InjectRepository(Startup) private startupRepository:Repository<Startup>,
        @InjectRepository(Investor) private investorRepository:Repository<Investor>
    ){}
    async pairedStartups(email: string) {
        const pairing=await this.pairingRepository.find({where:{investor:email,status:PairingStatus.ACCEPTED}})
        const pairingPromises = pairing.map(async (pair) => {
            return this.startupRepository.findOne({where: {email: pair.startup },relations: ['requiredAssistance', 'industryStage']});
        });
        const startups=await Promise.all(pairingPromises)
        return startups;
    }
    async getResponses(email: string, role: string) {
        if (role==UserRole.STARTUP){
            const pairing=await this.pairingRepository.
                                    createQueryBuilder("pairing").
                                    where("paring.startup=:value",{email}).
                                    andWhere("pairing.status !='pending'").
                                    getMany();
            return pairing
        }else if(role==UserRole.INVESTOR){
            const pairing=await this.pairingRepository.
                                    createQueryBuilder("pairing").
                                    where("paring.investor=:value",{email}).
                                    andWhere("pairing.status !='pending'").
                                    getMany();
            return pairing
        }
    }
    async getRequests(email: string, role: string) {
        if (role==UserRole.STARTUP){
            const pairing=await this.pairingRepository.
                                    createQueryBuilder("pairing").
                                    where("paring.startup=:value",{email}).
                                    andWhere("pairing.status ='pending'").
                                    getMany();
            return pairing
        }else if(role==UserRole.INVESTOR){
            const pairing=await this.pairingRepository.
                                    createQueryBuilder("pairing").
                                    where("paring.investor=:value",{email}).
                                    andWhere("pairing.status ='pending'").
                                    getMany();
            return pairing
        }
    }
    async updateResponse(dto: PairingDto) {
        const pairing=await this.pairingRepository.findOne({where:{startup:dto.startupEmail,investor:dto.investorEmail}});
        await this.pairingRepository.save({
            id:pairing.id,
            status:dto.status
        })
    }
    async pairedInvestors(email: string) {
        const pairing=await this.pairingRepository.find({where:{startup:email,status:PairingStatus.ACCEPTED}})
        const pairingPromises = pairing.map(async (pair) => {
            return this.investorRepository.findOne({where: {email: pair.investor },relations: ['investmentIntersts', 'investmentStage']});
        });
        const investors=await Promise.all(pairingPromises)
        return investors;   
    }
    async requestStartup(investorEmail: string, email: string) {
        await this.pairingRepository.save({
            startup:email,
            investor:investorEmail,
            status:PairingStatus.PENDING
        })
    }
    async requestInvestor(startupEmail: string, email: string) {
        await this.pairingRepository.save({
            startup:startupEmail,
            investor:email,
            status:PairingStatus.PENDING
        })
    }
}
