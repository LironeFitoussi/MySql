-- Lesson: ON DELETE CASCADE in SQL
-- This lesson demonstrates how to automatically remove dependent rows
-- when a referenced parent row is deleted, ensuring referential integrity.

-- Example Schema Setup
CREATE TABLE departments (
    dept_id    INT PRIMARY KEY,
    dept_name  VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    dept_id    INT,
    name       VARCHAR(100),
    salary     DECIMAL(10,2),
    -- Define foreign key with ON DELETE CASCADE
    CONSTRAINT fk_dept
      FOREIGN KEY (dept_id)
      REFERENCES departments(dept_id)
      ON DELETE CASCADE
);

-- Populate sample data
INSERT INTO departments (dept_id, dept_name) VALUES
    (1, 'HR'),
    (2, 'Engineering');

INSERT INTO employees (emp_id, dept_id, name, salary) VALUES
    (101, 1, 'Alice',  60000),
    (102, 1, 'Bob',    55000),
    (201, 2, 'Carol',  75000),
    (202, 2, 'David',  80000);

-- Example 1: Delete a department
-- This will remove department 1 and its employees (101,102)
DELETE FROM departments
WHERE dept_id = 1;

-- Verify remaining employees
SELECT * FROM employees;
-- Expected: only emp_id 201 and 202 remain

-- Example 2: Prevent orphan rows without CASCADE
-- (Recreate tables without ON DELETE CASCADE)
CREATE TABLE teams (
    team_id    INT PRIMARY KEY,
    team_name  VARCHAR(100)
);

CREATE TABLE players (
    player_id  INT PRIMARY KEY,
    team_id    INT,
    name       VARCHAR(100),
    CONSTRAINT fk_team
      FOREIGN KEY (team_id)
      REFERENCES teams(team_id)
      -- No cascade: default is RESTRICT/NO ACTION
);

-- Tips:
-- 1. ON DELETE CASCADE is useful for parent-child relationships (e.g., orders → order_items).
-- 2. Use with caution: deleting a parent removes all children automatically.
-- 3. Some dialects (e.g., SQLite) require foreign_keys pragma to enable cascades.

-- Common Pitfalls:
-- • Unintended data loss when cascading through multiple levels of relationships.
-- • Circular cascade rules can cause errors or undefined behavior.
-- • Forgetting to define ON DELETE for newly added foreign keys (use ALTER TABLE to modify).

-- Summary:
-- ON DELETE CASCADE enforces automatic cleanup of dependent rows when a parent is deleted,
-- simplifying maintenance of referential integrity.

-- Suggested file name:
-- on_delete_cascade_lesson.sql

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);