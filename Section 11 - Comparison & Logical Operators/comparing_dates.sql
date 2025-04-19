-- 🧠 SQL LESSON: COMPARING DATES

-- 🔍 Why Compare Dates?
-- In SQL, dates are often stored in DATE, DATETIME, or TIMESTAMP columns.
-- You can use comparison operators (=, >, <, <=, >=, !=, BETWEEN) to filter by date or datetime.

-- ✅ Always wrap date values in single quotes using the format 'YYYY-MM-DD'
-- ✅ For full datetime comparisons, use 'YYYY-MM-DD HH:MM:SS'

-- 📄 Syntax Examples:
-- WHERE order_date = '2024-01-01'
-- WHERE created_at > '2024-01-01 08:00:00'


-- 🧪 Example 1: Get all orders placed on January 1st, 2024
SELECT order_id, customer_name, order_date
FROM orders
WHERE order_date = '2024-01-01';

-- 🧾 Sample Output:
-- +----------+----------------+------------+
-- | order_id | customer_name  | order_date |
-- +----------+----------------+------------+
-- | 1001     | Alice          | 2024-01-01 |
-- | 1002     | David          | 2024-01-01 |
-- +----------+----------------+------------+


-- 🧪 Example 2: Find all events that happened AFTER March 1st, 2024
SELECT event_name, start_time
FROM events
WHERE start_time > '2024-03-01';

-- 🧾 Sample Output:
-- +------------------------+---------------------+
-- | event_name             | start_time          |
-- +------------------------+---------------------+
-- | Spring Conference      | 2024-03-10 09:00:00  |
-- | Tech Expo              | 2024-04-01 13:00:00  |
-- +------------------------+---------------------+


-- 🧪 Example 3: Users who signed up BETWEEN two dates
SELECT username, signup_date
FROM users
WHERE signup_date BETWEEN '2024-06-01' AND '2024-06-30';

-- 💡 Note: BETWEEN is inclusive, so this will include both June 1 and June 30.


-- ❗ Tip: Using DATE(), YEAR(), or other functions for partial matching

-- 🧪 Example 4: Get all logs from March 2024
SELECT log_id, log_time
FROM logs
WHERE MONTH(log_time) = 3 AND YEAR(log_time) = 2024;


-- 🧠 SQL LESSON: COMPARING DATES

-- 🔍 Why Compare Dates?
-- In SQL, dates are often stored in DATE, DATETIME, or TIMESTAMP columns.
-- You can use comparison operators (=, >, <, <=, >=, !=, BETWEEN) to filter by date or datetime.

-- ✅ Always wrap date values in single quotes using the format 'YYYY-MM-DD'
-- ✅ For full datetime comparisons, use 'YYYY-MM-DD HH:MM:SS'

-- 📄 Syntax Examples:
-- WHERE order_date = '2024-01-01'
-- WHERE created_at > '2024-01-01 08:00:00'


-- 🧪 Example 1: Get all orders placed on January 1st, 2024
SELECT order_id, customer_name, order_date
FROM orders
WHERE order_date = '2024-01-01';

-- 🧾 Sample Output:
-- +----------+----------------+------------+
-- | order_id | customer_name  | order_date |
-- +----------+----------------+------------+
-- | 1001     | Alice          | 2024-01-01 |
-- | 1002     | David          | 2024-01-01 |
-- +----------+----------------+------------+


-- 🧪 Example 2: Find all events that happened AFTER March 1st, 2024
SELECT event_name, start_time
FROM events
WHERE start_time > '2024-03-01';

-- 🧾 Sample Output:
-- +------------------------+---------------------+
-- | event_name             | start_time          |
-- +------------------------+---------------------+
-- | Spring Conference      | 2024-03-10 09:00:00  |
-- | Tech Expo              | 2024-04-01 13:00:00  |
-- +------------------------+---------------------+


-- 🧪 Example 3: Users who signed up BETWEEN two dates
SELECT username, signup_date
FROM users
WHERE signup_date BETWEEN '2024-06-01' AND '2024-06-30';

-- 💡 Note: BETWEEN is inclusive, so this will include both June 1 and June 30.


-- ❗ Tip: Using DATE(), YEAR(), or other functions for partial matching

-- 🧪 Example 4: Get all logs from March 2024
SELECT log_id, log_time
FROM logs
WHERE MONTH(log_time) = 3 AND YEAR(log_time) = 2024;


-- ⚠️ Be careful: Comparing with NULL dates needs IS NULL
SELECT * FROM tasks WHERE due_date IS NULL;


-- ✅ Summary of Common Operators for Dates:
-- =             -- Exact match
-- != or <>      -- Not equal
-- > or >=       -- After / on or after
-- < or <=       -- Before / on or before
-- BETWEEN       -- Within a range (inclusive)
-- IS NULL       -- No date set

-- END OF LESSON
