with Incrementing_CTE as
(
select 1 as Number 
union all

select Incrementing_CTE.Number+1 from Incrementing_CTE 
where Number<10

)
select * from Incrementing_CTE
order by Number



