/* eslint-disable prettier/prettier */
import { IsNotEmpty, IsString } from "class-validator";
export class AnnouncementDto {

    @IsNotEmpty()
    @IsString()
    message:string;
    
}