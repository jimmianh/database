create database CodeLean
go
use codelean
go

create table classes
(
classname nvarchar(30),
teacher varchar(30),
timeslot varchar(30),
class int,
lab int,
)
go

insert into classes values  ('T2010A','kim thi','13h30',2343,234322),
							('T2016A','kim thi','13h30',2383,230322),
							('T2015A','kim thi','13h30',23453,23322),
							('T2014A','kim thi','13h30',23433,237322),
							('T2013A','kim thi','13h30',23443,274322),
							('T2012A','kim thi','13h30',23413,284322),
							('T2018A','kim thi','13h30',23423,294322),
							('T2019A','kim thi','13h30',23043,263322)

go
select * from classes


create unique index ix_uq_subjectname on classes(classname)
go

create clustered index ix_subjectid
on classes(classname)
go

create nonclustered index ix_subjectname
on classes(teacher)
go

drop index ix_subjectname on classes
go

alter index ix_subjectname on classes rebuild with (fillfactor=60)

create index classlabindex on classes(class,lab)

execute sp_helpindex 'subjects'
go


create table student
(
studentno int primary key,
studentname nvarchar(50),
studentaddress nvarchar(100),
phoneno int
)
go
insert into student values  (212313,'Bui Van Hoa','hai phong',1234342545),
							(234324,'Luong Minh Tien','ha nam',324832582),
							(236473,'vu hoang ngoc anh','dak nong',3473545),
							(283578,'luong minh thanh','ha nam',3467345783)
go
select * from student

create table department
(
deptno int primary key,
deptname nvarchar(50),
managername nvarchar(30)
)

insert into department values   (123445,'vip pro boy','Luong Minh Tien'),
								(11445,'hoa cai','Bui van hoa'),
								(67458,'choi cho','vu hoang ngoc anh'),
								(56756,'sieu nhan','Luong minh thanh')
go
select * from department

create table assignment
(
assignmentNo int primary key,
descriptions nvarchar(100),
)
insert into assignment values(123,'de'),
								(456,'kho'),
								(903,'de')
go
select * from assignment

create table Works_Assign
(
JobID int Primary Key,
StudentNo int,
AssignmentNo int,
TotalHours int,
JobDetails nvarchar(450)

constraint pk foreign key (studentno) references student(studentno),
constraint mk foreign key (assignmentNo) references assignment(assignmentNo)

)
insert into Works_Assign values (123,212313,23,9,'lam het 100%'),
								(156,234324,23,9,'lam het 100%'),
								(127,236473,23,9,'lam het 100%'),
								(179,283578,23,9,'lam het 100%')
go
select * from Works_Assign
--Tạo 1 clustered 
CREATE clustered index  IX_Student ON Student(StudentNO)
GO

CREATE nonclustered index IX_Dept ON Department(DeptName,ManagerName)
GO