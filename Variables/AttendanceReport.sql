declare @ReportYear int;
declare @ReportMonth int;
declare @TotaldaysinMonth int;
declare @EmployeeID int;
declare @PresentDays int;
declare @AbsentDays int;
declare @LeaveDays int;

set @ReportYear=2023;
set @ReportMonth=7;
set @EmployeeID=102;

set @TotaldaysinMonth = DAY(EOMONTH(DATEFROMPARTS(@ReportYear,@ReportMonth,1)));

set @PresentDays = (select count(*) from EmployeeAttendance where year(attendancedate) = @ReportYear and month(attendancedate) = @ReportMonth and EmployeeID=@EmployeeID and status like 'present');
set @AbsentDays = (select count(*) from EmployeeAttendance where year(attendancedate) = @ReportYear and month(attendancedate) = @ReportMonth and EmployeeID=@EmployeeID and status like 'absent');
set @LeaveDays = (select count(*) from EmployeeAttendance where year(attendancedate) = @ReportYear and month(attendancedate) = @ReportMonth and EmployeeID=@EmployeeID and status like 'leave');


print 'report of employee number '+cast( @EmployeeID as varchar);
print 'Report Year : '+cast( @ReportYear as varchar)+' ,Report Month : '+cast( @TotaldaysinMonth as varchar);
print 'Total working days '+cast( @TotaldaysinMonth as varchar);
print 'Present Days :'+cast(@PresentDays as varchar);
print 'Leave Days :'	+cast(@LeaveDays  as varchar);
print 'Absent Days :'	+cast(@AbsentDays as varchar);


select * from EmployeeAttendance