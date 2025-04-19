-- 🧠 SQL LESSON: LOGICAL OR

-- 🔍 What is the OR Operator?
-- The `OR` operator allows you to check multiple conditions in a SQL query.
-- A row will be returned if **at least one** of the conditions is TRUE.

-- 📄 Syntax:
-- WHERE condition1 OR condition2

-- ✅ Use `OR` when you want to match any of several conditions.


-- 🧪 Example 1: Get all books released before 2000 OR with fewer than 200 pages
SELECT title, released_year, pages
FROM books
WHERE released_year < 2000 OR pages < 200;

-- 🧾 Sample Output:
-- +------------------------+---------------+--------+
-- | title                  | released_year | pages  |
-- +------------------------+---------------+--------+
-- | The Old Man and the Sea| 1952          | 127    |
-- | Animal Farm            | 1945          | 112    |
-- | The Giver              | 1993          | 180    |
-- +------------------------+---------------+--------+


-- 🧪 Example 2: Find employees in 'HR' OR with salary under 3000
SELECT name, department, salary
FROM employees
WHERE department = 'HR' OR salary < 3000;

-- 🧾 Sample Output:
-- +--------+-------------+--------+
-- | name   | department  | salary |
-- +--------+-------------+--------+
-- | Bob    | HR          | 2800   |
-- | Maria  | HR          | 4500   |
-- | Tom    | Sales       | 2500   |
-- +--------+-------------+--------+


-- 💡 Real-World Use Cases and Tips:
-- - Use `OR` to broaden your query results.
-- - Ideal for matching multiple acceptable values or alternatives.
-- - Combine `OR` with `AND` using parentheses to avoid logic mistakes.

-- 🧪 Bonus Example: Students who scored below 60 OR above 90
SELECT student_name, final_score
FROM students
WHERE final_score < 60 OR final_score > 90;

-- END OF LESSON
