-- 🧠 SQL LESSON: LESS THAN OR EQUAL TO

-- 🔍 What is LESS THAN OR EQUAL TO?
-- The LESS THAN OR EQUAL TO operator (`<=`) is used to compare two values.
-- It returns TRUE when the value on the left is either less than or exactly equal to the one on the right.

-- 📄 Syntax:
-- WHERE column_name <= value

-- ✅ Use this in WHERE clauses to filter values that are below or equal to a given limit.


-- 🧪 Example 1: Find all products priced at 30 or less
SELECT product_name, price
FROM products
WHERE price <= 30;

-- 🧾 Sample Output:
-- +-------------------+--------+
-- | product_name      | price  |
-- +-------------------+--------+
-- | USB Cable         | 9.99   |
-- | Notebook          | 12.50  |
-- | Pen Set           | 25.00  |
-- +-------------------+--------+


-- 🧪 Example 2: Get all students who scored 70 or below on the final exam
SELECT student_name, final_score
FROM students
WHERE final_score <= 70;

-- 🧾 Sample Output:
-- +--------------+--------------+
-- | student_name | final_score  |
-- +--------------+--------------+
-- | Bob          | 68           |
-- | Sarah        | 65           |
-- | Tom          | 70           |
-- +--------------+--------------+


-- 💡 Real-World Use Cases and Tips:
-- - Use `<=` for filtering "at most" values (e.g., maximum budget, youngest allowed age).
-- - Helpful in eligibility filters like "under 18" or "orders below $100".
-- - Can be combined with other conditions using `AND` or `OR`.

-- 🧪 Bonus Example: Employees in 'Sales' earning 3000 or less
SELECT name, department, salary
FROM employees
WHERE department = 'Sales' AND salary <= 3000;

-- END OF LESSON
