begin tran

begin try

  if not exists(select 1 from Accounts where accountid =1)
   begin
     throw 50002,'sender not found',1;
   end

  if(select Balance from Accounts where accountid =1)<100
   begin
     throw 50003,'balance is under amount',1;
   end

  if not exists(select 1 from Accounts where accountid =2)
  begin
     throw 50002,'receiver not found',1;
  end

  update accounts set balance = balance -100 where accountid =1;
  if @@ROWCOUNT=0
   begin 
        throw 50004,'failed to update sender balance',1;
   end

   update accounts set balance = balance +100 where accountid =2;
   if @@ROWCOUNT=0
     begin 
        throw 50004,'failed to update receiver balance',2;
     end
    
   insert into Transactions values (1,2,100,GETDATE());
  
   if @@ROWCOUNT=0
   begin
      throw 50005,'failed to insert the transaction',1;
   end
   
   commit tran;
end try

begin catch
  rollback;
  throw;
end catch


select * from accounts;
select * from transactions;
