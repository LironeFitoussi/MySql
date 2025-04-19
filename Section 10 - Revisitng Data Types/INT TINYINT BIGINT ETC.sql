-- Explanation:
-- MySQL provides several integer types, each optimized for different ranges and storage requirements.
--
-- TINYINT: 1 byte.
--   - Signed:   -128 to 127.
--   - Unsigned: 0 to 255.
--
-- SMALLINT: 2 bytes.
--   - Signed:   -32768 to 32767.
--   - Unsigned: 0 to 65535.
--
-- MEDIUMINT: 3 bytes.
--   - Signed:   -8388608 to 8388607.
--   - Unsigned: 0 to 16777215.
--
-- INT or INTEGER: 4 bytes.
--   - Signed:   -2147483648 to 2147483647.
--   - Unsigned: 0 to 4294967295.
--
-- BIGINT: 8 bytes.
--   - Signed:   -9223372036854775808 to 9223372036854775807.
--   - Unsigned: 0 to 18446744073709551615.
--
-- Examples:
-- The following SQL code creates a sample table to illustrate these types.
CREATE TABLE ExampleNumbers (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key using INT
    tiny TINYINT,                       -- For very small numbers
    tiny_unsigned TINYINT UNSIGNED,     -- Unsigned version of TINYINT
    small SMALLINT,                     -- For small range integers
    small_unsigned SMALLINT UNSIGNED,   -- Unsigned version of SMALLINT
    medium MEDIUMINT,                   -- For medium range integers
    medium_unsigned MEDIUMINT UNSIGNED, -- Unsigned version of MEDIUMINT
    regular INT,                        -- Standard integer type
    regular_unsigned INT UNSIGNED,      -- Unsigned version of INT
    big BIGINT,                         -- For large integer values
    big_unsigned BIGINT UNSIGNED        -- Unsigned version of BIGINT
);

-- Inserting sample records:
INSERT INTO ExampleNumbers (tiny, tiny_unsigned, small, small_unsigned, medium, medium_unsigned, regular, regular_unsigned, big, big_unsigned) VALUES
(127, 255, 32767, 65535, 8388607, 16777215, 2147483647, 4294967295, 9223372036854775807, 18446744073709551615),
(-128, 0, -32768, 0, -8388608, 0, -2147483648, 0, -9223372036854775808, 0);

-- Querying the table to verify the inserted data:
SELECT * FROM ExampleNumbers;