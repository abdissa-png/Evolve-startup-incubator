/* eslint-disable prettier/prettier */
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { tokens } from './types/types';
import { InjectEntityManager, InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/entities/User.entity';
import { Repository, EntityManager } from 'typeorm';
import * as bcrypt from "bcrypt";
import { LoginDto } from './dto/login.dto';
import { Startup } from 'src/entities/Startup.entity';
import { Investor } from 'src/entities/Investor.entity';
import { UserRole } from 'src/common/roles/user.role';
import { StartupDto } from './dto/startup.dto';
import { Role } from 'src/entities/Roles.entity';
import { IndustryStage } from 'src/entities/IndustryStage.entity';
import { Assistance } from 'src/entities/Assistance.entity';
import { InvestorDto } from './dto/investor.dto';
import { AdminDto } from './dto/admin.dto';
import { Pairing } from 'src/entities/Pairing.entity';
@Injectable()
export class AuthService {
    constructor(@InjectRepository(User) private userRepository:Repository<User>,
        @InjectRepository(Startup) private startupRepository:Repository<Startup>,
        @InjectRepository(Investor) private investorRepository:Repository<Investor>,
        @InjectRepository(Role) private roleRepository:Repository<Role>,
        @InjectRepository(IndustryStage) private industryStageRepository:Repository<IndustryStage>,
        @InjectRepository(Assistance) private assistanceRepository:Repository<Assistance>,
        @InjectRepository(Pairing) private pairingRepository:Repository<Pairing>,
        @InjectEntityManager() private entityManager: EntityManager,
        private jwtService:JwtService,
        private config:ConfigService){
    }
    hashData(data:string){
        return bcrypt.hash(data,10);
    }
    async getTokens(userId:number,email:string,role:string):Promise<tokens>{
        const [at,rt]=await Promise.all([
            this.jwtService.signAsync({
                sub:userId,
                email,
                role
            },{
                secret:this.config.get("AT_SECRET"),
                expiresIn:60*60,
            }),
            this.jwtService.signAsync({
                sub:userId,
                email,
                role
            },{
                secret:this.config.get("RT_SECRET"),
                expiresIn:60*60*24*7,
            })
        ])
        return {
            access_token:at,
            refresh_token:rt
        }
    }
    async updateRtHash(userId:number,rt:string){
        const hash=await this.hashData(rt);
        await this.userRepository.update(userId,{hashedRt:hash});
    }
    async login(dto:LoginDto):Promise<any>{
        const email=dto.email;
        const user=await this.userRepository.findOne({where:{email:email},relations:["role"]});
        // console.log(user);
        if(!user) throw new HttpException("Access Denied!",HttpStatus.FORBIDDEN);

        const passwordMatches=await bcrypt.compare(dto.password,user.hash)
        if(!passwordMatches ) throw new HttpException("Access Denied!",HttpStatus.FORBIDDEN);
        const tokens=await this.getTokens(user.id,user.email,user.role.role)
        await this.updateRtHash(user.id,tokens.refresh_token)
        return [user.role.role,tokens];
    }
    async logout(userId:number){
        await this.userRepository.update(userId,{hashedRt:''})
        return true;
    }
    async changePass(email:string,oldpassword:string,password:string){
        const user=await this.userRepository.findOneBy({email});
        if(!user) throw new HttpException("User with given email not found",HttpStatus.NOT_FOUND);
        const passwordsMatch = await bcrypt.compare(oldpassword, user.hash);
        if (passwordsMatch){
            user.hash=await this.hashData(password)
            this.userRepository.save(user)
        }
    }
    async deleteAccount(email:string,role:string){
        if(role==UserRole.STARTUP){
            this.startupRepository.delete({email})
            this.userRepository.delete({email})
            this.pairingRepository.delete({startup:email})
        }else if(role==UserRole.INVESTOR){
            this.investorRepository.delete({email})
            this.userRepository.delete({email})
            this.pairingRepository.delete({investor:email})
        }
    }
    async refreshTokens(userId:number,rt:string){
        const user=await this.userRepository.findOne({where:{id:userId},relations:["role"]});
        if(!user || !user.hashedRt) throw new HttpException("Access Denied!",HttpStatus.FORBIDDEN);
        const rtMatches= await bcrypt.compare(rt,user.hashedRt);
        if(!rtMatches) throw new HttpException("Access Denied!",HttpStatus.FORBIDDEN);
        const tokens=await this.getTokens(user.id,user.email,user.role.role)
        await this.updateRtHash(user.id,tokens.refresh_token)
        return [user.role.role,tokens];
    }
    async startupSignup(dto:StartupDto){
        const hash=await this.hashData(dto.password)
        const role=await this.roleRepository.findOneBy({role:UserRole.STARTUP})
        if (role){
        const newUser=this.userRepository.create({
            name:dto.name,
            email:dto.email,
            hashedRt:'',
            hash:hash,
            role:role
        });
        
        const industryStage=await this.industryStageRepository.findOne({where:{stage:dto.industryStage}})
        const assistancePromises = dto.requiredAssistance.map(async (assistance) => {
            return this.assistanceRepository.findOne({where: {assistance: assistance }});
          });
          
        const assistance= await Promise.all(assistancePromises);
        const newStartupProfile=this.startupRepository.create({
            name:dto.name,
            email:dto.email,
            description:dto.description,
            founders:dto.founders,
            industryStage:industryStage,
            phoneNumber:dto.phoneNumber,
            address:dto.address,
            requiredAssistance:assistance,
            user:newUser
        })
        const savedUser=await this.userRepository.save(newUser).catch((error)=>{
            // console.error(error)
            throw new HttpException("Internal Server Error",HttpStatus.INTERNAL_SERVER_ERROR);
        });
        newStartupProfile.user=savedUser
        const savedStartup=await this.startupRepository.save(newStartupProfile).catch((error)=>{
            // console.error(error)
            throw new HttpException("Internal Server Error",HttpStatus.INTERNAL_SERVER_ERROR);
        });
        const tokens=await this.getTokens(newUser.id,newUser.email,newUser.role.role)
        await this.updateRtHash(newUser.id,tokens.refresh_token)
        return tokens;
        }
    }
    async investorSignup(dto:InvestorDto){
        const hash=await this.hashData(dto.password)
        const role=await this.roleRepository.findOneBy({role:UserRole.INVESTOR})
        if (role){
        const newUser=this.userRepository.create({
            name:dto.name,
            email:dto.email,
            hashedRt:'',
            hash:hash,
            role:role
            });
        
        const industryStagePromises = dto.investmentStage.map(async (stage) => {
            return this.industryStageRepository.findOne({ where:{ stage:stage }});
        });
        const assistancePromises = dto.investmentInterests.map(async (assistance) => {
            return this.assistanceRepository.findOne({where: {assistance: assistance }});
        });
        const investmentStage=await Promise.all(industryStagePromises)
        const investmentInterests= await Promise.all(assistancePromises);
        const newInvestorProfile=this.investorRepository.create({
            email:dto.email,
            name:dto.name,
            description:dto.description,
            phoneNumber:dto.phoneNumber,
            investmentIntersts:investmentInterests,
            investmentStage:investmentStage,
            user:newUser
        });
        const savedUser=await this.userRepository.save(newUser).catch((error)=>{
            // console.error(error)
            throw new HttpException("Internal Server Error",HttpStatus.INTERNAL_SERVER_ERROR);
        });
        newInvestorProfile.user=savedUser;
        const savedInvestor=await this.investorRepository.save(newInvestorProfile).catch((error)=>{
            // console.error(error)
            throw new HttpException("Internal Server Error",HttpStatus.INTERNAL_SERVER_ERROR);
        });
        const tokens=await this.getTokens(newUser.id,newUser.email,newUser.role.role)
        await this.updateRtHash(newUser.id,tokens.refresh_token)
        return tokens;
    }
    }
    async createRole(role:string){
        const newRole=this.roleRepository.create({role:role});
        this.roleRepository.save(newRole)
    }
    async adminSignup(dto:AdminDto){
        const hash=await this.hashData(dto.password)
        const role=await this.roleRepository.findOneBy({role:UserRole.ADMIN})
        const newUser=this.userRepository.create({...dto,hash:hash,role:role})
        const savedUser=await this.userRepository.save(newUser).catch((error)=>{
            console.error(error);
            throw new HttpException("Internal Server Error",HttpStatus.INTERNAL_SERVER_ERROR);
        })
        const tokens=await this.getTokens(newUser.id,newUser.email,newUser.role.role)
        await this.updateRtHash(newUser.id,tokens.refresh_token)
        return tokens;
    }
    async searchUser(name:string){
        const users = await this.userRepository
                        .createQueryBuilder('user')
                        .leftJoinAndSelect('user.role', 'role')
                        .where('user.name LIKE :name', { name: `${name}%` })
                        .getMany()
        return users;
    }
    async removeUser(email:string,role:string){
        if (role==UserRole.STARTUP){
            this.startupRepository.delete({email})
            this.userRepository.delete({email})
            this.pairingRepository.delete({startup:email})
        }else if(role==UserRole.INVESTOR){
            this.investorRepository.delete({email})
            this.userRepository.delete({email})
            this.pairingRepository.delete({investor:email})   
        }
    }
}
