if OBJECT_ID('dbo.vempOrders') is not null
	drop view dbo.vempOrders;
go

create view dbo.vempOrders with schemabinding
as

select O.employeeID,SUM(OD.Quantity) as TotalQty,COUNT_BIG(*) as cnt
from dbo.Orders as O
	join dbo.[Order details] as OD
on O.Orderid=OD.Orderid
group by O.employeeID;

go

create unique clustered index idx_uc_empid on dbo.vempOrders(EmployeeID);
go