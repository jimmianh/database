CREATE DATABASE fixEx
GO
USE fixEx
GO
CREATE TABLE Orderr(
OrderId int,
CustomerId int,
DateId int,
CONSTRAINT ck FOREIGN  KEY (CustomerId ) REFERENCES  Customer(CustomerId)
)
GO
INSERT INTO Orderr (OrderId ,CustomerId ,DateId  )
		VALUES ( 123 , 111, '12/1/2021' ),
				(456, 222 , '13/1/2021 '),
				(789 , 333 , '14/1/2021 ')
GO

CREATE TABLE Customer(
CustomerId int PRIMARY KEY ,
Namee varchar (30),
Addresss varchar (40),
Tel int,
)
GO

INSERT INTO Customer (CustomerId , Namee , Addresss , Tel) 
		VALUES ('111' ,'Bui Van Hoa' , '221 Trung Kinh' , '0376306599 ' ),
				('222' , 'Vu Hoang Ngoc Anh' ,'50 Duong My Dinh ', '9329323930' ),
				 ('333' , 'Luong Minh Tien' ,'Nhon ' ,'3232323')
GO
SELECT Namee FROM Customer
GO

CREATE TABLE Product (
ProductId int PRIMARY KEY ,
Namee varchar (30),
Prescription varchar (40),
Unit varchar (20),
Price money,
Qty int,
CatID varchar (30) ,
CONSTRAINT mk FOREIGN KEY (CatID) REFERENCES Category (CatID),
)
GO
INSERT INTO Product (ProductId , Namee , Prescription , Unit , Price ,Qty,CatID )
		VALUES ('9090' ,'May Tinh T450' , 'May nhap moi','Don vi' ,1000,1, 'xin'),
				('8080', 'Dien thoai Nokia5670','Dien thoai dang hot','Chiec' ,200,2,'xin' ),
				('7070' ,'May in dang e','chiec', 100, 1,100,'deu')

CREATE TABLE Category (
CatID int PRIMARY KEY ,
Namee  varchar (60),
)
 INSERT INTO Category (CatID , Namee ) 
		VALUES ( 'xin' ,'May Tinh T450' ),
				('xin' ,'Dien thoai Nokia5670'),
				('deu' , 'May in dang e' )

GO

CREATE TABLE OrderrDetails(
OrderId int ,
ProductId int PRIMARY KEY ,
Price int ,
Qty varchar(30) ,
CONSTRAINT fk FOREIGN KEY ( ProductId) REFERENCES OrderrDetails (ProductId),
)
GO
INSERT INTO  OrderrDetails (OrderId , ProductId ,Price ,Qty )
		VALUES (	444  , 9090 ,1000, 'xin' ),
				( 555 ,8080 ,200,'xin'),
				(777 ,70 ,100 ,'deu')
GO
SELECT * FROM OrderrDetails
GO