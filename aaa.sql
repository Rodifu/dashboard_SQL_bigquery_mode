WITH order_valueb as (
SELECT
  order_id,
  MIN(order_date) as order_date,
  SUM(revenue_usd) as order_value
FROM data-474517.starbucks.starbucks_orders_monthly_usd
GROUP BY order_id
),

calc AS (
  SELECT
    FORMAT_DATE('%Y-%m', order_date) AS ano_mes,
    order_value,
    PERCENTILE_CONT(order_value, 0.5) OVER (PARTITION BY FORMAT_DATE('%Y-%m', order_date)) AS p50_mes,
    PERCENTILE_CONT(order_value, 0.9) OVER (PARTITION BY FORMAT_DATE('%Y-%m', order_date)) AS p90_mes
  FROM order_valueb
)
SELECT
  ano_mes,
  AVG(order_value) AS aov_mean,
  ANY_VALUE(p50_mes) AS aov_p50,
  ANY_VALUE(p90_mes) AS aov_p90
FROM calc
GROUP BY ano_mes
ORDER BY ano_mes;
