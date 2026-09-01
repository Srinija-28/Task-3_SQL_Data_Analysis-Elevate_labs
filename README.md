# Task 3: SQL for Data Analysis

## Data Analyst Internship

### Task Objective

The objective of this task is to use SQL queries to extract and analyze data from an e-commerce database.

### Tools Used

- SQLite
- DB Browser for SQLite
- SQL

### Dataset

The dataset used for this task is an E-commerce SQL database.

The database contains the following tables:

- Customers
- Products
- Orders

---

## Database Tables

### 1. Customers

The Customers table contains customer information such as:

- customer_id
- customer_name
- city
- email

### 2. Products

The Products table contains product information such as:

- product_id
- product_name
- category
- price

### 3. Orders

The Orders table contains order information such as:

- order_id
- customer_id
- product_id
- quantity
- order_date

---

## SQL Concepts Implemented

The following SQL concepts were used in this task:

1. SELECT statements
2. WHERE clause
3. ORDER BY clause
4. GROUP BY clause
5. Aggregate functions
6. AVG() function
7. SUM() function
8. INNER JOIN
9. LEFT JOIN
10. RIGHT JOIN
11. Subqueries
12. Revenue analysis
13. Views
14. Indexes

---

## Queries and Analysis Performed

### 1. Customer Data

Retrieved and examined customer information from the Customers table.

### 2. Product Data

Retrieved and examined product information from the Products table.

### 3. Orders Data

Retrieved and examined order information from the Orders table.

### 4. SELECT Query

Used SELECT statements to retrieve data from the database.

### 5. WHERE Query

Filtered customers based on their city.

Example:

```sql
SELECT *
FROM Customers
WHERE city = 'Hyderabad';
