-- =============================================
-- 🗓️ MySQL DATE FORMATTING EXAMPLES
-- =============================================

-- Drop table if it exists
DROP TABLE IF EXISTS date_formatting_demo;

-- Create a table with date & time
CREATE TABLE date_formatting_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    event_datetime DATETIME
);

-- Insert sample datetime values
INSERT INTO date_formatting_demo (event_name, event_datetime) VALUES
('User Signup', '2025-04-18 09:30:15'),
('Order Placed', '2025-04-19 13:05:02'),
('Payment Received', '2025-04-20 18:47:59');

-- =============================================
-- 🧪 DATE_FORMAT() - Format with patterns
-- =============================================

-- Format as "April 18, 2025 at 09:30 AM"
SELECT 
  event_name,
  event_datetime,
  DATE_FORMAT(event_datetime, '%M %d, %Y at %h:%i %p') AS formatted_readable
FROM date_formatting_demo;

-- Format as "18/04/2025 09:30"
SELECT 
  event_name,
  DATE_FORMAT(event_datetime, '%d/%m/%Y %H:%i') AS european_format
FROM date_formatting_demo;

-- =============================================
-- 🧩 CONCAT() - Custom formatting
-- =============================================

-- Combine YEAR(), MONTH(), DAY() manually
SELECT 
  event_name,
  CONCAT(YEAR(event_datetime), '-', LPAD(MONTH(event_datetime), 2, '0'), '-', LPAD(DAY(event_datetime), 2, '0')) AS yyyy_mm_dd
FROM date_formatting_demo;

-- Format as "Weekday, the 18th of April"
SELECT 
  event_name,
  CONCAT(
    DATE_FORMAT(event_datetime, '%W'), ', the ',
    DAY(event_datetime), 'th of ',
    DATE_FORMAT(event_datetime, '%M')
  ) AS custom_string
FROM date_formatting_demo;

-- =============================================
-- 🧠 Common DATE_FORMAT patterns
-- =============================================
-- %Y – year (2025)
-- %y – year, 2 digits (25)
-- %m – month number (04)
-- %M – month name (April)
-- %d – day (18)
-- %e – day (1–31 no leading zero)
-- %H – hour (00–23)
-- %h – hour (01–12)
-- %i – minutes
-- %s – seconds
-- %p – AM/PM
-- %W – weekday name (Friday)

-- =============================================
-- 📌 Use Cases
-- =============================================

-- Format for frontend display
-- Format logs for email or SMS
-- Localized reports: use European or US formats
-- Extract and group by date parts (e.g., month, year)

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;
