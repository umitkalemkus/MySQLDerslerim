-- Create Komutu Kullanimi Tablo olusturmak icin kullanilan komut
create table Kitaplar(
KitapID int not null,
KitapAD nvarchar(50) not null,
Yazar nvarchar(50) not null,
Yayinevi nvarchar(50) not null,
Fiyat   int not null)