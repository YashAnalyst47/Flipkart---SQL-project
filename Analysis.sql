-- Welcome to the Flipkart SQL project. The following queries were created to solve specific business questions. Each query is designed to provide insights based on sales, payments, products, and customer data.

-- 1) Retrieve all products along with their total sales revenue from completed orders.

SELECT p.product_id,p.product_name,p.brand,SUM(s.quantity * s.price_per_unit) AS tot_sales
FROM products p
LEFT JOIN sales s
ON p.product_id = s.product_id
WHERE s.order_status ='Completed'
GROUP BY p.product_id
ORDER BY tot_sales DESC

-- 2) List all customers and the products they have purchased, showing only those who have ordered more than two products.

SELECT c.customer_id, c.customer_name, COUNT(DISTINCT s.product_id) AS distinct_purchases
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT s.product_id) >2

-- 3) Find the total amount spent by customers in 'Gujarat' who have ordered products priced greater than 10,000.

SELECT SUM(s.quantity * s.price_per_unit) AS total_amt_spent
FROM customers c
RIGHT JOIN sales s
ON c.customer_id = s.customer_id
WHERE state ='Gujarat' AND s.price_per_unit > 10000
AND s.quantity >= 1

-- 4) Find the average order value per customer for orders with a quantity of more than 5.

SELECT (SUM(price_per_unit*quantity)/COUNT(DISTINCT customer_id)) AS average_order_value
FROM sales
WHERE quantity > 5

-- 5) Get the top 5 customers by total spending on 'Accessories'.

SELECT s.customer_id, c.customer_name, SUM(s.quantity * s.price_per_unit) AS total_purchases 
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
JOIN customers c
ON s.customer_id = c.customer_id
WHERE p.category ='Accessories'
GROUP BY s.customer_id,c.customer_name
ORDER BY total_purchases DESC
LIMIT 5

-- 6) Retrieve a list of customers whose payment hasn't been successful for their orders.

SELECT s.customer_id,c.customer_name,s.order_id,p.payment_status
FROM customers c 
RIGHT JOIN sales s
ON c.customer_id = s.customer_id
JOIN payments p
ON p.order_id = s.order_id
GROUP BY s.customer_id,c.customer_name,s.order_id,p.payment_status
HAVING p.payment_status = 'Payment Failed'

-- 7) Find the most popular product based on total quantity sold in 2023.

SELECT p.product_id,p.product_name, SUM(s.quantity) AS units_sold
FROM products p
RIGHT JOIN sales s
ON p.product_id = s.product_id
JOIN payments ps
ON s.order_id = ps.order_id
WHERE s.order_status='Completed' 
AND EXTRACT(YEAR FROM s.order_date)='2023' 
AND ps.payment_status='Payment Successed'
GROUP BY p.product_id,p.product_name
ORDER BY units_sold DESC
LIMIT 1;

-- 8) List all orders that were cancelled and the reason for cancellation (if available).

SELECT s.order_id,s.order_status,s.order_date,p.payment_status
FROM sales s
LEFT JOIN payments p 
ON s.order_id = p.order_id
WHERE s.order_status ='Cancelled'
ORDER BY s.order_date ASC

-- By running the above query, it is evidant that the failed payment is the reason for order cancellation.

-- 9) Retrieve the total quantity of products sold by category in 2022.

SELECT p.category, SUM(s.quantity) AS units_sold
FROM sales s
LEFT JOIN products p
ON p.product_id = s.product_id
JOIN payments ps
ON ps.order_id = s.order_id
WHERE s.order_status='Completed' 
AND EXTRACT(YEAR FROM s.order_date)='2022'
AND ps.payment_status='Payment Successed'
GROUP BY p.category
ORDER BY units_sold DESC

-- 10) Get the count of returned orders by shipping provider in 2024.

SELECT sh.shipping_providers,COUNT(s.order_id) AS returned_orders
FROM sales s
JOIN shippings sh
ON s.order_id = sh.order_id
WHERE EXTRACT(YEAR FROM s.order_date)='2024' 
AND s.order_status='Returned'
GROUP BY sh.shipping_providers
ORDER BY returned_orders DESC

-- 11) List the products that have never been ordered 

SELECT p.product_id,p.product_name
FROM products p
LEFT JOIN sales s
ON p.product_id = s.product_id
WHERE s.order_status IS NULL
ORDER BY p.product_id ASC

-- 12) List the total sales recorded each month for the year 2024 & ascertain the month with the highest sales.

SELECT SUM (s.quantity * s.price_per_unit) AS total_sales, TO_CHAR(s.order_date,'MONTH') as month_name
FROM sales s
LEFT JOIN payments p
ON s.order_id = p.order_id
WHERE s.order_status='Completed' 
AND p.payment_status='Payment Successed'
AND EXTRACT(YEAR FROM s.order_date)='2021'
GROUP BY month_name
ORDER BY total_sales DESC

-- By running the above query, it is observed that the month of July had recorded the highest sales.













