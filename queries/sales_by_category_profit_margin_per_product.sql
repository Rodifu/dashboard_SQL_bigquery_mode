-- "Sales By Category / Profit Margin per Product"

SELECT
  category,
  SUM(revenue_usd) AS revenue,
  (SUM(revenue_usd) - SUM(cost_usd)) AS Gross_Profit
FROM starbucks.starbucks_orders_monthly_usd
GROUP BY category
ORDER BY revenue DESC;
