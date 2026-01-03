declare @Balance decimal(10,2) =962;
declare @WithDrawalAmount int =100;


while @Balance>0
begin
 set @Balance =@Balance- @WithDrawalAmount;
 if @Balance<0
   begin 
      print 'Insufficient Balance for withdrawl';
	  break;
   end
    
   print 'Current Balance :'+ cast(@Balance as varchar)+'$';
end
