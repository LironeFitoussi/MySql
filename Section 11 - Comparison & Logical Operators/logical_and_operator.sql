-- 🧠 SQL LESSON: LOGICAL AND

-- 🔍 What is the AND Operator?
-- The `AND` operator allows you to combine multiple conditions in a SQL query.
-- A row will be returned ONLY if **all** conditions joined with `AND` are TRUE.

-- 📄 Syntax:
-- WHERE condition1 AND condition2

-- ✅ Used to create more specific and narrow filters.


-- 🧪 Example 1: Get all books released after 2010 AND with more than 300 pages
SELECT title, released_year, pages
FROM books
WHERE released_year > 2010 AND pages > 300;

-- 🧾 Sample Output:
-- +----------------------------+---------------+--------+
-- | title                      | released_year | pages  |
-- +----------------------------+---------------+--------+
-- | The Silent Patient         | 2019          | 325    |
-- | Project Hail Mary          | 2021          | 476    |
-- +----------------------------+---------------+--------+


-- 🧪 Example 2: Find employees in 'Engineering' AND with salary over 5000
SELECT name, department, salary
FROM employees
WHERE department = 'Engineering' AND salary > 5000;

-- 🧾 Sample Output:
-- +--------+--------------+--------+
-- | name   | department   | salary |
-- +--------+--------------+--------+
-- | Alice  | Engineering  | 6500   |
-- | David  | Engineering  | 7200   |
-- +--------+--------------+--------+


-- 💡 Real-World Use Cases and Tips:
-- - Use `AND` to make filters stricter — useful when combining roles, status, or date ranges.
-- - Combine with `OR` and parentheses `()` for complex queries.
-- - You can use as many `AND` conditions as needed.

-- 🧪 Bonus Example: Get orders placed in 2024 AND with total over 100
SELECT order_id, order_date, total
FROM orders
WHERE YEAR(order_date) = 2024 AND total > 100;

-- END OF LESSON
