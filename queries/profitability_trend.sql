-- "Profitability Trend"

SELECT
  FORMAT_DATE('%Y-%m', order_date) AS ano_mes,
  ((SUM(revenue_usd) - SUM(cost_usd)) / SUM(revenue_usd)) AS Gross_margin, -- removed *100 because the chart
  SUM(revenue_usd) AS revenue,
  SUM(cost_usd) AS cost
FROM starbucks.starbucks_orders_monthly_usd
GROUP BY ano_mes
ORDER BY ano_mes;
