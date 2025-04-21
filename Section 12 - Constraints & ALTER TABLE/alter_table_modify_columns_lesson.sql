-- 🧠 SQL LESSON: ALTER TABLE – Modifying Columns
--
-- 🧐 What is Modifying Columns?
-- Modifying columns lets you change an existing column’s definition—such as its data type,
-- nullability, default value, or name—without dropping and recreating the column.

-------------------------------------------------------------------------------
-- 📄 Basic Syntax

-- 1) Change data type
--   PostgreSQL:
--     ALTER TABLE table_name
--       ALTER COLUMN column_name TYPE new_data_type;
--   MySQL:
--     ALTER TABLE table_name
--       MODIFY COLUMN column_name new_data_type;
--   SQL Server:
--     ALTER TABLE table_name
--       ALTER COLUMN column_name new_data_type;

-- 2) Set or drop NOT NULL
--   PostgreSQL:
--     ALTER TABLE table_name
--       ALTER COLUMN column_name SET NOT NULL;
--     ALTER TABLE table_name
--       ALTER COLUMN column_name DROP NOT NULL;
--   MySQL / SQL Server:
--     ALTER TABLE table_name
--       MODIFY COLUMN column_name data_type [NOT NULL | NULL];

-- 3) Change DEFAULT value
--   PostgreSQL:
--     ALTER TABLE table_name
--       ALTER COLUMN column_name SET DEFAULT default_expr;
--     ALTER TABLE table_name
--       ALTER COLUMN column_name DROP DEFAULT;
--   MySQL:
--     ALTER TABLE table_name
--       ALTER COLUMN column_name SET DEFAULT default_expr;
--   SQL Server:
--     -- Must drop existing DEFAULT constraint, then add new one:
--     ALTER TABLE table_name DROP CONSTRAINT df_constraint_name;
--     ALTER TABLE table_name ADD CONSTRAINT df_constraint_name
--       DEFAULT default_expr FOR column_name;

-------------------------------------------------------------------------------
-- 🧪 Example 1: Change data type
ALTER TABLE products
  ALTER COLUMN price TYPE NUMERIC(10,2);

-- In MySQL:
-- ALTER TABLE products
--   MODIFY COLUMN price DECIMAL(10,2);

-------------------------------------------------------------------------------
-- 🧪 Example 2: Make a column NOT NULL and give it a default
-- Step 1: Set a default
ALTER TABLE orders
  ALTER COLUMN order_date SET DEFAULT NOW();
-- Step 2: Fill existing NULLs if any
UPDATE orders SET order_date = NOW() WHERE order_date IS NULL;
-- Step 3: Enforce NOT NULL
ALTER TABLE orders
  ALTER COLUMN order_date SET NOT NULL;

-- MySQL combined:
-- ALTER TABLE orders
--   MODIFY COLUMN order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

-------------------------------------------------------------------------------
-- 🧪 Example 3: Remove a default
ALTER TABLE users
  ALTER COLUMN is_active DROP DEFAULT;

-- MySQL:
-- ALTER TABLE users
--   ALTER COLUMN is_active DROP DEFAULT;

-------------------------------------------------------------------------------
-- 🧪 Example 4: Rename a column while modifying type (MySQL older syntax)
-- ALTER TABLE employees
--   CHANGE COLUMN dept dept_code VARCHAR(10) NOT NULL;

-------------------------------------------------------------------------------
-- ❌ Common Pitfalls
-- • Modifying a column’s type on a large table can lock the table and take time.
-- • Some databases require a non-nullable column be empty or have a default before setting NOT NULL.
-- • SQL Server requires dropping/recreating DEFAULT constraints to change defaults.
-- • Changing a column involved in an index may implicitly rebuild the index—plan accordingly.

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Always back up or test in a staging environment before heavy ALTERs.
-- • For large tables, consider using `ALTER TABLE ... ALTER COLUMN ... USING ...` in PostgreSQL
--   to convert data safely.
-- • When changing types, verify compatibility (e.g., VARCHAR → TEXT vs TEXT → VARCHAR).
-- • Check for dependent objects (views, functions, triggers) that reference the column.
-- • Use a single ALTER TABLE statement when possible to minimize table locks.

-------------------------------------------------------------------------------
-- ✅ Summary
-- ALTER TABLE modifications keep your schema flexible—allowing you to evolve data types,
-- nullability, defaults, and more—while preserving existing data and relationships.

-- END OF LESSON
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);