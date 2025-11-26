# Dashboard with Bigquery and Mode
I created a Dashboard in Mode using SQL as language and BigQuery as database. I'll explain more about each analysis here.

# Starbucks SQL Analytics (Mode / BigQuery)

This repository contains a collection of SQL queries used to analyze Starbucks performance data, including revenue metrics, gross margin, customer retention, churn analysis, product profitability, and forecasting trends.

⚠️ The database is all fictitious, just for apresent the skills with SQL and Data Analytics.

All queries were developed for use in **Mode Analytics** and **BigQuery**, following best practices for analytical SQL. Furthermore I can't share a public link of interative Dashboard here, because this function is just for who pay the Mode, however I can share with you if you have a account in Mode, fell free for ask 🤗!

---

## 📁 Repository Structure

```text
queries/
   average_order_value.sql
   gross_margin_pct.sql
   total_revenue_yoy_growth.sql
   profitability_trend.sql
   percentile_trend.sql
   customer_retention_overall.sql
   sales_by_category_profit_margin_per_product.sql
   country_performance.sql
   sales_channel_distribution.sql
   customers_churn_retention_overview.sql
   customers_churn_retention_online.sql
   forecast_ml_profitability.sql
README.md
database.csv
```

---

## 📊 Query Overview

### average_order_value.sql
Calculates the **Average Order Value (AOV)** based on aggregated revenue per order.

<img width="281" height="185" alt="image" src="https://github.com/user-attachments/assets/b4480fb3-da1a-4b2c-8548-a9d90539d70b" />

### gross_margin_pct.sql
Computes the **Gross Margin Percentage**, using total revenue and cost.

<img width="215" height="188" alt="image" src="https://github.com/user-attachments/assets/7ba9db4b-b2e2-4493-b4e9-335cc03fbca6" />

### total_revenue_yoy_growth.sql
Returns:
- Total Revenue  
- Revenue from the previous year  
- Revenue from the current year  
- **Year-over-Year (YoY) Growth**

- <img width="211" height="374" alt="image" src="https://github.com/user-attachments/assets/7cf8c185-a4ee-4fbd-b0ef-5ad854dc900f" />

### profitability_trend.sql
Generates a monthly trend of:
- Gross Margin  
- Total Revenue  
- Total Cost  

<img width="929" height="390" alt="image" src="https://github.com/user-attachments/assets/f3f3afb1-f3c1-4d6c-a8bb-dbae130cd6c6" />

### percentile_trend.sql
Calculates AOV distribution metrics by month:
- Mean AOV  
- AOV P50  
- AOV P90
  
<img width="918" height="386" alt="image" src="https://github.com/user-attachments/assets/caf2dece-9fdf-4854-aa5b-41fbf649f0b2" />

### customer_retention_overall.sql
Computes overall **customer retention rate**, used for high-level KPIs.

<img width="229" height="182" alt="image" src="https://github.com/user-attachments/assets/3f427d39-2935-4ff9-88ca-a488e82d0da1" />

### sales_by_category_profit_margin_per_product.sql
Summarizes:
- Total revenue by product category  
- Gross profit per category

  <img width="926" height="349" alt="image" src="https://github.com/user-attachments/assets/a0b4af4b-9aef-4c58-bfbb-5b97dde606c9" />

### country_performance.sql
Breakdown of:
- Revenue by country  
- Gross profit by country  

<img width="923" height="378" alt="image" src="https://github.com/user-attachments/assets/f5fae1aa-9298-49c8-ab85-9c168783c621" />

### sales_channel_distribution.sql
Shows revenue distribution by sales channel (Online, In-Store, etc.) over time.

<img width="928" height="387" alt="image" src="https://github.com/user-attachments/assets/027d6845-e236-4a57-becb-1f1d04288d95" />

### customers_churn_retention_overview.sql
Provides a monthly overview of:
- Active customers  
- Retained customers  
- Lost customers  
- Retention rate  
- Churn rate  

<img width="922" height="381" alt="image" src="https://github.com/user-attachments/assets/e0802b1d-a207-4dc1-b604-56c9bd74f87e" />

### customers_churn_retention_online.sql
Same metrics as above, but **filtered exclusively for online customers**.

<img width="926" height="376" alt="image" src="https://github.com/user-attachments/assets/15fe322d-f9ba-4271-abec-e52513ae14b0" />

### forecast_ml_profitability.sql
Forecast-based profitability analysis containing:
- Predicted revenue  
- Predicted cost  
- Forecasted gross margin

  <img width="927" height="369" alt="image" src="https://github.com/user-attachments/assets/6aa5ff9f-6347-4a4a-87e0-f190841db068" />

---

## 🧠 Technologies Used

- **BigQuery SQL**
- **Mode Analytics**
- Date and time functions (FORMAT_DATE, DATE_TRUNC)
- Analytical functions (PERCENTILE_CONT, SAFE_DIVIDE)
- Window functions
- Common Table Expressions (CTEs)
