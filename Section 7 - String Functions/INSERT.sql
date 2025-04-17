-- 1. Create a database and use it
CREATE DATABASE example_db;
USE example_db;

-- 2. Create a table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- 3. Insert multiple rows into the table
INSERT INTO employees (name, position, salary)
VALUES 
('Alice', 'Manager', 75000.00),
('Bob', 'Developer', 60000.00),
('Charlie', 'Designer', 55000.00);

-- 4. Select all rows to verify the data
SELECT * FROM employees;

-- Output:
-- +----+---------+-----------+----------+
-- | id | name    | position  | salary   |
-- +----+---------+-----------+----------+
-- |  1 | Alice   | Manager   | 75000.00 |
-- |  2 | Bob     | Developer | 60000.00 |
-- |  3 | Charlie | Designer  | 55000.00 |
-- +----+---------+-----------+----------+

-- 5. Insert a single row into the table
INSERT INTO employees (name, position, salary)
VALUES ('Diana', 'Tester', 50000.00);

-- 6. Select all rows again to verify the new data
SELECT * FROM employees;

-- Output:
-- +----+---------+-----------+----------+
-- | id | name    | position  | salary   |
-- +----+---------+-----------+----------+
-- |  1 | Alice   | Manager   | 75000.00 |
-- |  2 | Bob     | Developer | 60000.00 |
-- |  3 | Charlie | Designer  | 55000.00 |
-- |  4 | Diana   | Tester    | 50000.00 |
-- +----+---------+-----------+----------+