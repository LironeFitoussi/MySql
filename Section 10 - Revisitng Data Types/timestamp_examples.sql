-- =============================================
-- 🕓 TIMESTAMP in MySQL - Examples & Use Cases
-- =============================================

-- Drop table if it exists
DROP TABLE IF EXISTS timestamp_demo;

-- Create table with TIMESTAMP
CREATE TABLE timestamp_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),

    -- Default value is current timestamp on insert
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Auto-update value on UPDATE
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert rows (created_at auto-filled)
INSERT INTO timestamp_demo (event_name) VALUES
('User Signup'),
('Order Placed'),
('Profile Updated');

-- Simulate delay
-- UPDATE timestamp_demo SET event_name = 'User Signup Edited' WHERE id = 1;

-- View table contents
SELECT * FROM timestamp_demo;

-- =============================================
-- 🔍 TIMESTAMP vs DATETIME (in MySQL)
-- =============================================
-- TIMESTAMP is stored in UTC, converted to local time on retrieval
-- DATETIME is stored as-is (no time zone awareness)

DROP TABLE IF EXISTS compare_datetime_timestamp;

CREATE TABLE compare_datetime_timestamp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sample_datetime DATETIME,
    sample_timestamp TIMESTAMP
);

-- Insert using NOW()
INSERT INTO compare_datetime_timestamp (sample_datetime, sample_timestamp)
VALUES (NOW(), NOW());

-- View result
SELECT * FROM compare_datetime_timestamp;

-- =============================================
-- 🧠 TIMESTAMP Functions & Use
-- =============================================

-- 1. Get current timestamp
SELECT CURRENT_TIMESTAMP AS now_timestamp;

-- 2. Compare timestamps
SELECT * FROM timestamp_demo
WHERE created_at > CURRENT_TIMESTAMP - INTERVAL 1 DAY;

-- 3. Format TIMESTAMP
SELECT 
  event_name,
  created_at,
  DATE_FORMAT(created_at, '%W, %M %d %Y at %H:%i:%s') AS readable
FROM timestamp_demo;

-- =============================================
-- 📌 Summary
-- =============================================
-- TIMESTAMP:
-- - Auto-filled with CURRENT_TIMESTAMP if specified
-- - Can auto-update with ON UPDATE clause
-- - Stored in UTC and converted to session time zone
-- - Max range: '1970-01-01 00:00:01' to '2038-01-19 03:14:07'

-- DATETIME:
-- - No time zone conversion
-- - Larger date range: '1000-01-01' to '9999-12-31'

-- ✅ Use TIMESTAMP for: Logs, audit trails, created/updated tracking
-- ✅ Use DATETIME for: Birthdays, appointments, exact historic data
