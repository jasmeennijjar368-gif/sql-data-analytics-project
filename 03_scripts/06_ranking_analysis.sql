--Ranking Analysis
--Which 5 products generate the highest revenue
SELECT p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key=f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT * 
FROM(
	SELECT 
	p.product_name,
	SUM(f.sales_amount) AS total_revenue,
	RANK() OVER(ORDER BY SUM(f.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key=f.product_key
GROUP BY p.product_name)
WHERE rank_products<=5;

--Top 10 customers who have generated the highest revenue
SELECT 
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c
ON c.customer_key=f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

--3 customers with the fewest orders placed 
SELECT 
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c
ON c.customer_key=f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY  total_orders
LIMIT 3;

--5 worst performing products in terms of sales
SELECT p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key=f.product_key
GROUP BY p.product_name
ORDER BY total_revenue 
LIMIT 5;
