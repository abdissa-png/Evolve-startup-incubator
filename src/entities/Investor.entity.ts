/* eslint-disable prettier/prettier */
import { Entity, OneToOne, ManyToMany, JoinTable, JoinColumn} from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";
import { User } from './User.entity';
import { Assistance } from './Assistance.entity';
import { IndustryStage } from './IndustryStage.entity';

@Entity({name:"investor"})
export class Investor{
    @PrimaryGeneratedColumn()
    id:number;
    @Column()
    name:string;
    @Column({unique:true})
    email:string;
    @Column({type:"text"})
    description:string;
    @Column()
    phoneNumber:string;
    @ManyToMany(()=>IndustryStage)
    @JoinTable()
    investmentStage: IndustryStage[];
    @ManyToMany(()=>Assistance)
    @JoinTable()
    investmentIntersts:Assistance[];
    @OneToOne(() => User)
    @JoinColumn()
    user: User;  
}