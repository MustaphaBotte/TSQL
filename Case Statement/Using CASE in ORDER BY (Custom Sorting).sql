select *  from Applications
order by DATEDIFF(HOUR,Applications.ApplicationDate,Applications.LastStatusDate) desc


select * from sales
order by
case when SaleAmount>150 then 1 else 0 end
-- order it by 1 or 0