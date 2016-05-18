use Test1;
go

create proc dbo.usp_proc1
as

select col1 from dbo.T1;

go


exec dbo.usp_proc1;


create table dbo.T1
(
col1 int
);

insert into dbo.T1(col1) values (1);


exec dbo.usp_proc1;

--验证已存在表T1但不存在列col2的存储过程创建
create proc dbo.usp_proc2
as
select col2 from dbo.T1;
go

--执行结果
--Msg 207, Level 16, State 1, Procedure usp_proc2, Line 28
--列名 'col2' 无效。
