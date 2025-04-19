-- ================================================
-- 📅 MySQL DATE FUNCTIONS EXAMPLES & EXPLANATIONS
-- ================================================

-- Create a demo table
DROP TABLE IF EXISTS date_functions_demo;

CREATE TABLE date_functions_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100),
    sample_date DATE
);

-- Insert some sample dates
INSERT INTO date_functions_demo (label, sample_date) VALUES
('Start of year', '2025-01-01'),
('Middle of year', '2025-06-15'),
('End of year', '2025-12-31'),
('Birthday', '1995-04-18'),
('Holiday', '2025-09-15');

-- View raw data
SELECT * FROM date_functions_demo;

-- ================================================
-- 🧪 Function Demonstrations
-- ================================================

-- 1️⃣ DAY() - returns the day of the month (1-31)
SELECT 
  label, sample_date, 
  DAY(sample_date) AS day_of_month
FROM date_functions_demo;

-- 2️⃣ DAYOFWEEK() - returns day of week (1 = Sunday, 7 = Saturday)
SELECT 
  label, sample_date, 
  DAYOFWEEK(sample_date) AS day_of_week
FROM date_functions_demo;

-- 3️⃣ DAYOFYEAR() - returns day of the year (1-366)
SELECT 
  label, sample_date, 
  DAYOFYEAR(sample_date) AS day_of_year
FROM date_functions_demo;

-- 4️⃣ MONTHNAME() - returns full name of the month
SELECT 
  label, sample_date, 
  MONTHNAME(sample_date) AS month_name
FROM date_functions_demo;

-- 5️⃣ WEEK() - returns week number of the year (0-53)
SELECT 
  label, sample_date, 
  WEEK(sample_date) AS week_number
FROM date_functions_demo;

-- ================================================
-- 🧠 Summary Table
-- ================================================
-- DAY(date)         → Day of the month (1–31)
-- DAYOFWEEK(date)   → Day of the week (1 = Sunday, 7 = Saturday)
-- DAYOFYEAR(date)   → Day number in the year (1–366)
-- MONTHNAME(date)   → Full month name like 'January'
-- WEEK(date)        → Week number of the year (0–53)

-- ================================================
-- 📌 Use Cases
-- ================================================

-- Find all birthdays in April
-- SELECT * FROM date_functions_demo WHERE MONTH(sample_date) = 4;

-- Find events on Mondays (DAYOFWEEK = 2)
-- SELECT * FROM date_functions_demo WHERE DAYOFWEEK(sample_date) = 2;

-- Sort events by day of the year
-- SELECT * FROM date_functions_demo ORDER BY DAYOFYEAR(sample_date);

-- Group by week number
-- SELECT WEEK(sample_date) AS week, COUNT(*) FROM date_functions_demo GROUP BY week;

SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;