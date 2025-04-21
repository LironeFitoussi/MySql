-- 1) List every order with its customer’s name
SELECT
  o.id         AS order_id,
  o.order_date,
  o.amount,
  c.first_name,
  c.last_name,
  c.email
FROM orders o
JOIN customers c
  ON o.customer_id = c.id
ORDER BY o.order_date;

-- 2) Show total order amount per customer
SELECT
  c.id          AS customer_id,
  c.first_name,
  c.last_name,
  COUNT(o.id)   AS order_count,
  SUM(o.amount) AS total_spent
FROM customers c
LEFT JOIN orders o
  ON o.customer_id = c.id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 3) Find customers with no orders
SELECT
  c.id,
  c.first_name,
  c.last_name,
  c.email
FROM customers c
LEFT JOIN orders o
  ON o.customer_id = c.id
WHERE o.id IS NULL;

-- 4) Attempt to delete a customer (will fail if they have orders)
-- DELETE FROM customers WHERE id = 1;
-- ERROR:  Cannot delete or update a parent row: a foreign key constraint fails

-- 5) If you want orders to be removed automatically when a customer is deleted:
ALTER TABLE orders
  DROP FOREIGN KEY orders_ibfk_1,       -- MySQL auto‑generated FK name; adjust as needed
  ADD CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE;

-- Now:
DELETE FROM customers WHERE id = 1;      -- Deletes customer + their orders automatically



SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;
 
 
SELECT * FROM orders 
WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');
 
-- To perform a (kind of useless) cross join:
SELECT * FROM customers