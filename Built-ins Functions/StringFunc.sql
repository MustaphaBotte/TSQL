select Name, Length = len(Name) from employees -- string length

select Upper(Name)as UpperCase from employees  -- upper string 

select Lower(Name)as LowerCase from employees  -- lower string

select RTRIM(Name)as Name from employees  -- remove spaces from right

select LTRIM(Name)as Name from employees -- remove spaces from left

select TRIM(Name)as Name from employees  -- remove spaces

select SUBSTRING(Name,1,3)as Name from employees where EmployeeID=1 -- returns 'Joh' 
select SUBSTRING(Name,0,3)as Name from employees where EmployeeID=1 -- returns 'Jo' because 0 converted to 1 and length reduced by 1

select * from employees

select CHARINDEX('J',Name)as CharIndex from employees where EmployeeID=1  -- the index of the first occurence 

select REPLACE(Name,'e','D')as UpdatedStr from employees where EmployeeID=2 -- replace characters

select LEFT(Name,4)as _Left from employees where EmployeeID=1 -- returns a left part of string by length

select RIGHT(Name,5)as _Left from employees where EmployeeID=1 -- returns a right part of string by length

select CONCAT(UPPER(Name),' - Department ID= ',DepartmentID)as Employee from employees where EmployeeID=1 --concatenation

select FORMAT(hiredate,'dd/MM/yyyy')as hiredate from employees --format
  
select REPLICATE('*',20)as Text  -- duplicate string

select SPACE(20) as Spaces  -- return spaces 

select STR(2650.1445787,6,3)as StrNumber -- convert a float into string with fraction length

select PATINDEX('%+[0-9][0-9][0-9]%','HEllo my country code is +212 morocco')as regexIndex -- first occurence index of a pattern 

select employees.Name from employees where Name like 'J%' -- regex

select * from employees where PATINDEX('j%',Name)>0  -- trick

select DIFFERENCE('mustapha','mutapha') -- return a scale from 0 to 4 representing the similarity of the  soundex

select  SOUNDEX('mustapha') -- the sound code of mustapha

select Employees.DepartmentID, STRING_AGG(Name,' ') from Employees group by DepartmentID --concatenates values from multiple rows

select STRING_ESCAPE('hello\n my name is "mustapha"','json')as SafeText -- Escapes special characters in a string to make it safe for use in JSON text

select * from STRING_SPLIT('java;c#;php;python',';') -- returns valued function table of the splited content

select STUFF('__________ is a great database',1,10,'Sql Server')as Result -- replace a specific length of chars by a string

select UNICODE('A') as ascii --return the ascii code 