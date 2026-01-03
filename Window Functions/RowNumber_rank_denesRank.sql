

-- row number assign an incrementing number to each row
select * ,ROW_NUMBER() over (order by Students.grade) from Students


-- Rank assign an incrementing number to each row but if the ordered by column value is duplicated he give it the same
-- value and continue incrementing from the total rows that have that value + the current incrementing value
select * ,Rank() over (order by Students.grade desc) from Students




update Students set grade = 88 where  StudentID=1