use NorthWind;
go

if OBJECT_ID('dbo.usp_GetOrders') is not null
	drop proc dbo.usp_GetOrders;

go

create proc dbo.usp_GetOrders
	@oDate as datetime
as

select OrderID,CustomerID,EmployeeID,OrderDate
from dbo.Orders
where OrderDate>=@oDate;
go



--打开统计选项
set statistics io on;

exec dbo.usp_GetOrders @oDate='19960101';


select cacheobjtype,objtype,usecounts,sql
from sys.syscacheobjects
where sql not like '%cache%'
	and sql like '%usp_GetOrders%'

--使用重编译选项创建存储过程
alter proc dbo.usp_GetOrders
	@oDate as datetime
with recompile
as

select OrderID,CustomerID,EmployeeID,OrderDate
from dbo.Orders
where OrderDate>=@oDate;
go

exec dbo.usp_GetOrders @oDate='19980506';

exec dbo.usp_GetOrders @oDate='19960101';


--使用重编译选项后将无法看到缓存的对象
select cacheobjtype,objtype,usecounts,sql
from sys.syscacheobjects
where sql not like '%cache%'
	and sql like '%usp_GetOrders%'

--sql server 2005以后支持语句级别重编译
alter proc dbo.usp_GetOrders
	@oDate as datetime

as

select OrderID,CustomerID,EmployeeID,OrderDate
from dbo.Orders
where OrderDate>=@oDate
option(recompile);
go

set statistics io on;
exec dbo.usp_GetOrders @oDate='19980506';

set statistics io on;
exec dbo.usp_GetOrders @oDate='19960101';



select cacheobjtype,objtype,usecounts,sql
from sys.syscacheobjects
where sql not like '%cache%'
	and sql like '%usp_GetOrders%'