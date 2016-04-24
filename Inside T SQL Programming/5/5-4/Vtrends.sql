if OBJECT_ID('dbo.Vtrends') IS NOT NULL
	drop view dbo.Vtrends;
go

create view dbo.Vtrends
as 

select CONVERT(varchar(6),MIN(mnth),112) as start_range,
	CONVERT(varchar(6),max(mnth),112) as end_range,
	case sgn
		when -1 then 'down'
		when 0 then 'same'
		when 1 then 'up'
		else 'unknown'
	end as trend　
from dbo.Vgrp
group by sgn,grp