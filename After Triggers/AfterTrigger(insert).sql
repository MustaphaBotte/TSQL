create table StudentsLogs
(ID int identity primary key,
StudentID int ,
InsertDate datetime default GetDate()
);

alter trigger trg_InsertedStudentsLogs on Students
after insert
as 
begin 
insert into StudentsLogs(StudentID) select StudentID from inserted
end


begin tran
insert into Students values(40,'mustapha' ,'Programming',80);
commit;

select * from StudentsLogs

select * from Students
select * from StudentsLogs
