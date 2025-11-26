-- "Sales Channel Distribution"

SELECT
  FORMAT_DATE('%Y-%m', order_date) AS mounth_year,
  channel,
  SUM(revenue_usd) AS revenue
FROM starbucks.starbucks_orders_monthly_usd
GROUP BY mounth_year, channel
ORDER BY mounth_year;
