use Northwind;

go
DECLARE
	@schemaname AS NVARCHAR(128),
	@tablename AS NVARCHAR(128),
	@colname AS NVARCHAR(128),
	@sql AS NVARCHAR(805),
	@cnt AS INT;
SET @schemaname=N'dbo';
SET @tablename=N'Orders';
SET @colname=N'CustomerID';
SET @sql=N'select count(distinct '
	+QUOTENAME(@colname)+N') from '
	+QUOTENAME(@schemaname)
	+N'.'
	+QUOTENAME(@tablename)
	+N';';

	--必须将输出结果放在临时表中，然后再在临时表中获取；

CREATE TABLE #T(col int);
INSERT INTO #T(col)
EXEC(@sql);

SET @cnt=(SELECT col FROM #T);

SELECT @cnt;

DROP TABLE #T;