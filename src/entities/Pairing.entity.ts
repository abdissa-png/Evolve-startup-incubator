/* eslint-disable prettier/prettier */
import { Entity } from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";

@Entity({name:"pairing"})
export class Pairing{
  @PrimaryGeneratedColumn()
  id:number;
  @Column()
  startup:string;
  @Column()
  investor:string;
  @Column()
  status:string;
  @Column()
  requestFrom:string;
}