declare @Max int ;
declare @A int =10;
declare @B int =100;

if @A>@B
   select @Max = @A;
else
   select @Max = @B;

print @Max;

----------------------------------------------------------------
declare @Grade char = 'A' ;
declare @AttendancePercentage int =70;
if @Grade='A' or @AttendancePercentage>=70
  print 'Allowed to participate'
else
  print 'Not Allowed'