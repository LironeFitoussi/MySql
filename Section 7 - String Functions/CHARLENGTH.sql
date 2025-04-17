-- Example 1: Basic CHAR_LENGTH usage
SELECT CHAR_LENGTH('Hello World') AS LengthOfString;
-- Output: 11

-- Example 2: CHAR_LENGTH with an empty string
SELECT CHAR_LENGTH('') AS LengthOfEmptyString;
-- Output: 0

-- Example 3: CHAR_LENGTH with spaces
SELECT CHAR_LENGTH('   ') AS LengthOfSpaces;
-- Output: 3

-- Example 4: CHAR_LENGTH with multibyte characters
SELECT CHAR_LENGTH('こんにちは') AS LengthOfMultibyteString;
-- Output: 5

-- Example 5: CHAR_LENGTH with NULL
SELECT CHAR_LENGTH(NULL) AS LengthOfNull;
-- Output: NULL

-- Example 6: CHAR_LENGTH in a table query
CREATE TEMPORARY TABLE SampleText (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text_column VARCHAR(255)
);

INSERT INTO SampleText (text_column) VALUES
('MySQL'), 
('Database'), 
(''), 
(NULL);

SELECT id, text_column, CHAR_LENGTH(text_column) AS LengthOfText
FROM SampleText;
-- Output:
-- id | text_column | LengthOfText
--  1 | MySQL       | 5
--  2 | Database    | 8
--  3 |             | 0
--  4 | NULL        | NULL