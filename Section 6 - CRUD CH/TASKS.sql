-- 1. Create a DB named shirts_db:
CREATE DATABASE shirts_db;
USE shirts_db;

-- 2. Create shirts table:
CREATE TABLE shirts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    shirt_size VARCHAR(10) NOT NULL,
    last_worn INT NOT NULL
);

DESC shirts;

-- 3. Get All That Data In There 
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

-- 4. Add a New Shirt
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

-- 5. SELECT all shirts
SELECT article, color FROM shirts;

-- 6. SELECT all medium shirts
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size="M";

-- 7. Update all polo shirts
UPDATE shirts SET shirt_size="L" WHERE article="polo shirt";

-- 8. Update the shirt last worn 15 days ago
UPDATE shirts SET last_worn=0 WHERE last_worn=15;

-- 9. Update all white shirts
UPDATE shirts SET shirt_size="XS", color="off white" WHERE color="white";

-- 10. Delete all old shirts
DELETE FROM shirts WHERE last_worn=200;

-- 11. Delete all tank tops
DELETE FROM shirts WHERE article="tank top";

-- 12. Delete all shirts
DELETE FROM shirts;

-- FINAL 
DROP TABLE shirts;