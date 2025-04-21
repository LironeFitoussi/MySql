-- 🧠 SQL LESSON: ALTER TABLE – Renaming
--
-- 🧐 What is Renaming?
-- Renaming lets you change the name of a table or a column without dropping and recreating it,
-- preserving all data, constraints, and indexes.

-------------------------------------------------------------------------------
-- 📄 Basic Syntax

-- 1) Rename a table
--   PostgreSQL / SQLite:
--     ALTER TABLE old_table_name RENAME TO new_table_name;
--   MySQL:
--     RENAME TABLE old_table_name TO new_table_name;
--     -- or in MySQL 8.0+: ALTER TABLE old_table_name RENAME TO new_table_name;

-- 2) Rename a column
--   PostgreSQL / SQLite:
--     ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;
--   MySQL:
--     ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;
--     -- or (older MySQL) ALTER TABLE table_name CHANGE old_column_name new_column_name data_type;

-------------------------------------------------------------------------------
-- 🧪 Example 1: Rename a table
-- Rename `companies` to `organizations`
ALTER TABLE companies
  RENAME TO organizations;

-- In MySQL (alternative syntax):
-- RENAME TABLE companies TO organizations;

-------------------------------------------------------------------------------
-- 🧪 Example 2: Rename a column
-- Rename the `phone` column to `contact_phone` in `organizations`
ALTER TABLE organizations
  RENAME COLUMN phone TO contact_phone;

-- In older MySQL versions (before 8.0):
-- ALTER TABLE organizations
--   CHANGE phone contact_phone VARCHAR(20);

-------------------------------------------------------------------------------
-- 🧾 What Happens Behind the Scenes?
-- • All data, indexes, constraints, triggers, and privileges remain intact.
-- • Dependent views, stored procedures, or application code referencing the old name will break.

-------------------------------------------------------------------------------
-- ❌ Common Pitfalls
-- • Forgetting to update application queries, views, stored routines, or ORM mappings.
-- • In some RDBMS, you cannot rename columns involved in certain constraints without dropping/recreating them.
-- • Renaming large tables can acquire locks—plan during low‑traffic windows.

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Search your codebase for the old name and update references (e.g., in joins, selects, model definitions).
-- • For complex schemas, generate a dependency diagram to identify all usages.
-- • Test renaming in a staging environment first to catch broken dependencies.
-- • Use transactional DDL (if supported) to wrap renames for safe rollbacks.

-------------------------------------------------------------------------------
-- ✅ Summary
-- Renaming via ALTER TABLE is a quick way to correct naming mistakes or reflect evolving requirements.
-- Always synchronize schema changes with application code and documentation.

-- END OF LESSON
RENAME TABLE companies to suppliers;


ALTER TABLE suppliers RENAME TO companies;


ALTER TABLE companies
RENAME COLUMN name TO company_name;
