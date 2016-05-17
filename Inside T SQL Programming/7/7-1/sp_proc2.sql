use master;
go

if OBJECT_ID('dbo.sp_proc2') is not null
	drop proc dbo.sp_proc2;
go

create proc dbo.sp_proc2
as
print 'master.dbo.sp_proc2 executing in '+db_name();

select orderid from northwind.dbo.orders;
go

exec sp_MS_marksystemobject 'dbo.sp_proc2';

use NorthWind;
exec dbo.sp_proc2;

use AdventureWorks2012;
exec dbo.sp_proc2;