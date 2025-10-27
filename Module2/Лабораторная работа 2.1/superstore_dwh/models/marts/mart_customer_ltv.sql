-- models/marts/mart_customer_ltv.sql
-- Эта витрина рассчитывает ключевые LTV-метрики по каждому клиенту для анализа ценности и сегментации клиентской базы.
 SELECT
    customer_id,
    customer_name,
    segment,
    -- LTV метрики
    MIN(order_date) as first_order_date,
    MAX(order_date) as last_order_date,
    COUNT(DISTINCT order_id) as number_of_orders,
    SUM(sales) as total_sales_lifetime,
    AVG(sales) as average_order_value
 FROM
    {{ ref('int_sales_orders') }}
 GROUP BY 1, 2, 3