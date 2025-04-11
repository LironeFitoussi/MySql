-- Exercise 3

-- 1. Delete all cats that are 4 years old
SELECT * FROM cats WHERE age=4;
DELETE FROM cats WHERE age=4;

-- 2. Delete all cats that have same age as id
SELECT * FROM cats WHERE age=cat_id;
DELETE FROM cats WHERE cat_id=age;

-- 3. Delte all cats in the table 
SELECT * FROM cats;
DELETE FROM cats;