
use C21_DB1;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    StockQuantity INT
);

Go

INSERT INTO Products (ProductID, StockQuantity) VALUES (1, 100);
INSERT INTO Products (ProductID, StockQuantity) VALUES (2, 50);
INSERT INTO Products (ProductID, StockQuantity) VALUES (3, 75);



declare @StockQty int ;
set @StockQty = -5;
begin try
 if @StockQty<0 
      begin 
	    THROW 50001,'Stock quantity cannot be negative',1;
		
		-- error number from 50k +(4 bytes)
		-- message less that 2048chars
      end
 else 
   begin
    update Products set StockQuantity =@StockQty where ProductID=1;
   end
end try

begin catch

 select error_message() as Errormessgae , ERROR_NUMBER() as ErrorNumber,ERROR_STATE() as State,ERROR_SEVERITY(); -- log it in another table
 throw;  -- and send the error again
end catch; 
