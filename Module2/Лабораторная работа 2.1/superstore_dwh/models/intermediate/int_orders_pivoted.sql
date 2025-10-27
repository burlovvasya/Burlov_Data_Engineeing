-- models/intermediate/int_orders_pivoted.sql
{{ config(
    materialized='view',
    schema='dw_intermediate'
) }}

SELECT
    order_id,
    customer_id,
    category,
    sub_category,
    order_date,
    sales,
    profit
FROM {{ ref('int_sales_orders') }}
