-- .1
SELECT COUNT(*) AS TotalBooks
FROM books;

-- 2. 
SELECT released_year, COUNT(*) 
FROM books 
GROUP BY released_year;

-- 3.
SELECT SUM(stock_quantity) AS total_stock
FROM books;

-- 4.
SELECT AVG(released_year) AS avg_released_year
FROM books
GROUP BY author_fname, author_lname;

-- 5. 
SELECT author_fname, author_lname AS full_name
FROM books
WHERE pages = (SELECT MAX(pages) FROM books)
GROUP BY author_fname, author_lname;

-- 6.
SELECT released_year AS year, COUNT(*) AS books, AVG(pages) AS avg_pages
FROM books
GROUP BY released_year 
ORDER BY released_year ASC;