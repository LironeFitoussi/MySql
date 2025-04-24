-- Lesson: LEFT JOIN with GROUP BY in SQL
-- This lesson demonstrates how to combine tables with LEFT JOIN
-- and aggregate results, including unmatched rows from the left table.

-- Example Schema Setup
CREATE TABLE departments (
    dept_id    INT PRIMARY KEY,
    dept_name  VARCHAR(100)
);

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    dept_id    INT,
    salary     DECIMAL(10,2),
    CHECK (salary >= 0)
);

-- Sample data
INSERT INTO departments (dept_id, dept_name) VALUES
    (10, 'Sales'),
    (20, 'Engineering'),
    (30, 'HR');

INSERT INTO employees (emp_id, dept_id, salary) VALUES
    (1, 10, 55000),
    (2, 10, 60000),
    (3, 20, 75000),
    (4, 20, 80000),
    (5, NULL, 40000);  -- Employee without a department

-- Example 1: Total salary per department (include empty depts)
SELECT
    d.dept_name,
    SUM(e.salary)    AS total_salary,
    COUNT(e.emp_id)  AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
    ON d.dept_id = e.dept_id
GROUP BY
    d.dept_name;

-- Example 2: Average salary, only for departments with at least 2 employees
SELECT
    d.dept_name,
    AVG(e.salary) AS avg_salary,
    COUNT(e.emp_id) AS emp_count
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY
    d.dept_name
HAVING
    COUNT(e.emp_id) >= 2;

-- Tips:
-- 1. GROUP BY must include all non-aggregated columns (here d.dept_name).
-- 2. LEFT JOIN preserves departments with no employees (NULLs included).
-- 3. Use IS NULL on aggregates to detect zero-sum groups if needed.

-- Common Pitfalls:
-- • Applying WHERE e.salary > X filters out NULLs, effectively converting to INNER JOIN.
-- • Forgetting HAVING for filtering groups after aggregation.
-- • Joining on mismatched data types may prevent correct grouping.

-- Summary:
-- LEFT JOIN with GROUP BY provides aggregated metrics per category,
-- while retaining rows from the primary (left) table even when no matches.

-- Suggested file name:
-- left_join_group_by_lesson.sql
SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS money_spent
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;