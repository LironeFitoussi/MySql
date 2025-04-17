-- TRIM function examples
-- Remove leading and trailing spaces from a string
SELECT TRIM('   Hello World   ') AS Result;
-- Expected: 'Hello World'

-- Remove specific characters from both ends of a string
SELECT TRIM(BOTH 'x' FROM 'xxxHello Worldxxx') AS Result;
-- Expected: 'Hello World'

-- Remove leading spaces from a string
SELECT LTRIM('   Hello World') AS Result;
-- Expected: 'Hello World'

-- Remove trailing spaces from a string
SELECT RTRIM('Hello World   ') AS Result;
-- Expected: 'Hello World'

-- TRIM with column values
CREATE TABLE ExampleTable (
    ID INT,
    TextColumn VARCHAR(100)
);

INSERT INTO ExampleTable (ID, TextColumn)
VALUES (1, '   apple pie   '), (2, '   cherry tart'), (3, 'banana cake   ');

-- Remove leading and trailing spaces from TextColumn
SELECT ID, TRIM(TextColumn) AS TrimmedText
FROM ExampleTable;
-- Expected: 'apple pie', 'cherry tart', 'banana cake'

-- Remove specific characters from TextColumn
SELECT ID, TRIM(BOTH 'e' FROM TextColumn) AS TrimmedText
FROM ExampleTable;
-- Example: Removes 'e' from both ends of the string

-- Clean up
DROP TABLE ExampleTable;