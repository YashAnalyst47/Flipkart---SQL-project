CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(45),
price FLOAT,
COGS FLOAT,
category VARCHAR(30),
brand VARCHAR(20)
);

CREATE TABLE customers
(
Customer_id INT PRIMARY KEY,
customer_name VARCHAR(30),
state VARCHAR(25) 
);

CREATE TABLE sales
(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT REFERENCES customers(customer_id),
order_status VARCHAR(20),
product_id INT REFERENCES products(product_id),
quantity INT,
price_per_unit FLOAT
);

CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
order_id INT REFERENCES sales(order_id),
payment_date DATE,
payment_status VARCHAR(25)
);

CREATE TABLE shippings
(
shipping_id INT PRIMARY KEY,
order_id INT REFERENCES sales(order_id),
shipping_date DATE,
return_date DATE,
shipping_providers VARCHAR(25),
delivery_status VARCHAR(25)
);

SELECT 'Database setup completed'



