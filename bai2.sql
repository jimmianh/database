create database thongtin
go
use thongtin
go

create table giaydangki(
tenkhachhang varchar(900),
socmt int primary key,
diachi nvarchar(900),
sothuebao nvarchar(900),
loaithuebao nvarchar(900),
ngaydangki date,
)
go
INSERT INTO giaydangki VALUES('Nguyen Nguyet Nga',123456789,'ha noi',123456789,'tra truoc',12/12/02);
INSERT INTO giaydangki VALUES('luong minh tien',134456456,'ha nam',123454467,'tra sau',20/08/02);
INSERT INTO giaydangki VALUES('bui van hoa',135456456,'hai phong',123456789,'tra sau',21/01/02);
INSERT INTO giaydangki VALUES('tien dz pro',130446456,'ha nam',123454467,'tra sau',29/08/02);
INSERT INTO giaydangki VALUES('hoa ngu bo',194456456,'hai phong',123456789,'tra sau',29/01/02);
go

select*from giaydangki
go