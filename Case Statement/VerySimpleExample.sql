select Employees.EmployeeID,
case when Employees.DepartmentID =1 then 'Human Resources'
     when Employees.DepartmentID =2 then 'Marketing'
     when Employees.DepartmentID =3 then 'Sales'
     when Employees.DepartmentID =4 then 'IT'
	 else 'Others' end as Department
from Employees


