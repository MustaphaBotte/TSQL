create  table #Departments 
(DepartmentID int  primary key ,
Title nvarchar(100) not null,
--fk int foreign key references Departments(Departmentid) --fk is skipped
)


insert into #Departments select * from Departments

select * from Employees
inner join #Departments as varTable on Employees.Departmentid = varTable.DepartmentID

begin tran
delete from #Departments
rollback;

create index test on #Departments (Title)



-- Cleaning Up
-- Temporary tables are automatically deleted when the session that created them ends. However, 
-- it's often considered good practice to explicitly drop them when they are no longer needed.
