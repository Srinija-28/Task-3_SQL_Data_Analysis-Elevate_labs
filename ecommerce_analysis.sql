-- ==========================================
-- ECOMMERCE SQL DATA ANALYSIS
-- ==========================================

-- ==========================================
-- 1. CREATE TABLES
-- ==========================================

CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT,
    email TEXT
);

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    price REAL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- ==========================================
-- 2. INSERT CUSTOMER DATA
-- ==========================================

INSERT INTO Customers VALUES
(1, 'Ravi', 'Hyderabad', 'ravi@gmail.com'),
(2, 'Priya', 'Bangalore', 'priya@gmail.com'),
(3, 'Arjun', 'Chennai', 'arjun@gmail.com'),
(4, 'Sneha', 'Hyderabad', 'sneha@gmail.com'),
(5, 'Kiran', 'Mumbai', 'kiran@gmail.com'),
(6, 'Anjali', 'Delhi', 'anjali@gmail.com');

-- ==========================================
-- 3. INSERT PRODUCT DATA
-- ==========================================

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile Phone', 'Electronics', 25000),
(103, 'Headphones', 'Electronics', 2000),
(104, 'Office Chair', 'Furniture', 7000),
(105, 'Desk', 'Furniture', 9000),
(106, 'Keyboard', 'Electronics', 1500);

-- ==========================================
-- 4. INSERT ORDER DATA
-- ==========================================

INSERT INTO Orders VALUES
(1001, 1, 101, 1, '2026-08-01'),
(1002, 2, 102, 2, '2026-08-02'),
(1003, 3, 103, 3, '2026-08-03'),
(1004, 1, 104, 1, '2026-08-04'),
(1005, 4, 105, 2, '2026-08-05'),
(1006, 5, 106, 2, '2026-08-06'),
(1007, 2, 103, 1, '2026-08-07'),
(1008, 3, 101, 1, '2026-08-08'),
(1009, 4, 102, 1, '2026-08-09'),
(1010, 5, 104, 2, '2026-08-10');

-- ==========================================
-- 5. SELECT
-- ==========================================

SELECT *
FROM Customers;

-- ==========================================
-- 6. WHERE
-- ==========================================

SELECT *
FROM Customers
WHERE city = 'Hyderabad';

-- ==========================================
-- 7. ORDER BY
-- ==========================================

SELECT *
FROM Products
ORDER BY price DESC;

-- ==========================================
-- 8. GROUP BY
-- ==========================================

SELECT
    city,
    COUNT(*) AS customer_count
FROM Customers
GROUP BY city
ORDER BY customer_count DESC;

-- ==========================================
-- 9. SUM
-- ==========================================

SELECT
    SUM(p.price * o.quantity) AS total_revenue
FROM Orders o
JOIN Products p
    ON o.product_id = p.product_id;

-- ==========================================
-- 10. AVG
-- ==========================================

SELECT
    AVG(price) AS average_product_price
FROM Products;

-- ==========================================
-- 11. AVERAGE REVENUE PER USER
-- ==========================================

SELECT
    SUM(p.price * o.quantity) * 1.0
    / COUNT(DISTINCT o.customer_id)
    AS average_revenue_per_user
FROM Orders o
JOIN Products p
    ON o.product_id = p.product_id;

-- ==========================================
-- 12. INNER JOIN
-- ==========================================

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    o.quantity,
    p.price
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id
INNER JOIN Products p
    ON o.product_id = p.product_id;

-- ==========================================
-- 13. LEFT JOIN
-- ==========================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- ==========================================
-- 14. RIGHT JOIN EQUIVALENT IN SQLITE
-- ==========================================

SELECT
    p.product_id,
    p.product_name,
    p.category,
    o.order_id,
    o.order_date
FROM Products p
LEFT JOIN Orders o
    ON p.product_id = o.product_id
ORDER BY p.product_id;

-- ==========================================
-- 15. SUBQUERY
-- ==========================================

SELECT
    product_name,
    price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

-- ==========================================
-- 16. REVENUE BY CUSTOMER
-- ==========================================

SELECT
    c.customer_name,
    SUM(p.price * o.quantity) AS total_revenue
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Products p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;

-- ==========================================
-- 17. REVENUE BY PRODUCT
-- ==========================================

SELECT
    p.product_name,
    SUM(p.price * o.quantity) AS total_revenue
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- ==========================================
-- 18. REVENUE BY CATEGORY
-- ==========================================

SELECT
    p.category,
    SUM(p.price * o.quantity) AS total_revenue
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- ==========================================
-- 19. CREATE VIEW
-- ==========================================

CREATE VIEW customer_revenue AS
SELECT
    c.customer_name,
    SUM(p.price * o.quantity) AS total_revenue
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Products p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;

-- ==========================================
-- 20. DISPLAY VIEW
-- ==========================================

SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;

-- ==========================================
-- 21. CREATE INDEX
-- ==========================================

CREATE INDEX idx_orders_customer_id
ON Orders(customer_id);