-- 🧠 SQL LESSON: IS NULL Operator

-- 🤔 What is IS NULL?
-- In SQL, NULL represents **missing or unknown values**.
-- You can't compare NULL using = or != — instead, you use IS NULL or IS NOT NULL.

-- ✅ Remember:
-- Use `IS NULL` to check for missing values.
-- Use `IS NOT NULL` to find rows where the value **exists**.

-- 📄 Syntax:
-- WHERE column_name IS NULL
-- WHERE column_name IS NOT NULL

-- 🧪 Example 1: Find tasks without a due date
SELECT task_id, task_name, due_date
FROM tasks
WHERE due_date IS NULL;

-- 🧾 Sample Output:
-- +---------+---------------------+----------+
-- | task_id | task_name           | due_date |
-- +---------+---------------------+----------+
-- | 301     | Fix login issue     | NULL     |
-- | 305     | Update documentation| NULL     |
-- +---------+---------------------+----------+

-- 🧪 Example 2: Show users who have entered their phone number
SELECT user_id, username, phone_number
FROM users
WHERE phone_number IS NOT NULL;

-- 🧾 Sample Output:
-- +---------+----------+---------------+
-- | user_id | username | phone_number  |
-- +---------+----------+---------------+
-- | 101     | Alice    | 555-1234      |
-- | 102     | David    | 555-9876      |
-- +---------+----------+---------------+

-- 🧪 Example 3: Use CASE to show status based on NULL values
SELECT student_id, name, grade,
  CASE
    WHEN grade IS NULL THEN 'Not Graded'
    ELSE 'Graded'
  END AS status
FROM grades;

-- 🧾 Sample Output:
-- +------------+----------+-------+-------------+
-- | student_id | name     | grade | status      |
-- +------------+----------+-------+-------------+
-- | 501        | Emma     | 87    | Graded      |
-- | 502        | Noah     | NULL  | Not Graded  |
-- +------------+----------+-------+-------------+

-- ✅ Tips:
-- NULL is **not equal to anything**, not even another NULL.
-- Always use `IS NULL` or `IS NOT NULL`, never `= NULL`.

-- ❗ Avoid this mistake:
-- WHERE email = NULL    ❌ (Wrong!)
-- WHERE email IS NULL   ✅ (Correct!)

-- END OF LESSON
