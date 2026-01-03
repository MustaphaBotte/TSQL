Select GETDATE()as Date --current date time

Select SYSDATETIME()as Date --current date time with more fractionl seconds

select DATEADD(DAY,50,GETDATE())as date --add 50 days to the current data

select DATEDIFF(DAY,'2023-07-30',GETDATE())as date -- get the difference between two dates

select DATEPART(year,GETDATE())as year --get the current year part

select DATEName(month,GETDATE())as Datestring --get the name of the month

select year(GETDATE())as year --get the current year

select month(GETDATE())as Month --get the current Month

select DAY(GETDATE())as Month --get the current DAY

select CONVERT(varchar,GETDATE(),111)as Formateddate --formatting dates (you can search for codes for a specific date format)

select cast(GETDATE() as varchar) as stringDate --convert Datetime to string

select cast(GETDATE() as date) as stringDate --convert Datetime to date

select EOMONTH(GETDATE()) as EndOfMonth --Date of end of the month

NOTE:
--more info here https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16

