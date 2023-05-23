/* eslint-disable prettier/prettier */
import { IsNotEmpty, IsString } from "class-validator";
export class StartupProfileDto{
    @IsNotEmpty()
    @IsString()
    name:string;

    @IsNotEmpty()
    @IsString()
    description:string;

    @IsNotEmpty()
    @IsString()
    founders:string;

    @IsNotEmpty()
    @IsString()
    industryStage:string;
    
    @IsNotEmpty()
    @IsString()
    address:string;

    @IsNotEmpty()
    @IsString()
    phoneNumber:string;

    @IsNotEmpty()
    requiredAssistance:string[];
}