alter proc dbo.GetCustOrders
	@custid as nvarchar(5),
	@fromdate as datetime ='19000101',
	@todate as datetime ='99991231',
	@numrows as int output
as

set nocount on;

declare @err as int;
select OrderID,CustomerID,EmployeeID,OrderDate
from dbo.Orders
where CustomerID=@custid and
OrderDate>=@fromdate
and OrderDate<=@todate;

select @numrows=@@ROWCOUNT,@err=@@ERROR;
return @err;

go


declare @myerr as int,@mynumrows as int;

exec @myerr=dbo.GetCustOrders 
@custid=N'ALFKI',@fromdate='19970101',@todate='19980101',
@numrows=@mynumrows output;

select @myerr,@mynumrows;

if OBJECT_ID('tempdb..#CustOrders') is not null
	drop table #custorders;
go

create table #custorders
(
orderid int not null primary key,
customerid nchar(5) not null,
employeeid int not null,
orderdata datetime not null
);

declare @myerr as int,@mynumrows as int;
insert into #custorders(orderid,customerid,employeeid,orderdata)
exec @myerr=dbo.GetCustOrders 
@custid=N'ALFKI',@fromdate='19970101',@todate='19980101',
@numrows=@mynumrows output;


select * from #custorders;