-- Example 1: COUNT all rows in a table
SELECT COUNT(*) AS TotalRows
FROM employees;

-- Example 2: COUNT non-NULL values in a specific column
SELECT COUNT(department_id) AS NonNullDepartments
FROM employees;

-- Example 3: COUNT with a WHERE clause
SELECT COUNT(*) AS ActiveEmployees
FROM employees
WHERE status = 'Active';

-- Example 4: COUNT distinct values in a column
SELECT COUNT(DISTINCT department_id) AS UniqueDepartments
FROM employees;

-- Example 5: COUNT combined with GROUP BY
SELECT department_id, COUNT(*) AS EmployeesPerDepartment
FROM employees
GROUP BY department_id;

-- Example 6: COUNT with HAVING clause
SELECT department_id, COUNT(*) AS EmployeesPerDepartment
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- Example 7: COUNT with JOIN
SELECT d.department_name, COUNT(e.employee_id) AS TotalEmployees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;



-----------------------------

SELECT COUNT(*) FROM books;
SELECT COUNT(author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';