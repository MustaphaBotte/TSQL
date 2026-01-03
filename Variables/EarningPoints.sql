declare @CustomerID int;
declare @TotalSpent int;
declare @EarnedPoints int;
declare @CurrentYear int;

set @CustomerID =1;
set @CurrentYear =YEAR(datefromparts(2023,01,01));
select @TotalSpent= (select sum(amount) from Purchases where year(PurchaseDate)=@CurrentYear and CustomerID=@CustomerID);

set @EarnedPoints = @TotalSpent/10;

update Customers set LoyaltyPoints =LoyaltyPoints+ @EarnedPoints where CustomerID = @CustomerID;


print 'Loyalty points update for CustomerID    : '+ cast(@CustomerID as varchar);
print '@TotalSpent   : '+ cast(@TotalSpent as varchar);
print 'Earned Points : '+ cast(@EarnedPoints as varchar);

select * from Customers