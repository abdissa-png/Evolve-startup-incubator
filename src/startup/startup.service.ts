/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Startup } from 'src/entities/Startup.entity';
import { StartupProfileDto } from './dto/profile.dto';
import { IndustryStage } from 'src/entities/IndustryStage.entity';
import { Assistance } from 'src/entities/Assistance.entity';
import { User } from 'src/entities/User.entity';

@Injectable()
export class StartupService {
    constructor(
        @InjectRepository(Startup) private startupRepository:Repository<Startup>,
        @InjectRepository(IndustryStage) private industryStageRepository:Repository<IndustryStage>,
        @InjectRepository(Assistance) private assistanceRepository:Repository<Assistance>,
        @InjectRepository(User) private userRepository:Repository<User>,
    ){}
    async updateProfile(email:string,dto:StartupProfileDto){
        // console.log(email)
        // console.log(dto)
        const industryStage=await this.industryStageRepository.findOne({where:{stage:dto.industryStage}})
        const assistancePromises = dto.requiredAssistance.map(async (assistance) => {
            return this.assistanceRepository.findOne({where: {assistance: assistance }});
          });
          
        const assistance= await Promise.all(assistancePromises);
        const startup=await this.startupRepository.findOne({where:{email:email},relations:["user"]})
        await this.userRepository.save({
            id:startup.user.id,
            name:dto.name
        })
        await this.startupRepository.save({
        id:startup.id,
        name:dto.name,
        address:dto.address,
        description:dto.description,
        founders:dto.founders,
        industryStage:industryStage,
        requiredAssistance:assistance,
        phoneNumber:dto.phoneNumber,
    })
    }
    async getProfile(email:string){
        const profile=await this.startupRepository.findOne({where:{email:email},relations: ['requiredAssistance', 'industryStage']})
        return profile
    }
    async searchStartup(name:string){
        const users = await this.startupRepository
                        .createQueryBuilder('startup')
                        .where('startup.name LIKE :name', { name: `${name}%` })
                        .leftJoinAndSelect('startup.requiredAssistance', 'requiredAssistance')
                        .leftJoinAndSelect('startup.industryStage', 'industryStage')
                        .getMany()
        return users;
    }
}
