with daily_sales as (
select
t.date,
s.store_nbr,
s.city,
s.state,
sum (t.sales) total_sales
from"SALES"."PUBLIC"."TRAIN" t
left join "SALES"."PUBLIC"."STORES" s
on t.store_nbr = s.store_nbr
where t.sales != 0
group by 1,2,3,4
),
agg_transaksi as(
select
d.store_nbr,
d.city,
d.state,
count (distinct d.date) count_day,
sum (d.total_sales) sum_sales,
sum (coalesce (tr.transactions, 0)) transaksi
from daily_sales d
left join "SALES"."PUBLIC"."TRANSACTIONS" tr
on d.store_nbr = tr.store_nbr
and d.date = tr.date
group by 1,2,3
),
ranking as (
select
store_nbr,
row_number() over (order by sum_sales desc) rank_store
from agg_transaksi
)
select
ag.store_nbr,
ag.city,
ag.state,
ag.count_day,
round (ag.sum_sales, 2) total_sales_store,
ag.transaksi,
r. rank_store
from agg_transaksi ag
left join ranking r
on ag.store_nbr = r.store_nbr
order by rank_store;
