-- Example 1: Ordering by a single column in ascending order
SELECT first_name, last_name, age
FROM employees
ORDER BY age;

-- Output:
-- first_name | last_name | age
-- ----------------------------
-- Alice      | Johnson   | 25
-- Bob        | Smith     | 30
-- Charlie    | Brown     | 35

-- Example 2: Ordering by a single column in descending order
SELECT first_name, last_name, age
FROM employees
ORDER BY age DESC;

-- Output:
-- first_name | last_name | age
-- ----------------------------
-- Charlie    | Brown     | 35
-- Bob        | Smith     | 30
-- Alice      | Johnson   | 25

-- Example 3: Ordering by multiple columns
SELECT first_name, last_name, age
FROM employees
ORDER BY last_name ASC, first_name ASC;

-- Output:
-- first_name | last_name | age
-- ----------------------------
-- Charlie    | Brown     | 35
-- Alice      | Johnson   | 25
-- Bob        | Smith     | 30

-- Example 4: Ordering by a calculated column
SELECT first_name, last_name, salary, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- Output:
-- first_name | last_name | salary | annual_salary
-- -----------------------------------------------
-- Bob        | Smith     | 5000   | 60000
-- Alice      | Johnson   | 4000   | 48000
-- Charlie    | Brown     | 3000   | 36000