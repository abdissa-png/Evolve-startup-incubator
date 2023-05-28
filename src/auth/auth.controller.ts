/* eslint-disable prettier/prettier */
import { Body, Controller, Delete, Get, HttpCode, HttpStatus, Patch, Post, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { Public } from 'src/common/decorators/public.decorator';
import { LoginDto } from './dto/login.dto';
import { GetCurrentUserId } from 'src/common/decorators/get-current-user-id.decorator';
import { GetCurrentUser } from 'src/common/decorators/get-current-user.decorator';
import { InvestorDto } from './dto/investor.dto';
import { StartupDto } from './dto/startup.dto';
import { AdminDto } from './dto/admin.dto';
import { RolesGuard } from 'src/common/guards/roles.guard';
import { UserRole } from 'src/common/roles/user.role';
import { Roles } from 'src/common/decorators/roles.decorator';

@Controller('api/v1/auth')
export class AuthController {
    constructor(private authService:AuthService){

    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Post("role")
    @HttpCode(HttpStatus.OK)
    async createRole(@Body("role") role:string){
        this.authService.createRole(role)
    }
    
    @Public()
    @Post("login")
    @HttpCode(HttpStatus.OK)
    async login(@Body() dto:LoginDto){
        const result=await this.authService.login(dto);
        return result
    }
    @Public()
    @Post("signup/startup")
    @HttpCode(HttpStatus.CREATED)
    async startupSignup(@Body() dto:StartupDto){
        const result=this.authService.startupSignup(dto)
        return result
    }
    @Public()
    @Post("signup/investor")
    @HttpCode(HttpStatus.CREATED)
    async investorSignup(@Body() dto:InvestorDto){
        const result=this.authService.investorSignup(dto)
        return result
    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Post("signup/admin")
    @HttpCode(HttpStatus.CREATED)
    async adminSignup(@Body() dto:AdminDto){
        const result=this.authService.adminSignup(dto)
        return result;
    }
    @Post("logout")
    @HttpCode(HttpStatus.OK)
    logout(@GetCurrentUserId() userId:number){
        return this.authService.logout(userId);
    }
    @Patch("changePass")
    @HttpCode(HttpStatus.OK)
    async changePass(@GetCurrentUser("email") email:string,@Body("old_password") oldpassword: string,@Body("new_password") password: string){
        return this.authService.changePass(email,oldpassword,password);
    }
    @Delete("deleteAccount")
    @HttpCode(HttpStatus.NO_CONTENT)
    async deleteAccount(@GetCurrentUser("email") email:string,@GetCurrentUser("role") role:string){
        return this.authService.deleteAccount(email,role);
    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Get("search/user")
    async searchUser(@Body("name") name:string){
        return this.authService.searchUser(name)
    }
    @Roles(UserRole.ADMIN)
    @UseGuards(RolesGuard)
    @Delete("remove/user")
    @HttpCode(HttpStatus.NO_CONTENT)
    async removeUser(@Body("email") email:string,@Body("role") role:string){
        return this.authService.removeUser(email,role)
    }
}
