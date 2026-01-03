-- USING CTE
with TotalSales as
(
select EmployeeID , Sum(SaleAmount)as TotalSales from SalesRecords
group by EmployeeID
)
,
SalesRank as
(
select * ,DENSE_RANK() over (order by TotalSales desc)as Rank from TotalSales
)
Select * from SalesRank

