DECLARE @Year int;
DECLARE @Month int;
DECLARE @TotalTransactions int;
DECLARE @TotalSales float;

set @Year=2023;
set @Month=6;

select @TotalSales = (select sum(SaleAmount) from sales where year(saleDate) =@Year and month(saleDate)=@Month);
select @TotalTransactions = (select count(*) from Sales where year(saleDate) =@Year and month(saleDate)=@Month);

print 'Sales Reporter';
print 'Year ' +cast(@Year as varchar)+ ' , Month '+cast(@Month as varchar);
print 'Total sales = '+cast(@TotalSales as varchar)
print 'Total Transactions  = '+cast(@TotalTransactions  as varchar)
print 'Average Sales  = '+cast((@TotalSales/@TotalTransactions)  as varchar)






