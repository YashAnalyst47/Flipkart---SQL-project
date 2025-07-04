
# Flipkart E-commerce SQL Project

![Project Banner Placeholder](https://github.com/YashAnalyst47/Flipkart---SQL-project/blob/main/flipkart.jpg)

Welcome to my SQL project, where I analyze real-time data from **Flipkart**! This project uses a dataset of **20,000+ sales records** and additional tables for payments, products, and shipping data to explore and analyze e-commerce transactions, product sales, and customer interactions. The project aims to solve business problems through SQL queries, helping Flipkart make informed decisions.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Business Problems](#business-problems)
- [SQL Queries & Analysis](#sql-queries--analysis)
- [Getting Started](#getting-started)
- [Questions & Feedback](#questions--feedback)
- [Contact Me](#contact-me)

---

## Introduction

This project demonstrates essential SQL skills by analyzing e-commerce data from **Flipkart**, focusing on sales, payments, products, and customer data. Through SQL, we answer critical business questions, uncover trends, and derive actionable insights that help improve business strategies and customer experiences. The project covers different SQL techniques including **Joins**, **Group By**, **Aggregations**, and **Date Functions**.

## Project Structure

1. **SQL Scripts**: Contains code to create the database schema and write queries for analysis.
2. **Dataset**: Real-time data representing e-commerce transactions, product details, customer information, and shipping status.
3. **Analysis**: SQL queries crafted to solve business problems, each focusing on understanding e-commerce sales and performance.

---

## Database Schema

Here’s an overview of the database structure:

### 1. **Customers Table**
- **customer_id**: Unique identifier for each customer
- **customer_name**: Name of the customer
- **state**: Location (state) of the customer

### 2. **Products Table**
- **product_id**: Unique identifier for each product
- **product_name**: Name of the product
- **price**: Price of the product
- **cogs**: Cost of goods sold
- **category**: Category of the product
- **brand**: Brand name of the product

### 3. **Sales Table**
- **order_id**: Unique order identifier
- **order_date**: Date the order was placed
- **customer_id**: Linked to the `customers` table
- **order_status**: Status of the order (e.g., Completed, Cancelled)
- **product_id**: Linked to the `products` table
- **quantity**: Quantity of products sold
- **price_per_unit**: Price per unit of the product

### 4. **Payments Table**
- **payment_id**: Unique payment identifier
- **order_id**: Linked to the `sales` table
- **payment_date**: Date the payment was made
- **payment_status**: Status of the payment (e.g., Payment Successed, Payment Failed)

### 5. **Shippings Table**
- **shipping_id**: Unique shipping identifier
- **order_id**: Linked to the `sales` table
- **shipping_date**: Date the order was shipped
- **return_date**: Date the order was returned (if applicable)
- **shipping_providers**: Shipping provider (e.g., Ekart, Bluedart)
- **delivery_status**: Status of delivery (e.g., Delivered, Returned)

## Business Problems

The following queries were created to solve specific business questions. Each query is designed to provide insights based on sales, payments, products, and customer data.

1. `Retrieve all products along with their total sales revenue from completed orders.`
2. `List all customers and the products they have purchased, showing only those who have ordered more than two products.`
3. `Find the total amount spent by customers in 'Gujarat' who have ordered products priced greater than 10,000.`
4. `Find the average order value per customer for orders with a quantity of more than 5.`
5. `Get the top 5 customers by total spending on 'Accessories'.`
6. `Retrieve a list of customers whose payment hasn't been successful for their orders.`
7. `Find the most popular product based on total quantity sold in 2023.`
8. `List all orders that were cancelled and the reason for cancellation (if available).`
9. `Retrieve the total quantity of products sold by category in 2022.`
10. `Get the count of returned orders by shipping provider in 2024.`
11. `List the products that have never been ordered.`
12. `List the total sales recorded each month for the year 2024 & ascertain the month with the highest sales.`
13. `Find the top 2 best selling brand of each month based on qty sold for the year 2023 [Utilizing window functions].`
   
## SQL Queries & Analysis

The `Analysis.sql` file contains all SQL queries developed for this project. Each query corresponds to a business problem and demonstrates skills in SQL syntax, data filtering, aggregation, grouping, and ordering.
---

## Getting Started

### Prerequisites
- PostgreSQL (or any SQL-compatible database)
- Basic understanding of SQL

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/YashAnalyst47/Flipkart---SQL-project
   ```
2. **Set Up the Database**:
   - Run the `Flipkart_schemas.sql` script to set up tables and establish the constraints. Refer to the attached CSV files for importing the sample data.

3. **Run Queries**:
   - Execute each query in `Analysis.sql` to explore and analyze the data.

---

## Questions & Feedback

Feel free to add your questions and code snippets below and submit them as issues for further feedback!


## ERD (Entity-Relationship Diagram)

## Notice:
All customer names and data used in this project are computer-generated using AI and random
functions. They do not represent real data associated with Amazon or any other entity. This
project is solely for learning and educational purposes, and any resemblance to actual persons,
businesses, or events is purely coincidental.

![ERD Placeholder](https://github.com/YashAnalyst47/Flipkart---SQL-project/blob/main/Flipkart%20ERD%20diagram.png)
