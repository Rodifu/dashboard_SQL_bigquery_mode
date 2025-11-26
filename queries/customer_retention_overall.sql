-- "Customer Retention"

SELECT
  AVG(retained_next_month) AS customer_retantion, -- removed *100 because the chart
  1 AS total
FROM starbucks.starbucks_orders_monthly_usd;
