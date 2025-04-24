-- Lesson: INNER JOIN in SQL
-- This lesson demonstrates how to combine rows from two or more tables
-- based on matching column values, returning only the matching records.

-- Example Schema Setup
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    name          VARCHAR(100),
    email         VARCHAR(255)
);

CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    customer_id   INT,
    order_date    DATE,
    amount        DECIMAL(10,2),
    -- No FOREIGN KEY for ANSI-SQL simplicity; assume referential integrity
    CHECK (amount >= 0)
);

-- Populate with sample data
INSERT INTO customers (customer_id, name, email) VALUES
    (1, 'Alice Johnson',  'alice@example.com'),
    (2, 'Bob Smith',      'bob@example.com'),
    (3, 'Carol Martinez', 'carol@example.com');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
    (100, 1, '2025-04-20',  250.00),
    (101, 2, '2025-04-21',   75.50),
    (102, 1, '2025-04-22',  100.00),
    (103, 4, '2025-04-23',   50.00);  -- Note: customer_id 4 does not exist

-- Example 1: Basic INNER JOIN
-- Retrieve orders with customer details
SELECT
    o.order_id,
    c.name,
    o.order_date,
    o.amount
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

-- Example 2: INNER JOIN with WHERE filter
-- Only orders above $100
SELECT
    c.email,
    o.order_id,
    o.amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.amount > 100;

-- Tips:
-- 1. INNER JOIN returns rows only when the ON condition matches in both tables.
-- 2. Use table aliases (o, c) for readability in complex queries.
-- 3. ANSI-SQL requires INNER JOIN keyword, but JOIN is often accepted.

-- Common Pitfalls:
-- • Omitting join condition leads to a Cartesian product (every row × every row).
-- • Joining on non-indexed columns can degrade performance.
-- • Mismatched data types between join columns may prevent matching.

-- Summary:
-- INNER JOIN is used to combine related rows from two tables based on a matching column.
-- It filters out non-matching rows, ensuring returned data reflects only valid relationships.

-- Suggested file name:
-- inner_join_lesson.sql
