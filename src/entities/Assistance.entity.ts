/* eslint-disable prettier/prettier */
import { Entity} from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";

@Entity({name:"assistance"})
export class Assistance{
    @PrimaryGeneratedColumn()
    id:number;
    @Column()
    assistance:string;
}