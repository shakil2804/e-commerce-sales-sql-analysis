CREATE database e_commerce_sales;
use e_commerce_sales;

CREATE TABLE Customers(
      customer_id int PRIMARY KEY auto_increment,
      customer_name varchar(30),
      gender varchar(10) CHECK (gender IN ("Male",'Female','Other')),
      age int,
      city varchar(50),
      STATE varchar(50)
);

CREATE TABLE Categories(
	category_id int PRIMARY KEY auto_increment,
	category_name varchar(30)
);

CREATE TABLE Products(
	product_id int PRIMARY KEY auto_increment ,
	product_name varchar(50),
	category_id int,
    price decimal(10,2),
	cost decimal(10,2),
	stock_quantity int,
	FOREIGN KEY((category_id) REFERENCES Categories(category_id)
);
        
CREATE TABLE Orders(
	order_id int PRIMARY KEY auto_increment,
	customer_id int,
	order_date date,
	order_status varchar(20),
	payment_method varchar(20),
	FOREIGN KEY( (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE Order_Details(
	order_detail_id int PRIMARY KEY auto_increment,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal(10,2),
    discount decimal(5,2) DEFAULT 0,
    FOREIGN KEY((order_id) REFERENCES Orders(order_id),
    FOREIGN KEY((product_id) REFERENCES Products(product_id)
);

CREATE table Payment(
	payment_id int PRIMARY KEY auto_increment,
    order_id int,
    payment_date date,
    payment_amount decimal(10,2),
    payment_status varchar(30),
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
      
INSERT INTO Customers(customer_name, gender, age, city, state)
VALUES
('Rahul', 'Male', 28, 'Chennai', 'Tamil Nadu'),
('Priya', 'Female', 25, 'Bangalore', 'Karnataka'),
('Arun Kumar', 'Male', 32, 'Coimbatore', 'Tamil Nadu'),
('Sneha', 'Female', 29, 'Hyderabad', 'Telangana'),
('Vijay', 'Male', 35, 'Chennai', 'Tamil Nadu'),
('Anjali', 'Female', 27, 'Mumbai', 'Maharashtra'),
('Karthik', 'Male', 30, 'Madurai', 'Tamil Nadu'),
('Divya', 'Female', 24, 'Kochi', 'Kerala'),
('Mohammed', 'Male', 31, 'Bangalore', 'Karnataka'),
('Meena', 'Female', 33, 'Delhi', 'Delhi'),
('Sanjay', 'Male', 26, 'Ahmedabad', 'Gujarat'),
('Pooja', 'Female', 30, 'Pune', 'Maharashtra'),
('Ramesh', 'Male', 38, 'Salem', 'Tamil Nadu'),
('Lakshmi Priya', 'Female', 26, 'Trichy', 'Tamil Nadu'),
('Aditya', 'Male', 29, 'Mumbai', 'Maharashtra');

INSERT INTO Categories (category_name)
VALUES
('Mobiles'),
('Laptops'),
('Audio'),
('Smart Watches'),
('Footwear'),
('Bags'),
('Fashion'),
('Personal Care');

INSERT INTO Products(product_name, category_id, price, cost, stock_quantity)
VALUES
('iPhone 15', 1, 69999.00, 58000.00, 25),
('Samsung Galaxy S24', 1, 74999.00, 62000.00, 20),
('OnePlus 12', 1, 59999.00, 48000.00, 30),
('HP Laptop 15', 2, 54999.00, 45000.00, 15),
('Dell Inspiron 15', 2, 62999.00, 52000.00, 18),
('Lenovo IdeaPad 3', 2, 45999.00, 37000.00, 22),
('Sony Headphones', 3, 8999.00, 6500.00, 40),
('JBL Bluetooth Speaker', 3, 4999.00, 3500.00, 35),
('Apple Watch SE', 4, 29999.00, 24000.00, 12),
('Samsung Galaxy Watch', 4, 24999.00, 19000.00, 16),
('Nike Running Shoes', 5, 7999.00, 5500.00, 30),
('Adidas Sneakers', 5, 6999.00, 4800.00, 25),
('American Tourister Bag', 6, 3499.00, 2200.00, 45),
('Ray-Ban Sunglasses', 7, 12999.00, 9000.00, 10),
('Philips Trimmer', 8, 2499.00, 1600.00, 50);

INSERT INTO Orders
(customer_id, order_date, order_status, payment_method)
VALUES
(1, '2025-01-05', 'Delivered', 'UPI'),
(2, '2025-01-08', 'Delivered', 'Credit Card'),
(3, '2025-01-12', 'Shipped', 'UPI'),
(4, '2025-01-15', 'Delivered', 'Debit Card'),
(5, '2025-01-18', 'Cancelled', 'UPI'),
(6, '2025-01-22', 'Delivered', 'Cash on Delivery'),
(7, '2025-01-25', 'Delivered', 'Credit Card'),
(8, '2025-02-02', 'Shipped', 'UPI'),
(9, '2025-02-05', 'Delivered', 'Debit Card'),
(10, '2025-02-10', 'Delivered', 'UPI'),
(11, '2025-02-14', 'Pending', 'Credit Card'),
(12, '2025-02-18', 'Delivered', 'UPI'),
(13, '2025-02-22', 'Delivered', 'Cash on Delivery'),
(14, '2025-03-01', 'Shipped', 'Debit Card'),
(15, '2025-03-05', 'Delivered', 'UPI'),
(1, '2025-03-10', 'Delivered', 'Credit Card'),
(3, '2025-03-15', 'Cancelled', 'UPI'),
(5, '2025-03-20', 'Delivered', 'Debit Card'),
(8, '2025-03-25', 'Delivered', 'UPI'),
(10, '2025-03-30', 'Pending', 'Cash on Delivery');

INSERT INTO Order_Details
(order_id, product_id, quantity, unit_price, discount)
VALUES
(1, 1, 1, 69999.00, 5.00),
(1, 7, 2, 8999.00, 10.00),
(2, 4, 1, 54999.00, 5.00),
(2, 13, 1, 3499.00, 0.00),
(3, 2, 1, 74999.00, 8.00),
(3, 8, 1, 4999.00, 5.00),
(4, 11, 2, 7999.00, 10.00),
(4, 15, 1, 2499.00, 0.00),
(5, 3, 1, 59999.00, 5.00),
(6, 5, 1, 62999.00, 10.00),
(6, 12, 1, 6999.00, 5.00),
(7, 9, 1, 29999.00, 8.00),
(7, 7, 1, 8999.00, 5.00),
(8, 6, 1, 45999.00, 10.00),
(8, 13, 2, 3499.00, 0.00),
(9, 10, 1, 24999.00, 5.00),
(9, 14, 1, 12999.00, 10.00),
(10, 1, 1, 69999.00, 7.00),
(10, 15, 2, 2499.00, 0.00),
(11, 4, 1, 54999.00, 5.00),
(12, 2, 1, 74999.00, 10.00),
(12, 8, 2, 4999.00, 5.00),
(13, 11, 1, 7999.00, 0.00),
(13, 12, 2, 6999.00, 5.00),
(14, 5, 1, 62999.00, 8.00),
(15, 3, 1, 59999.00, 10.00),
(15, 7, 1, 8999.00, 5.00),
(16, 9, 1, 29999.00, 5.00),
(17, 6, 2, 45999.00, 10.00),
(18, 14, 1, 12999.00, 5.00);

INSERT INTO Payment
(order_id, payment_date, payment_amount, payment_status)
VALUES
(1, '2025-01-05', 85497.05, 'Completed'),
(2, '2025-01-08', 55723.05, 'Completed'),
(3, '2025-01-12', 73998.00, 'Completed'),
(4, '2025-01-15', 16995.60, 'Completed'),
(5, '2025-01-18', 0.00, 'Refunded'),
(6, '2025-01-22', 63448.55, 'Completed'),
(7, '2025-01-25', 36348.55, 'Completed'),
(8, '2025-02-02', 48348.60, 'Completed'),
(9, '2025-02-05', 35647.55, 'Completed'),
(10, '2025-02-10', 70448.57, 'Completed'),
(11, '2025-02-14', 52249.05, 'Pending'),
(12, '2025-02-18', 75948.05, 'Completed'),
(13, '2025-02-22', 21248.05, 'Completed'),
(14, '2025-03-01', 57958.08, 'Completed'),
(15, '2025-03-05', 62903.10, 'Completed'),
(16, '2025-03-10', 28499.05, 'Completed'),
(17, '2025-03-15', 0.00, 'Refunded'),
(18, '2025-03-20', 12349.05, 'Completed'),
(19, '2025-03-25', 0.00, 'Pending'),
(20, '2025-03-30', 0.00, 'Pending');

-- show all customers
SELECT * FROM customers;

-- Show only Customer names
SELECT customer_name FROM customers;

--  Insert new customer
INSERT INTO Customers(customer_name, gender, age, city, state)
VALUES('Sakthi', 'Male', 25, 'Vellore', 'Tamil Nadu');

--  Update product price
UPDATE products
SET price=79999.00
WHERE product_id=1;

--  Find customers above a certain age
SELECT * FROM customers
WHERE age >30;

--  Count total customers
SELECT COUNT(*) AS total_customers FROM Customers;

--  Find average product price
SELECT avg(price) AS average_price FROM products;

--  Find maximum/minimum product price
SELECT max(price) AS max_price,min(price) AS min_price FROM products;

--  Find male/female customers
SELECT * FROM Customers WHERE gender="male" OR gender="female";

-- Find products between ₹10,000 and ₹50,000
SELECT * FROM Products
WHERE price BETWEEN 10000 AND 50000;

-- IN — Multiple values
SELECT * FROM Customers
WHERE city IN ('Chennai', 'Mumbai', 'Bangalore');

-- Find customers who are not from Chennai or Mumbai
SELECT * FROM Customers
WHERE city NOT IN ('Chennai', 'Mumbai');

-- Sort products by price
SELECT * FROM products
ORDER BY price;

-- Find products with low stock
SELECT * FROM products
WHERE stock_quantity <15;

-- total sales
SELECT Sum(quantity*unit_price*(1-discount/100)) AS Total_Sales FROM order_details;

-- Customers who spent more than ₹50,000
SELECT
    c.customer_name,
    ROUND(SUM(od.quantity * od.unit_price * (1 - od.discount / 100)), 2) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > 50000
ORDER BY total_spent DESC;

-- Sales by category
SELECT c.category_name,
round(
    SUM(od.quantity * od.unit_price * (1 - od.discount / 100)),2) 
    AS total_sales
FROM Categories c JOIN Products p
    ON c.category_id = p.category_id 
    JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY c.category_name
ORDER BY total_sales DESC;

-- Sales by customer
SELECT c.customer_id,c.customer_name,
	SUM(od.quantity * od.unit_price * (1-discount/100)) as total_sales from customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_details od
	ON od.order_id=o.order_id
GROUP BY c.customer_id
order by total_sales desc;

-- Top-selling products
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
ORDER BY total_quantity_sold DESC;

-- Top 3 customers by total Sales
SELECT c.customer_id,c.customer_name,
	SUM(od.quantity * od.unit_price * (1-discount/100)) AS total_sales FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_details od
	ON od.order_id=o.order_id
GROUP BY c.customer_id
ORDER BY total_sales DESC
LIMIT 3;

-- To calculate total sales for each month, use MONTH() and YEAR() with GROUP BY
SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    ROUND(
        SUM(od.quantity * od.unit_price * (1 - od.discount / 100)),
        2
    ) AS total_sales
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    sales_year,
    sales_month;
    
-- Month-over-Month (MoM) Sales
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        ROUND(
            SUM(
                od.quantity * od.unit_price *
                (1 - od.discount / 100)
            ),
            2
        ) AS total_sales
    FROM Orders o
    JOIN Order_Details od
        ON o.order_id = od.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    sales_month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_month
    ) AS previous_month_sales
FROM monthly_sales
ORDER BY sales_month;

-- Repeat Customers
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

-- Most Recent Order of Each Customer
WITH ranked_orders AS (
    SELECT
        c.customer_name,
        o.order_id,
        o.order_date,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY o.order_date DESC
        ) AS rn
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
)
SELECT
    customer_name,
    order_id,
    order_date
FROM ranked_orders
WHERE rn = 1;
 
-- Products costing more than the average product price using Subqueries
SELECT
    product_name,
    price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
)
ORDER BY price DESC;


