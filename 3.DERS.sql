-- CREATE DATABASE FSAE01;
USE FSAE01;

CREATE TABLE calisanlar
(
ID char(9),
ISIM varchar(50),
SOYISIM varchar(50),
EMAİL varchar(50),
ISE_BASLAMA_TARIHI VARCHAR(15),
IS_UNVANI varchar(20),
MAAS int,
CONSTRAINT calisanlar_pk PRIMARY KEY (ID)
);
select * FROM calisanlar;
INSERT INTO calisanlar  VALUES("123456789","Ali","Can","alican@gmail.com","2010-04-10","isci",5000);
INSERT INTO calisanlar VALUES("123456788","Veli","CEM","velicem@gmail.com", "2012-01-10","isci",5500);
INSERT INTO calisanlar VALUES("123456777","AYSE","GUL","aysegul@gmail.com","2014-05-01","MUHASEBECI",4500);
INSERT INTO calisanlar VALUES("123456987","Fatma","YASA","fatmayasa@gmail.com","2009-04-19","MUHENDIS",7500);





