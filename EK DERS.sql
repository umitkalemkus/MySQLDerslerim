use fsae01;
drop table if exists aileler;
drop table if exists calisanlar;
CREATE TABLE calisanlar (
id CHAR(4),
isim VARCHAR(50),
maas int,
CONSTRAINT id_pk PRIMARY KEY (id) );
​
INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000),
( '1002', 'Mehmet Yılmaz' ,12000),('1003', 'Meryem ', 7215),
('1004', 'Veli Han', 5000), ('1005', 'Alı Hana', 5700),
('1006', 'Alı Can', 15000), ('1007', 'Alı Aslan', 7700),
('1008', 'Salih Aslan', 6000), ('1009', 'Can Ağa', 6700);
​
CREATE TABLE aileler (
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int,
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id) );



​
INSERT INTO aileler VALUES('1001', 4, 2000),('1002', 2, 1500),
('1003', 1, 1200),('1004', 3, 1400),('1005', 3, 3200),('1006', 6, 3400),
('1007', 4, 2500),('1008', 5, 5400),('1009', 3, 1900);

select * from aileler;
select * from calisanlar;

-- SORU-1 Veli han'in maasina %20 zam yapiniz.
select * from calisanlar where isim = 'Veli Han';
UPDATE `fsae01`.`calisanlar`
SET
`maas` = maas *1.2
WHERE isim = 'Veli Han';

-- Soru 2) Ek geliri maaşın %25 inden az olanların, isim ve maaşlarını listeleyiniz

select isim , maas from calisanlar where maas*0.25>( select ek_gelir from aileler where aileler.id =calisanlar.id)


-- Soru 2a) id si 1002 kişinin Ek geliri maaşın %25 inden az ise,  isim ve maaşlarını listeleyiniz
select isim, maas from calisanlar 
where id='1002' and maas*0.25>(select ek_gelir from aileler where  aileler.id='1002');








