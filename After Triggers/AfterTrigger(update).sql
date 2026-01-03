create table StudentsUpdatedLogs
(
ID int identity primary key,
StudentID int ,
PreviousGrade int,
CurrentGrade int,
UpdatedDate datetime default GetDate()
);

alter trigger trg_PersonUpdates on students
after update
as 
begin

if update(grade) -- check if grade is a part of the update statement
begin
 insert into StudentsUpdatedLogs(StudentID,PreviousGrade,CurrentGrade) 
 select inserted.studentId, deleted.Grade ,inserted.Grade from inserted
 inner join deleted on deleted.StudentID = inserted.StudentID;

end
end

update Students set Grade = 78 where StudentID >11
select * from   StudentsUpdatedLogs
select * from  Students where StudentID =4