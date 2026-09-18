# e-commerce-sales-sql-analysis
E-Commerce Sales and Customer Behavior Analysis using SQL. This project analyzes customer purchases, product performance, sales trends, repeat customers, revenue, and business insights using SQL queries.

# E-Commerce Sales and Customer Behavior Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing **E-Commerce sales and customer behavior using SQL**. The analysis is performed on customer, product, order, order details, category, and payment data to identify sales trends, customer purchasing patterns, product performance, and business insights.

The project demonstrates how SQL can be used to transform raw e-commerce data into meaningful information for business decision-making.

---

## 🎯 Project Objectives

* Analyze total sales and revenue
* Identify top-selling products
* Analyze monthly sales trends
* Compare sales between months
* Calculate month-over-month sales
* Identify repeat customers
* Rank customers based on sales
* Rank products based on sales
* Analyze product profitability
* Calculate profit and profit margin
* Identify products that have never been ordered
* Analyze customer purchasing behavior
* Generate business insights using SQL

---

## 🗄️ Database Tables

The project contains the following tables:

### 1. Customers

Stores customer information.

| Column        | Description        |
| ------------- | ------------------ |
| customer_id   | Unique customer ID |
| customer_name | Customer name      |
| gender        | Customer gender    |
| age           | Customer age       |
| city          | Customer city      |
| state         | Customer state     |

### 2. Categories

Stores product category information.

| Column        | Description        |
| ------------- | ------------------ |
| category_id   | Unique category ID |
| category_name | Product category   |

### 3. Products

Stores product details.

| Column         | Description        |
| -------------- | ------------------ |
| product_id     | Unique product ID  |
| product_name   | Product name       |
| category_id    | Category reference |
| price          | Selling price      |
| cost           | Product cost       |
| stock_quantity | Available stock    |

### 4. Orders

Stores customer order information.

| Column         | Description        |
| -------------- | ------------------ |
| order_id       | Unique order ID    |
| customer_id    | Customer reference |
| order_date     | Date of order      |
| order_status   | Order status       |
| payment_method | Payment method     |

### 5. Order_Details

Stores products included in each order.

| Column          | Description         |
| --------------- | ------------------- |
| order_detail_id | Unique detail ID    |
| order_id        | Order reference     |
| product_id      | Product reference   |
| quantity        | Quantity purchased  |
| unit_price      | Price per unit      |
| discount        | Discount percentage |

### 6. Payments

Stores payment information.

| Column         | Description       |
| -------------- | ----------------- |
| payment_id     | Unique payment ID |
| order_id       | Order reference   |
| payment_date   | Payment date      |
| payment_amount | Amount paid       |
| payment_status | Payment status    |

---

## 🔗 Database Relationships

The main relationships are:

```text
Customers
    |
    | 1 : Many
    ↓
Orders
    |
    | 1 : Many
    ↓
Order_Details
    |
    | Many : 1
    ↓
Products
    |
    | Many : 1
    ↓
Categories

Orders
    |
    | 1 : 1
    ↓
Payments
```

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* **MySQL Workbench**
* **Git**
* **GitHub**

---

## 📊 SQL Concepts Used

This project covers several SQL concepts:

### Basic SQL

* SELECT
* WHERE
* AND / OR
* BETWEEN
* IN
* LIKE
* DISTINCT
* ORDER BY
* LIMIT

### Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

### Grouping

* GROUP BY
* HAVING

### Joins

* INNER JOIN
* LEFT JOIN
* Multiple-table JOINs

### Advanced SQL

* Common Table Expressions (CTEs)
* Subqueries
* Window Functions
* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* LAG()
* PARTITION BY
* Running Totals

### Business Analysis

* Customer segmentation
* Repeat customer analysis
* Customer ranking
* Product ranking
* Monthly sales analysis
* Month-over-month growth
* Profit calculation
* Profit margin
* Customer Lifetime Value analysis

---

## 📈 Key Analysis Questions

The project answers questions such as:

1. What is the total sales revenue?
2. Which products sell the most?
3. What are the top 5 products?
4. Which customers generate the highest sales?
5. Which customers are repeat customers?
6. What are the monthly sales trends?
7. How does sales change from one month to another?
8. What is the running total of sales?
9. Which products generate the highest profit?
10. What is the profit margin of each product?
11. Which products have never been ordered?
12. What is the first and latest order of each customer?
13. How can customers be ranked according to their purchases?
14. What are the top products within each category?

---

## 💡 Example SQL Analysis

### Top-Selling Products

```sql
SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
```

### Customer Sales Analysis

```sql
SELECT
    c.customer_name,
    ROUND(
        SUM(
            od.quantity * od.unit_price *
            (1 - od.discount / 100)
        ), 2
    ) AS total_sales
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE o.order_status IN ('Delivered', 'Shipped')
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_sales DESC;
```

### Monthly Sales Analysis

```sql
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(
        SUM(
            od.quantity * od.unit_price *
            (1 - od.discount / 100)
        ), 2
    ) AS total_sales
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;
```

---

## 📂 Project Structure

```text
ecommerce-sales-sql-analysis/
│
├── README.md
│
├── database/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── 03_analysis_queries.sql
│
├── queries/
│   ├── level1_basic.sql
│   ├── level2_intermediate.sql
│   ├── level3_advanced.sql
│   └── level4_business_analysis.sql
│
└── screenshots/
```

---

## 🚀 How to Run the Project

### Step 1: Install MySQL

Install MySQL Server and MySQL Workbench.

### Step 2: Create the Database

```sql
CREATE DATABASE ecommerce_analysis;
```

Select the database:

```sql
USE ecommerce_analysis;
```

### Step 3: Create Tables

Run:

```text
database/01_create_tables.sql
```

### Step 4: Insert Data

Run:

```text
database/02_insert_data.sql
```

### Step 5: Run Analysis Queries

Run:

```text
database/03_analysis_queries.sql
```

You can also execute the individual SQL files inside the `queries` folder.

---

## 📌 Project Outcomes

This project provides practical experience in using SQL for:

* Data extraction
* Data cleaning and transformation
* Sales analysis
* Customer analysis
* Product analysis
* Business intelligence
* Performance analysis
* Advanced SQL analytics

The project also demonstrates the use of **CTEs and window functions** to solve real-world business problems.

---

## 🔮 Future Improvements

Possible future enhancements include:

* Power BI dashboard integration
* Customer segmentation using RFM analysis
* Advanced Customer Lifetime Value analysis
* Sales forecasting
* Interactive dashboards
* Python-based exploratory data analysis
* Automated reporting

---

## 👨‍💻 Author

**Shakil**

### Project

**E-Commerce Sales and Customer Behavior Analysis using SQL**

---

⭐ If you find this project useful, feel free to explore the SQL queries and analysis.
