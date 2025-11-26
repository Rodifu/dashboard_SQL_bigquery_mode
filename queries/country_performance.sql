-- "Country Performance"

SELECT
  country AS Country,
  SUM(revenue_usd) AS Revenue,
  SUM(revenue_usd) - SUM(cost_usd) AS Gross_Profit
FROM starbucks.starbucks_orders_monthly_usd
GROUP BY country
ORDER BY revenue DESC;
