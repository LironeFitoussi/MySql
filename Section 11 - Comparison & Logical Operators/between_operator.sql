-- 🧠 SQL LESSON: BETWEEN Operator

-- 🔍 What is the BETWEEN Operator?
-- The `BETWEEN` operator is used to filter results within a specific range.
-- It includes both the **lower** and **upper** boundary values.
-- It's equivalent to using >= and <= together.

-- 📄 Syntax:
-- WHERE column_name BETWEEN value1 AND value2

-- ✅ The range is inclusive: value1 <= column <= value2


-- 🧪 Example 1: Get all books released BETWEEN 2000 and 2020
SELECT title, released_year
FROM books
WHERE released_year BETWEEN 2000 AND 2020;

-- 🧾 Sample Output:
-- +----------------------------+---------------+
-- | title                      | released_year |
-- +----------------------------+---------------+
-- | The Kite Runner            | 2003          |
-- | The Help                   | 2009          |
-- | The Silent Patient         | 2019          |
-- +----------------------------+---------------+


-- 🧪 Example 2: Find products priced BETWEEN $10 and $50
SELECT product_name, price
FROM products
WHERE price BETWEEN 10 AND 50;

-- 🧾 Sample Output:
-- +-------------------+--------+
-- | product_name      | price  |
-- +-------------------+--------+
-- | USB Cable         | 12.99  |
-- | Notebook          | 25.00  |
-- | Bluetooth Speaker | 49.99  |
-- +-------------------+--------+


-- 💡 Real-World Use Cases and Tips:
-- - Use `BETWEEN` for filtering dates, numbers, or even characters (like BETWEEN 'A' AND 'M').
-- - It's inclusive, so it includes the boundary values.
-- - You can also use it with `NOT` to exclude a range: `NOT BETWEEN ... AND ...`

-- 🧪 Bonus Example: Students whose final score is between 70 and 85
SELECT student_name, final_score
FROM students
WHERE final_score BETWEEN 70 AND 85;

-- 🧪 Bonus Example 2: Orders NOT placed in Q1 (January to March)
SELECT order_id, order_date
FROM orders
WHERE MONTH(order_date) NOT BETWEEN 1 AND 3;

-- END OF LESSON
