select * from Employees2 order by Department


update employees2 set salary =
case   
    when Department ='HR'
       then
	     case when Salary>90 then Salary*1.15  
            when Salary  between 75 and 90 then salary*1.10 
            when Salary  between 50 and 74 then salary*1.05
            else Salary
	     end
     
	when Department ='IT'
		then
	      case when Salary>90 then Salary*1.10  
               when Salary  between 75 and 90 then salary*1.08 
               when Salary  between 50 and 74 then salary*1.04
               else Salary
	      end
  
     else
	     case when Salary>90 then Salary*1.07  
               when Salary  between 75 and 90 then salary*1.04 
               when Salary  between 50 and 74 then salary*1.02
               else Salary
         end
end;
select * from Employees2 order by Department
