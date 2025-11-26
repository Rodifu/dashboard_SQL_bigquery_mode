-- "Gross Margin %"

SELECT -- Gross Margin
  ((SUM(revenue_usd) - SUM(cost_usd)) / SUM(revenue_usd)) AS gross_margin -- removed *100 because the chart
FROM starbucks.starbucks_orders_monthly_usd;
