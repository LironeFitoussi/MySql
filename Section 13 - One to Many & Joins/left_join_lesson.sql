-- Lesson: LEFT JOIN in SQL
-- This lesson demonstrates how to return all rows from the left table
-- and matching rows from the right table, using NULL for non-matches.

-- Example Schema Setup
CREATE TABLE authors (
    author_id   INT PRIMARY KEY,
    name        VARCHAR(100),
    country     VARCHAR(50)
);

CREATE TABLE books (
    book_id     INT PRIMARY KEY,
    author_id   INT,
    title       VARCHAR(200),
    published   DATE,
    CHECK (published <= CURRENT_DATE)
);

-- Populate sample data
INSERT INTO authors (author_id, name, country) VALUES
    (1, 'Jane Austen',     'UK'),
    (2, 'Mark Twain',      'USA'),
    (3, 'Gabriel García Márquez', 'Colombia');

INSERT INTO books (book_id, author_id, title, published) VALUES
    (101, 1, 'Pride and Prejudice', '1813-01-28'),
    (102, 1, 'Emma',                '1815-12-23'),
    (103, 2, 'Adventures of Tom Sawyer', '1876-06-01');

-- Example 1: List all authors and their books (if any)
SELECT
    a.author_id,
    a.name,
    b.title
FROM authors AS a
LEFT JOIN books AS b
    ON a.author_id = b.author_id;

-- Example 2: Count books per author, including authors with zero books
SELECT
    a.name,
    COUNT(b.book_id) AS book_count
FROM authors a
LEFT JOIN books b
    ON a.author_id = b.author_id
GROUP BY
    a.name;

-- Tips:
-- 1. LEFT JOIN returns all rows from the left table (authors) even if no match.
-- 2. Use IS NULL in WHERE to find unmatched rows: WHERE b.book_id IS NULL.
-- 3. ANSI-SQL uses LEFT OUTER JOIN; INNER keyword is optional (LEFT JOIN).

-- Common Pitfalls:
-- • Using WHERE b.column = value after LEFT JOIN converts it to INNER JOIN.
-- • Forgetting NULL handling for right-table columns when no match exists.
-- • Joining on non-indexed columns can lead to slow performance.

-- Summary:
-- LEFT JOIN is ideal for retrieving all records from a primary table and
-- optionally matching related data, preserving non-matches as NULLs.

-- Suggested file name:
-- left_join_lesson.sql


SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;
 
 
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;