set nocount on ;
use NorthWind;
go

if OBJECT_ID('dbo.fn_GetcustOrders') is not null
	drop function dbo.fn_GetcustOrders;
go

create function dbo.fn_GetcustOrders
(@cid as nchar(5)) returns table
as
return 
	select OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,
	Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry
	from dbo.Orders
	where CustomerID=@cid;
go


select o.OrderID,o.CustomerID,OD.ProductID,OD.Quantity
from dbo.fn_GetcustOrders(N'ALFKI') as O
join dbo.[Order Details] as OD
on o.OrderID=OD.OrderID

begin tran
select OrderID,ShipVia from dbo.fn_GetcustOrders(N'ALFKI') As O;
update dbo.fn_GetcustOrders(N'ALFKI') set ShipVia=2;
select OrderID,ShipVia from dbo.fn_GetcustOrders(N'ALFKI') As O;
rollback