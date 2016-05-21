--sp_executesql更胜一筹，可以充分利用执行计划，即生产Prepared的查询
DECLARE @i AS INT;
SET @i=10248;

DECLARE @sql AS NVARCHAR(46);
SET @sql=N'select * from dbo.orders where orderid=@id';

EXEC sys.sp_executesql @stmt=@sql,
@params=N'@id as int',
@id=@i;

SELECT cacheobjtype,objtype,usecounts,sql FROM sys.syscacheobjects
WHERE sql LIKE '%dbo.orders%';