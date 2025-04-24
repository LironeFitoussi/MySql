-- Lesson: INNER JOIN with GROUP BY in SQL
-- This lesson demonstrates how to combine tables and aggregate results
-- by grouping on specific columns after joining.

-- Example Schema Setup
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    name         VARCHAR(100),
    category     VARCHAR(50)
);

CREATE TABLE sales (
    sale_id      INT PRIMARY KEY,
    product_id   INT,
    sale_date    DATE,
    quantity     INT,
    price        DECIMAL(8,2),
    CHECK (quantity > 0 AND price >= 0)
);

-- Populate sample data
INSERT INTO products (product_id, name, category) VALUES
    (1, 'Laptop',       'Electronics'),
    (2, 'Office Chair', 'Furniture'),
    (3, 'Notebook',     'Stationery');

INSERT INTO sales (sale_id, product_id, sale_date, quantity, price) VALUES
    (1001, 1, '2025-04-01', 2, 1200.00),
    (1002, 1, '2025-04-03', 1, 1150.00),
    (1003, 2, '2025-04-05', 5,   150.00),
    (1004, 3, '2025-04-07', 10,    5.00),
    (1005, 2, '2025-04-10', 2,   140.00);

-- Example 1: Total revenue per product
SELECT
    p.product_id,
    p.name,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
INNER JOIN products AS p
    ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name;

-- Example 2: Units sold per category
SELECT
    p.category,
    SUM(s.quantity) AS units_sold,
    AVG(s.price)   AS avg_price
FROM sales s
INNER JOIN products p
    ON s.product_id = p.product_id
GROUP BY
    p.category
HAVING
    SUM(s.quantity) > 5;  -- Only categories with more than 5 units sold

-- Tips:
-- 1. GROUP BY columns must appear in SELECT or be used in aggregates.
-- 2. Use HAVING to filter aggregated groups (WHERE cannot).
-- 3. Aliases improve readability: e.g., s for sales, p for products.

-- Common Pitfalls:
-- • Forgetting to include non-aggregated columns in GROUP BY causes errors.
-- • Applying WHERE before grouping filters rows, HAVING filters groups.
-- • Joining large tables without pre-aggregation can impact performance.

-- Summary:
-- Combining INNER JOIN with GROUP BY enables aggregated insights
-- on related data, such as totals per product or category.

-- Suggested file name:
-- inner_join_group_by_lesson.sql




SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;