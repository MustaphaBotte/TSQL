create procedure UpdatePerson
@P_PersonID int ,@FirstName nvarchar(20) output,@lastName nvarchar(20) output,@Email nvarchar(255) output, @IsUpdated  Bit output
as 
begin
 set @IsUpdated=0;
 if exists(select 1 from People where PersonID =@P_PersonID)
   begin
      update People set FirstName =@FirstName ,
               lastName =@lastName ,Email =@Email where PersonID =@P_PersonID ;
	  if @@ROWCOUNT>0
         set @IsUpdated =1;
   end

end
go

declare @status bit;
exec UpdatePerson 85 ,'update','update','update',@status output

if @status=1
select * from people where PersonID =1 ;

else 
print 'Not updated'