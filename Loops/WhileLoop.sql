declare @Counter int =1;

while @Counter<=5
begin
 print 'Counter :'+cast(@Counter as varchar);
 set @Counter =@Counter+1;
end;

set @Counter=5;

print '===================================================';
while @Counter>0
begin
 print 'Counter :'+cast(@Counter as varchar);
  set @Counter =@Counter-1;
end;