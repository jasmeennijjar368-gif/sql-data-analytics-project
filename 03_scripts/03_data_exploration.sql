--Data Exploration 
--Find the date of first and last order
-- how many years of sales are available 
-- how many months of sales are available 
SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
EXTRACT(YEAR FROM AGE(MAX(order_date),MIN(order_date))) AS order_range_years, 
EXTRACT(MONTH FROM AGE(MAX(order_date),MIN(order_date))) AS order_range_month
FROM gold.fact_sales;

--Find the youngest and oldest customer 
SELECT 
MIN(birthdate) AS oldest_birthdate,
MAX(birthdate) AS youngest_birthdate,
EXTRACT(YEAR FROM AGE(CURRENT_DATE,MIN(birthdate))) AS oldest_age,
EXTRACT(YEAR FROM AGE(CURRENT_DATE,MAX(birthdate))) AS youngest_age
FROM gold.dim_customers;
