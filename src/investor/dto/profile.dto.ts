/* eslint-disable prettier/prettier */
import { IsNotEmpty, IsString } from "class-validator";
export class InvestorProfileDto{
    @IsNotEmpty()
    @IsString()
    name:string;

    @IsNotEmpty()
    @IsString()
    description:string;

    @IsNotEmpty()
    @IsString()
    phoneNumber:string;

    @IsNotEmpty()
    investmentStage:string[];
    
    @IsNotEmpty()
    investmentInterests:string[];
}