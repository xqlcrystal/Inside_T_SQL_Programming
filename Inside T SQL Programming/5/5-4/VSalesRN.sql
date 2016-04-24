if OBJECT_ID('dbo.VSalesRN') IS NOT NULL
	drop view dbo.VSalesRN;
Go

Create View dbo.VSalesRN
As

Select mnth,qty,ROW_NUMBER() over(Order by mnth) as rn
from dbo.Sales;
go


