-- Example 1: Using LIMIT to fetch the first 5 rows
SELECT * 
FROM employees
LIMIT 5;

-- Output: Displays the first 5 rows from the employees table.

-- Example 2: Using LIMIT with OFFSET to fetch rows 6 to 10
SELECT * 
FROM employees
LIMIT 5 OFFSET 5;

-- Output: Skips the first 5 rows and displays rows 6 to 10.

-- Example 3: Using LIMIT with a threshold condition
SELECT * 
FROM orders
WHERE total_amount > 1000
LIMIT 3;

-- Output: Displays the first 3 rows from the orders table where total_amount is greater than 1000.

-- Example 4: Using LIMIT with ORDER BY
SELECT * 
FROM products
ORDER BY price DESC
LIMIT 10;

-- Output: Displays the top 10 most expensive products.

-- Example 5: Using LIMIT with a subquery
SELECT * 
FROM (SELECT * FROM sales ORDER BY sale_date DESC LIMIT 5) AS recent_sales;

-- Output: Displays the 5 most recent sales based on sale_date.