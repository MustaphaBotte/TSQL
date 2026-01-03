select count(*)As NumberOfEmployees,PerformanceCategory,TotalSalaries=Avg(Salary) from(select *,

PerformanceCategory = case
when PerformanceRating>=80 then 1
when PerformanceRating>=60 then 2
else 'Low' end 
from Employees2)A
group by A.PerformanceCategory
