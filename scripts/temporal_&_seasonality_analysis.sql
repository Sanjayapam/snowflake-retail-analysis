
Search
Search

Selection deleted
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


----- Case 5: Analisis Tren Harian (Optimasi Snowflake) -----

with top_stores as (
select store_nbr
from (
select 
store_nbr, 
sum(sales) as store_total_sales,
sum(sum(sales)) over () as grand_total_sales,
sum(sum(sales)) over (order by sum(sales) desc) / nullif(sum(sum(sales)) over (), 0) as pct_cum
from "SALES"."PUBLIC"."TRAIN"
group by 1
) where pct_cum <= 0.81 
),
daily_trends as (
select 
t.family,
dayname(t.date) as day_of_week,
extract(dayofweek from t.date) as day_num, 
sum(t.sales) as total_sales
from "SALES"."PUBLIC"."TRAIN" t
inner join top_stores ts on t.store_nbr = ts.store_nbr
where t.family in ('GROCERY I', 'BEVERAGES', 'PRODUCE', 'CLEANING', 'DAIRY')
group by 1, 2, 3
)
select 
family,
day_of_week,
round(total_sales, 2) as sales_amount,
round(total_sales * 100.0 / sum(total_sales) over (partition by family), 2) as pct_contribution_of_week
from daily_trends
order by family, day_num;
