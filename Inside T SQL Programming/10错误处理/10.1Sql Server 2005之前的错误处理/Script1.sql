select * FROM Northwind.dbo.Categories;

DECLARE @err AS INT;
DECLARE @rc AS INT;

--采用如下方式是不会得到正确的结果的
--SET @err=@@ERROR;
--实际上返回的是上一条语句SET @err=@@ERROR影响的行数，即一行
--SET @rc=@@ROWCOUNT;

SELECT @err=@@ERROR,@rc=@@ROWCOUNT;


SELECT @err,@rc;