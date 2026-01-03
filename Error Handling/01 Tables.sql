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
-- Error Functions Overview
-- ERROR_NUMBER()
-- Purpose: Returns the error number of the error that caused the CATCH block to be executed.
-- Usage: Useful for identifying the specific error that occurred.
-- ERROR_SEVERITY()
-- Purpose: Returns the severity level of the error.
-- Usage: Helps in understanding the nature and seriousness of the error. Severity levels range from 0 to 25.
-- ERROR_STATE()
-- Purpose: Returns the state number of the error.
-- Usage: Useful for providing additional information about the error or to distinguish between errors with the same number.
-- ERROR_PROCEDURE()
-- Purpose: Returns the name of the stored procedure or trigger in which the error occurred.
-- Usage: Essential for identifying the source of the error in complex systems with multiple procedures and triggers.
-- ERROR_LINE()
-- Purpose: Returns the line number where the error occurred.
-- Usage: Helps in pinpointing the exact location in the code where the error was raised, facilitating quicker debugging.
-- ERROR_MESSAGE()
-- Purpose: Provides the complete text of the error message.
-- Usage: Offers a detailed description of the error, which is valuable for understanding what went wrong.