--切换数据库上下文
USE Northwind;
GO

DECLARE @db AS NVARCHAR(258);
SET @db=QUOTENAME(N'pubs');
EXEC(N'use '+@db+';');
SELECT DB_NAME();