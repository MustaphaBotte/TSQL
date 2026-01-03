alter procedure DeletePersonByID
@P_PersonID int ,
@IsDeleted bit out
as 
begin
 set nocount on;  --dont show the rows affected

  delete  from people where PersonID = @P_PersonID;
  set @IsDeleted= (select case when  @@ROWCOUNT>0 then 1 else 0 end);
end
go

declare @IsDeleted bit
exec DeletePersonByID 9,@IsDeleted out
print @IsDeleted