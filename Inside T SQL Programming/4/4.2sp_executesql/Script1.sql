DECLARE @sql AS NVARCHAR(4000),@b AS VARBINARY(1000),@s AS VARCHAR(2002);
SET @s='0x0123456789abcdef';
SET @sql=N'set @O='+@s+N';';
EXEC sys.sp_executesql
	@stmt=@sql,
	@params=N'@O as VARBINARY(1000) output',
	@O=@b OUTPUT;

SELECT @b;

