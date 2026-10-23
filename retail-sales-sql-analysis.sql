--PROJECT: RETAIL SALES & CUSTOMER ANALYSIS--

-- STEP 1: DATABASE SETUP
CREATE DATABASE IF NOT EXISTS retail_sales_db;
USE retail_sales_db;
SHOW DATABASES;
SELECT DATABASE();

USE retail_sales_db;

-- STEP 2: BASIC SALES ANALYSIS
-- 1. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(20),
    city VARCHAR(50),
    age INT
);

-- 2. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);

-- 3. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 4. Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

SHOW TABLES;

USE retail_sales_db;

-- 1. Insert customers
INSERT INTO customers VALUES
(1, 'Ananya', 'Female', 'Chennai', 24),
(2, 'Rahul', 'Male', 'Bengaluru', 29),
(3, 'Priya', 'Female', 'Chennai', 32),
(4, 'Arjun', 'Male', 'Hyderabad', 26),
(5, 'Sneha', 'Female', 'Mumbai', 28),
(6, 'Karthik', 'Male', 'Bengaluru', 35),
(7, 'Meera', 'Female', 'Coimbatore', 23),
(8, 'Vikram', 'Male', 'Chennai', 31);

-- 2. Insert products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Headphones', 'Electronics', 2500.00),
(103, 'Office Chair', 'Furniture', 7500.00),
(104, 'Desk', 'Furniture', 12000.00),
(105, 'Smartphone', 'Electronics', 30000.00),
(106, 'Notebook', 'Stationery', 100.00),
(107, 'Backpack', 'Accessories', 1800.00),
(108, 'Keyboard', 'Electronics', 1500.00);

-- 3. Insert orders
INSERT INTO orders VALUES
(1001, 1, '2026-01-05', 'UPI'),
(1002, 2, '2026-01-10', 'Card'),
(1003, 3, '2026-01-15', 'UPI'),
(1004, 1, '2026-02-02', 'Card'),
(1005, 4, '2026-02-12', 'Cash'),
(1006, 5, '2026-02-18', 'UPI'),
(1007, 6, '2026-03-03', 'Card'),
(1008, 2, '2026-03-10', 'UPI'),
(1009, 7, '2026-03-15', 'Cash'),
(1010, 8, '2026-03-20', 'Card'),
(1011, 3, '2026-04-02', 'UPI'),
(1012, 5, '2026-04-10', 'Card');

-- 4. Insert order items
INSERT INTO order_items VALUES
(1, 1001, 101, 1, 55000.00),
(2, 1001, 102, 2, 2500.00),
(3, 1002, 105, 1, 30000.00),
(4, 1002, 108, 1, 1500.00),
(5, 1003, 103, 2, 7500.00),
(6, 1003, 106, 5, 100.00),
(7, 1004, 107, 2, 1800.00),
(8, 1004, 102, 1, 2500.00),
(9, 1005, 104, 1, 12000.00),
(10, 1005, 103, 1, 7500.00),
(11, 1006, 105, 1, 30000.00),
(12, 1006, 107, 1, 1800.00),
(13, 1007, 101, 1, 55000.00),
(14, 1007, 108, 2, 1500.00),
(15, 1008, 102, 3, 2500.00),
(16, 1008, 106, 10, 100.00),
(17, 1009, 107, 2, 1800.00),
(18, 1010, 104, 1, 12000.00),
(19, 1011, 105, 2, 30000.00),
(20, 1012, 103, 1, 7500.00);

SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;

-- STEP 3: PRODUCT & CUSTOMER ANALYSIS
SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM order_items;


SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY revenue DESC;

SELECT
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY total_spending DESC;


SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS customers_without_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    ROUND(SUM(order_revenue) / COUNT(*), 2) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.unit_price) AS order_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_id
) AS order_totals;

-- STEP 4: ADVANCED SQL ANALYSIS
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products AS p
    JOIN order_items AS oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
),
ranked_products AS (
    SELECT
        product_name,
        category,
        revenue,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_revenue
)
SELECT
    product_name,
    category,
    revenue,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category, product_rank;

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),
sales_comparison AS (
    SELECT
        sales_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    sales_month,
    revenue,
    previous_month_revenue,
    ROUND(
        100.0 * (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_change_pct
FROM sales_comparison
ORDER BY sales_month;

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_spending DESC;

















































