create procedure Sp_GetPersonByIdV2 
@P_PersonID int ,@FirstName nvarchar(20) output,@lastName nvarchar(20) output,@Email nvarchar(255) output, @IsFound  Bit output
as 
begin
 set @IsFound=0;
 if exists(select 1 from People where PersonID =@P_PersonID)
   begin
      select @P_PersonID = PersonID ,@FirstName = FirstName,
               @lastName = lastName ,@Email     = Email     from  People where PersonID =@P_PersonID ;
      set @IsFound =1;
   end

end
go

Declare @P_PersonID int=1 ,@FirstName nvarchar(20) ,@lastName nvarchar(20) ,@Email nvarchar(255), @IsFound  Bit ;

exec  Sp_GetPersonByIdV2 @P_PersonID,@FirstName output,@lastName output,@Email output,@IsFound output;
if @IsFound=1
 begin 
   print @P_PersonID
   print @FirstName
   print @lastName 
   print @Email 
end
else
print 'not found'