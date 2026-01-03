--What is Window Functions:

--Windows functions (also known as windowed or analytic functions) in T-SQL allow you to perform calculations across 
--a set of rows related to the current row within a result set. These functions are especially useful when you want to 
--compare or aggregate data within a specific "window" or range of rows.


--Types of Window Functions in T-SQL

--Aggregate Functions: 
        --Used to perform calculations over a range of values. Examples include SUM(), AVG(), COUNT(), MAX(), MIN().
--Ranking Functions: 
        --Used to assign a ranking or a row number to each row in a partition. Examples include ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE().
--Analytic Functions:
        --Used for advanced analytical operations like moving averages or cumulative totals. Examples include LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE().
