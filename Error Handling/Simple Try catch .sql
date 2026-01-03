begin try
insert into Employees3 values(1,'MustaphaBotte','IT');
insert into Employees3 values(1,'MustaphaBotte','IT');
end try

begin catch
print error_message(); -- error message (description)
print error_number();  -- error number
print ERROR_SEVERITY() -- level of the error
print ERROR_PROCEDURE() -- which procedure or trigger that did the error  or null if just normal script
print ERROR_LINE()       -- line error
print ERROR_STATE()
end catch; 

select * from   Employees3