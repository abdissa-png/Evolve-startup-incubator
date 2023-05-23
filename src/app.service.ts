/* eslint-disable prettier/prettier */
import { Injectable,OnModuleInit } from '@nestjs/common';
import { Role } from './entities/Roles.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Assistance } from './entities/Assistance.entity';
import { IndustryStage } from './entities/IndustryStage.entity';
import { UserRole } from './common/roles/user.role';

@Injectable()
export class AppService implements OnModuleInit {
    constructor(
        @InjectRepository(Role) private roleRepository: Repository<Role>,
        @InjectRepository(Assistance) private assistanceRepository: Repository<Assistance>,
        @InjectRepository(IndustryStage) private industryStageRepository: Repository<IndustryStage>,
      ) {}
    async onModuleInit() {
        const roles=[
            {"role":UserRole.ADMIN},
            {"role":UserRole.INVESTOR},
            {"role":UserRole.STARTUP},
        ];
        const assistance=[
            {"assistance":"Funding"},
            {"assistance":"Mentoring"},
            {"assistance":"Legal Assistance"},
            {"assistance":"Other"},
        ];
        const stage=[
            {"stage":"Seed"},
            {"stage":"Early-Stage"},
            {"stage":"Growth"},
            {"stage":"Late-Stage"},
        ]
        await this.roleRepository.count().then(count=>{
            if (!count){
                this.roleRepository.save(roles);
            }
        })
        await this.assistanceRepository.count().then(count=>{
            if (!count){
                this.assistanceRepository.save(assistance);
            }
        });
        await this.industryStageRepository.count().then(count=>{
            if (!count){
                this.industryStageRepository.save(stage);
            }
        });
    }
  
}
