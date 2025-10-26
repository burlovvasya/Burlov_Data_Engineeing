# Практическая работа 3.1 — Вариант 5 (Служба поддержки)

**Цель:** собрать и сравнить дашборды в Yandex DataLens и Tableau по обращениям клиентов службы поддержки.  
**Данные:** Bitext Customer Support Intent (+ обогащение полями: `resolution_minutes`, `csat`, `sla_met`, `agent`, `channel`, `is_repeat_customer` и др.).  
**Готовый дашборд DataLens:** https://datalens.ru/do24sikkp5c4y

## KPI
- Среднее время решения, мин: **—**
- CSAT (1–5): **—**
- SLA выполнен, %: **—**
- Повторные клиенты, %: **—**

## Поля данных (основные)
`created_at (datetime)`, `channel`, `customer_id`, `agent`, `intent`, `category_code`,  
`resolution_minutes`, `csat`, `sla_met`, `is_repeat_customer`, `interactions_per_customer`, `message`, `tags`, `split`.

## Шаги в Yandex DataLens
1. Источники → Файл → загрузить `support_tickets_enriched.csv`.
2. Типы: `created_at` — Дата и время; логические поля — Boolean; числовые — Number.
3. Вычисляемые поля:
   ```
   CreatedAtDT = DATETIME_PARSE("created_at", 'yyyy-MM-dd HH:mm:ss')
   Date        = DATE_TRUNC('day', CreatedAtDT)
   SLA_Rate    = CASE WHEN "sla_met" THEN 1 ELSE 0 END   -- использовать AVG
   Repeat_Rate = CASE WHEN "is_repeat_customer" THEN 1 ELSE 0 END  -- использовать AVG
   ```
4. Чарты: 3 KPI; Таймлайн (X=Date, COUNT()); Категории (гориз. бар); Топ‑интенты (Top N); Рейтинг специалистов (COUNT, AVG времени/CSAT/SLA); Повторные клиенты (donut).
5. Фильтры: `Date`, `channel`, `agent`, `category_code`. Публикация и права доступа — по необходимости.

## Шаги в Tableau
1. Data → Text File → выбрать `support_tickets_enriched.csv`.
2. Calculated fields:
   ```
   ResolutionHours = [resolution_minutes]/60
   SLA Rate        = IF [sla_met] THEN 1 ELSE 0 END
   Repeat Rate     = IF [is_repeat_customer] THEN 1 ELSE 0 END
   ```
3. Sheets: Таймлайн (Columns=[Date] Day, Rows=Number of Records), Категории (Bar), Топ‑интенты (Bar + Top N), Рейтинг специалистов (Text/Bar), KPI-листы (AVG).
4. Dashboard: собрать KPI вверху, ниже — таймлайн и разрезы; справа — рейтинг специалистов. Включить общие фильтры.

