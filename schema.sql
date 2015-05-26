drop database if exists dbUsers;

create database if not exists dbUsers;

use dbUsers;

drop table if exists tblUsers;
drop table if exists tblAdmin;

create table if not exists tblUsers(
   userId integer primary key auto_increment,
   username varchar(100) unique,
   password varchar(100)
)engine=innodb;

create table if not exists tblAdmin(
   adminId integer primary key auto_increment,
   username varchar(100) unique,
   password varchar(100)
)engine=innodb;
