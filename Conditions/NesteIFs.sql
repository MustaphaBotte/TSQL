declare @score int;

set @score=90;
if @score>=90
   begin 
     if @score=100
	   begin 
	      print 'Congrats Grade A' 
	   end  
	   else
	     print ' Grade A' 
   end
else    
   begin 
      if @score>=80
	     begin 
		    print 'Score B'
         end
      else 
	    print 'Score C or lower'
   end