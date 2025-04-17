-- Replace a specific substring in a string
SELECT REPLACE('Hello World', 'World', 'SQL') AS Result;
-- Expected: Hello SQL

-- Replace all occurrences of a character in a string
SELECT REPLACE('123-456-789', '-', '/') AS Result;
-- Expected: 123/456/789


-- Replace a substring in a column value
CREATE TABLE ExampleTable (
    ID INT,
    TextColumn VARCHAR(100)
);

INSERT INTO ExampleTable (ID, TextColumn)
VALUES (1, 'apple pie'), (2, 'apple tart'), (3, 'banana pie');

-- Replace 'apple' with 'cherry' in TextColumn
SELECT ID, REPLACE(TextColumn, 'apple', 'cherry') AS UpdatedText
FROM ExampleTable;
-- Expected: cherry pie, cherry tart, banana pie

-- Update a column in a table using REPLACE
UPDATE ExampleTable
SET TextColumn = REPLACE(TextColumn, 'pie', 'cake')
WHERE TextColumn LIKE '%pie%';
-- This will change 'apple pie' to 'apple cake' and 'banana pie' to 'banana cake'
-- Expected: apple cake, apple tart, banana cake

-- Verify the update
SELECT * FROM ExampleTable;
-- Expected: apple cake, apple tart, banana cake
-- Clean up