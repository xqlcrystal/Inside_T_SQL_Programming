if OBJECT_ID('dbo.VGrp') IS NOT NULL
	drop view dbo.VGrp;
go

create view dbo.VGrp
as 

select mnth,sgn,DATEADD(MONTH,-ROW_NUMBER() over(partition by sgn order by mnth),mnth) as grp
from dbo.VSgn;
go