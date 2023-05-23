/* eslint-disable prettier/prettier */
import { IsEmail, IsNotEmpty, IsString, MaxLength, MinLength } from "class-validator";
export class PairingDto {
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    startupEmail:string;
    
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    investorEmail:string;

    @IsNotEmpty()
    @IsString()
    status:string
}