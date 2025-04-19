-- ==========================================
-- 📆 CURDATE(), CURTIME(), NOW() in MySQL
-- ==========================================

-- This file demonstrates how to use MySQL's
-- built-in functions for getting the current
-- date, time, and datetime.

-- Create a test table to store function results (optional)
DROP TABLE IF EXISTS current_datetime_demo;

CREATE TABLE current_datetime_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50),
    date_only DATE,
    time_only TIME,
    full_datetime DATETIME
);

-- Insert current date/time values using built-in functions
INSERT INTO current_datetime_demo (label, date_only, time_only, full_datetime)
VALUES
('System Clock Snapshot', CURDATE(), CURTIME(), NOW());

-- View the inserted values
SELECT * FROM current_datetime_demo;

-- ==========================================
-- 📌 Function Usage Examples
-- ==========================================

-- Get current date only
SELECT CURDATE() AS today;

-- Get current time only
SELECT CURTIME() AS now_time;

-- Get current date and time
SELECT NOW() AS full_datetime;

-- ==========================================
-- 🎨 Formatted Output Example (MySQL only)
-- ==========================================

-- Pretty-print the current datetime
SELECT DATE_FORMAT(NOW(), '%W, %M %d %Y at %h:%i %p') AS pretty_time;

-- Example output:
-- Friday, April 18 2025 at 04:45 PM

-- ==========================================
-- 🔍 Use Cases
-- ==========================================
-- Use CURDATE() to filter today's records:
-- SELECT * FROM your_table WHERE DATE(created_at) = CURDATE();

-- Use NOW() for automatic timestamps in INSERT:
-- INSERT INTO logs (message, created_at) VALUES ('User logged in', NOW());

-- Use CURTIME() for time-based comparisons:
-- SELECT * FROM schedule WHERE CURTIME() BETWEEN start_time AND end_time;
