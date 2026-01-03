insert into Customers values(3,'mustapha',0)

declare @ErrorCode int=@@Error;

-- put it in temp var because you will lost the code after the (if instruction)
if @ErrorCode <>0 
 print 'An error occured. error code is :'+cast( @ErrorCode as varchar)