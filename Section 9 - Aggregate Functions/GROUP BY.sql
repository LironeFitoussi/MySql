-- Example 1: GROUP BY with COUNT
-- Count the number of books by each author
SELECT author_lname, COUNT(*) AS BooksCount
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | BooksCount |
-- |--------------|------------|
-- | Smith        | 5          |
-- | Johnson      | 3          |
-- | Brown        | 7          |

-- Example 2: GROUP BY with SUM
-- Calculate the total stock quantity for each author
SELECT author_lname, SUM(stock_quantity) AS TotalStock
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | TotalStock |
-- |--------------|------------|
-- | Smith        | 120        |
-- | Johnson      | 85         |
-- | Brown        | 200        |

-- Example 3: GROUP BY with AVG
-- Find the average number of pages for books by each author
SELECT author_lname, AVG(pages) AS AveragePages
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | AveragePages |
-- |--------------|--------------|
-- | Smith        | 350          |
-- | Johnson      | 420          |
-- | Brown        | 300          |

-- Example 4: GROUP BY with MAX
-- Find the maximum number of pages for books by each author
SELECT author_lname, MAX(pages) AS MaxPages
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | MaxPages |
-- |--------------|----------|
-- | Smith        | 500      |
-- | Johnson      | 600      |
-- | Brown        | 450      |

-- Example 5: GROUP BY with MIN
-- Find the earliest release year for books by each author
SELECT author_lname, MIN(released_year) AS EarliestYear
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | EarliestYear |
-- |--------------|--------------|
-- | Smith        | 1995         |
-- | Johnson      | 2000         |
-- | Brown        | 1985         |

-- Example 6: GROUP BY with multiple columns
-- Count the number of books by each author and release year
SELECT author_lname, released_year, COUNT(*) AS BooksCount
FROM books
GROUP BY author_lname, released_year;
-- Expected Output:
-- | author_lname | released_year | BooksCount |
-- |--------------|---------------|------------|
-- | Smith        | 1995          | 2          |
-- | Smith        | 2000          | 3          |
-- | Johnson      | 2000          | 1          |
-- | Johnson      | 2005          | 2          |
-- | Brown        | 1985          | 4          |
-- | Brown        | 1990          | 3          |

-- Example 7: GROUP BY with HAVING
-- Find authors who have written more than 2 books
SELECT author_lname, COUNT(*) AS BooksCount
FROM books
GROUP BY author_lname
HAVING COUNT(*) > 2;
-- Expected Output:
-- | author_lname | BooksCount |
-- |--------------|------------|
-- | Smith        | 5          |
-- | Brown        | 7          |

------------------

SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;
 
SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;