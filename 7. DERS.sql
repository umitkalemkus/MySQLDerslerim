USE FSAE01;
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

SELECT sirket, min(maas) AS en_az_maas
FROM personel
GROUP BY sirket
HAVING MIN(maas) >2000;

SELECT sehir, MAX(maas) AS max_maas
FROM personel
GROUP BY sehir
HAVING MAX(maas) < 5000;

/*
UNION
UNION ALL
*/
​
SELECT 'Mart Satışlar' as Ay, urun_id, musteri_isim, urun_isim FROM mart_satislar
UNION
SELECT 'Nisan Satışlar', urun_id, musteri_isim, urun_isim FROM nisan_satislar;
​
SELECT 'Mart Satışlar' as Ay, urun_id, musteri_isim, urun_isim FROM mart_satislar
UNION
SELECT 'Nisan Satışlar', urun_id, musteri_isim, urun_isim FROM nisan_satislar
ORDER BY Ay DESC;
​
SELECT urun_isim FROM mart_satislar
UNION ALL
SELECT urun_isim FROM nisan_satislar;
​
SELECT urun_isim FROM mart_satislar
UNION ALL
SELECT urun_isim FROM nisan_satislar
UNION ALL
SELECT urun_isim FROM mayis_satislar;
​
/*
JOINS
INNER JOIN
LEFT JOIN
RIGHT JOIN
*/





​
 DROP TABLE sirketler;
 DROP TABLE siparisler;
 DROP TABLE siparisler;
​
CREATE TABLE sirketler
(
sirket_id int, 
sirket_isim varchar(20)
);
​
CREATE TABLE siparisler
(
siparis_id int,
sirket_id int, 
siparis_tarihi date
);
​
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
​
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');
​
SELECT * FROM sirketler;
SELECT * FROM siparisler;

SELECT sirketler.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM sirketler INNER JOIN siparisler ON sirketler.sirket_id = siparisler.sirket_id;

SELECT sirketler.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM sirketler LEFT JOIN siparisler ON sirketler.sirket_id = siparisler.sirket_id;

SELECT siparisler.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM sirketler RIGHT JOIN siparisler ON sirketler.sirket_id = siparisler.sirket_id;


/* LIKE */
​
CREATE TABLE musteriler
(
id int UNIQUE,
isim varchar(50) NOT NULL, 
gelir int
);
​
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);

SELECT * FROM musteriler WHERE isim LIKE 'A%';


 -- SORU -2 İsmi e harfi ile biten müşterilerin isimlerini ve gelirlerini yazdıran QUERY yazın.
SELECT isim,gelir
FROM musteriler
WHERE isim LIKE '%e';

-- SORU-3: İsminin içinde er olan müşterilerin isimlerini ve gelirlerini yazdıran QUERY yazın.
SELECT isim,gelir
FROM musteriler
WHERE isim LIKE '%er%';

-- 2) _ => Sadece bir karakteri gösterir.
-- SORU: İsmi 5 harfli olup son 4 harfi atma olan müşterilerin tüm bilgilerini yazdıran QUERY yazın.

SELECT *
FROM musteriler
WHERE isim LIKE '_atma';

-- SORU: İkinci harfi a olan müşterilerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM musteriler
WHERE isim LIKE '_a%';


-- SORU: Üçüncü harfi s olan müşterilerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM musteriler
WHERE isim LIKE '__s%';

-- SORU: Üçüncü harfi s olan ismi 4 harfli müşterilerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM musteriler
WHERE isim LIKE '__s_';

-- SORU: İlk harfi F olan en az 4 harfli müşterilerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM musteriler
WHERE isim LIKE 'F___%'


-- SORU: İkinci harfi a, 4.harfi m olan müşterilerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM musteriler
WHERE isim LIKE '_a_m%';

CREATE TABLE kelimeler
(
id int UNIQUE,
kelime varchar(50) NOT NULL,
Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
​
SELECT * FROM kelimeler;

-- SORU: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM kelimeler
WHERE  REGEXP_LIKE (kelime, 'h[ai]t');


-- SORU 1: İlk harfi h olmayan kelimelerin tüm bilgilerini yazdıran QUERY yazın.
SELECT *
FROM kelimeler
WHERE kelime NOT LIKE 'h%';

SELECT UPPER(kelime) FROM kelimeler; 
SELECT LOWER(kelime) FROM kelimeler; 

SELECT * FROM musteriler LIMIT 3;















