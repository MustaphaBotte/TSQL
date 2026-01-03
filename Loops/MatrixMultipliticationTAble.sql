declare @Row int=1;
declare @Column int=1;
declare @StringResult varchar(100);
declare @Header varchar(100) ='';
declare @Result int;


while @Row<=10 
begin  
  set @Header =@Header+CAST(@Row as varchar)+'   ';
set @Row =@Row+1;
end;
print '    '+@Header
set @Row =1;




while @Row<=10 
    begin  
      set @column =1;
      set @StringResult=''
      while @column<=10
         begin
    	  
    	     set @Result =@Row*@column;
    	     set @StringResult = @StringResult+cast(@Result as varchar)+char(9); 
    	     set @column = @column+1;
          end;


print cast(@Row as varchar)+char(9)+@StringResult

set @Row =@Row+1;

end;


