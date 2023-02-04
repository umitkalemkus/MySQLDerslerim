 DROP DATABASE FSAE01;
​
CREATE DATABASE FSAE01;
​
USE FSAE01;
​
-- UNIQUE
/*
Bir sütundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar.  
*/
​
-- NOT NULL
/*
Bir sütunun  NULL içermemesini, yani boş olmamasını sağlar.
/*
​
CREATE TABLE ogrenciler
( 
id int UNIQUE, 
isim varchar(50) NOT NULL, 
adres varchar(100),
sinav_notu int
);
​
-- drop table ogrenciler;
​
select * from ogrenciler;
​
insert into ogrenciler (id, isim, adres, sinav_notu)
values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(123, 'Derya Soylu', 'İstanbul', 95);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(124, 'Yavuz Bal', 'Ankara', 80);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(125, 'Yavuz Bal', 'Ankara', 80);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(126, 'Yavuz Bal', NULL, 80);
insert into ogrenciler (id, isim, sinav_notu)
values(127, 'Yavuz Bal', 80);
​
insert into ogrenciler (id, isim, adres)
values(128, 'Yavuz Bal', 80);
​
insert into ogrenciler (id, isim, sinav_notu)
values(129, 'Yavuz Bal', '70');
​
insert into ogrenciler (id, isim, adres, sinav_notu)
values(NULL, 'Yavuz Bal', 'Ankara', 80);
​
-- PRIMARY KEY
/*
Bir sütünün NULL içermemesini ve 
sütundaki verilerin BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
*/
​
-- FOREIGN KEY
/*
Başka bir tablodaki Primary Key’i referans göstermek için kullanılır.
Böylelikle, tablolar arasında ilişki kurulmuş olur.
foreign ve primary ile tablolar birbirine bağlamadan da,
id leri ayni olan satirlarda işlem yap diyebiliriz,
böylelikle ayni field verilebilir, parent child ilişkisi olmamiş olur
*/
​
USE FSAE01;

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY,
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);
​
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz', 12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10020', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', 34555, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'veli can', 6000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz' ,12000, '2018-04-14');
​
SELECT * FROM calisanlar;
​
CREATE TABLE adresler
(
calisanlar_id CHAR(5),
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
CONSTRAINT calisanlar_id_fk FOREIGN KEY(calisanlar_id) REFERENCES calisanlar(id)
);
​
select * from adresler;

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','Istanbul');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');

-- drop table adresler;
-- drop table calisanlar;
delete from adresler;

delete from calisanlar where id=10002;
delete from adresler where calisanlar_id=10002;

