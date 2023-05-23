/* eslint-disable prettier/prettier */
import {Entity,ManyToOne} from "typeorm"
import {Column} from 'typeorm/decorator/columns/Column';
import { PrimaryGeneratedColumn } from "typeorm/decorator/columns/PrimaryGeneratedColumn";
import { Role } from './Roles.entity';
// import { Startup } from './Startup.entity';
// import { Investor } from './Investor.entity';

@Entity({name:"user"})
export class User {
  @PrimaryGeneratedColumn()
  id:number;
  @Column()
  name:string;
  @Column({unique:true})
  email:string;
  @Column()
  hash:string;
  @Column({nullable:true})
  hashedRt:string;
  @ManyToOne(() => Role)
  role: Role;
}