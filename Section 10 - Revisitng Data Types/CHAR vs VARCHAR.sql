-- Example and Explanation of CHAR vs VARCHAR in MySQL

-- Create a table to demonstrate CHAR
CREATE TABLE CharExample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fixed_length CHAR(10) -- Fixed-length string, always 10 characters
);

-- Insert data into CharExample
INSERT INTO CharExample (fixed_length) VALUES ('Hello');
INSERT INTO CharExample (fixed_length) VALUES ('World');

-- Notice that 'Hello' and 'World' will be padded with spaces to make them 10 characters long.

-- Query the data
SELECT id, fixed_length, LENGTH(fixed_length) AS actual_length FROM CharExample;

-- Create a table to demonstrate VARCHAR
CREATE TABLE VarcharExample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    variable_length VARCHAR(10) -- Variable-length string, up to 10 characters
);

-- Insert data into VarcharExample
INSERT INTO VarcharExample (variable_length) VALUES ('Hello');
INSERT INTO VarcharExample (variable_length) VALUES ('World');

-- Notice that 'Hello' and 'World' will not be padded with spaces.

-- Query the data
SELECT id, variable_length, LENGTH(variable_length) AS actual_length FROM VarcharExample;

-- Key Differences:
-- 1. CHAR is fixed-length, while VARCHAR is variable-length.
-- 2. CHAR is faster for fixed-size data but wastes space if the data is shorter than the defined length.
-- 3. VARCHAR is more space-efficient for variable-length data but has a slight performance overhead.