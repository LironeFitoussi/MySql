-- 🧠 SQL LESSON: Multiple Column Constraints

-- 🧐 What are Multiple Column Constraints?
-- Multiple column (composite) constraints enforce rules across more than one column,
-- such as composite PRIMARY KEYs, UNIQUEs, FOREIGN KEYs, or CHECKs involving two or more fields.

-- 📄 Basic Syntax (CREATE time)
-- CREATE TABLE table_name (
--   col1 data_type,
--   col2 data_type,
--   ...,
--   CONSTRAINT constraint_name constraint_type (col1, col2[, ...])
-- );

-------------------------------------------------------------------------------
-- 🧪 Example 1: Composite PRIMARY KEY
CREATE TABLE enrollment (
  student_id INT,
  course_id  INT,
  CONSTRAINT pk_enrollment PRIMARY KEY (student_id, course_id)
);

-- Ensures each student can enroll in each course only once.

-------------------------------------------------------------------------------
-- 🧪 Example 2: Composite UNIQUE Constraint
CREATE TABLE reservations (
  flight_id    INT,
  seat_number  VARCHAR(5),
  passenger_id INT,
  CONSTRAINT uq_flight_seat UNIQUE (flight_id, seat_number)
);

-- Prevents two passengers from booking the same seat on the same flight.

-------------------------------------------------------------------------------
-- 🧪 Example 3: Composite FOREIGN KEY
CREATE TABLE order_items (
  order_id    INT,
  product_id  INT,
  quantity    INT,
  CONSTRAINT fk_order_product
    FOREIGN KEY (order_id, product_id)
      REFERENCES orders_products(order_id, product_id)
);

-- Links order_items to a composite key in orders_products.

-------------------------------------------------------------------------------
-- 🧪 Example 4: Composite CHECK Constraint
CREATE TABLE events (
  start_date DATE,
  end_date   DATE,
  CONSTRAINT chk_event_dates CHECK (start_date < end_date)
);

-- Validates that the event start is before its end.

-------------------------------------------------------------------------------
-- ✅ Tips:
-- • Name composite constraints (`CONSTRAINT name …`) for clarity in errors and maintenance.
-- • Use composite keys only when appropriate—sometimes a surrogate key (single-column PK) is simpler.
-- • Composite UNIQUE and CHECK constraints are powerful for enforcing multi-column business rules.
-- • Composite FOREIGN KEYs require the referenced table to have the matching composite key or unique index.

-------------------------------------------------------------------------------
-- ✅ Summary:
-- Multiple column constraints let you enforce integrity rules that involve more than one column,
-- ensuring your data relationships and business rules remain consistent.

-- END OF LESSON

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);