-- 🧠 SQL LESSON: IN Operator

-- 🔍 What is the IN Operator?
-- The `IN` operator is used to check if a value matches **any value** in a list.
-- It’s a concise alternative to writing multiple OR conditions.

-- 📄 Syntax:
-- WHERE column_name IN (value1, value2, value3, ...)

-- ✅ It returns TRUE if the column matches any value in the list.


-- 🧪 Example 1: Get all users from specific countries
SELECT username, country
FROM users
WHERE country IN ('USA', 'Canada', 'UK');

-- 🧾 Sample Output:
-- +-----------+---------+
-- | username  | country |
-- +-----------+---------+
-- | Alice     | USA     |
-- | Bob       | UK      |
-- | John      | Canada  |
-- +-----------+---------+


-- 🧪 Example 2: Find books released in selected years
SELECT title, released_year
FROM books
WHERE released_year IN (1999, 2005, 2020);

-- 🧾 Sample Output:
-- +------------------------+---------------+
-- | title                  | released_year |
-- +------------------------+---------------+
-- | The Book Thief         | 2005          |
-- | A Promised Land        | 2020          |
-- +------------------------+---------------+


-- 💡 Real-World Use Cases and Tips:
-- - Use `IN` to filter multiple matching values with cleaner syntax than repeated OR.
-- - Works with numbers, strings, and even subqueries.
-- - Be careful: An empty `IN ()` list is invalid and causes an error.

-- 🧪 Bonus Example: Orders placed by premium customers
SELECT order_id, customer_id
FROM orders
WHERE customer_id IN (
    SELECT id FROM customers WHERE membership_level = 'Premium'
);


-- ❗ Opposite of IN: Use NOT IN
SELECT * FROM employees
WHERE department NOT IN ('HR', 'Finance');

-- END OF LESSON
