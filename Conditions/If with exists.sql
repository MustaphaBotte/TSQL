declare  @Customername varchar(20);

set @Customername= 'john doe';

if exists(select CustomerID from Customers where Name =@Customername)
 begin
    update Customers set LoyaltyPoints = LoyaltyPoints +10 where Name =@Customername
	declare @error int=@@Error;
	if @error<>0
	     begin
	        print 'an error occured wiht code =' + cast(@error as varchar)
         end
    else
	     begin
	         print 'Loyalty points updated with success'
	     end
 end
