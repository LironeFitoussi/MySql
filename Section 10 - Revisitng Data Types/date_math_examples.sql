-- =============================================
-- 📅 DATE MATH FUNCTIONS in MySQL
-- =============================================

-- Drop table if it exists
DROP TABLE IF EXISTS date_math_demo;

-- Create demo table
CREATE TABLE date_math_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100),
    start_date DATETIME,
    end_date DATETIME
);

-- Insert sample data
INSERT INTO date_math_demo (label, start_date, end_date) VALUES
('Project A', '2025-04-01 09:00:00', '2025-04-18 17:30:00'),
('Vacation', '2025-08-01 00:00:00', '2025-08-15 23:59:59'),
('Flash Sale', '2025-04-18 12:00:00', '2025-04-18 15:00:00');

-- =============================================
-- 📏 1. DATEDIFF() - Difference in days
-- =============================================
SELECT 
  label,
  start_date,
  end_date,
  DATEDIFF(end_date, start_date) AS days_between
FROM date_math_demo;

-- =============================================
-- 🧮 2. TIMEDIFF() - Difference in time (HH:MM:SS)
-- =============================================
SELECT 
  label,
  start_date,
  end_date,
  TIMEDIFF(end_date, start_date) AS time_difference
FROM date_math_demo;

-- =============================================
-- ➕ 3. DATE_ADD() - Add interval to date
-- =============================================
SELECT 
  label,
  start_date,
  DATE_ADD(start_date, INTERVAL 10 DAY) AS plus_10_days,
  DATE_ADD(start_date, INTERVAL 2 HOUR) AS plus_2_hours
FROM date_math_demo;

-- =============================================
-- ➖ 4. DATE_SUB() - Subtract interval from date
-- =============================================
SELECT 
  label,
  end_date,
  DATE_SUB(end_date, INTERVAL 7 DAY) AS minus_7_days,
  DATE_SUB(end_date, INTERVAL 30 MINUTE) AS minus_30_minutes
FROM date_math_demo;

-- =============================================
-- ⏱️ 5. ADDTIME() - Add a time duration to DATETIME
-- =============================================
SELECT 
  label,
  start_date,
  ADDTIME(start_date, '01:30:00') AS start_plus_1_5_hours
FROM date_math_demo;

-- =============================================
-- ⏱️ 6. SUBTIME() - Subtract a time duration
-- =============================================
SELECT 
  label,
  end_date,
  SUBTIME(end_date, '02:00:00') AS end_minus_2_hours
FROM date_math_demo;

-- =============================================
-- 🧠 Summary Table
-- =============================================
-- DATEDIFF(end, start)     → Returns number of days
-- TIMEDIFF(end, start)     → Returns time difference (HH:MM:SS)
-- DATE_ADD(date, INTERVAL) → Adds to date/time
-- DATE_SUB(date, INTERVAL) → Subtracts from date/time
-- ADDTIME(datetime, time)  → Adds time duration (string)
-- SUBTIME(datetime, time)  → Subtracts time duration

-- =============================================
-- 📌 Use Cases
-- =============================================
-- ⏳ Track duration of events (DATEDIFF, TIMEDIFF)
-- 📅 Schedule reminders or deadlines (DATE_ADD, ADDTIME)
-- 📆 Subtract trial periods or buffer times (DATE_SUB)
-- 📊 Create dashboards and reports grouped by durations
