use master;
exec sp_MS_marksystemobject 'dbo.sp_proc1'

use NorthWind;

exec dbo.sp_proc1;

use AdventureWorks2012;

exec dbo.sp_proc1;

exec AdventureWorks2012.dbo.sp_proc1;


use NorthWind;
go

if OBJECT_ID('dbo.sp_proc1') is not null
	drop proc dbo.sp_proc1;
go

create proc dbo.sp_proc1
as
print 'northwind.dbo.sp_proc1 executing in '+db_name();
go


exec NorthWind.dbo.sp_proc1;

use AdventureWorks2012;

exec dbo.sp_proc1;