-- Example 1: Find names starting with 'A'
SELECT * 
FROM employees
WHERE name LIKE 'A%';

-- Output: 
-- Returns all employees whose names start with the letter 'A'.

-- Example 2: Find names ending with 'son'
SELECT * 
FROM employees
WHERE name LIKE '%son';

-- Output: 
-- Returns all employees whose names end with 'son'.

-- Example 3: Find names containing 'ar'
SELECT * 
FROM employees
WHERE name LIKE '%ar%';

-- Output: 
-- Returns all employees whose names contain the substring 'ar'.

-- Example 4: Find names with exactly 5 characters
SELECT * 
FROM employees
WHERE name LIKE '_____';

-- Output: 
-- Returns all employees whose names are exactly 5 characters long.

-- Example 5: Find names starting with 'J' and second letter is 'o'
SELECT * 
FROM employees
WHERE name LIKE 'Jo%';

-- Output: 
-- Returns all employees whose names start with 'Jo'.

-- Example 6: Find names with any single character between 'A' and 'nna'
SELECT * 
FROM employees
WHERE name LIKE 'A_nna';

-- Output: 
-- Returns all employees whose names have a single character between 'A' and 'nna'.

-- Wildcards: Seraching for a bokk with a "%" in it:
SELECT * 
FROM books
WHERE title LIKE '%\%%';

-- Output:
-- Returns all books whose titles contain the '%' character.