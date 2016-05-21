--sql2000中的特性，及其限制，即只能8000个
DECLARE @sql1 AS VARCHAR(8000),@sql2 AS VARCHAR(8000),@sql3 AS VARCHAR(8000);
SET @sql1='PRINT ''';
SET @sql2=REPLICATE('A',7999)+'B';
SET @sql3=''';';
EXEC(@sql1+@sql2+@sql3);


--sql2005中可以声明varchar(max),最大可达到2GB
DECLARE @sql AS VARCHAR(max),@i AS int;
SET @sql='';
SET @i=1;
WHILE @i<=10000
BEGIN
	SET @sql=@sql+'PRINT '+CAST(@i AS VARCHAR(10))+CHAR(13)+CHAR(10);
	SET @i=@i+1;
END

EXEC(@sql);