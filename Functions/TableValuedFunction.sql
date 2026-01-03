-- inline table valued function ITVF is a function that can return a result set


alter Function GetEmployeesByDepartment(@Department nvarchar(30))
returns table as
return (
  select * from Employees2 where Department = @Department
);
go


select sum(Salary)as TotalSalaries  from dbo.GetEmployeesByDepartment('IT')

--------------------------------------------------------------------
create Function GetStudentsBySubject(@Subject nvarchar(30))
returns table as
return (
  select * from Students where Subject = @Subject
);
go


select * from  Teachers  
inner join DBO.GetStudentsBySubject('MATH')as students on Teachers.Subject = students.Subject
where Grade>80
