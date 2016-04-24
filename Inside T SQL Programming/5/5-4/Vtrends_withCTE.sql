if OBJECT_ID('dbo.Vtrends_withCTE') IS NOT NULL
	drop view dbo.Vtrends_withCTE
go
create view dbo.Vtrends_withCTE
as 
with CSalesRN as
(
	select mnth,qty,ROW_NUMBER() over(order by mnth) as rn
	from dbo.sales
),
CSgn as
(
	select Cur.mnth,Cur.qty,SIGN(Cur.qty-Pre.qty) as sgn
	from CSalesRN as Cur
	left join CSalesRN Pre on Cur.rn=Pre.rn+1
),
CGrp as 
(
	select mnth,sgn,
		DATEADD(month,-ROW_NUMBER() over(partition by sgn order by mnth),mnth) as grp
	from CSgn
),
CTrends as
(
	select CONVERT(varchar(6),min(mnth),112) as start_range,
		CONVERT(varchar(6),max(mnth),112) as end_range,
		case sgn
			when -1 then 'down'
			when 0 then 'same'
			when 1 then 'up'
			else 'unknown'
		end as trend
	from CGrp
	group by sgn,grp
)


select * from CTrends;