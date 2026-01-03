declare static_forward_Cursor  cursor static FORWARD_ONLY for
select StudentID,name from students

open static_forward_Cursor

declare @ID int ,@Name varchar(80)

fetch  next  from  static_forward_Cursor  into @ID ,@Name
print concat(@ID,' ',@Name)


while @@fetch_status=0
begin

fetch  next  from  static_forward_Cursor  into @ID ,@Name
print concat(@ID,' ',@Name)

-- fetch  Prior  from  static_forward_Cursor  into @ID ,@Name -- this will throw an exception because cursor is forward only
-- print  'Previous ' +concat(@ID,' ',@Name)

end


close  static_forward_Cursor    
deallocate static_forward_Cursor


--forward_Only is faster than the scrollable cursors
--because sql server does not store additionl info about the position of previous rows or other metadata
-- Only a simple pointer to the next row is maintained, reducing memory and CPU usage.
