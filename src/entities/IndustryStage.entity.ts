/* eslint-disable prettier/prettier */
import { Entity} from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";

@Entity({name:"industrystage"})
export class IndustryStage{
    @PrimaryGeneratedColumn()
    id:number;
    @Column()
    stage:string;
}