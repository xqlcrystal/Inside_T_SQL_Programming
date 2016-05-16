if OBJECT_ID('dbo.T1') is not null
	drop table dbo.T1;
go

create table dbo.T1
(
keycol int not null constraint pk_T1 primary key check(keycol>0),
datacol varchar(10) not null
);

go

if OBJECT_ID('dbo.fn_T1_getkey') is not null
	drop function dbo.fn_T1_getkey;
go

create function dbo.fn_T1_getkey() returns int
as
begin
	return
	case
		when not exists(select * from dbo.T1 where keycol=1) then 1
	else
		(select min(keycol+1)
		from dbo.T1 as A
		where not exists(select * from dbo.T1 as B where B.keycol=A.keycol+1)
		)
	end;

end
go

alter table dbo.T1 add default(dbo.fn_T1_getkey()) for keycol;

insert into dbo.T1(datacol) values('a');
insert into dbo.T1(datacol) values('b');
insert into dbo.T1(datacol) values('c');

select * from dbo.T1;

alter function dbo.fn_add1(@i as int) returns int
	with schemabinding
as 
begin
	return @i+1;

end

alter table dbo.T1 add col1 as dbo.fn_add1(keycol) constraint uq_T1_col1 unique;

select * from dbo.T1;
alter table dbo.T1 drop constraint pk_T1;

alter table dbo.T1
	add col2 as dbo.fn_add1(keycol) 
	--persisted not null
	constraint pk_T1 primary key;