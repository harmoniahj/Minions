show databases;
SET NAMES UTF8;

create table member(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
reg_data datetime not null
);

create table board(
bid int not NULL AUTO_INCREMENT,
uid varchar(100) not null,
subject varchar(160) not null,
comment varchar(100) not null,
reg_data datetime not null,
PRIMARY KEY (bid)
);


alter table member
add (adress varchar(100) not null,
tel varchar(20) not null);

desc member;

insert into member(id,passwd,name,reg_data,adress,tel)
values('hj','1234','jhj',now(),'서울','010-1111-1234');

insert into board(uid, subject, comment, reg_data)
values('1','1111','uu',now());

select * from member;
select * from board;
