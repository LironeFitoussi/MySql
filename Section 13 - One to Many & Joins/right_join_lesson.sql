-- Lesson: RIGHT JOIN in SQL
-- This lesson demonstrates how to return all rows from the right table
-- and matching rows from the left table, using NULL for non-matches.

-- Example Schema Setup
CREATE TABLE teams (
    team_id     INT PRIMARY KEY,
    team_name   VARCHAR(100)
);

CREATE TABLE matches (
    match_id    INT PRIMARY KEY,
    home_team   INT,
    away_team   INT,
    score       VARCHAR(10),
    CHECK (score LIKE '%-%')
);

-- Populate sample data
INSERT INTO teams (team_id, team_name) VALUES
    (1, 'Eagles'),
    (2, 'Tigers'),
    (3, 'Sharks');

INSERT INTO matches (match_id, home_team, away_team, score) VALUES
    (10, 1, 2, '3-1'),
    (11, 2, 4, '2-2'),  -- away_team 4 does not exist in teams
    (12, 3, 1, '1-0');

-- Example 1: List all matches and their home team names (if any)
SELECT
    m.match_id,
    t.team_name AS home_team_name,
    m.score
FROM teams AS t
RIGHT JOIN matches AS m
    ON t.team_id = m.home_team;

-- Example 2: List all matches and their away team names (if any)
SELECT
    m.match_id,
    t.team_name AS away_team_name,
    m.score
FROM teams t
RIGHT JOIN matches m
    ON t.team_id = m.away_team;

-- Tips:
-- 1. RIGHT JOIN returns all rows from the right table (matches), even if no match.
-- 2. Swap table order or use LEFT JOIN if RIGHT JOIN is unsupported in some dialects.
-- 3. Always check for NULLs in joined columns to handle missing references.

-- Common Pitfalls:
-- • RIGHT JOIN is less common; many prefer LEFT JOIN by swapping tables for clarity.
-- • Using WHERE t.team_id = value after RIGHT JOIN filters out NULLs, becoming INNER JOIN.
-- • Ensure join columns have compatible data types and indexes for performance.

-- Summary:
-- RIGHT JOIN retrieves all records from the second (right) table and matches
-- from the first (left) table, filling with NULLs when no match exists.

-- Suggested file name:
-- right_join_lesson.sql

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;