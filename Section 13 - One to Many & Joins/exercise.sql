-- Parent table: students
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL
);

-- Child table: papers
CREATE TABLE papers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    grade VARCHAR(50),
    student_id INT NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE CASCADE
);

-- 1. Basic INNER JOIN: only students who have at least one paper
SELECT
    s.id        AS student_id,
    s.first_name,
    p.id        AS paper_id,
    p.title,
    p.grade
FROM
    students AS s
INNER JOIN
    papers   AS p
    ON p.student_id = s.id
ORDER BY
    s.first_name,
    p.title;


INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT
    s.first_name,
    p.title,
    p.grade
FROM
    students AS s
INNER JOIN
    papers   AS p
    ON p.student_id = s.id
ORDER BY
    p.grade
DESC;

----

SELECT
    s.first_name,
    IFNULL(p.title, 'MISSING'),
    IFNULL(p.grade, 0)
FROM
    students AS s
LEFT JOIN
    papers   AS p
    ON p.student_id = s.id
ORDER BY
    s.id
ASC;

-----

SELECT
  s.first_name,
  CASE
    WHEN AVG(p.grade) IS NULL THEN 0
    ELSE CAST(AVG(p.grade) AS DECIMAL(10,4))
  END AS average
FROM
  students AS s
LEFT JOIN
  papers AS p
    ON p.student_id = s.id
GROUP BY
  s.first_name
ORDER BY
  average DESC;

-----

SELECT
  s.first_name,
  CASE
    WHEN AVG(p.grade) IS NULL THEN 0
    ELSE CAST(AVG(p.grade) AS DECIMAL(10,4))
  END AS average,
  CASE WHEN AVG(p.grade) >= 75 THEN "PASSING"
  ELSE "FAILLING"
  END AS passing_status
FROM
  students AS s
LEFT JOIN
  papers AS p
    ON p.student_id = s.id
GROUP BY
  s.first_name
ORDER BY
  average DESC;


