CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    major VARCHAR(50)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credit INT
);

CREATE TABLE enrollments (
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    score NUMERIC(5,2)
);

INSERT INTO students (full_name, major) VALUES
('Nguyen Van A', 'Computer Science'),
('Tran Thi B', 'Information Systems'),
('Le Van C', 'Software Engineering'),
('Pham Thi D', 'Data Science');

INSERT INTO courses (course_name, credit) VALUES
('Database Systems', 3),
('Web Development', 4),
('Machine Learning', 3),
('Data Structures', 3);

INSERT INTO enrollments (student_id, course_id, score) VALUES
(1, 1, 8.5),
(1, 2, 7.0),
(2, 1, 9.0),
(2, 3, 8.0),
(3, 2, 6.5),
(3, 4, 7.5),
(4, 3, 9.5),
(4, 4, 8.5);

SELECT 
    s.full_name AS "Tên sinh viên",
    c.course_name AS "Môn học",
    e.score AS "Điểm"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

SELECT 
    s.student_id,
    s.full_name AS "Tên sinh viên",
    AVG(e.score) AS "Điểm trung bình",
    MAX(e.score) AS "Điểm cao nhất",
    MIN(e.score) AS "Điểm thấp nhất"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name;

SELECT 
    s.major AS "Ngành học",
    AVG(e.score) AS "Điểm trung bình"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.major
HAVING AVG(e.score) > 7.5;

SELECT 
    s.full_name AS "Tên sinh viên",
    c.course_name AS "Môn học",
    c.credit AS "Số tín chỉ",
    e.score AS "Điểm"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

SELECT 
    s.student_id,
    s.full_name AS "Tên sinh viên",
    AVG(e.score) AS "Điểm trung bình"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name
HAVING AVG(e.score) > (
    SELECT AVG(score)
    FROM enrollments
);