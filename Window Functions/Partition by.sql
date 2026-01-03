select Department,Avg(Salary)As AvgSlr from Employees2
group by Department


-- partition by function allows you to partition your data
-- based on a common value like group by
-- but also allows you to select those rows not just one row
select *,DENSE_RANK() over(Partition by Subject order by grade desc) As Rank from Students

--------------------- example 2------------------------------
select * ,
DENSE_RANk() over (partition by Subject order by Grade)As RANk,
avg(grade) over(partition by Subject)As AvgGrades,
Sum(grade) over()As TotalGradesInAllSubjects
from students
