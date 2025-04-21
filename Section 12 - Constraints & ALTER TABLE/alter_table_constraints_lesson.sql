-- 🧠 SQL LESSON: ALTER TABLE – Constraints
--
-- 🧐 What is ALTER TABLE … ADD/DROP CONSTRAINT?
-- Use ALTER TABLE to add or remove table-level constraints (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
-- without recreating the entire table. This lets you evolve your schema safely.

-------------------------------------------------------------------------------
-- 📄 Adding Constraints

-- Basic Syntax:
-- ALTER TABLE table_name
--   ADD CONSTRAINT constraint_name constraint_type (column_list)
--   [REFERENCES ref_table(ref_col_list)];  -- for FOREIGN KEY

-- Examples:

-- 1) Add a PRIMARY KEY to an existing table
ALTER TABLE customers
  ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);

-- 2) Add a UNIQUE constraint
ALTER TABLE users
  ADD CONSTRAINT uq_users_email UNIQUE (email);

-- 3) Add a FOREIGN KEY
ALTER TABLE orders
  ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id);

-- 4) Add a CHECK constraint
ALTER TABLE products
  ADD CONSTRAINT chk_price_positive CHECK (price > 0);

-------------------------------------------------------------------------------
-- 📄 Dropping Constraints

-- Basic Syntax (PostgreSQL, SQL Server):
-- ALTER TABLE table_name
--   DROP CONSTRAINT constraint_name;

-- MySQL:
--   ALTER TABLE table_name DROP FOREIGN KEY fk_name;
--   ALTER TABLE table_name DROP INDEX uq_name;           -- for UNIQUE
--   ALTER TABLE table_name DROP CHECK chk_name;          -- MySQL 8.0+

-- Examples:

-- 1) Drop a PRIMARY KEY (PostgreSQL / SQL Server)
ALTER TABLE customers
  DROP CONSTRAINT pk_customers;

-- 2) Drop a UNIQUE constraint (PostgreSQL / SQL Server)
ALTER TABLE users
  DROP CONSTRAINT uq_users_email;

-- 3) Drop a FOREIGN KEY (PostgreSQL / SQL Server)
ALTER TABLE orders
  DROP CONSTRAINT fk_orders_customer;

-- 4) Drop a CHECK constraint (PostgreSQL / SQL Server)
ALTER TABLE products
  DROP CONSTRAINT chk_price_positive;

-------------------------------------------------------------------------------
-- ❌ Common Pitfalls
-- • Constraint names must match exactly—query information_schema if unsure.
-- • In MySQL, dropping UNIQUE often uses DROP INDEX, not DROP CONSTRAINT.
-- • Removing constraints can break data integrity—ensure application logic is updated.
-- • Some RDBMS require CASCADE when dropping constraints with dependencies.

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Always name constraints explicitly when creating tables to simplify ALTER operations.
-- • Use information_schema.table_constraints to find existing constraint names.
-- • Wrap DDL in transactions if your DB supports it to allow rollbacks on error.
-- • Plan maintenance windows for large tables—adding constraints can lock and rewrite data.

-------------------------------------------------------------------------------
-- ✅ Summary
-- ALTER TABLE … ADD/DROP CONSTRAINT lets you enforce or remove rules dynamically.
-- It’s essential for evolving schema design while preserving data and minimizing downtime.

-- END OF LESSON
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);


ALTER TABLE houses DROP CONSTRAINT positive_pprice;