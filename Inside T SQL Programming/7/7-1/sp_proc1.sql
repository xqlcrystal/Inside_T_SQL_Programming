set nocount on;
use master;
go

if OBJECT_ID('dbo.sp_proc1') is not null
	drop proc dbo.sp_proc1;
go

create proc dbo.sp_proc1
as 

PRINT 'master.dbo.sp_proc1 executing in '+DB_Name();
Exec('select table_catalog,table_schema,table_name
	from information_schema.tables
	where table_type=''base table'';');

select table_catalog,table_schema,table_name
from INFORMATION_SCHEMA.Tables
where table_type='base table'

go


exec dbo.sp_proc1;