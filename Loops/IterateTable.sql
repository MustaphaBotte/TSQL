declare @Max int =0;
declare @EmployeeID int =0;
declare @Name varchar(20) ='';

set @EmployeeID =( select min(EmployeeID) from employees);

set @Max =( select max(EmployeeID) from employees);

while @EmployeeID is not null and @EmployeeID<=@Max
begin
 set  @Name = (select Name from Employees where EmployeeID=@EmployeeID);
 print 'Employee name :'+@Name
 set  @EmployeeID = (select  min(EmployeeID) from employees where  EmployeeID>@EmployeeID);
end