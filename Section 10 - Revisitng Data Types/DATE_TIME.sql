-- ===========================================
-- 📅 DATE & TIME TYPES in SQL (PostgreSQL + MySQL)
-- ===========================================

-- 🚫 Drop all previous demo tables
DROP TABLE IF EXISTS date_time_demo;
DROP TABLE IF EXISTS datetime_mysql_demo;

-- ===========================================
-- 🛠️ Create table using all types
-- ===========================================
CREATE TABLE date_time_demo (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100),

    -- DATE: Stores calendar date (YYYY-MM-DD)
    date_value DATE,

    -- TIME: Stores clock time (HH:MM:SS)
    time_value TIME,

    -- TIMESTAMP: Stores both date and time
    timestamp_value TIMESTAMP,

    -- INTERVAL (PostgreSQL only): Stores time duration
    interval_value INTERVAL
);

-- ===========================================
-- ✅ Insert values into date_time_demo
-- ===========================================
INSERT INTO date_time_demo (
    description, date_value, time_value, timestamp_value, interval_value
) VALUES
('Just a date', '2025-01-01', NULL, NULL, NULL),
('Just a time', NULL, '14:30:00', NULL, NULL),
('Full datetime', '2025-04-18', '09:00:00', '2025-04-18 09:00:00', NULL),
('With interval', NULL, NULL, '2025-01-01 08:00:00', INTERVAL '3 days 2 hours'),
('Now()', CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP, INTERVAL '1 day');

-- ===========================================
-- 🔍 View inserted data
-- ===========================================
SELECT * FROM date_time_demo;

-- ===========================================
-- 🧮 INTERVAL + TIMESTAMP Example
-- ===========================================
SELECT 
    description,
    timestamp_value,
    interval_value,
    timestamp_value + interval_value AS updated_time
FROM date_time_demo
WHERE interval_value IS NOT NULL;

-- ===========================================
-- 🕒 Date/Time Functions
-- ===========================================
-- PostgreSQL & MySQL
SELECT
    CURRENT_DATE AS today,
    CURRENT_TIME AS now_time,
    CURRENT_TIMESTAMP AS full_now;

-- PostgreSQL Only
SELECT
    EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS year,
    EXTRACT(MONTH FROM CURRENT_TIMESTAMP) AS month,
    EXTRACT(DAY FROM CURRENT_TIMESTAMP) AS day;

-- ===========================================
-- 🧭 Formatting (PostgreSQL)
-- ===========================================
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS') AS formatted;

-- ===========================================
-- 📆 DATETIME (MySQL only)
-- ===========================================
-- If you are using MySQL, use this section
-- PostgreSQL users can skip this part

-- Create DATETIME demo table
CREATE TABLE datetime_mysql_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100),
    datetime_value DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert examples
INSERT INTO datetime_mysql_demo (description, datetime_value) VALUES
('User registered', '2025-04-18 12:00:00'),
('Order placed', '2025-04-18 15:45:00'),
('System auto-time', NOW());

-- View DATETIME entries (MySQL only)
SELECT * FROM datetime_mysql_demo;

-- MySQL Date/Time functions
-- SELECT NOW(); -- Current datetime
-- SELECT CURDATE(); -- Current date
-- SELECT CURTIME(); -- Current time
-- SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS formatted_datetime;
