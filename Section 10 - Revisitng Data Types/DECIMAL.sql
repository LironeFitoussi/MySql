-- DECIMAL Examples in SQL
-- DECIMAL(p, s): p = precision (total number of digits), s = scale (digits after the decimal point)

-- Create a sample table to experiment with DECIMAL values
DROP TABLE IF EXISTS decimal_demo;
CREATE TABLE decimal_demo (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100),
    value DECIMAL(10, 2) -- 10 digits total, 2 digits after the decimal
);

-- Insert examples

-- ✅ This fits: total digits = 5, scale = 2
INSERT INTO decimal_demo (description, value) VALUES
('Price of coffee', 12.50);

-- ✅ This fits: total digits = 10, scale = 2
INSERT INTO decimal_demo (description, value) VALUES
('Car price', 12345678.90);

-- ❌ This exceeds precision (more than 10 digits total) and will be rejected or rounded/truncated
-- Uncomment the line below to test behavior in your SQL engine
-- INSERT INTO decimal_demo (description, value) VALUES
-- ('Too big number', 1234567890.12);

-- ✅ Decimal without fractional part (still stored as .00)
INSERT INTO decimal_demo (description, value) VALUES
('Whole number', 150);

-- ✅ Negative decimal
INSERT INTO decimal_demo (description, value) VALUES
('Negative discount', -25.75);

-- ✅ Rounding will occur based on scale
INSERT INTO decimal_demo (description, value) VALUES
('Rounding test', 99.999); -- Will be rounded to 100.00

-- ✅ Insert using string format
INSERT INTO decimal_demo (description, value) VALUES
('String format input', '49.955'); -- Rounded to 49.96

-- View all inserted data
SELECT * FROM decimal_demo;

-- Notes:
-- DECIMAL is useful for exact precision, especially in financial applications.
-- Unlike FLOAT or REAL, DECIMAL avoids rounding errors for things like money.
