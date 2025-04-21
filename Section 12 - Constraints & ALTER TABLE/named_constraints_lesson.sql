-- 🧠 SQL LESSON: Named Constraints

-- 🧐 What are Named Constraints?
-- Named constraints allow you to give a custom name to a constraint (like UNIQUE, CHECK, PRIMARY KEY),
-- making it easier to identify and manage later — especially when debugging errors or altering constraints.

-- 📄 Basic Syntax (Inline or Table-Level)
-- CREATE TABLE table_name (
--   column_name data_type,
--   CONSTRAINT constraint_name constraint_type (column_name)
-- );

-- ✅ Constraint types that can be named:
--   - PRIMARY KEY
--   - FOREIGN KEY
--   - UNIQUE
--   - CHECK

-------------------------------------------------------------------------------
-- 🧪 Example 1: Named UNIQUE constraint
CREATE TABLE users (
  user_id   SERIAL PRIMARY KEY,
  email     VARCHAR(100),
  CONSTRAINT uq_user_email UNIQUE (email) -- ← Named UNIQUE constraint
);

-- ❌ Duplicate email will trigger:
-- ERROR: duplicate key value violates unique constraint "uq_user_email"

-------------------------------------------------------------------------------
-- 🧪 Example 2: Named CHECK constraint
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  salary      INT,
  CONSTRAINT chk_salary_min CHECK (salary > 0) -- ← Named CHECK constraint
);

-- ❌ Inserting salary = 0 will trigger:
-- ERROR: new row violates check constraint "chk_salary_min"

-------------------------------------------------------------------------------
-- 🧪 Example 3: Named FOREIGN KEY constraint
CREATE TABLE orders (
  order_id    SERIAL PRIMARY KEY,
  customer_id INT,
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Makes error messages and constraint management easier in ALTER/DROP operations

-------------------------------------------------------------------------------
-- ✅ Benefits of Naming Constraints:
-- • Easier to understand error messages
-- • More control over ALTER TABLE / DROP CONSTRAINT
-- • Enhances maintainability in complex schemas

-------------------------------------------------------------------------------
-- 🛠️ How to Drop a Named Constraint:
-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;

-- 🧪 Example:
-- ALTER TABLE employees DROP CONSTRAINT chk_salary_min;

-------------------------------------------------------------------------------
-- ✅ Summary:
-- Named constraints are like labeled rules — they give your database structure clarity and manageability.
-- Always name important constraints for better debugging and future-proofing.

-- END OF LESSON


CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);