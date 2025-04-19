-- FLOAT and DOUBLE Examples in SQL
-- Used for approximate values (not exact like DECIMAL)
-- Good for scientific or engineering calculations, not for financial data

DROP TABLE IF EXISTS float_double_demo;
CREATE TABLE float_double_demo (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100),
    float_value FLOAT,              -- Approximate single-precision float
    double_value DOUBLE PRECISION   -- Approximate double-precision float
);

-- Insert values with many decimal places
INSERT INTO float_double_demo (description, float_value, double_value) VALUES
('Pi value', 3.1415926535, 3.1415926535),
('Small number', 0.000000123456789, 0.000000123456789),
('Large number', 123456789.123456789, 123456789.123456789),
('Whole number', 42, 42),
('Rounded example', 1.23456789, 1.23456789);

-- Insert values using exponential notation
INSERT INTO float_double_demo (description, float_value, double_value) VALUES
('Exponential small', 1.23e-10, 1.23e-10),
('Exponential large', 9.87e+10, 9.87e+10);

-- View results
SELECT * FROM float_double_demo;

-- Notes:
-- FLOAT is typically 4 bytes (single precision), DOUBLE is 8 bytes (double precision)
-- Results may vary depending on the SQL engine's implementation (MySQL vs PostgreSQL)
-- FLOAT and DOUBLE are **not precise** — suitable for scientific data but not for currency!
