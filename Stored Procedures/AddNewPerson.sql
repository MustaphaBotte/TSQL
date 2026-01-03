alter procedure SP_AddNewPerson
@p_FirstName varchar(100),
@p_LastName varchar(100),
@p_Email varchar(255),
@p_PersonID int output 
as
begin
insert into People values (@p_FirstName,@p_LastName,@p_Email);
set @p_PersonID = @@IDENTITY;
return @p_PersonID
end;

go
declare @InsertedPersonID int = 0
declare @Return int = 0
exec @Return= SP_AddNewPerson @p_FirstName='Mustapha' ,@p_Email ='Email@ex.com', @p_PersonID = @InsertedPersonID output,@p_LastName= 'Botte'
select @InsertedPersonID
select @Return
 
select * from  people