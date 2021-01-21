create database BookLibrary
go
use BookLibrary
go
create table Book(
BookCode int ,
BookTitle varchar(100) NOT NULL,
Author varchar(50) NOT NULL,
Edition int ,
BookPrice money,
Copies int,
constraint BookCode PRIMARY KEY(BookCode)
)
go

create table Member(
MemberCode int,
Name varchar(50) NOT NULL,
Address varchar(100) NOT NULL,
PhoneNumber int,
constraint MemberCode PRIMARY KEY(MemberCode)
)
go

create table IssueDetails(
BookCode int, 
MemberCode int, 
IssueDate datetime, 
ReturnDate datetime,
CONSTRAINT fk FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
CONSTRAINT ak FOREIGN KEY (BookCode) REFERENCES Member(MemberCode)
)
go
alter table IssueDetails
drop CONSTRAINT fk,
CONSTRAINT ak

alter table Member
drop constraint MemberCode

alter table Book
drop constraint BookCode

alter table IssueDetails
add constraint MemberCode PRIMARY KEY(MemberCode),
constraint PhoneNumber PRIMARY KEY(PhoneNumber)

alter table Book
add constraint BookCode PRIMARY KEY (BookCode),
constraint BookPrice CHECK (BookPrice <200 and BookPrice>0)

alter table IssueDetails
add CONSTRAINT fk FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
CONSTRAINT ak FOREIGN KEY (BookCode) REFERENCES Member(MemberCode)

alter table IssueDetails
alter column  MemberCode int NOT NULL

alter table IssueDetails
alter column  BookCode int NOT NULL

alter table IssueDetails
add constraint pk primary key( BookCode, MemberCode)