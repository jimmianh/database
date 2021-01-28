create database CodeLean
go

use CodeLean
go

create table classes (
classname char(6),
teacher varchar(30),
timeslot varchar(30),
class int,
lab int
)
go

insert into classes values('hoa','thuan','hai gio',01,1),
                           ('ly','tuan anh','hai gio',02,2),
						   ('anh','hoa','hai gio',03,3),
						   ('toan','thuan','hai gio',04,4)
go

select * from classes
go

create unique clustered index MyClusteredIndex on classes(classname)
go

create nonclustered index TeacherIndex on classes(teacher)
go

drop index TeacherIndex on classes
go

alter index MyClusteredIndex on classes rebuild with(fillfactor=60)
go

create index ClassLabIndex on classes(Class, Lab)
go

exec sp_helpindex 'classes'
go