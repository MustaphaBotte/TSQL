create or alter  trigger trg_InsteadOfStudentViewInsert on StudentView
instead of insert
as
begin
insert into personalInfo select StudentID,Name,Address from inserted
insert into AcademicInfo select StudentID,Course,Grade from inserted
end
go








insert into StudentView values(2,'karim', 'casa' ,'Philosphy','100')
select * from StudentView
select * from personalInfo
select * from AcademicInfo 