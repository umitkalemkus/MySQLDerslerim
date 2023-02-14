-- CREATE DATABASE FSAE01;

USE FSAE01;

/***************************************************
SET SQL_SAFE_UPDATES = 0;
****************************************************/
----  pvot
CREATE TABLE product_sales (
  product_name VARCHAR(100),
  store_location VARCHAR(50),
  num_sales INT
);
INSERT INTO product_sales (product_name, store_location, num_sales) VALUES
('Chair', 'North', 55),
('Desk', 'Central', 120),
('Couch', 'Central', 78),
('Chair', 'South', 23),
('Chair', 'South', 10),
('Chair', 'North', 98),
('Desk', 'West', 61),
('Couch', 'North', 180),
('Chair', 'South', 14),
('Desk', 'North', 45),
('Chair', 'North', 87),
('Chair', 'Central', 34),
('Desk', 'South', 42),
('Couch', 'West', 58),
('Couch', 'Central', 27),
('Chair', 'South', 91),
('Chair', 'West', 82),
('Chair', 'North', 37),
('Desk', 'North', 68),
('Couch', 'Central', 54),
('Chair', 'South', 81),
('Desk', 'North', 25),
('Chair', 'North', 46),
('Chair', 'Central', 121),
('Desk', 'South', 85),
('Couch', 'North', 43),
('Desk', 'West', 10),
('Chair', 'North', 5),
('Chair', 'Central', 16),
('Desk', 'South', 9),
('Couch', 'West', 22),
('Couch', 'Central', 59),
('Chair', 'South', 76),
('Chair', 'West', 48),
('Chair', 'North', 19),
('Desk', 'North', 3),
('Couch', 'West', 63),
('Chair', 'South', 81),
('Desk', 'North', 85),
('Chair', 'North', 90),
('Chair', 'Central', 47),
('Desk', 'West', 63),
('Couch', 'North', 28);
SELECT * FROM product_sales;
SELECT
product_name,
SUM(CASE
  WHEN store_location = 'North' THEN num_sales ELSE 0 END
) AS north,
SUM(CASE
  WHEN store_location = 'Central' THEN num_sales ELSE 0 END
) AS central,
SUM(CASE
  WHEN store_location = 'South' THEN num_sales ELSE 0 END
) AS south,
SUM(CASE
  WHEN store_location = 'West' THEN num_sales ELSE 0 END
) AS west
FROM product_sales
GROUP BY product_name;
drop table personel;
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


ALTER TABLE personel
ADD ulke_isim varchar(20) DEFAULT 'Turkiye';

ALTER TABLE personel
ADD yas int;


ALTER TABLE personel
DROP COLUMN yas;


ALTER TABLE personel
RENAME COLUMN ulke_isim TO ulke_adi;


ALTER TABLE personel
RENAME TO isciler;

ALTER TABLE isciler
MODIFY ulke_adi varchar(30) NOT NULL;


select * from isciler;

-- WIEV --

  Create view isciler2 AS
  select id ,isim ,sehir from isciler;
  select * from isciler2;
  
  DROP VIEW isciler2;
  
  -- INDEX --
  
  CREATE INDEX isim_index
  ON isciler (isim);
    select * from isciler where isim ='Ali Yilmaz';
    
    
    
    SELECT DATEDIFF('2023-02-14','2023-01-01') TarihFark;
    
    ALTER TABLE isciler
	ADD  baslama_tarihi date;
    
    
	ALTER TABLE isciler
	ADD  ayrilma_tarihi date;
    
    
    
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda', '2017-01-01' ,'2023-03-04');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');



select now();
select PI();
/* STRING FONKSIYONLAR */

SELECT CONCAT('AD', '' ,'SOYAD') AS AdSoyad ;
SELECT CONCAT (isim ,'-', sehir) as isim_sehir from isciler;

SELECT isim , length(isim) from isciler;

select substring(' Umit kalemkus ' , 3) AS substring ;

select ceil(2.7);
select FLOOR(2.7);
select MOD(5 ,2);


select * FROM isciler WHERE mod(id ,2)=0;
select * FROM isciler WHERE mod(id ,2)=1;

-- ROUND 

SELECT ROUND(PI() , 2);
SELECT ROUND(3.14567, 2);


SELECT truncate(3.14567, 3);
SELECT power(2 ,3 );

select rand();
select sign(-7)

select sin(30);











    