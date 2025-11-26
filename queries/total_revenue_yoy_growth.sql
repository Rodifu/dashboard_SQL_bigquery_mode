-- "Total Revenue"  e "YoY Growth"

WITH base AS (
  SELECT
    SUM(revenue_usd) AS Total_revenue,
    (SELECT SUM(revenue_usd)
       FROM starbucks.starbucks_orders_monthly_usd
      WHERE order_date < '2024-01-01') AS last_year,
    (SELECT SUM(revenue_usd)
       FROM starbucks.starbucks_orders_monthly_usd
      WHERE order_date > '2024-01-01') AS new_year
  FROM starbucks.starbucks_orders_monthly_usd
)

SELECT
  Total_revenue,
  last_year,
  new_year,
  ((new_year - last_year) / last_year) AS YoY_growth -- removed *100 because the chart
FROM base;
