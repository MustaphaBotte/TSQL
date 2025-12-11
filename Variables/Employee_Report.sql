DECLARE @DepartementID int;
Declare @DepartementName varchar(30);
DECLARE @StartDate date;
DECLARE @EndDate date;
Declare @TotalEmployees int;

set @DepartementID=3;
set @StartDate='2023-01-01';
set @EndDate='2023-12-31';


set @DepartementName = (select Name from Departments where DepartmentID = @DepartementID);
set @TotalEmployees = (select count(*) from Employees where DepartmentID = @DepartementID and HireDate between @StartDate and @EndDate);

print 'employees reporter';
print 'Departement Name      :'+@DepartementName;
print 'Reporting Period From :'+cast(@StartDate as varchar) + ' To '+cast(@EndDate as varchar);

print 'Total employees in '+ @DepartementName +' is :'+cast( @TotalEmployees as varchar);