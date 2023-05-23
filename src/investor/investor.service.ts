/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Assistance } from 'src/entities/Assistance.entity';
import { IndustryStage } from 'src/entities/IndustryStage.entity';
import { Investor } from 'src/entities/Investor.entity';
import { User } from 'src/entities/User.entity';
import { InvestorProfileDto } from './dto/profile.dto';

@Injectable()
export class InvestorService {
    constructor(
        @InjectRepository(Investor) private investorRepository:Repository<Investor>,
        @InjectRepository(IndustryStage) private industryStageRepository:Repository<IndustryStage>,
        @InjectRepository(Assistance) private assistanceRepository:Repository<Assistance>,
        @InjectRepository(User) private userRepository:Repository<User>,
    ){}
    async updateProfile(email:string,dto:InvestorProfileDto){
        // console.log(email)
        // console.log(dto)
        const industryStagePromises = dto.investmentStage.map(async (stage) => {
            return this.industryStageRepository.findOne({ where:{ stage:stage }});
        });
        const assistancePromises = dto.investmentInterests.map(async (assistance) => {
            return this.assistanceRepository.findOne({where: {assistance: assistance }});
          });
        const investmentStage=await Promise.all(industryStagePromises)
        const assistance= await Promise.all(assistancePromises);
        const investor=await this.investorRepository.findOne({where:{email:email},relations:["user"]})
        await this.userRepository.save({
            id:investor.user.id,
            name:dto.name
        })
        await this.investorRepository.save({
            id:investor.id,
            name:dto.name,
            description:dto.description,
            phoneNumber:dto.phoneNumber,
            investmentIntersts:assistance,
            investmentStage:investmentStage,
    })
    }
    async getProfile(email:string){
        const profile=await this.investorRepository.findOne({where:{email:email},relations: ['investmentIntersts', 'investmentStage']})
        return profile
    }
    async searchInvestor(name:string){
        const users = await this.investorRepository
                        .createQueryBuilder('investor')
                        .where('investor.name LIKE :name', { name: `${name}%` })
                        .leftJoinAndSelect('investor.investmentIntersts', 'investmentIntersts')
                        .leftJoinAndSelect('investor.investmentStage', 'investmentStage')
                        .getMany()
        return users;
    }
}
