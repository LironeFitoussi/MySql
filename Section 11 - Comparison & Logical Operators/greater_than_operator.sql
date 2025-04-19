-- 🧠 SQL LESSON: GREATER THAN

-- 🔍 What is GREATER THAN?
-- The GREATER THAN operator (`>`) is used in SQL to compare two values.
-- It returns TRUE when the value on the left is strictly larger than the one on the right.

-- 📄 Syntax:
-- WHERE column_name > value

-- ✅ Use it in WHERE clauses to filter values that are larger than a given threshold.


-- 🧪 Example 1: Find all products with a price GREATER THAN 50
SELECT product_name, price
FROM products
WHERE price > 50;

-- 🧾 Sample Output:
-- +-------------------+--------+
-- | product_name      | price  |
-- +-------------------+--------+
-- | Wireless Mouse    | 59.99  |
-- | Mechanical Keyboard | 120  |
-- | Laptop Stand      | 75     |
-- +-------------------+--------+


-- 🧪 Example 2: Get all students who scored more than 80 on the final exam
SELECT student_name, final_score
FROM students
WHERE final_score > 80;

-- 🧾 Sample Output:
-- +--------------+--------------+
-- | student_name | final_score  |
-- +--------------+--------------+
-- | Alice        | 85           |
-- | David        | 90           |
-- +--------------+--------------+


-- 💡 Real-World Use Cases and Tips:
-- - Use `>` for filtering results above a certain threshold (e.g., age, salary, score).
-- - Combine it with `ORDER BY` to sort high scorers or top-selling items.
-- - You can chain conditions using `AND` or `OR` for advanced filtering.

-- 🧪 Bonus Example: Employees with salary > 5000 AND in 'Engineering'
SELECT name, salary, department
FROM employees
WHERE salary > 5000 AND department = 'Engineering';

-- END OF LESSON
