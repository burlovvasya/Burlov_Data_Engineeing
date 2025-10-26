-- Задание 1: Представление по прибыли регионов

-- Создаем представление, агрегирующее прибыль по регионам
CREATE OR REPLACE VIEW dw.v_profit_by_region AS
SELECT
    region,                  -- Колонка "регион" из таблицы заказов
    SUM(profit) AS total_profit  -- Суммируем прибыль по каждому региону
FROM stg.orders              -- Берем данные из исходной таблицы заказов
GROUP BY region              -- Группируем по региону
ORDER BY total_profit DESC;  -- Сортируем по убыванию прибыли

-- Добавляем комментарии к представлению и его колонкам
COMMENT ON VIEW dw.v_profit_by_region IS 'Представление с суммарной прибылью по регионам';
COMMENT ON COLUMN dw.v_profit_by_region.region IS 'Регион';
COMMENT ON COLUMN dw.v_profit_by_region.total_profit IS 'Суммарная прибыль по региону';


-- Задание 2: Топ-10 клиентов по количеству заказов

-- Создаем представление, которое считает количество заказов и суммарную прибыль по клиентам
CREATE OR REPLACE VIEW dw.v_top10_customers AS
SELECT
    customer_id,                     -- Идентификатор клиента
    customer_name,                   -- Имя клиента
    COUNT(order_id) AS order_count,  -- Считаем количество заказов
    SUM(sales) AS total_sales,       -- Суммируем продажи по клиенту
    SUM(profit) AS total_profit      -- Суммируем прибыль по клиенту
FROM stg.orders                      -- Берем данные из таблицы заказов
GROUP BY customer_id, customer_name  -- Группируем по клиенту
ORDER BY order_count DESC            -- Сортируем по количеству заказов
LIMIT 10;                            -- Берем только топ-10 клиентов

-- Комментарии к представлению и колонкам
COMMENT ON VIEW dw.v_top10_customers IS 'Топ-10 клиентов по количеству заказов';
COMMENT ON COLUMN dw.v_top10_customers.customer_id IS 'Идентификатор клиента';
COMMENT ON COLUMN dw.v_top10_customers.customer_name IS 'Имя клиента';
COMMENT ON COLUMN dw.v_top10_customers.order_count IS 'Количество заказов клиента';
COMMENT ON COLUMN dw.v_top10_customers.total_sales IS 'Сумма продаж клиента';
COMMENT ON COLUMN dw.v_top10_customers.total_profit IS 'Суммарная прибыль клиента';



-- Задание 3: Выручка по подкатегориям товаров

-- Создаем представление, которое агрегирует продажи по подкатегориям товаров
CREATE OR REPLACE VIEW dw.v_revenue_by_subcategory AS
SELECT
    subcategory,              -- Подкатегория товара
    category,                 -- Основная категория товара
    SUM(sales) AS total_sales -- Суммируем продажи по подкатегории
FROM stg.orders               -- Берем данные из таблицы заказов
GROUP BY subcategory, category -- Группируем по подкатегории и категории
ORDER BY total_sales DESC;     -- Сортируем по суммарной выручке

-- Комментарии к представлению и колонкам
COMMENT ON VIEW dw.v_revenue_by_subcategory IS 'Выручка по подкатегориям товаров';
COMMENT ON COLUMN dw.v_revenue_by_subcategory.subcategory IS 'Подкатегория товара';
COMMENT ON COLUMN dw.v_revenue_by_subcategory.category IS 'Категория товара';
COMMENT ON COLUMN dw.v_revenue_by_subcategory.total_sales IS 'Общая сумма продаж';


