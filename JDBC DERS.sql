-- CREATE DATABASE FSAE01;
USE FSAE01;
/***************************************************
SET SQL_SAFE_UPDATES = 0;
****************************************************/
CREATE TABLE ogrenciler
(
id int,
isim varchar(50),
adres varchar(100),
sinav_notu int
);
 create view ogrenciler_view AS
 select id, isim  from ogrenciler order by isim ;
 
 select * from  ogrenciler_view




 drop table ogrenciler;
select * from ogrenciler;
insert into ogrenciler (id, isim, adres, sinav_notu)
values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(122, 'Ayse Tan', 'Bursa', 65);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(124, 'Yavuz Bal', 'Ankara', 80);
-- WHERE
/*
SELECT *
FROM tablo adı
WHERE koşul
*/
/*
SORU01: Sınav notu 80'den büyük olan öğrencilerin bilgilerini listele
*/
SELECT id, isim, adres, sinav_notu
FROM ogrenciler
WHERE sinav_notu > 80;
/*
SORU02: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
*/
select isim, adres
from ogrenciler
where adres = 'Ankara';
/*
SORU03: id’si 124 olan öğrencinin tüm bilgilerini listele
*/
select *
from ogrenciler
where id = 124;
/*
SORU04: id’si 121 olan öğrencinin adres ve sinav notunu listele
*/
SELECT adres, sinav_notu
FROM ogrenciler
WHERE id = 121;
create table personel
(
id char(4),
isim varchar(40),
maas int
);
select * from personel;
insert into personel values('1001', 'Ali Can', '70000');
insert into personel values('1002', 'Veli Mert','85000');
insert into personel values('1003', 'Ayşe Tan', '65000');
insert into personel values('1004', 'Derya Soylu', '95000');
insert into personel values('1005', 'Yavuz Bal', '80000');
insert into personel values('1006', 'Sena Beyaz', '100000');
-- AND
/*
Belirtilen şartların her ikisi de gerçekleşiyorsa o kayıt listelenir.
Bir tanesi gerçekleşmez ise listelenmez.
*/
/*
SORU: Maaşı 65000 ile 90000 arasında olan persollerin listesi
*/
select *
from personel
where maas > 65000 and maas < 90000;
-- OR
/*
Belirtilen şartlardan biri gerçekleşiyorsa o kayıt listelenir.
Hiç biri gerçekleşmez ise listelenmez.
*/
/*
Ali Can ın ve maaşı 80000 den büyük olanların bilgilerini listele
*/
SELECT *
FROM personel
WHERE isim = 'Ali Can' OR maas > 80000;
-- BETWEEN
SELECT *
FROM personel
WHERE maas BETWEEN 65000 AND 70000;
SELECT *
FROM personel
WHERE maas >= 65000 AND maas <= 70000;
/*
SORU05: id'si 1002 ile 1005 arasında olan personel bilgilerini listele
*/
select * from personel where id between 1002 and 1005;
/*
SORU06: Derya Soylu ile Yavuz Bal arasındaki personel bilgilerini listele
*/
SELECT *
FROM personel
WHERE isim BETWEEN 'Derya Soylu' AND 'Yavuz Bal';
/*
SORU07: id'si 1001, 1002 ve 1004 olan personel bilgilerini listele
*/
select *
from personel
where id = 1001 or id = 1002 or id = 1004;
/*
SORU08: Maaşı sadece 70000 ve 100000 olan personelleri listele
*/
SELECT *
FROM personel
WHERE maas = 70000 OR maas = 100000;
-- IN
SELECT *
FROM personel
WHERE maas IN (70000, 100000);
SELECT *
FROM personel
WHERE isim IN ('Derya Soylu', 'Yavuz Bal');
-- LIKE
/*
SELECT sutun1, sutun2,...
FROM tablo_adı
WHERE sutun LIKE patern
patern işaretleri;
% 0 veya daha fazla karakteri belirtir
_ tek bir karakter
*/
/*
SORU09: İsmi A harfi ile başlayan personelleri listele
*/
SELECT *
FROM personel
WHERE isim LIKE 'A%'
/*
SORU10: İsmi N harfi ile biten personelleri listele
*/
SELECT *
FROM personel
WHERE isim LIKE '%N'
/*
SORU11: İsminin 2. harfi E olan personeli listeleyin
*/
SELECT *
FROM personel
WHERE isim LIKE '_E%'
/*
SORU12: İsminin 2. harfi E olup diğer harflerinde Y olan personel
*/
SELECT *
FROM personel
WHERE isim LIKE '_E%Y%'
SELECT *
FROM personel
WHERE isim LIKE '_E%Y%'
/*
SORU13: İsminde A harfi olmayan personeli listeleyin
*/
SELECT *
FROM personel
WHERE isim NOT LIKE '%A%'
/*
SORU15: 1. harfi A ve 7. harfi A olan personeli listeleyin
*/
SELECT *
FROM personel
WHERE isim LIKE 'A_____A%'
-- NOT
NOT BETWEEN
NOT LIKE
NOT (...AND...)
NOT (...OR...)
SELECT *
FROM personel
WHERE maas NOT BETWEEN 80000 AND 95000;
-- NOT OR
SELECT *
FROM personel
WHERE NOT (maas = 70000 OR maas = 100000);
SELECT *
FROM personel
WHERE maas != 70000 AND maas != 100000;
-- regexp_like
/*
Daha karmaşık pattern ile sorgulama işlemi için
REGEXP_LIKE kullanılabilir.
REGEXP_LIKE(sutun_adı, 'pattern[]', 'c')
'c' => case-sentisitive demektir
'i' => incase-sentisitive demektir.
Default incase-sensitive aktiftir.
VEYA işlemi için | karakteri kullanılır.
Başlangıcı göstermek için ^ karakteri kullanılır.
Bitişi göstermek için $ karakteri kullanılır.
[a-z]
[A-Z]
[0-9]
[a-zA-Z0-9]
*/
SELECT *
FROM personel
WHERE regexp_like(isim, 'A','i')
SELECT *
FROM personel
WHERE regexp_like(isim, '^a','c')