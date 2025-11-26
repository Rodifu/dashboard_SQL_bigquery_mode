-- "Forecast ML - Profitability"

SELECT
  DATE_TRUNC(forecast_timestamp, MONTH) as Date,
  MAX(revenue) as Revenue,
  MAX(cost) as Cost,
  ((SUM(revenue)-SUM(cost))/SUM(revenue)) as Gross_Margin
FROM starbucks.revenue_and_cost
GROUP BY Date
ORDER BY Date ASC;
