DECLARE @sql AS NVARCHAR(12),@i AS INT;
SET @sql=N'set @p=10';

EXEC sys.sp_executesql
	@stmt=@sql,
	@params=N'@p as int output',
	@p=@i OUTPUT;

SELECT @i;