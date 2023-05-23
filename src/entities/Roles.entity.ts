/* eslint-disable prettier/prettier */
import { Entity} from 'typeorm';
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";

@Entity({name:"role"})
export class Role {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  role: string;

}