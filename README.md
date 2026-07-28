# 🛒 E-Commerce Database Management System

## Customer, Product & Purchase Database Analysis Using SQL

## 📌 Problem Statement

Retail businesses need to track customers, products, and purchases efficiently. Managing this information manually makes it difficult to answer business questions such as:

- Which customer bought which product?
- When was a product purchased?
- Which products are the best-selling?

This mini project designs a relational database with three tables:

- **Customers**
- **Products**
- **Purchases**

The project demonstrates SQL concepts like **Primary Keys**, **Foreign Keys**, **INNER JOIN**, **GROUP BY**, **Aggregate Functions**, and **ORDER BY**.

---

# 🛠 Tech Stack

| Layer | Technology |
|--------|------------|
| Database | MySQL |
| Language | SQL (DDL, DML, DQL) |
| Concepts | Primary Key, Foreign Key, INNER JOIN, GROUP BY, SUM(), ORDER BY |
| Tools | MySQL Workbench / CLI |

---

# 📂 Database Schema

## 1. Customers Table

```sql
CREATE TABLE Customers (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(50),
    ph_no VARCHAR(15)
);

INSERT INTO Customers VALUES
(1,'Rahul','9876543210'),
(2,'Priya','9123456789'),
(3,'Amit','9988776655'),
(4,'Sneha','9012345678'),
(5,'Karan','9090909090');
```

---

## 2. Products Table

```sql
CREATE TABLE Products (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO Products VALUES
(101,'Laptop',55000,10),
(102,'Mouse',500,50),
(103,'Keyboard',1200,30),
(104,'Headphones',2000,20),
(105,'Monitor',10000,15);
```

---

## 3. Purchases Table

```sql
CREATE TABLE Purchases (
    pu_id INT PRIMARY KEY,
    c_id INT,
    p_id INT,
    quantity INT,
    pu_date DATE,
    FOREIGN KEY (c_id) REFERENCES Customers(c_id),
    FOREIGN KEY (p_id) REFERENCES Products(p_id)
);

INSERT INTO Purchases VALUES
(1,1,101,1,'2025-01-05'),
(2,2,102,2,'2025-01-06'),
(3,3,103,1,'2025-01-07'),
(4,4,104,2,'2025-01-08'),
(5,5,105,1,'2025-01-09'),
(6,1,102,3,'2025-01-10'),
(7,2,103,2,'2025-01-11'),
(8,3,104,1,'2025-01-12'),
(9,4,105,1,'2025-01-13'),
(10,5,101,1,'2025-01-14');
```

---

# 🔍 Query 1 – Complete Purchase Details

Displays customer details, purchased product, price, quantity, and purchase date.

```sql
SELECT
    c.c_id,
    c.c_name,
    c.ph_no,
    p.p_name,
    p.price,
    pu.quantity,
    pu.pu_date
FROM Customers c
INNER JOIN Purchases pu
ON c.c_id = pu.c_id
INNER JOIN Products p
ON pu.p_id = p.p_id;
```

### Sample Output

| Customer | Product | Price | Quantity | Purchase Date |
|----------|---------|-------|----------|---------------|
| Rahul | Laptop | 55000 | 1 | 2025-01-05 |
| Rahul | Mouse | 500 | 3 | 2025-01-10 |
| Priya | Mouse | 500 | 2 | 2025-01-06 |
| Priya | Keyboard | 1200 | 2 | 2025-01-11 |
| Amit | Keyboard | 1200 | 1 | 2025-01-07 |
| Amit | Headphones | 2000 | 1 | 2025-01-12 |
| Sneha | Headphones | 2000 | 2 | 2025-01-08 |
| Sneha | Monitor | 10000 | 1 | 2025-01-13 |
| Karan | Monitor | 10000 | 1 | 2025-01-09 |
| Karan | Laptop | 55000 | 1 | 2025-01-14 |

---

# 📊 Query 2 – Total Quantity Purchased per Product

Calculates the total quantity sold for each product.

```sql
SELECT
    p.p_id,
    p.p_name,
    SUM(pu.quantity) AS total_purchased
FROM Products p
JOIN Purchases pu
ON p.p_id = pu.p_id
GROUP BY p.p_id, p.p_name
ORDER BY total_purchased DESC;
```

### Sample Output

| Product ID | Product | Total Purchased |
|------------|---------|-----------------|
| 102 | Mouse | 5 |
| 103 | Keyboard | 3 |
| 104 | Headphones | 3 |
| 101 | Laptop | 2 |
| 105 | Monitor | 2 |

---

# 📈 Key Insights

- 🖱️ Mouse is the best-selling product (5 units sold).
- ⌨️ Keyboard and 🎧 Headphones are tied for second place (3 units each).
- 💻 Laptop and 🖥️ Monitor each sold 2 units.
- SQL **JOIN** enables combining related tables.
- SQL **GROUP BY** and **SUM()** help generate business reports.

---

# 📚 SQL Concepts Used

- CREATE TABLE
- INSERT INTO
- PRIMARY KEY
- FOREIGN KEY
- INNER JOIN
- GROUP BY
- SUM()
- ORDER BY

---

# 🚀 How to Run

1. Open MySQL Workbench (or any MySQL client).
2. Create a new database.

```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```

3. Run the table creation scripts.
4. Insert the sample data.
5. Execute the SQL queries.

---

# 📁 Project Structure

```
E-Commerce-Database/
│── README.md
│── ecommerce.sql
```

---

# 👨‍💻 Author

**Your Name**

Mini Project – SQL Database Management System
