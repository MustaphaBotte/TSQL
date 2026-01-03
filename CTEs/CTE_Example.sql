-- sub query
select * from (select Department,Sum(Salary)  as Salaries 
from Employees2
group by Department )As SubQuery;



-- CTE
with CTE_Query as
(
 select Department,Sum(Salary)  as Salaries 
 from Employees2
 group by Department
)
select C1.Department,C1.Salaries, C2.Department,C2.Salaries ,Difference =abs(C1.Salaries-C2.Salaries)  from CTE_Query C1
inner join CTE_Query C2 on  C1.Department <> C2.Department


--A CTE is a temporary named result set (like a virtual table) 
--that exists only for the single query immediately following its definition