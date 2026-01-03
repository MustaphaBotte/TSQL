alter Function AvgGradesPerSubject (@Subject nvarchar(20))
returns int 
begin
return (select avg(Grade) from Students where Subject=@Subject)
end

go

-- normal way
select *,AvgGrades =(select avg(Grade) from Students s where teachers.Subject=subject) from teachers

--using scalar function 
-- readable, maintanable,reuseable,copmiled,Encapsulated,optimized by db engine
-- Security:control access to that function
select *,AvgGrades =dbo.AvgGradesPerSubject(subject) from teachers

-----------------------------------------------------------------
-- another example imaging puttin all that code in sub query

create Function CalculateBonus(@Salary int , @PerfRating int) 
returns float 
begin
if @PerfRating>90 
 return @Salary * 1.15
if @PerfRating>80
  return @Salary * 1.10
if @PerfRating>60
  return @Salary * 1.05
if @PerfRating>60
  return @Salary * 1.03

return @Salary
end

-- look at this example
select *, 
case when PerformanceRating>90 
 then Salary * 1.15
when PerformanceRating>80
  then Salary * 1.10
when PerformanceRating>60
  then Salary * 1.05
when PerformanceRating>60
  then Salary * 1.03
end as Bonus
from  Employees2 order by PerformanceRating desc

-- and look to this 
select * ,DBO.CalculateBonus(salary,PerformanceRating)as Bonus
from Employees2 order by PerformanceRating desc

select * from Employees2
where Salary = DBO.CalculateBonus(salary,PerformanceRating)

