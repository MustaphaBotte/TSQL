
-- it clean and maintainable  using CTE

with TotalSales as
(
select EmployeeID , Sum(SaleAmount)as TotalSales from SalesRecords
group by EmployeeID)
,

TopSalesRank as
(select TOP 3 * ,DENSE_RANK() over (order by TotalSales desc)as Rank from TotalSales)
,
AvgTopSales as
(select AVG(TotalSales)as AvgOfTopSales from TopSalesRank )
delete from AvgTopSales



-- NOW look at sub queries
select AVG(TotalSales)as AvgOfTopSales from
(
select top 3* , Rank() over (order by TotalSales)as RANK from 
(
select employeeID, Sum(SaleAmount)as TotalSales from SalesRecords
group by employeeID
)TotalSalesTB)TopSalesTB



-- even with removing the RANK function , it's still not clean
select avg(TOPSales.TOTAl) from 
(
select TOP 3  *
from
(select EmployeeID, SUm(SaleAmount) as TOTAl from  SalesRecords group by  EmployeeID)topSales
order by TOTAl)TOPSales