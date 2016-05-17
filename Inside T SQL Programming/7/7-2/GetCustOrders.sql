use NorthWind;
go

if OBJECT_ID('dbo.GetCustOrders') is not null
	drop proc dbo.GetCustOrders;
go

create proc dbo.GetCustOrders
	@custid as nvarchar(5),
	@fromdate as datetime ='19000101',
	@todate as datetime ='99991231'
as

set nocount on;

select OrderID,CustomerID,EmployeeID,OrderDate
from dbo.Orders
where CustomerID=@custid and
OrderDate>=@fromdate
and OrderDate<=@todate

exec dbo.GetCustOrders N'ALFKI',default,'19980101'

exec dbo.GetCustOrders 
@custid=N'ALFKI',@fromdate='19970101',@todate='19980101'