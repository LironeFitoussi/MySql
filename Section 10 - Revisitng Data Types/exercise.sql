-- ================================================
-- 🧠 SQL REVIEW – Data Types, Date/Time Functions, Formatting
-- ================================================

-- 🔹 1. CHAR Use Case Example
-- CHAR is ideal for fixed-length values like country codes or status flags.

-- Example:
-- CREATE TABLE country_codes (
--     code CHAR(2)
-- );

-- ================================================
-- 🔹 2. Inventory Table – Fill in the blanks
DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
    item_name CHAR(50),         -- Fixed-length name
    price DECIMAL(10, 2),       -- Monetary value
    quantity INT                -- Whole number quantity
);

-- ================================================
-- 🔹 3. DATETIME vs TIMESTAMP (MySQL)
-- TIMESTAMP:
-- - Auto-converts to/from UTC
-- - Supports DEFAULT/ON UPDATE
-- - Smaller range (1970–2038)
-- DATETIME:
-- - Stores literal datetime, no time zone adjustment
-- - Larger range (1000–9999)
-- - No ON UPDATE support (manual or via triggers)

-- Comparison Table:
DROP TABLE IF EXISTS compare_datetime_timestamp;

CREATE TABLE compare_datetime_timestamp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sample_datetime DATETIME,
    sample_timestamp TIMESTAMP
);

INSERT INTO compare_datetime_timestamp (sample_datetime, sample_timestamp)
VALUES (NOW(), NOW());

-- ================================================
-- 🔹 4. Print Current Time
SELECT CURTIME() AS current_time;

-- ================================================
-- 🔹 5. Print Current Date Only
SELECT CURDATE() AS current_date;

-- ================================================
-- 🔹 6. Print Current Day of the Week (Number)
SELECT DAYOFWEEK(CURDATE()) AS weekday_number; -- 1 = Sunday, 7 = Saturday

-- ================================================
-- 🔹 7. Print Current Day of the Week (Name)
SELECT DAYNAME(CURDATE()) AS weekday_name;

-- ================================================
-- 🔹 8. Format: mm/dd/yyyy
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y') AS formatted_date;

-- ================================================
-- 🔹 9. Format: January 2nd at 3:15
SELECT CONCAT(
  DATE_FORMAT(NOW(), '%M '),
  DAY(NOW()), 
  CASE 
    WHEN DAY(NOW()) IN (1, 21, 31) THEN 'st'
    WHEN DAY(NOW()) IN (2, 22) THEN 'nd'
    WHEN DAY(NOW()) IN (3, 23) THEN 'rd'
    ELSE 'th'
  END,
  ' at ',
  DATE_FORMAT(NOW(), '%k:%i')
) AS fancy_format;

-- Example test for hardcoded date:
-- SELECT CONCAT(
--   DATE_FORMAT('2025-04-01 10:18:00', '%M '),
--   DAY('2025-04-01'),
--   'st at ',
--   DATE_FORMAT('2025-04-01 10:18:00', '%k:%i')
-- ) AS formatted;

-- ================================================
-- 🔹 10. Create tweets table
DROP TABLE IF EXISTS tweets;

CREATE TABLE tweets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(280),                          -- Tweet content
    username VARCHAR(50),                          -- Twitter username
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of creation
);

-- Insert example tweet
INSERT INTO tweets (content, username) VALUES
('Hello world! This is my first tweet.', 'sql_user');

-- View inserted tweets
SELECT * FROM tweets;
