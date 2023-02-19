-- CREATE DATABASE FSAE01;

USE FSAE01;

/***************************************************
SET SQL_SAFE_UPDATES = 0;
****************************************************/

CREATE TABLE personel
(
id int,
isim varchar(50),
maas int,
sirket varchar(20),
fotograf mediumblob,
cv mediumtext
);
select * from personel;
INSERT INTO personel VALUES(123456789, "Ali Seker", 2500);
INSERT INTO personel VALUES(234567890, "Ayse Gul", 1500 );
INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 3000);
INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 1000);
INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 7000);