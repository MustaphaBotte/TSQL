create procedure Sp_GetPersonById 
@P_PersonID int 
as 
begin
 select * from  People where PersonID =@P_PersonID ;
end

go
exec  Sp_GetPersonById @P_PersonID = 3

