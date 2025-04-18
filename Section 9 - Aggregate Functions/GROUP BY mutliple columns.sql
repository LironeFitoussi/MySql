-- Example 1: GROUP BY multiple columns
-- Count the number of books by each author and release year
SELECT author_lname, released_year, COUNT(*) AS BooksCount
FROM books
GROUP BY author_lname, released_year;
-- Expected Output:
-- | author_lname | released_year | BooksCount |
-- |--------------|---------------|------------|
-- | Smith        | 1995          | 2          |
-- | Johnson      | 2000          | 1          |
-- | Brown        | 2022          | 3          |

-- Example 2: GROUP BY multiple columns with SUM
-- Calculate the total stock quantity for each author and release year
SELECT author_lname, released_year, SUM(stock_quantity) AS TotalStock
FROM books
GROUP BY author_lname, released_year;
-- Expected Output:
-- | author_lname | released_year | TotalStock |
-- |--------------|---------------|------------|
-- | Smith        | 1995          | 50         |
-- | Johnson      | 2000          | 30         |
-- | Brown        | 2022          | 70         |

-- Example 3: GROUP BY multiple columns with HAVING
-- Find authors and release years where more than 2 books were published
SELECT author_lname, released_year, COUNT(*) AS BooksCount
FROM books
GROUP BY author_lname, released_year
HAVING COUNT(*) > 2;
-- Expected Output:
-- | author_lname | released_year | BooksCount |
-- |--------------|---------------|------------|
-- | Brown        | 2022          | 3          |


---------------


SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;


SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;