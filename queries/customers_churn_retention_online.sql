-- "Customers - Churn / Retention - On-line"

WITH customers_by_month AS(
  SELECT
    customer_id,
    DATE_TRUNC(order_date,MONTH) AS month,
    channel
  FROM starbucks.starbucks_orders_monthly_usd
  WHERE channel = "Online"
  GROUP BY month, customer_id, channel
)

SELECT
  a.month as month_now, -- precisamos agrupar esse mes novamente aqui
  COUNT(DISTINCT a.customer_id) as customers_on_month, -- clientes do mes
  COUNT(DISTINCT b.customer_id) as customers_retention, -- clientes retidos
  (COUNT(DISTINCT a.customer_id) - COUNT(DISTINCT b.customer_id)) as customers_lost,
  SAFE_DIVIDE (COUNT(DISTINCT b.customer_id), COUNT(DISTINCT a.customer_id)) as range_retention, -- removed the *100 because the chart do the porcentage
  SAFE_DIVIDE (COUNT(DISTINCT a.customer_id) - COUNT(DISTINCT b.customer_id), COUNT(DISTINCT a.customer_id)) as churt_lost -- removed the *100 because the chart do the porcentage
FROM customers_by_month a
LEFT JOIN customers_by_month b ON b.customer_id = a.customer_id
 AND b.month = DATE_ADD(a.month, INTERVAL 1 MONTH)
WHERE a.month < (SELECT DATE_TRUNC(MAX(order_date), MONTH)
                 FROM `starbucks.starbucks_orders_monthly_usd`) -- Evitar o 100% falso do último mês
GROUP BY a.month
ORDER BY a.month;
