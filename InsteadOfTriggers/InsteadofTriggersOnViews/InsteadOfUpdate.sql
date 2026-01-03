create trigger trg_InsteadOfStudentViewUpdated on StudentView
instead of update
as
begin
update PersonalInfo set StudentID = inserted.studentID, Name=inserted.Name, Address = inserted.Address from PersonalInfo
inner join inserted on inserted.StudentID =PersonalInfo.StudentID;

update AcademicInfo set StudentID = inserted.studentID, Course=inserted.Course, Grade = inserted.Grade  from AcademicInfo
inner join inserted on inserted.StudentID =AcademicInfo.StudentID

end 
GO


select * from StudentView

update StudentView set Name='mstafa' ,Course='Programming'  where StudentID=2
