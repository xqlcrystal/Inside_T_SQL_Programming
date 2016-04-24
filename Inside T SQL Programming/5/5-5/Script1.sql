if OBJECT_ID('dbo.vUserData') IS NOT NULL
	drop view dbo.vUserData;
go

if OBJECT_ID('dbo.UserData') IS NOT NULL
	drop table dbo.UserData;
go

create table dbo.UserData
(
	keycol int not null identity primary key,
	loginname sysname not null default(suser_sname()),
	datacol varchar(20) not null
);
go

create view dbo.vUserData
as

select keycol,datacol
from UserData
where loginname=SUSER_SNAME();

go

deny select,insert,update,delete on dbo.UserData to public;
grant select,insert,update,delete on dbo.vUserData to public;
go

select * from dbo.UserData;