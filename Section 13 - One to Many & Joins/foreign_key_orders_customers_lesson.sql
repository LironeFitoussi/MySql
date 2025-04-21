-- 🧠 SQL LESSON: FOREIGN KEY Constraint (Orders → Customers)
--
-- 🧐 What is a FOREIGN KEY?
-- A FOREIGN KEY enforces referential integrity between two tables by ensuring
-- that values in the child table correspond to existing values in the parent table.

-------------------------------------------------------------------------------
-- 📄 Basic Syntax (CREATE time)
-- CREATE TABLE child_table (
--   …,
--   parent_id   data_type,
--   CONSTRAINT fk_name
--     FOREIGN KEY (parent_id)
--     REFERENCES parent_table(parent_id)
--     [ON DELETE action]
--     [ON UPDATE action]
-- );

-------------------------------------------------------------------------------
-- 🧪 Example 1: Create Customers and Orders with a simple FK

CREATE TABLE customers (
  customer_id   SERIAL PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  email         VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE orders (
  order_id      SERIAL PRIMARY KEY,
  customer_id   INT NOT NULL,
  order_date    DATE     NOT NULL DEFAULT CURRENT_DATE,
  total_amount  NUMERIC(10,2),
  CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- Now each order.customer_id must match an existing customer.customer_id.

-------------------------------------------------------------------------------
-- 🧪 Example 2: FK with ON DELETE / ON UPDATE actions

CREATE TABLE orders (
  order_id      SERIAL PRIMARY KEY,
  customer_id   INT NOT NULL,
  order_date    DATE     NOT NULL DEFAULT CURRENT_DATE,
  total_amount  NUMERIC(10,2),
  CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
    ON DELETE CASCADE    -- deletes orders if the customer is removed
    ON UPDATE RESTRICT   -- prevents changing customer_id if referenced
);

-------------------------------------------------------------------------------
-- 🧪 Example 3: Adding a FOREIGN KEY to an existing table

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
    ON DELETE SET NULL;  -- sets customer_id to NULL when parent is deleted

-------------------------------------------------------------------------------
-- 🧾 Referential Actions Summary
-- • CASCADE      – propagate delete/update to child rows  
-- • SET NULL     – set foreign key to NULL on delete/update  
-- • SET DEFAULT  – set to column DEFAULT value on delete/update  
-- • RESTRICT     – block delete/update if there are dependent rows  
-- • NO ACTION    – same as RESTRICT in most DBMS  

-------------------------------------------------------------------------------
-- ✅ Tips
-- • Always index your foreign key columns for performance.  
-- • Match data types exactly between parent and child columns.  
-- • Use meaningful constraint names (e.g., fk_orders_customers).  
-- • Choose ON DELETE/UPDATE actions based on your business rules.  
-- • To find existing FKs:  
--     SELECT constraint_name, table_name, column_name  
--       FROM information_schema.key_column_usage  
--      WHERE referenced_table_name = 'customers';

-------------------------------------------------------------------------------
-- ✅ Summary
-- FOREIGN KEYs link tables, enforcing that child rows reference valid parent
-- rows. Use cascade or restrict actions to control how deletes/updates
-- propagate and maintain data integrity.

-- END OF LESSON
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);