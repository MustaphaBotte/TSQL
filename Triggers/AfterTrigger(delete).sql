alter trigger trg_PersonDeleted on students
after delete as
begin
insert into DeletedStudentsLogs select *,GETDATE() from deleted
end

delete from Students where StudentID>10


select * from  DeletedStudentsLogs  