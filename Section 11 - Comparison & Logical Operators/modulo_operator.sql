-- 🧠 SQL LESSON: The Modulo Operator (%)

-- 🤔 What is the Modulo Operator?
-- The modulo operator (%) returns the remainder after dividing one number by another.
-- In SQL, it's often used to check for even/odd numbers, or to group items in cycles.

-- 📄 Syntax:
-- SELECT number % divisor AS result

-- 🧪 Example 1: Find Even and Odd Numbers
SELECT number,
  CASE
    WHEN number % 2 = 0 THEN 'Even'
    ELSE 'Odd'
  END AS parity
FROM numbers;

-- 🧾 Sample Output:
-- +--------+-------+
-- | number | parity|
-- +--------+-------+
-- | 1      | Odd   |
-- | 2      | Even  |
-- | 3      | Odd   |
-- | 4      | Even  |
-- +--------+-------+

-- 🧪 Example 2: Select every 3rd order (orders where order_id is a multiple of 3)
SELECT order_id, customer_name
FROM orders
WHERE order_id % 3 = 0;

-- 🧾 Sample Output:
-- +----------+---------------+
-- | order_id | customer_name |
-- +----------+---------------+
-- | 1003     | Sam           |
-- | 1006     | Chris         |
-- +----------+---------------+

-- 🧪 Example 3: Group items into 5 buckets (useful for data sharding or distribution)
SELECT item_id, (item_id % 5) AS bucket
FROM inventory;

-- 🧾 Sample Output:
-- +---------+--------+
-- | item_id | bucket |
-- +---------+--------+
-- | 101     | 1      |
-- | 102     | 2      |
-- | 103     | 3      |
-- | 104     | 4      |
-- | 105     | 0      |
-- +---------+--------+

-- ✅ Tips:
-- `% 2 = 0` finds even numbers.
-- `% 2 = 1` finds odd numbers.
-- Group by `column % n` to create "buckets" or partitions.

-- END OF LESSON
