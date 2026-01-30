with sales_daily as (
select
store_nbr,
round (sum (sales),2) total_sales,
round (sum(sum(sales)) over (),2) total_sales_store
from "SALES"."PUBLIC"."TRAIN"
group by 1
),
cum_store as(
select*,
round (sum(total_sales) over(order by total_sales desc),2) cum_sales,
round (sum(total_sales) over(order by total_sales desc)/total_sales_store,2) pct_pareto
from sales_daily
),
pareto_store as (
select*,
case when pct_pareto <= 0.8 then 'Top 80'
else 'Remaining 20%'
end as flag_store
from cum_store
order by total_sales desc
),
top_store as (
select*
from pareto_store
where flag_store = 'Top 80' 
),
family_sales as (
select
tr.family,
sum (tr.sales) total_sales_family
from "SALES"."PUBLIC"."TRAIN" tr
inner join top_store ts
on tr.store_nbr = ts.store_nbr
group by 1
),
agg_family as (
select
family,
total_sales_family,
sum (total_sales_family) over () total_sales_family_all,
from family_sales
),
cumulative_family as (
select*,
round(sum(total_sales_family) over (order by total_sales_family desc),2) cum_family,
round(sum(total_sales_family) over (order by total_sales_family desc)/total_sales_family_all,2) as pct_family_pareto
from agg_family
)
select*,
case 
when pct_family_pareto <= 0.8 then 'Top 80'
else 'Remaining 20%'
end as flag_family
from cumulative_family
order by total_sales_family desc;
