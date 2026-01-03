select Employees7.*, Managers.Name as Manager from Employees7
left join Employees7 Managers  on Employees7.ManagerID = Managers.EmployeeID 
order by Employees7.NAme;


with Hieratchy_CTE as
(
-- setting the anchor
select * , CAST(Name as varchar(100)) as Hierarchy,1 as Level 
from Employees7 where ManagerID is null 
union all

-- recursion
select Employees7.*, CAST(concat(Hieratchy_CTE.Hierarchy ,'->',Employees7.Name)as varchar(100)),
Hieratchy_CTE.Level+1
from Hieratchy_CTE 
inner join Employees7 on Hieratchy_CTE.EmployeeID = Employees7.ManagerID
)
select * from Hieratchy_CTE order by Hierarchy


