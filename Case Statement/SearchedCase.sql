select * ,case when SaleAmount<=100 then 'Weak'
           when SaleAmount between 101 and 200 then 'Good'
           when SaleAmount between 201 and 300 then 'Very Good'
           when SaleAmount>300 then 'Excellent' end as SaleLevel

from Sales


