-- 🧠 SQL LESSON: NOT LIKE

-- 🔍 What is NOT LIKE?
-- The NOT LIKE operator is used in SQL to exclude rows that match a pattern.
-- It's the opposite of the LIKE operator and is commonly used with wildcards:
--   % for any number of characters
--   _ for a single character

-- 📄 Syntax:
-- WHERE column_name NOT LIKE 'pattern'

-- ✅ This condition returns TRUE for values that do NOT match the pattern.


-- 🧪 Example 1: Find all customers whose name does NOT start with 'A'
SELECT customer_name
FROM customers
WHERE customer_name NOT LIKE 'A%';

-- 🧾 Sample Output:
-- +------------------+
-- | customer_name    |
-- +------------------+
-- | Ben Hardy        |
-- | Clara Johnson    |
-- | Mike Anderson    |
-- +------------------+


-- 🧪 Example 2: Get all products that do NOT end with 'Pro'
SELECT product_name
FROM products
WHERE product_name NOT LIKE '%Pro';

-- 🧾 Sample Output:
-- +----------------------+
-- | product_name         |
-- +----------------------+
-- | Basic Laptop         |
-- | UltraTablet          |
-- | SmartWatch 2         |
-- +----------------------+


-- 🧪 Example 3: Find all emails that are NOT from Gmail
SELECT email
FROM users
WHERE email NOT LIKE '%@gmail.com';

-- 🧾 Sample Output:
-- +------------------------+
-- | email                  |
-- +------------------------+
-- | john@example.com       |
-- | emma@yahoo.com         |
-- | dev@company.org        |
-- +------------------------+


-- 💡 Real-World Use Cases and Tips:
-- - Use NOT LIKE to filter out patterns such as:
--     - unwanted domains (e.g. NOT LIKE '%@spam.com')
--     - specific naming patterns (e.g. NOT LIKE 'test_%')
-- - Combine with AND/OR for advanced filters
-- - Remember: NOT LIKE is case-insensitive in some databases (e.g., MySQL by default)
-- - To perform a case-sensitive NOT LIKE, use `BINARY` in MySQL:
--     WHERE BINARY column_name NOT LIKE 'pattern'

-- ✅ Reminder about wildcards:
--   % = any sequence of characters (including none)
--   _ = any single character

-- END OF LESSON
