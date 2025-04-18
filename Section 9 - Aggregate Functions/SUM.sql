-- Example 1: SUM
-- Find the total number of pages in all books
SELECT SUM(pages) AS TotalPages
FROM books;
-- Expected Output:
-- | TotalPages |
-- |------------|
-- | 12500      |

-- Example 2: SUM with GROUP BY
-- Find the total number of pages for books by each author
SELECT author_lname, SUM(pages) AS TotalPages
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | TotalPages |
-- |--------------|------------|
-- | Smith        | 4500       |
-- | Johnson      | 3800       |
-- | Brown        | 4200       |

-- Example 3: SUM with WHERE
-- Find the total number of pages for books released after the year 2000
SELECT SUM(pages) AS TotalPages
FROM books
WHERE released_year > 2000;
-- Expected Output:
-- | TotalPages |
-- |------------|
-- | 8900       |

-- Example 4: SUM with HAVING
-- Find authors whose total number of pages exceeds 4000
SELECT author_lname, SUM(pages) AS TotalPages
FROM books
GROUP BY author_lname
HAVING SUM(pages) > 4000;
-- Expected Output:
-- | author_lname | TotalPages |
-- |--------------|------------|
-- | Smith        | 4500       |
-- | Brown        | 4200       |

-- Example 5: SUM with multiple columns
-- Find the total number of pages and the total price of all books
SELECT SUM(pages) AS TotalPages, SUM(price) AS TotalPrice
FROM books;
-- Expected Output:
-- | TotalPages | TotalPrice |
-- |------------|------------|
-- | 12500      | 3500.00    |


SELECT SUM(pages) FROM books;


SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;