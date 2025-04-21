-- 🧠 SQL LESSON: ALTER TABLE – Adding Columns

-- 🧐 What is ALTER TABLE … ADD COLUMN?
-- The ALTER TABLE statement modifies an existing table’s structure.
-- Use ADD COLUMN to introduce one or more new columns to the table.

-- 📄 Basic Syntax
-- ALTER TABLE table_name
--   ADD COLUMN column_name data_type [column_constraints];

-- 📄 Add Multiple Columns at Once (PostgreSQL / MySQL 8+)
-- ALTER TABLE table_name
--   ADD COLUMN col1 data_type [constraints],
--   ADD COLUMN col2 data_type [constraints],
--   ...;

-------------------------------------------------------------------------------
-- 🧪 Example 1: Add a simple column
ALTER TABLE users
  ADD COLUMN last_login TIMESTAMP;

-- Now the `users` table has a new `last_login` column (nullable by default).

-------------------------------------------------------------------------------
-- 🧪 Example 2: Add a column with NOT NULL and DEFAULT
ALTER TABLE orders
  ADD COLUMN order_status VARCHAR(20) NOT NULL DEFAULT 'pending';

-- Ensures every existing and future row has a non-null status.

-------------------------------------------------------------------------------
-- 🧪 Example 3: Add multiple columns in one statement
ALTER TABLE products
  ADD COLUMN weight_kg  DECIMAL(6,2) CHECK (weight_kg > 0),
  ADD COLUMN dimensions TEXT,
  ADD COLUMN discontinued BOOLEAN NOT NULL DEFAULT FALSE;

-------------------------------------------------------------------------------
-- 🧪 Example 4: Add a column with a FOREIGN KEY constraint
ALTER TABLE order_items
  ADD COLUMN product_id INT,
  ADD CONSTRAINT fk_order_items_product
    FOREIGN KEY (product_id) REFERENCES products(product_id);

-------------------------------------------------------------------------------
-- ❌ Common Pitfall: Adding NOT NULL without DEFAULT
-- If you try to add a NOT NULL column without a DEFAULT to a non-empty table:
--   ALTER TABLE example ADD COLUMN new_col INT NOT NULL;
-- You’ll get:
--   ERROR:  column "new_col" contains null values
-- Solution: either allow NULL, supply a DEFAULT, or add the column nullable then backfill.

-------------------------------------------------------------------------------
-- ✅ Tips
-- • When adding NOT NULL columns to populated tables, always provide a DEFAULT or:
--     1. Add the column nullable.
--     2. UPDATE existing rows with a valid value.
--     3. ALTER the column to NOT NULL.
-- • Use single ALTER TABLE with multiple ADDs to minimize table rewrites.
-- • Adding columns with constraints may lock the table—plan for maintenance windows.
-- • Check your RDBMS docs: syntax for multiple ADDs varies (e.g., some MySQL versions require separate statements).

-------------------------------------------------------------------------------
-- ✅ Summary
-- ALTER TABLE … ADD COLUMN is the go‑to for evolving your schema.
-- Use it thoughtfully: consider defaults, nullability, and performance impacts on large tables.

-- END OF LESSON


ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;