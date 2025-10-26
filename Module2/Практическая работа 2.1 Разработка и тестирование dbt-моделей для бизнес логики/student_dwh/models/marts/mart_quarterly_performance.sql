-- models/marts/mart_quarterly_performance.sql
with orders as (
    select *
    from {{ ref('stg_orders') }}
)

select
    date_trunc('quarter', order_date) as quarter,
    sum(sales) as total_revenue,
    sum(profit) as total_profit
from orders
group by 1
order by 1
