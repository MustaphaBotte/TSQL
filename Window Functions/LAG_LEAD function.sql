select StudentID,name,subject,
Previous= lag(CONCAT(StudentID,' :',Name),1,'none') over(order by Grade),
Grade,
Next= lead(CONCAT(StudentID,' :',Name),1,'none') over(order by Grade)

from Students

-- lag funtion is a window function that give you the ability to get data from the previous row
-- lead funtion is a window function that give you the ability to get data from the next row
-- those functions are taking 3 parameters 

-- expression : what you want to select
-- offset : integer that represent how many rows to jump. by default 1, and if 0 the select will be applied on the current row
-- default : which expression to return if no row exists 


-- In this query:

 -- We use LAG and LEAD to fetch the student from the previous and the next row