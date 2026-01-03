declare @Row int=1;
declare @Column int=1;
declare @Result int =0;


while @Row<=10 
begin  
   set @Column =1;

   while @Column<=10
     begin
	   set @Result = @Row*@Column;
	   print cast(@Row as varchar)+' * ' + cast(@Column as varchar)+' = '+ cast(@Result as varchar);
	   set @Column = @Column+1;	   
	 end
print '============'
set @Row =@Row+1;
end;