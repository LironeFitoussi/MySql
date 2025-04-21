-- 🧠 SQL LESSON: CHECK Constraint

-- 🧐 What is CHECK?
-- The CHECK constraint enforces a rule that **must be true** for values inserted or updated in a column.
-- It’s used to validate data against custom conditions and maintain data integrity.

-- 📄 Basic Syntax (defined at CREATE time)
-- CREATE TABLE table_name (
--   column_name data_type CHECK (condition)
-- );

-- 📄 Basic Syntax (adding later)
-- ALTER TABLE table_name
--   ADD CONSTRAINT constraint_name CHECK (condition);

-------------------------------------------------------------------------------
-- 🧪 Example 1: Enforce valid age values
CREATE TABLE members (
  member_id  SERIAL PRIMARY KEY,
  name       VARCHAR(50),
  age        INT CHECK (age >= 0 AND age <= 120) -- ← Only allows realistic age
);

-- 🔁 Test It
INSERT INTO members (name, age) VALUES ('Sarah', 35);   -- ✅ OK
-- INSERT INTO members (name, age) VALUES ('Bob', -5);  -- ❌ Will fail

-- 💥 Error Message:
-- ERROR:  new row for relation "members" violates check constraint "members_age_check"
-- DETAIL:  Failing row contains (2, Bob, -5).

-------------------------------------------------------------------------------
-- 🧪 Example 2: Add a CHECK constraint to enforce a salary range
ALTER TABLE employees
  ADD CONSTRAINT chk_salary_range CHECK (salary BETWEEN 3000 AND 20000);

-- Ensures that salary values stay within the specified range.

-------------------------------------------------------------------------------
-- 🧪 Example 3: Use CHECK with ENUM-like logic
CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  name       VARCHAR(100),
  status     VARCHAR(20) CHECK (status IN ('active', 'inactive', 'archived'))
);

-- This acts like a manual ENUM — any other value will trigger a constraint error.

-------------------------------------------------------------------------------
-- ✅ Tips:
-- • Use CHECK for business rules like:
--   – Valid numeric ranges (age, salary)
--   – Allowed value sets (status IN ...)
--   – Logical relationships (start_date < end_date)
-- • Constraints can use multiple columns if needed:
--     CHECK (start_date < end_date)
-- • Not all databases support CHECK constraints equally:
--     – Fully supported in PostgreSQL, Oracle, SQL Server
--     – MySQL supports it, but older versions ignored them

-------------------------------------------------------------------------------
-- ✅ Summary:
-- CHECK lets you **guard your data** by enforcing conditions.
-- It's a powerful tool for keeping your database clean and accurate.

-- END OF LESSON


CREATE TABLE users (
	username VARCHAR(50) NOT NULL,
    age INT CHECK (age > 18)
);
 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
)

INSERT INTO users (username, age)
VALUES ("LOLO", 19);

INSERT INTO palindromes (word)
VALUES ("NATAN");