--Changes over time trends 
--Analyze sales performance over time 
SELECT 
EXTRACT (YEAR FROM order_date) AS order_year,
EXTRACT (MONTH FROM order_date) AS order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
EXTRACT(YEAR FROM order_date),
EXTRACT (MONTH FROM order_date) 
ORDER BY 
EXTRACT(YEAR FROM order_date),
EXTRACT (MONTH FROM order_date);

SELECT 
DATE_TRUNC('MONTH',order_date) AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_TRUNC('MONTH',order_date) 
ORDER BY DATE_TRUNC('MONTH',order_date);

--We can format order_date also
SELECT 
TO_CHAR(order_date,'YYYY-Mon') AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY TO_CHAR(order_date,'YYYY-Mon')
ORDER BY TO_CHAR(order_date,'YYYY-Mon');
