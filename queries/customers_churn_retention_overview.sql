-- "Customers - Churn / Retention - Overview"

WITH clientes_por_mes AS (
  SELECT
    customer_id,
    DATE_TRUNC(order_date, MONTH) AS month
  FROM `starbucks.starbucks_orders_monthly_usd`
  GROUP BY customer_id, month
)
SELECT
  a.month AS mes_atual,
  COUNT(DISTINCT a.customer_id) AS clientes_no_mes,
  COUNT(DISTINCT b.customer_id) AS clientes_retentos,
  (COUNT(DISTINCT a.customer_id) - COUNT(DISTINCT b.customer_id)) AS clientes_perdidos,
  SAFE_DIVIDE(COUNT(DISTINCT b.customer_id), COUNT(DISTINCT a.customer_id))  AS taxa_retencao_pct, -- removed the *100 because the chart do the porcentage
  SAFE_DIVIDE(
    COUNT(DISTINCT a.customer_id) - COUNT(DISTINCT b.customer_id),
    COUNT(DISTINCT a.customer_id)
  ) AS churn_pct -- tipo jan-fev/jan *100 -- -- removed the *100 because the chart do the porcentage
FROM clientes_por_mes a
LEFT JOIN clientes_por_mes b
  ON b.customer_id = a.customer_id
 AND b.month = DATE_ADD(a.month, INTERVAL 1 MONTH)
WHERE a.month < (SELECT DATE_TRUNC(MAX(order_date), MONTH)
                 FROM `starbucks.starbucks_orders_monthly_usd`) -- Evitar o 100% falso do último mês
GROUP BY a.month
ORDER BY a.month;
