-- 1. Reverse a string
SELECT REVERSE('hello') AS reversed_string;
-- Expected Output: 'olleh'

-- 2. Reverse a numeric value (treated as a string)
SELECT REVERSE(12345) AS reversed_number;
-- Expected Output: '54321'

-- 3. Reverse a column value
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO example_table (name)
VALUES ('Alice'), ('Bob'), ('Charlie');

SELECT name, REVERSE(name) AS reversed_name FROM example_table;
-- Expected Output:
-- name      | reversed_name
-- ----------|--------------
-- Alice     | ecilA
-- Bob       | boB
-- Charlie   | eilrahC

-- 4. Reverse and concatenate
SELECT CONCAT(REVERSE('abc'), REVERSE('123')) AS reversed_concat;
-- Expected Output: 'cba321'

-- 5. Reverse with NULL handling
SELECT REVERSE(NULL) AS reversed_null;
-- Expected Output: NULL

-- Cleanup
DROP TABLE example_table;