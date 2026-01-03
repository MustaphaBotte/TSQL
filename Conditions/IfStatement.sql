declare @x int=20;
declare @y int=20;


if @x<@y
    begin
        print 'Y bigger than X'
    end

else if @x>@y
    begin
        print 'X bigger than Y'
    end
else
   print 'Equals';