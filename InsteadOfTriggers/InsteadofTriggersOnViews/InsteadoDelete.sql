create or alter trigger trg_InsteadOfStudentUDeleted on StudentView
instead of delete
as
begin

delete A from AcademicInfo A
inner join deleted on deleted.StudentID =A.StudentID;

delete s from PersonalInfo s 
inner join deleted on deleted.StudentID =s.StudentID;

end 
GO

delete from StudentView where StudentID=2