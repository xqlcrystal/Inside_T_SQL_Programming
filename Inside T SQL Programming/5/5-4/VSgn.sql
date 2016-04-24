if OBJECT_ID('dbo.VSgn') IS NOT NULL
	drop view dbo.VSGN;
Go
CREATE VIEW [dbo].[VSgn]
	AS SELECT Cur.mnth,Cur.qty,SIGN(Cur.qty-Pre.qty) as sgn 
	FROM dbo.VSalesRN as Cur
	left join dbo.VSalesRN as Pre
	on Cur.rn=Pre.rn+1;

	go
