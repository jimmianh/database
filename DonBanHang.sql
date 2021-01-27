CREATE DATABASE DonDatHang
GO
USE DonDatHang
GO

CREATE TABLE Orderr(
OrderID int,
CustomerID int,
DateOrder int,
CONSTRAINT mk FOREIGN KEY (CustomerID) REFERENCES Customer(CusID),   
)
GO

CREATE TABLE Customer(
CusID int Primary key,
Name nvarchar(40),
Address int,
Tel int,
)
GO

CREATE TABLE Product(
ProID int,
Name nvarchar(40),
Descripition nvarchar(40),
Unit varchar(20),
Price int,
Qty int,
CatID int,
CONSTRAINT ck FOREIGN KEY (CatID) REFERENCES Category(CatID),
CONSTRAINT pk FOREIGN KEY (ProID) REFERENCES OrderDetails(ProductID)

)
GO

CREATE TABLE Category(
CatID int Primary key,
Name nvarchar,
)
GO

CREATE TABLE OrderDetails(
OrderID int,
ProductID int Primary key,
Price int,
Qty int,
)
GO