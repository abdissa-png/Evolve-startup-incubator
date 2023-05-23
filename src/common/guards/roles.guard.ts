/* eslint-disable prettier/prettier */
import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Reflector } from '@nestjs/core';
import { JwtService } from '@nestjs/jwt';
import {AuthGuard} from '@nestjs/passport';
@Injectable()
export class RolesGuard extends AuthGuard('jwt'){
  constructor(private reflector: Reflector,
    private jwtService:JwtService,
    private config:ConfigService) {
    super()
  }

  canActivate(context: ExecutionContext): boolean {
    const requiredRoles = this.reflector.get<string[]>('roles', context.getHandler());
    if (!requiredRoles) {
      return true;
    }
    const request=context.switchToHttp().getRequest()
    const token=request.headers.authorization?.split(' ')[1];
    // console.log(token)
    if (token){
      try{
      const secret=this.config.get("AT_SECRET")
      // console.log(typeof(secret))
      const decodedToken=this.jwtService.verify(token,{secret:secret});
      // console.log(decodedToken)
      const userRole=decodedToken.role;
      return requiredRoles.some((role) => userRole==role);
      } catch(err){
        console.error(err)
        return false
      }
    }
    
  }
}