-- models/marts/mart_monthly_running_profit.sql
{{ config(
    materialized='view',
    schema='dw'
) }}

WITH monthly_profit AS (
    SELECT
        date_trunc('month', order_date)::date AS sales_month,
        SUM(profit) AS monthly_profit
    FROM {{ ref('int_orders_pivoted') }}
    GROUP BY 1
),
running_profit AS (
    SELECT
        sales_month,
        monthly_profit,
        SUM(monthly_profit) OVER (ORDER BY sales_month) AS cumulative_profit
    FROM monthly_profit
)
SELECT *
FROM running_profit
