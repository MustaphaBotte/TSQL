alter procedure GenerateQueryAndSelect 
@TableName nvarchar(15)
as begin
 declare @Query nvarchar(200)
 set @Query = 'select * from '+QUOTENAME(@TableName) -- to add [@TableName]
 exec (@Query)
end


alter procedure GenerateQueryAndSelect2 
@EmployeeID nvarchar(15)
as begin
 declare @Query nvarchar(200)
 set @Query = 'select * from employees where EmployeeID =@EmployeeID'
 exec sp_executesql @Query,N'@EmployeeID nvarchar(15)',@EmployeeID=@EmployeeID
end


create table x(id int)

exec GenerateQueryAndSelect @TableName='employees'
exec GenerateQueryAndSelect2 @EmployeeID='1'

-- this is just a simple example of dynamic sql 
-- prevent to use this method because it can lead your to performance issues and sql injection attacks 
-- plus it's more complex in the context of Debugging and Maintenance

-- example of injection



alter procedure GenerateQueryAndSelectEmployee 
@EmployeeID nvarchar(50)
as begin
 declare @Query nvarchar(200)
 set @Query = 'select * from employees where EmployeeID ='+@EmployeeID
 print @Query
 exec sp_executesql @Query
end

exec GenerateQueryAndSelectEmployee '1 or 1=1; drop table x'

-- exec GenerateQueryAndSelectEmployee '1 or 1=1; drop table x'
