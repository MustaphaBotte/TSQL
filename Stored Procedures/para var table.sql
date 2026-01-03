

create type Mytable as table(id int);

create procedure printer 
@table Mytable readonly
as 
begin 
select * from @table;
end

declare @Mytable Mytable
exec printer @table= @Mytable

