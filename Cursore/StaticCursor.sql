declare Static_Cursor cursor static for
select ID,Vehicle_Display_Name from VehicleDetails

open Static_Cursor

declare @ID int ,@Name varchar(80)

fetch  next  from  Static_Cursor  into @ID ,@Name
print concat(@ID,' ',@Name)


-- note : because this is a static cursor this changes are not reflecting to the cursor sets
update VehicleDetails set Vehicle_Display_Name =concat(Vehicle_Display_Name,'v2') where ID=3;

while @@fetch_status=0
begin
fetch  next  from  Static_Cursor  into @ID ,@Name
print concat(@ID,' ',@Name)
end


close  Static_Cursor    
deallocate Static_Cursor








--Understanding Static Cursors in T-SQL
--
--Introduction to Static Cursors
--Static cursors in T-SQL create a fixed snapshot of the data at the time the cursor is opened.
--This means any changes made to the underlying data after the cursor has been opened will not be reflected in the cursor's result set.
--Static cursors are particularly useful when you need a consistent set of data throughout the cursor's life and do not need to track 
--real-time changes in the underlying data.
--
--When to Use Static Cursors
--Report Generation: When generating reports where data consistency is essential and should not reflect changes during the report generation process.
--Data Analysis: For analysis tasks where you need to work on a stable dataset.
--Advantages and Disadvantages
--Advantages:
--Consistency: Ensures the data being processed doesn't change during cursor operations.
--Reduced Locking Overhead: Since it doesn’t reflect changes, it might require fewer locks on the data.
--Disadvantages:
--Memory Usage: Can consume more memory as it makes a copy of the data.
--Not Suitable for Real-time Data: Not ideal for scenarios where you need to reflect the latest changes in data.
--Conclusion
--Static cursors are a powerful tool in T-SQL, offering a stable and consistent view of data. 
--They are ideal in scenarios where data consistency throughout the cursor operation is paramount. 
--However, their use should be judicious, considering their impact on memory and the requirement for up-to-date data. 
--Always evaluate if a set-based operation can be used before opting for cursors.