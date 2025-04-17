-- 1. Convert a string to uppercase
SELECT UPPER('hello') AS uppercased_string;
-- Expected Output: 'HELLO'

-- 2. Convert a string to lowercase
SELECT LOWER('HELLO') AS lowercased_string;
-- Expected Output: 'hello'

-- 3. Convert column values to uppercase and lowercase
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO example_table (name)
VALUES ('Alice'), ('Bob'), ('Charlie');

SELECT 
    name, 
    UPPER(name) AS uppercased_name, 
    LOWER(name) AS lowercased_name 
FROM example_table;
-- Expected Output:
-- name      | uppercased_name | lowercased_name
-- ----------|-----------------|----------------
-- Alice     | ALICE           | alice
-- Bob       | BOB             | bob
-- Charlie   | CHARLIE         | charlie

-- 4. Combine UPPER and LOWER with CONCAT
SELECT CONCAT(UPPER('abc'), LOWER('DEF')) AS combined_case;
-- Expected Output: 'ABCdef'

-- 5. Handle NULL values
SELECT UPPER(NULL) AS uppercased_null, LOWER(NULL) AS lowercased_null;
-- Expected Output:
-- uppercased_null | lowercased_null
-- ----------------|----------------
-- NULL            | NULL

-- Cleanup
DROP TABLE example_table;