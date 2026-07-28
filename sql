-- 
============================================================ -- MINI PROJECT: Customer, Product & Purchase Database 
Analysis -- 
============================================================ -- ------------------------------------------------------------ -- 1. CUSTOMERS TABLE -- -----------------------------------------------------------CREATE TABLE Customers (     
c_id INT PRIMARY KEY,     
c_name VARCHAR(50),     
ph_no VARCHAR(15) ); 
INSERT INTO Customers VALUES 
(1, 'Rahul', '9876543210'), 
(2, 'Priya', '9123456789'), 
(3, 'Amit', '9988776655'), 
(4, 'Sneha', '9012345678'), 
(5, 'Karan', '9090909090'); -- ------------------------------------------------------------ -- 2. PRODUCTS TABLE -- -----------------------------------------------------------CREATE TABLE Products (     
p_id INT PRIMARY KEY,     
VARCHAR(50),     
price DECIMAL(10,2),     
INSERT INTO Products VALUES 
(101, 'Laptop', 55000, 10), 
(102, 'Mouse', 500, 50), 
(103, 'Keyboard', 1200, 30), 
(104, 'Headphones', 2000, 20), 
(105, 'Monitor', 10000, 15); 
stock INT ); 
p_name -- ------------------------------------------------------------ -- 3. PURCHASES TABLE (links Customers & Products) -- -----------------------------------------------------------CREATE TABLE Purchases (     
pu_id INT PRIMARY KEY,     
INT,     
p_id INT,     
quantity INT,     
pu_date DATE,     
FOREIGN KEY (c_id) REFERENCES Customers(c_id), 
FOREIGN KEY (p_id) REFERENCES Products(p_id) 
); 
INSERT INTO Purchases VALUES 
(1, 1, 101, 1, '2025-01-05'), 
(2, 2, 102, 2, '2025-01-06'), 
(3, 3, 103, 1, '2025-01-07'), 
(4, 4, 104, 2, '2025-01-08'), 
(5, 5, 105, 1, '2025-01-09'), 
(6, 1, 102, 3, '2025-01-10'), 
(7, 2, 103, 2, '2025-01-11'), 
(8, 3, 104, 1, '2025-01-12'), 
(9, 4, 105, 1, '2025-01-13'), 
(10, 5, 101, 1, '2025-01-14'); 
c_id 
-- ------------------------------------------------------------ -- 4. QUERY 1: Complete Purchase Details (INNER JOIN) --    
Shows customer, product, price, quantity & date 
together -- -----------------------------------------------------------SELECT 
c.c_id, 
c.c_name, 
c.ph_no, 
p.p_name, 
p.price,     
pu.quantity,     
pu.pu_date FROM 
Customers c 
INNER JOIN Purchases pu 
ON c.c_id = pu.c_id 
INNER JOIN Products p 
ON pu.p_id = p.p_id; -- ------------------------------------------------------------ -- 5. QUERY 2: Total Quantity Purchased per Product --    
Aggregates & ranks products by total units sold -- -----------------------------------------------------------SELECT 
p.p_id, 
p.p_name,     
SUM(pu.quantity) AS 
total_purchased 
FROM Products p 
JOIN Purchases pu 
ON p.p_id = pu.p_id 
GROUP BY p.p_id, p.p_name 
ORDER BY total_purchased DESC;
