-- Example 1: MIN
-- Find the earliest release year of all books
SELECT MIN(released_year) AS EarliestYear
FROM books;
-- Expected Output:
-- | EarliestYear |
-- |--------------|
-- | 1985         |

-- Example 2: MAX
-- Find the latest release year of all books
SELECT MAX(released_year) AS LatestYear
FROM books;
-- Expected Output:
-- | LatestYear |
-- |------------|
-- | 2022       |

-- Example 3: MIN with GROUP BY
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

-- Example 4: MAX with GROUP BY
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

-- Example 5: MIN and MAX together
-- Find the earliest and latest release year of all books
SELECT MIN(released_year) AS EarliestYear, MAX(released_year) AS LatestYear
FROM books;
-- Expected Output:
-- | EarliestYear | LatestYear |
-- |--------------|------------|
-- | 1985         | 2022       |

-- Example 6: MIN and MAX with GROUP BY
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



---------

SELECT MAX(pages) FROM books;

SELECT MIN(author_lname) FROM books;