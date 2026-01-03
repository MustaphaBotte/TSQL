-- multi statement table valued function MSTVF is a function that can return a table variable

alter Function GetTopEmployeesBySalaries()
returns @Content Table
(
 EmployeeName varchar(20),
 Department nvarchar(50),
 Salary int,
 PerformanceRating int,
 FetchingTime datetime 
)
begin
declare @FetchingTime datetime = GetDate(); -- you cannot do this in TVF

insert into @Content(EmployeeName,Department,Salary,PerformanceRating,FetchingTime) select top 10 *,@FetchingTime from Employees2 order by salary
-- MSTVF allow you to do more statements
-- for example give the table a single FetchingTime across all rows
return;
end
go

select * from dbo.GetTopEmployeesBySalaries()