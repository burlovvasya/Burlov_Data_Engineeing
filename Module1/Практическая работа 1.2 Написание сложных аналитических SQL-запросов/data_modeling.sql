-- === Аналог DESCRIBE stg.orders ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'stg'
  AND table_name = 'orders'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE stg.returns ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'stg'
  AND table_name = 'returns'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE stg.people ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'stg'
  AND table_name = 'people'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE dw.shipping_dim ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'dw'
  AND table_name = 'shipping_dim'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE dw.customer_dim ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'dw'
  AND table_name = 'customer_dim'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE dw.geo_dim ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'dw'
  AND table_name = 'geo_dim'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE dw.product_dim ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'dw'
  AND table_name = 'product_dim'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE dw.calendar_dim ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'dw'
  AND table_name = 'calendar_dim'
ORDER BY ordinal_position;

-- === Аналог DESCRIBE dw.sales_fact ===
SELECT
    table_schema       AS "Schema",
    table_name         AS "Table",
    column_name        AS "Column",
    data_type          AS "Type",
    character_maximum_length AS "Length",
    numeric_precision  AS "Precision",
    numeric_scale      AS "Scale",
    is_nullable        AS "Nullable",
    column_default     AS "Default"
FROM information_schema.columns
WHERE table_schema = 'dw'
  AND table_name = 'sales_fact'
ORDER BY ordinal_position;
