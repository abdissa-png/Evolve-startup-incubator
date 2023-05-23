/* eslint-disable prettier/prettier */
import { Entity } from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";

@Entity({name:"message"})
export class Message{
    @PrimaryGeneratedColumn()
    id:number;
    @Column()
    from:string;
    @Column()
    to:string;
    @Column({type:"text"})
    message:string;
}