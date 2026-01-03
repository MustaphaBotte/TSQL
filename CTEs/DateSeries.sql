declare @StartDate date = '2025-01-01'
declare @EndDate date = '2025-12-31';

with DateSeries_CTE as
(
 select @StartDate as Date
 union all

 select DATEADD(day,1,DateSeries_CTE.Date) from DateSeries_CTE
 where Date<@EndDate
)
select * from DateSeries_CTE
option (maxrecursion 365)