/* eslint-disable prettier/prettier */
import { IsEmail, IsNotEmpty, IsString, MaxLength, MinLength } from "class-validator";
export class ComplaintDto {

    @IsNotEmpty()
    @IsString()
    @IsEmail()
    receiver:string;

    @IsNotEmpty()
    @IsString()
    message:string;
    
}