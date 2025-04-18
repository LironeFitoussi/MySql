-- Example 1: MIN with GROUP BY
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

-- Example 2: MAX with GROUP BY
-- Find the latest release year for books by each author
SELECT author_lname, MAX(released_year) AS LatestYear
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | LatestYear |
-- |--------------|------------|
-- | Smith        | 2020       |
-- | Johnson      | 2018       |
-- | Brown        | 2022       |

-- Example 3: MIN and MAX with GROUP BY
-- Find the earliest and latest release year for books by each author
SELECT author_lname, MIN(released_year) AS EarliestYear, MAX(released_year) AS LatestYear
FROM books
GROUP BY author_lname;
-- Expected Output:
-- | author_lname | EarliestYear | LatestYear |
-- |--------------|--------------|------------|
-- | Smith        | 1995         | 2020       |
-- | Johnson      | 2000         | 2018       |
-- | Brown        | 1985         | 2022       |

-- Example 4: MIN and MAX with additional column
-- Find the earliest and latest release year for books by each author and genre
SELECT author_lname, genre, MIN(released_year) AS EarliestYear, MAX(released_year) AS LatestYear
FROM books
GROUP BY author_lname, genre;
-- Expected Output:
-- | author_lname | genre      | EarliestYear | LatestYear |
-- |--------------|------------|--------------|------------|
-- | Smith        | Fiction    | 1995         | 2015       |
-- | Johnson      | Non-Fiction| 2000         | 2018       |
-- | Brown        | Mystery    | 1985         | 2022       |



------

SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;

SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;


SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;