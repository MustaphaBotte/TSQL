alter trigger  trg_InsteadOFDeleteStudent on students
instead of delete
as
begin
 --SOFT DELETE
 update Students set IsDeleted=1 from Students    
 inner join deleted on deleted.studentID = Students.studentID

end


delete from Students where StudentID=7

-- Note:we have an after trigger that is executed after the each delete statement
-- so here the instead of trigger is executed first and he overrides the delete operation
-- so after delete will not be executed 

select * from Students
