-- ================================================
-- ⏰ MySQL TIME FUNCTIONS EXAMPLES & EXPLANATIONS
-- ================================================

-- Create a demo table with datetime values
DROP TABLE IF EXISTS time_functions_demo;

CREATE TABLE time_functions_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100),
    sample_datetime DATETIME
);

-- Insert sample datetime entries
INSERT INTO time_functions_demo (label, sample_datetime) VALUES
('Morning Meeting', '2025-04-18 08:30:15'),
('Lunch Break', '2025-04-18 12:00:00'),
('Afternoon Session', '2025-04-18 15:45:50'),
('Evening Wrap-up', '2025-04-18 18:10:05'),
('Midnight Log', '2025-04-19 00:00:01');

-- View raw data
SELECT * FROM time_functions_demo;

-- ================================================
-- 🕒 TIME FUNCTION DEMOS
-- ================================================

-- 1️⃣ HOUR() - extracts the hour (0-23)
SELECT 
  label, sample_datetime,
  HOUR(sample_datetime) AS hour_part
FROM time_functions_demo;

-- 2️⃣ MINUTE() - extracts minutes (0-59)
SELECT 
  label, sample_datetime,
  MINUTE(sample_datetime) AS minute_part
FROM time_functions_demo;

-- 3️⃣ SECOND() - extracts seconds (0-59)
SELECT 
  label, sample_datetime,
  SECOND(sample_datetime) AS second_part
FROM time_functions_demo;

-- 4️⃣ DATE() - extracts just the date (YYYY-MM-DD)
SELECT 
  label, sample_datetime,
  DATE(sample_datetime) AS date_only
FROM time_functions_demo;

-- 5️⃣ TIME() - extracts just the time (HH:MM:SS)
SELECT 
  label, sample_datetime,
  TIME(sample_datetime) AS time_only
FROM time_functions_demo;

-- ================================================
-- 🧠 Summary Table
-- ================================================
-- HOUR(datetime)   → Hour portion (0–23)
-- MINUTE(datetime) → Minute portion (0–59)
-- SECOND(datetime) → Second portion (0–59)
-- DATE(datetime)   → Extract date only (YYYY-MM-DD)
-- TIME(datetime)   → Extract time only (HH:MM:SS)

-- ================================================
-- 📌 Use Cases
-- ================================================

-- Find all meetings that happened in the afternoon (12:00–17:59)
-- SELECT * FROM time_functions_demo WHERE HOUR(sample_datetime) BETWEEN 12 AND 17;

-- Find logs at exact midnight
-- SELECT * FROM time_functions_demo WHERE TIME(sample_datetime) = '00:00:00';

-- Group by hour of day
-- SELECT HOUR(sample_datetime) AS hour, COUNT(*) FROM time_functions_demo GROUP BY hour;

-- Extract only the date for reporting
-- SELECT DATE(sample_datetime) AS report_date, COUNT(*) FROM time_functions_demo GROUP BY report_date;


SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;
 
SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

