USE Northwind;
GO

IF OBJECT_ID('dbo.usp_GetCustomerOrders') IS NOT NULL
	DROP PROC dbo.usp_GetCustomerOrders;
go

CREATE PROCEDURE dbo.usp_GetCustomerOrders
	@custid AS VARCHAR(5),
	@fromdate AS DATETIME='19000101',
	@todate AS DATETIME='99991231',
	@numrows AS INT OUTPUT
AS

DECLARE @err AS INT;
SELECT OrderID,EmployeeID,CustomerID,OrderDate
FROM dbo.Orders
WHERE CustomerID=@custid
	AND OrderDate>=@fromdate
	AND OrderDate<@todate;

SELECT @numrows=@@ROWCOUNT,@err=@@ERROR;

go





--测试上面的程序
SET LOCK_TIMEOUT 5000;
DECLARE @err AS INT,@rc AS INT;

--返回成功
--EXEC @err=dbo.usp_GetCustomerOrders @custid=N'ALFKI',@fromdate='19970101',@todate='19980101',@numrows=@rc output;
--不返回任何行
EXEC @err=dbo.usp_GetCustomerOrders @custid=N'ALFKI',@fromdate='19980101',@todate='19980101',@numrows=@rc output;

select @err AS error_number,@rc AS row_count;

IF @err=0 AND @rc>0 
BEGIN
	PRINT 'Processing Successful';
	RETURN;
END

IF @err=0 AND @rc=0
BEGIN
	PRINT 'No rows were selected';
	RETURN;
END

IF @err=1222
BEGIN 
	PRINT 'handing lock timeout expired error';
	RETURN;
END
	