
-- create  database :database olustur
CREATE DATABASE FSAE01;

-- use calismak istedigimiz databaseni belirtiyoruz
USE FSAE01;
-- create table : tablo olusturunuz
create table student
(
id varchar(4),
name varchar(30),
age int
);
-- drop table : tablo sileriz

-- insert into : tabloya veri girisi yapilir.
insert into student values('1000', 'Ali Can', 25);
insert into student (id,name, age) values('1002', 'Ali Veli', 50);
insert into student (id,name, age) values('1003', 'Zeynep' ,45);

select * from student;