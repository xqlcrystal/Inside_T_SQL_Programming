set nocount on;
use tempdb;
go

if OBJECT_ID('dbo.Employees') is not null
	drop table dbo.Employees;
go

create table dbo.Employees
(
	empid int not null primary key,
	mgrid int null references dbo.Employees,
	empname varchar(25) not null,
	salary money not null,
);

go


insert into dbo.Employees(empid,mgrid,empname,salary) values(1,null,'David',$10000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(2,1,'Eitan',$7000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(3,1,'Ina',$7500);

insert into dbo.Employees(empid,mgrid,empname,salary) values(4,2,'Seraph',$5000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(5,2,'Jiru',$5500);
insert into dbo.Employees(empid,mgrid,empname,salary) values(6,2,'Steve',$4500);
insert into dbo.Employees(empid,mgrid,empname,salary) values(7,3,'Aaron',$5000);


insert into dbo.Employees(empid,mgrid,empname,salary) values(8,5,'Lilach',$3500);
insert into dbo.Employees(empid,mgrid,empname,salary) values(9,7,'Rita',$3000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(10,5,'Sean',$3000);

insert into dbo.Employees(empid,mgrid,empname,salary) values(11,7,'Gabriel',$3000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(12,9,'Emilia',$2000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(13,9,'Michael',$2000);
insert into dbo.Employees(empid,mgrid,empname,salary) values(14,9,'Didi',$1500);


if OBJECT_ID('dbo.fn_subordinates') is not null
	drop function dbo.fn_subordinates;
go

create function dbo.fn_subordinates(@mgrid as int) returns @subs table
(
empid int not null primary key clustered,
mgrid int null,
empname varchar(25) not null,
salary money not null,
lvl int not null,
unique clustered(lvl,empid)
)
as
begin
	declare @lvl as int;
	set @lvl=0;
	insert into @subs(empid,mgrid,empname,salary,lvl)
	select empid,null,empname,salary,@lvl
	from dbo.Employees
	where empid=@mgrid

end