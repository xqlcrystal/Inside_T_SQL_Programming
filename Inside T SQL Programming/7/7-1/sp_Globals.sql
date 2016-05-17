--不要在正式环境中依赖一下行为

use master;
go

create table dbo.sp_Globals
(
var_name sysname not null primary key,
val sql_variant null
);


use NorthWind;
insert into dbo.sp_Globals(var_name,val) values('var1',10);

use Test1;

insert into dbo.sp_Globals(var_name,val) values('var2',CAST(1 as bit));