alter procedure Sp_GetAllPeople
as 
begin
 select * from  People;
end

go
exec Sp_GetAllPeople