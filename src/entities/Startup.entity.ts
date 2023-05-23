/* eslint-disable prettier/prettier */
import { Entity, OneToOne, ManyToOne, ManyToMany, JoinTable, JoinColumn} from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";

import { User } from './User.entity';
import { IndustryStage } from './IndustryStage.entity';
import { Assistance } from './Assistance.entity';

@Entity({name:"startup"})
export class Startup{
    @PrimaryGeneratedColumn()
    id:number;
    @Column()
    name:string;
    @Column({unique:true})
    email:string;
    @Column({type:"text"})
    description:string;
    @Column()
    founders:string;
    @ManyToOne(() => IndustryStage)
    @JoinColumn()
    industryStage:IndustryStage;
    @Column()
    address:string;
    @Column()
    phoneNumber:string;
    @ManyToMany(()=>Assistance)
    @JoinTable()
    requiredAssistance:Assistance[];
    @OneToOne(() => User)
    @JoinColumn()
    user: User;
}