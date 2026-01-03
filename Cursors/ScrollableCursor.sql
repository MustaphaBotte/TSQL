declare Scrollable_Cursor  cursor static SCROLL for
select StudentID,name from students

open Scrollable_Cursor

declare @ID int ,@Name varchar(80)



fetch  next  from  Scrollable_Cursor  into @ID ,@Name   -- next
print concat(@ID,' ',@Name)

fetch  relative 3  from  Scrollable_Cursor  into @ID ,@Name  -- jump 3 rows forward
print  concat(@ID,' ',@Name)

fetch  relative -3  from  Scrollable_Cursor  into @ID ,@Name  -- jump 3 rows backward
print  concat(@ID,' ',@Name)

fetch  absolute 3  from  Scrollable_Cursor  into @ID ,@Name   -- jump 3 rows from the first row
print  concat(@ID,' ',@Name)

fetch  absolute -3  from  Scrollable_Cursor  into @ID ,@Name   -- jump 3 rows from the last row
print  concat(@ID,' ',@Name)


fetch  Prior  from  Scrollable_Cursor  into @ID ,@Name  
print  'Previous ' +concat(@ID,' ',@Name) 

fetch  absolute 1  from  Scrollable_Cursor  into @ID ,@Name  -- jump to first
print  'First ' +concat(@ID,' ',@Name)  

fetch  last  from  Scrollable_Cursor  into @ID ,@Name -- jump to last
print  'Last ' +concat(@ID,' ',@Name)  



close  Scrollable_Cursor    
deallocate Scrollable_Cursor


--Scrollable_Cursor is slower than forward only cursors
--because sql server store additionl info about the position of previous rows or other metadata
-- you cannot you absolute in dynamic cursor because data can be changed at run time