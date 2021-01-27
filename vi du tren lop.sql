use master 
go
IF (Db_ID('Exam10Test')IS NOT NULL)
drop Database Exam10Test
else 
create database Exam10Test
go
create table classes
( 
ClassID Int IDENTITY,
ClassName Nvarchar(10),
CONSTRAINT PK_Classes PRIMARY KEY(ClassID),
CONSTRAINT UQ_CLasses UNIQUE(ClassName),
)
CREATE TABLE Students
(
RollNo varchar(6) constraint PK_Students Primary key,
FullName nvarchar(50) NOT NULL,
Email varchar(100) CONSTRAINT UQ_StudentsEmail UNIQUE,
ClassName nvarchar(10) CONSTRAINT FK_Student_Classes
FOREIGN KEY REFERENCES CLasses(ClassName) ON UPDATE CASCADE
)
go
INSERT INTO classes(ClassName) values ('toan')
									--('Van'),
									--('ENGLISH')
INSERT INTO Students(RollNo ,FullName ,Email ,ClassName) VALUES 
('t1234','Vũ Hoàng Ngọc Anh', 'Jimmi1807@gmail.com','toan'),
('t1235','Vũ Hoàng Anh', 'Jimm1807@gmail.com','toan')
go
create INDEX IX_Email ON Students(Email)
go
--tạo bảng subjects
CREATE TAble Subjects
(
SubjectID int ,
SubjectsName Nvarchar(100)
)
--Tạo chỉ mục clustered
Create CLUSTERED INDEX IX_SubjectID
ON Subjects(SubjectID)
--tạo chỉ mục nonclustered
create NONCLUSTERED INDEX IX_SubjectName
ON Subjects(SubjectID)
--tạo chỉ mục duy nhất 
create UNIQUE INDEX IX_UQ_SubjectName on Subjects(SubjectName)
--tạo chỉ mục kết hợp 
create INDEX IX_Name_Email On Students(FullName,Email)
go
--xóa chỉ mục IX_SubjectID
DROP INDEX IX_SubjectID On Subjects
--tạo chỉ mục IX_SubjectID mới với tùy chọn FILLFACTOR
Create CLUSTERED INDEX IX_SubjectID on Subjects(SubjectID)
WITH(FILLFACTOR=60)
--xoá chỉ mục IX_SubjectID
DROP INDEX IX_Subject ON Subjects
GO
--Tạo chỉ mục IX_SubjectID mới với tùy chọn PAD_INDEX và FILLFACTOR
CREATE CLUSTERED INDEX IX_SubjectID ON Subjects(SubjectID)
WITH(PAD_INDEX=on,FILLFACTOR=60)
go
--xem định nghĩa chỉ mục dùng sp_
