# Retail Sales & Customer Analysis using MySQL

## 📌 Project Overview

This project uses MySQL to analyze retail sales, product performance, customer spending, and monthly revenue trends. It demonstrates how SQL can transform relational business data into meaningful insights that support data-driven decision-making.

The database contains four related tables: customers, products, orders, and order items.

## 🎯 Objectives

- Analyze overall retail revenue and sales performance.
- Identify top-performing products and product categories.
- Understand customer purchasing behavior and spending.
- Analyze monthly revenue trends.
- Identify repeat customers.
- Calculate average order value.
- Practice SQL techniques commonly used in business and data analysis.

## 🛠️ Tools & Technologies

- MySQL / MySQL Workbench
- SQL
- Relational Database Design
- Data Analysis
- Business Intelligence Fundamentals

## 🗂️ Database Structure

The project uses four related tables:

| Table | Description |
|---|---|
| `customers` | Customer details, city, gender, and age |
| `products` | Product names, categories, and prices |
| `orders` | Order dates, customer IDs, and payment methods |
| `order_items` | Products purchased, quantities, and transaction prices |

### Relationships

- One customer can place multiple orders.
- One order can contain multiple order items.
- Each order item references a product.

Primary keys and foreign keys maintain relationships between the tables.

## 📊 Analysis Performed

### Sales Analysis
- Total revenue calculation
- Monthly revenue analysis
- Average order value calculation
- Revenue comparison across months

### Product Analysis
- Product-wise revenue
- Units sold by product
- Revenue by product category
- Top products within each category

### Customer Analysis
- Customer spending analysis
- Total orders per customer
- Highest-value customers
- Repeat customer identification
- Customers with no recorded orders

## 💻 SQL Concepts Practiced

- `SELECT`, `WHERE`, `ORDER BY`
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`
- `GROUP BY` and `HAVING`
- `INNER JOIN` and `LEFT JOIN`
- Subqueries
- Common Table Expressions (CTEs)
- Window functions: `DENSE_RANK()` and `LAG()`
- Date formatting and monthly aggregation
- Revenue calculations and percentage change

## 🔍 Key Business Questions

1. What is the total revenue generated?
2. Which products generate the most revenue?
3. Which product categories contribute the most to sales?
4. Which customers spend the most?
5. How does revenue change from month to month?
6. Which customers place repeat orders?
7. What is the average order value?
8. Which products rank highest within each category?

## 💡 Business Applications

The analysis can help a retail business:

- Identify products that contribute significantly to revenue.
- Understand customer spending and repeat purchasing patterns.
- Monitor monthly sales performance.
- Compare category-level sales contributions.
- Support decisions about marketing, customer retention, and product strategy.

These are potential applications of the analysis; the dataset alone does not establish the causes of customer behavior or sales trends.

## 📁 Repository Structure

```text
retail-sales-sql-analysis/
├── retail_sales_analysis.sql
└── README.md
```

The SQL file contains the database setup, sample data, and analysis queries.

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench, or use a compatible MySQL environment.
2. Clone or download this repository.
3. Open `retail_sales_analysis.sql` in MySQL Workbench.
4. Execute the database creation and table setup statements.
5. Insert the sample retail data.
6. Run the analysis queries individually to explore the results.

## 👩‍💻 Author

**Logarakshika A**

B.Tech – Computer Science and Business Systems

Interests: Business Analysis, Data Analytics, Product Analytics, and technology-driven problem-solving.

