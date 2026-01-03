create procedure IsPersonExists
@ID int as
begin
 return (select result = case when exists(select 1from People where PersonID =@ID) then 1 else 0 end)

end

go

declare @Isexists int ;
exec @Isexists=IsPersonExists 18
print @Isexists