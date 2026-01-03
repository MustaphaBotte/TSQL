Declare @Departments table
(DepartmentID int  primary key ,
Title nvarchar(100) not null
)


insert into @Departments select * from Departments

select * from Employees
inner join @Departments as varTable on Employees.Departmentid = varTable.DepartmentID


-- variable table example
