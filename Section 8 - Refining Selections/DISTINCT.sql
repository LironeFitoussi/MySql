-- Using DISTINCT to get unique authors' first names
SELECT DISTINCT author_fname 
FROM books;

-- Output:
-- +--------------+
-- | author_fname |
-- +--------------+
-- | Jhumpa       |
-- | Neil         |
-- | Dave         |
-- | Michael      |
-- | Patti        |
-- | Raymond      |
-- | Don          |
-- | John         |
-- | David        |
-- +--------------+

-- Using DISTINCT to get unique combinations of authors' first and last names
SELECT DISTINCT author_fname, author_lname 
FROM books;

SELECT DISTINCT CONCAT(author_fname, " ", author_lname) AS "full name" 
FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

-- To count the total number of unique combinations
SELECT COUNT(*) AS total_unique_authors 
FROM (SELECT DISTINCT author_fname, author_lname FROM books) AS unique_authors;

-- Output:
-- +--------------+--------------+
-- | author_fname | author_lname |
-- +--------------+--------------+
-- | Jhumpa       | Lahiri       |
-- | Neil         | Gaiman       |
-- | Dave         | Eggers       |
-- | Michael      | Chabon       |
-- | Patti        | Smith        |
-- | Raymond      | Carver       |
-- | Don          | DeLillo      |
-- | John         | Steinbeck    |
-- | David        | Foster Wallace |
-- +--------------+--------------+

-- Using DISTINCT to get unique release years
SELECT DISTINCT released_year 
FROM books;

-- Output:
-- +---------------+
-- | released_year |
-- +---------------+
-- | 2003          |
-- | 2016          |
-- | 2001          |
-- | 1996          |
-- | 2012          |
-- | 2013          |
-- | 2000          |
-- | 2010          |
-- | 1981          |
-- | 1989          |
-- | 1985          |
-- | 1945          |
-- | 2004          |
-- | 2005          |
-- +---------------+