use AdventureWorks2012;
go

--执行方式一
declare @schemaname as nvarchar(128),@tablename as nvarchar(128);
set @schemaname=N'Production';
set @tablename=N'Product';
declare @objectName as nvarchar(517);
set @objectName=QUOTENAME(@schemaname)+N'.'+QUOTENAME(@tablename);
Exec(N'select count(*) from '+@objectName+N';');



use AdventureWorks2012;
go

--执行方式二
declare @schemaname as nvarchar(128),@tablename as nvarchar(128);
set @schemaname=N'Production';
set @tablename=N'Product';
--declare @objectName as nvarchar(517);
--set @objectName=QUOTENAME(@schemaname)+N'.'+QUOTENAME(@tablename);
Exec(N'select count(*) from '+QUOTENAME(@schemaname)+N'.'+QUOTENAME(@tablename)+N';');



use AdventureWorks2012;
go

--执行方式三：最佳实践，把待执行的sql语句放在变量中
declare @schemaname as nvarchar(128),@tablename as nvarchar(128);
set @schemaname=N'Production';
set @tablename=N'Product';
declare @sql as nvarchar(539);
set @sql=N'select count(*) from '+QUOTENAME(@schemaname)+N'.'+QUOTENAME(@tablename)+N';'
Exec(@sql);