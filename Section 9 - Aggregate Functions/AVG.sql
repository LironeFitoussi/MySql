-- Example 1: AVG
-- Find the average number of pages in all books
SELECT AVG(pages) AS AveragePages
FROM books;
-- Expected Output:
-- | AveragePages |
-- |--------------|
-- | 4166.67      |

-- Example 2: AVG with WHERE
-- Find the average number of pages for books released after the year 2000
SELECT AVG(pages) AS AveragePages
FROM books
WHERE released_year > 2000;
-- Expected Output:
-- | AveragePages |
-- |--------------|
-- | 4450.00      |

-- Example 3: AVG with GROUP BY
-- Find the average number of pages for books by each author
SELECT author_lname, AVG(pages) AS AveragePages
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | AveragePages |
-- |--------------|--------------|
-- | Smith        | 4500.00      |
-- | Johnson      | 3800.00      |
-- | Brown        | 4200.00      |

-- Example 4: AVG with GROUP BY and HAVING
-- Find authors whose average number of pages exceeds 4000
SELECT author_lname, AVG(pages) AS AveragePages
FROM books
GROUP BY author_lname
HAVING AVG(pages) > 4000;
-- Expected Output:
-- | author_lname | AveragePages |
-- |--------------|--------------|
-- | Smith        | 4500.00      |
-- | Brown        | 4200.00      |

-- Example 5: AVG with multiple columns
-- Find the average number of pages and the average price of all books
SELECT AVG(pages) AS AveragePages, AVG(price) AS AveragePrice
FROM books;
-- Expected Output:
-- | AveragePages | AveragePrice |
-- |--------------|--------------|
-- | 4166.67      | 1166.67      |



-------

SELECT AVG(pages) FROM books;

SELECT AVG(released_year) FROM books;

SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;