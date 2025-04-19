-- 🧠 SQL LESSON: CASE Operator

-- 🧐 What is CASE?
-- The CASE expression lets you perform **if-then-else logic** in SQL.
-- It returns a value based on conditions, useful for labeling or transforming data.

-- 📄 Basic Syntax:
-- CASE
--   WHEN condition1 THEN result1
--   WHEN condition2 THEN result2
--   ...
--   ELSE default_result
-- END

-- 🧪 Example 1: Label orders as 'High', 'Medium', or 'Low' value
SELECT order_id, amount,
  CASE
    WHEN amount >= 1000 THEN 'High'
    WHEN amount >= 500 THEN 'Medium'
    ELSE 'Low'
  END AS order_level
FROM orders;

-- 🧾 Sample Output:
-- +----------+--------+-------------+
-- | order_id | amount | order_level |
-- +----------+--------+-------------+
-- | 2001     | 1200   | High        |
-- | 2002     | 600    | Medium      |
-- | 2003     | 150    | Low         |
-- +----------+--------+-------------+

-- 🧪 Example 2: Show a custom message based on user status
SELECT username, status,
  CASE status
    WHEN 'active' THEN 'Welcome back!'
    WHEN 'inactive' THEN 'Account on hold'
    WHEN 'banned' THEN 'Access denied'
    ELSE 'Unknown status'
  END AS message
FROM users;

-- 🧾 Sample Output:
-- +----------+----------+------------------+
-- | username | status   | message          |
-- +----------+----------+------------------+
-- | Alex     | active   | Welcome back!    |
-- | Jamie    | banned   | Access denied    |
-- | Riley    | pending  | Unknown status   |
-- +----------+----------+------------------+

-- ✅ Tips:
-- Use CASE in SELECT to create custom columns.
-- Can also be used in ORDER BY and WHERE for dynamic logic.

-- ✅ Summary:
-- CASE is like a mini if/else inside your SQL.
-- Powerful for conditional logic directly in your queries!

-- END OF LESSON
