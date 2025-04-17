-- LEFT function examples
-- Extract the first 5 characters from a string
SELECT LEFT('Hello World', 5) AS Result;
-- Expected: Hello

-- Extract the first 3 characters from a phone number
SELECT LEFT('123-456-789', 3) AS Result;
-- Expected: 123

-- Extract a substring from a column value
CREATE TABLE ExampleTable (
    ID INT,
    TextColumn VARCHAR(100)
);

INSERT INTO ExampleTable (ID, TextColumn)
VALUES (1, 'apple pie'), (2, 'cherry tart'), (3, 'banana cake');

-- Extract the first 5 characters from TextColumn
SELECT ID, LEFT(TextColumn, 5) AS ExtractedText
FROM ExampleTable;
-- Expected: apple, cherr, banan

-- RIGHT function examples
-- Extract the last 5 characters from a string
SELECT RIGHT('Hello World', 5) AS Result;
-- Expected: World

-- Extract the last 4 characters from a phone number
SELECT RIGHT('123-456-789', 4) AS Result;
-- Expected: -789

-- Extract a substring from a column value
-- Extract the last 4 characters from TextColumn
SELECT ID, RIGHT(TextColumn, 4) AS ExtractedText
FROM ExampleTable;
-- Expected:  pie, tart, cake

-- Clean up
DROP TABLE ExampleTable;