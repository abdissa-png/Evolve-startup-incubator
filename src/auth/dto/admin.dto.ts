/* eslint-disable prettier/prettier */
import { IsEmail, IsNotEmpty, IsString, MaxLength, MinLength } from "class-validator";
export class AdminDto {
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    email:string;

    @IsNotEmpty()
    @IsString()
    name:string;
    
    @IsNotEmpty()
    @IsString()
    @MinLength(6)
    @MaxLength(20)
    password:string;
}