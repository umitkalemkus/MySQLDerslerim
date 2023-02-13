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

select sirket_id , personel_sayisi from sirketler
where sirket in (select sirket from personel where sehir = 'Ankara');

/* SELECT’den sonra kullanılabilir. Ancak SELECT CLAUSE’da kullanılan Subquery SADECE 1 DEĞER
dönmelidir. Dolayısıyla SUM, COUNT, MIN, MAX ve AVG gibi fonksiyonlar kullanılır.
Bu fonksiyonlara AGGREGATE FUNCTION denir. */
-- Toplam ne kadar  maas odeniyorum;
select sum(maas) from personel;
select avg(maas) from personel;

-- Kaç personele maaş ödüyorum
select count(id) from personel;

-- En yüksek maaş nedir
select max(maas) from personel;

-- Her şirketin ismini, personel sayısını ve 
-- personelin ortalama maaşını listeleyen bir QUERY yazın.

select sirket , 
(select avg(maas) from personel where personel.sirket = sirketler.sirket) AS 'oRTALAMA'  from sirketler;

-- Her şirketin ismini, personel sayısını ve 
-- personelin aldığı max. ve min. maaşı listeleyen bir QUERY yazın.
​
 select sirket, personel_sayisi,
(select max(maas)  from personel where personel.sirket = sirketler.sirket) AS 'ORTALAMA MAAS'
 from sirketler;

-- Her şirketin id’sini, ismini ve 
-- toplam kaç şehirde bulunduğunu listeleyen bir QUERY yazınız.alter
select sirket_id, sirket,
(select count(distinct sehir) from personel where personel.sirket = sirketler.sirket) as sehir 
 from sirketler;

 -- Her şirketin ismini, personel sayısını ve 
-- personelin aldığı max. ve min. maaşı listeleyen bir QUERY yazın.
​
SELECT sirket as Şirket,
personel_sayisi AS 'Personel Sayısı',
(SELECT max(maas) FROM personel where personel.sirket = sirketler.sirket) AS 'Max Maas',
(SELECT min(maas) FROM personel where personel.sirket = sirketler.sirket) AS 'Min Maas'
FROM sirketler;

/*
EXISTS
*/
​
CREATE TABLE mart_satislar
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
​
CREATE TABLE nisan_satislar
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
​
INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
​
INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');
​
select * from mart_satislar;
select * from nisan_satislar;
​ 
 drop table mart_satislar;
​ drop table nisan_satislar;
-- Her iki ayda da aynı id ile satılan ürünlerin urun_id’lerini 
-- ve ürünleri Mart ayında alanların isimlerini getiren bir query yazınız.

select urun_id, musteri_isim from mart_satislar ms
where exists(select 1 from nisan_satislar ns where ms.urun_id = ns.urun_id)

-- Her iki ayda da satılan urun_isimleri aynı ürünlerin urun_isim’ini 
-- ve ürünleri Nisan ayında alanların isimlerini getiren bir query yazınız. 
​
select urun_isim, musteri_isim from nisan_satislar ns
where exists(select 1 from mart_satislar ms where ns.urun_isim = ms.urun_isim)
​
-- Nisan ayında satışı olan ama Mart ayında satışı olmayan ürün_isim'ini listeleyin.
​
select urun_isim from nisan_satislar ns
where not exists(select 1 from mart_satislar ms where ns.urun_id = ms.urun_id)
​
select urun_isim from nisan_satislar ns
where not exists(select 1 from mart_satislar ms where ns.urun_isim = ms.urun_isim)

/*
IS NULL
IS NOT NULL
*/
​
select * from personel;
​
INSERT INTO personel VALUES(999999998, 'Ebubekir Bey', 'Bursa', null, 'Honda');
INSERT INTO personel VALUES(999999997, 'Sümeyra Hanım', 'Kocaeli', null, 'Volvo');
​
select * from personel where maas is null;
select * from personel where maas = null; -- kayıt getirmedi
select * from personel where maas is not null;
​
/*
ORDER BY
ASC : ascending
DESC : descending
*/
​
select * from personel order by sirket;
select * from personel order by sirket asc;
select * from personel order by sirket desc;
​
select * from personel order by sirket, maas desc;
select * from personel order by sirket desc, maas desc;
​
/*
GROUP BY
*/
​
CREATE TABLE manav
(
isim varchar(50), 
urun_adi varchar(50), 
urun_miktar int
);
​
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
​
select * from manav;
​
select isim as İsim, sum(urun_miktar) as Alinan_Toplam_Meyve
from manav
group by isim
order by isim;
​
-- Ürün ismine göre ürünü alan toplam kişi sayısı
​
select urun_adi, count(distinct isim)
from manav
group by urun_adi;
​
-- her şirkette ortalama maaş ne kadar?
​
select sirket, avg(maas)
from personel
group by sirket;


​



