-- "Average Order Value"

WITH order_valueb AS (
  SELECT
    order_id,
    SUM(revenue_usd) AS order_value
  FROM starbucks.starbucks_orders_monthly_usd
  GROUP BY order_id
)

SELECT
  AVG(order_value) AS AOV
FROM order_valueb;
