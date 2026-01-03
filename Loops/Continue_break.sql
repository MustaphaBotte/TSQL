Declare @Counter int =50;

-- break and continue
while @Counter>0
begin

  set @Counter = @Counter-1;
  if @Counter%2 =0
     continue
  print 'Odd Number :'+cast(@Counter as varchar);
  
  if @Counter=21
    break;
end