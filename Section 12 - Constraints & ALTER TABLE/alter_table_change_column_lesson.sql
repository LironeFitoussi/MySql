-- 🧠 SQL LESSON: ALTER TABLE – CHANGE Column (MySQL)
--
-- 🧐 What is CHANGE?
-- In MySQL, the CHANGE clause lets you **rename a column**, **modify its data type or attributes**, 
-- and **reposition it** in a single statement. Unlike MODIFY, CHANGE requires you to re-specify 
-- the full column definition.

-------------------------------------------------------------------------------
-- 📄 Basic Syntax
-- ALTER TABLE table_name
--   CHANGE [COLUMN] old_column_name new_column_name column_definition
--     [FIRST | AFTER existing_column];

-------------------------------------------------------------------------------
-- 🧪 Example 1: Rename a column and change type
ALTER TABLE users
  CHANGE COLUMN username user_name VARCHAR(100) NOT NULL;

-- • Renames `username` → `user_name`
-- • Changes type to VARCHAR(100) and sets NOT NULL
-- • If NULL/DEFAULT rules differ from the old column, you must include them here.

-------------------------------------------------------------------------------
-- 🧪 Example 2: Reposition a column
ALTER TABLE products
  CHANGE COLUMN price unit_price DECIMAL(10,2) NOT NULL AFTER name;

-- • Renames `price` → `unit_price`
-- • Keeps DECIMAL(10,2) NOT NULL
-- • Moves `unit_price` to be immediately after the `name` column.

-------------------------------------------------------------------------------
-- 🧪 Example 3: Change without renaming (just modify definition)
ALTER TABLE orders
  CHANGE COLUMN order_date order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- • Keeps the same name (`order_date`)
-- • Alters NULL‑ability and adds a DEFAULT

-------------------------------------------------------------------------------
-- ❌ Common Pitfalls
-- • You **must** supply the complete column definition (type, nullability, default, collation, etc.).
-- • Omitting any attribute (e.g. NOT NULL) will reset it to the default for that type.
-- • If you only need to change the type or attributes but not the name, you can either:
--     – Use CHANGE with the same name on both sides, or
--     – Use MODIFY COLUMN (which doesn’t allow renaming but avoids full definition in some cases).

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Use CHANGE when you need to **both** rename and redefine a column.
-- • Use MODIFY when you only need to change the data type or attributes and want to keep the name.
-- • Always back up or test on a staging environment—ALTERs on large tables can be slow and locking.
-- • Check for foreign keys or indexes referencing the column; you may need to drop/recreate them.

-------------------------------------------------------------------------------
-- ✅ Summary
-- MySQL’s ALTER TABLE … CHANGE lets you handle renames, type changes, and column order in one go.
-- Remember to restate the full column definition to avoid unintended resets.

-- END OF LESSON
