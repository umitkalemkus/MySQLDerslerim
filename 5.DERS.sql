-- SUBQUERIES (select icinde select yazmak)
USE FSAE01;

/***************************************************
SET SQL_SAFE_UPDATES = 0;
****************************************************/

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, "Ali Seker", "Istanbul", 2500, "Honda");
INSERT INTO personel VALUES(234567890, "Ayse Gul", 'Istanbul', 1500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');

CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
personel_sayisi int
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

select * from personel;
select * from sirketler;

-- 1) Personel sayısı 15.000’den çok olan şirketlerin isimlerini ve
-- bu şirkette çalışan personelin isimlerini listeleyin.
select isim ,sirket 
from personel 
where sirket in (select sirket  from sirketler WHERE personel_sayisi > 15000);

-- 2) sirket_id’si 101’den büyük olan şirketlerin maaşlarını ve şehirlerini listeleyiniz.

select  isim ,maas , sehir from personel 
where sirket in (select sirket  from sirketler WHERE sirket_id > 101);

-- Ankara’daki şirketlerin sirket_id ve çalışan sayılarını listeleyiniz.

select sirket_id , personel_sayisi from sirketler;










