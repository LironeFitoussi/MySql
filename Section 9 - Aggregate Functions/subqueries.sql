-- Example 1: Subquery in SELECT
-- Find the title of the book with the maximum number of pages
SELECT title, pages
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
-- Expected Output:
-- | title           | pages |
-- |-----------------|-------|
-- | Longest Book    | 1200  |

-- Example 2: Subquery in WHERE
-- Find all books released after the earliest release year
SELECT title, released_year
FROM books
WHERE released_year > (SELECT MIN(released_year) FROM books);
-- Expected Output:
-- | title           | released_year |
-- |-----------------|---------------|
-- | Book A          | 1990          |
-- | Book B          | 2000          |

-- Example 3: Subquery with GROUP BY
-- Find authors who have written books with the maximum number of pages
SELECT author_lname
FROM books
WHERE pages = (SELECT MAX(pages) FROM books)
GROUP BY author_lname;
-- Expected Output:
-- | author_lname |
-- |--------------|
-- | Smith        |

-- Example 4: Subquery in FROM (Derived Table)
-- Find the average number of pages for books released after 2000
SELECT AVG(pages) AS AvgPages
FROM (SELECT pages FROM books WHERE released_year > 2000) AS RecentBooks;
-- Expected Output:
-- | AvgPages |
-- |----------|
-- | 350      |

-- Example 5: Correlated Subquery
-- Find books where the number of pages is greater than the average number of pages for all books
SELECT title, pages
FROM books b1
WHERE pages > (SELECT AVG(pages) FROM books b2 WHERE b1.author_lname = b2.author_lname);
-- Expected Output:
-- | title           | pages |
-- |-----------------|-------|
-- | Book C          | 500   |
-- | Book D          | 600   |

-- Example 6: Subquery with EXISTS
-- Find authors who have written at least one book with more than 500 pages
SELECT DISTINCT author_lname
FROM books b1
WHERE EXISTS (SELECT 1 FROM books b2 WHERE b1.author_lname = b2.author_lname AND b2.pages > 500);
-- Expected Output:
-- | author_lname |
-- |--------------|
-- | Johnson      |
-- | Brown        |

-- Example 7: Subquery with NOT EXISTS
-- Find authors who have not written any book with more than 300 pages
SELECT DISTINCT author_lname
FROM books b1
WHERE NOT EXISTS (SELECT 1 FROM books b2 WHERE b1.author_lname = b2.author_lname AND b2.pages > 300);
-- Expected Output:
-- | author_lname |
-- |--------------|
-- | Smith        |



-----------------------

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);