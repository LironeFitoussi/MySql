-- 1.
SELECT
    UPPER(
        REVERSE ("Why does my cat look at me with such hatred?")
    ) AS reversed_string;

-- 2.
SELECT
    REPLACE (title, " ", "->")
FROM
    books;

-- 3.
SELECT
    author_lname AS forwards,
    REVERSE (author_lname) AS backwards
FROM
    books;

-- 4. 
SELECT
    UPPER(CONCAT (author_fname, " ", author_lname)) AS "full name in caps"
FROM
    books;

-- 5.
SELECT
    CONCAT (title, " was released in ", released_year)
FROM
    books;

-- 6.
SELECT
    title,
    CHAR_LENGTH(title) as "character count"
FROM
    books;

-- 7. 
SELECT
    CONCAT (LEFT (title, 10), "...") AS "short title",
    CONCAT (author_lname, ",", author_fname) AS "author",
    CONCAT (stock_quantity, " in stock") AS "quantity"
FROM
    books;

-- 8.
