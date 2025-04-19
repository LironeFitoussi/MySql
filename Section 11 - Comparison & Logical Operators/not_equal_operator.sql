-- 🧠 SQL LESSON: NOT EQUAL

-- 🔍 What is NOT EQUAL?
-- The NOT EQUAL operator is used in SQL to compare two values.
-- It returns TRUE when the values are NOT the same.
-- There are two valid ways to write it: `!=` and `<>`.

-- 📄 Syntax Examples:
-- WHERE column_name != value
-- WHERE column_name <> value

-- ✅ Both are valid and mean the same thing.


-- 🧪 Example 1: Get all books NOT released in the year 2020
SELECT title, released_year
FROM books
WHERE released_year != 2020;

-- 🧾 Sample Output:
-- +---------------------+---------------+
-- | title               | released_year |
-- +---------------------+---------------+
-- | The Alchemist       | 1993          |
-- | Atomic Habits       | 2018          |
-- | The Great Gatsby    | 1925          |
-- +---------------------+---------------+


-- 🧪 Example 2: Get employees who are NOT in the 'Sales' department
SELECT first_name, department
FROM employees
WHERE department <> 'Sales';

-- 🧾 Sample Output:
-- +-------------+--------------+
-- | first_name  | department   |
-- +-------------+--------------+
-- | Alice       | Engineering  |
-- | Bob         | HR           |
-- | Diana       | Marketing    |
-- +-------------+--------------+


-- 💡 Real-World Use Cases and Tips:
-- - Use NOT EQUAL to filter out specific values.
-- - Ideal for exclusion logic, like customers who didn't place an order.
-- - Prefer `!=` for readability in modern SQL.
-- - Be careful with NULLs — NULL is not equal to anything, not even another NULL.

-- ❗ Important Tip About NULL:
-- This query will NOT return rows where email IS NULL
SELECT * FROM users WHERE email != 'example@example.com';

-- ✅ Instead, include an IS NULL condition
SELECT * FROM users
WHERE email != 'example@example.com'
   OR email IS NULL;

-- END OF LESSON
