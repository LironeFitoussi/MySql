-- 🧠 SQL LESSON: UNIQUE Constraint
--
-- 🧐 What is UNIQUE?
-- The UNIQUE constraint guarantees that a column (or a set of columns) contains
-- only **distinct, non‑duplicate** values.  Any attempt to insert or update
-- rows that would create a duplicate value triggers an error.

-- 📄 Basic Syntax (defined at CREATE time)
-- CREATE TABLE table_name (
--   column_name data_type UNIQUE,
--   ...
-- );

-- 📄 Basic Syntax (adding later)
-- ALTER TABLE table_name
--   ADD CONSTRAINT constraint_name UNIQUE (column_name[, column_name2 ...]);

-------------------------------------------------------------------------------
-- 🧪 Example 1: Prevent duplicate emails in a users table
CREATE TABLE users (
  user_id   SERIAL PRIMARY KEY,
  username  VARCHAR(50),
  email     VARCHAR(100) UNIQUE      -- ← UNIQUE constraint here
);

-- 🔁 Test It
INSERT INTO users (username, email)
VALUES ('Alice', 'alice@example.com'),
       ('Bob',   'bob@example.com');

-- ❌ This will fail because the email already exists
-- INSERT INTO users (username, email)
-- VALUES ('Charlie', 'alice@example.com');
--
-- ERROR:  duplicate key value violates unique constraint "users_email_key"

-------------------------------------------------------------------------------
-- 🧪 Example 2: Add a composite UNIQUE constraint (combination must be unique)
ALTER TABLE orders
  ADD CONSTRAINT uq_customer_order UNIQUE (customer_id, order_date);

-- Now a customer can place only one order per day; a second order the same day
-- triggers a duplicate‑key error.

-------------------------------------------------------------------------------
-- 🧾 Expected Error Message Format (PostgreSQL)
-- ERROR:  duplicate key value violates unique constraint "<constraint_name>"
-- DETAIL: Key (<column_list>)=(<value_list>) already exists.

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Use UNIQUE to enforce business rules (e.g., unique usernames, SKUs,
--   composite constraints like one booking per seat per flight).
-- • UNIQUE columns are automatically indexed in most databases—no need to add
--   a separate index unless you have special performance needs.
-- • NULL handling differs by DBMS:
--     – PostgreSQL: multiple NULLs allowed (NULLs are not equal).
--     – MySQL / SQL Server: one NULL allowed per UNIQUE column by default.
--   Check your engine’s behavior when NULL values are possible.
-- • Give explicit names to UNIQUE constraints (`CONSTRAINT uq_name …`) so
--   error messages are clearer and maintenance is easier.

-------------------------------------------------------------------------------
-- ✅ Summary
-- UNIQUE enforces **no duplicates**, protecting data integrity at the
-- database level. Use it whenever a column—or combination of columns—must
-- stay distinct across the entire table.

-- END OF LESSON


CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');