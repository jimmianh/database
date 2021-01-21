IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO
--T?o b?ng L?p h?c
CREATE TABLE LopHoc(
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10)
)
GO
--T?o b?ng Sinh vi�n c� kh�a ngo?i l� c?t MaLopHoc, n?i v?i b?ng
LopHoc
CREATE TABLE SinhVien(
MaSV int PRIMARY KEY,
TenSV varchar(40),
MaLopHoc int,
CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO
--T?o b?ng SanPham v?i m?t c?t NULL, m?t c?t NOT NULL
CREATE TABLE SanPham (
MaSP int NOT NULL,
T�nP varchar(40) NULL
)
GO
--T?o b?ng v?i thu?c t�nh default cho c?t Price
CREATE TABLE StoreProduct(
ProductID int NOT NULL,
Name varchar(40) NOT NULL,
Price money NOT NULL DEFAULT (100)
)
--Th? ki?m tra xem gi� tr? default c� ???c s? d?ng hay kh�ng
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, Rivets)
GO
--T?o b?ng ContactPhone v?i thu?c t�nh IDENTITY
CREATE TABLE ContactPhone (
Person_ID int IDENTITY(500,1) NOT NULL,
MobileNumber bigint NOT NULL
)
GO
--T?o c?t nh?n d?ng duy nh?t t?ng th?
CREATE TABLE CellularPhone(
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)
--Ch�n m?t record v�o
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Ki?m tra gi� tr? c?a c?t Person_ID t? ??ng sinh
SELECT * FROM CellularPhone
GO
--T?o b?ng ContactPhone v?i c?t MobileNumber c� thu?c t�nh UNIQUE
CREATE TABLE ContactPhone (
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
--Ch�n 2 b?n ghi c� gi� tr? gi?ng nhau ? c?t MobileNumber v�
LanlieNumber ?? quan s�t l?i
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345674, 'Alex', NULL)
GO
--T?o b?ng PhoneExpenses c� m?t CHECT ? c?t Amount
CREATE TABLE PhoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
(MobileNumber),
Amount bigint CHECK (Amount >0)
)
GO
--Ch?nh s?a c?t trong b?ng
ALTER TABLE ContactPhone
ALTER COLUMN ServiceProvider varchar(45)
GO
--X�a c?t trong b?ng
ALTER TABLE ContactPhone
DROP COLUMN ServiceProvider
GO
---Them m?t r�ng bu?c v�o b?ng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--X�a m?t r�ng bu?c
ALTER TABLE Person.ContactPhone
DROP CONSTRAINT CHK_RC
