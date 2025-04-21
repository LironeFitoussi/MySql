-- 🧠 SQL LESSON: ALTER TABLE – Dropping Columns

-- 🧐 What is ALTER TABLE … DROP COLUMN?
-- The ALTER TABLE … DROP COLUMN statement removes one or more columns
-- from an existing table, permanently deleting both the column definition
-- and its data.

-- 📄 Basic Syntax (single column)
-- ALTER TABLE table_name
--   DROP COLUMN column_name;

-- 📄 Drop Multiple Columns at Once (PostgreSQL / MySQL 8+ / SQL Server)
-- ALTER TABLE table_name
--   DROP COLUMN col1,
--   DROP COLUMN col2[, ...];

-------------------------------------------------------------------------------
-- 🧪 Example 1: Drop a single column
ALTER TABLE users
  DROP COLUMN middle_name;

-- Removes the `middle_name` column and all its values from `users`.

-------------------------------------------------------------------------------
-- 🧪 Example 2: Drop multiple columns in one statement
ALTER TABLE products
  DROP COLUMN weight_kg,
  DROP COLUMN dimensions;

-- Removes both `weight_kg` and `dimensions` in a single ALTER operation.

-------------------------------------------------------------------------------
-- 🧪 Example 3: Drop a column with dependent objects
-- If a view, index, or constraint depends on the column, you must
-- drop or alter those first. For example:
--
-- DROP INDEX idx_orders_status ON orders;
-- ALTER TABLE orders DROP COLUMN order_status;

-------------------------------------------------------------------------------
-- ❌ Common Pitfalls
-- • Trying to drop a column that doesn’t exist:
--   ERROR:  column "foo" of relation "table_name" does not exist
-- • Columns referenced by constraints, indexes, or views must be removed
--   or updated before dropping.
-- • In some RDBMS (Oracle), you may need to use CASCADE:
--   ALTER TABLE table_name DROP COLUMN column_name CASCADE;

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Always check for dependencies (FKs, indexes, views, triggers) before dropping.
-- • Back up your data/schema or use a transactional DDL if supported:
--     BEGIN;
--       ALTER TABLE … DROP COLUMN …;
--       ROLLBACK;  -- to test without committing
-- • Dropping columns can lock large tables—schedule during maintenance windows.
-- • Use version control for your schema migrations (e.g., in Liquibase, Flyway).

-------------------------------------------------------------------------------
-- ✅ Summary
-- ALTER TABLE … DROP COLUMN is a simple but destructive operation.
-- Plan ahead: verify dependencies, back up data, and consider the impact
-- on application code and queries.

-- END OF LESSON
ALTER TABLE companies DROP COLUMN phone;
