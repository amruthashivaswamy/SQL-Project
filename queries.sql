USE project;
SELECT * FROM students;

SELECT * FROM courses;

SELECT s.name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';


SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT s.name, c.course_name, r.marks
FROM results r
JOIN exams ex ON r.exam_id = ex.exam_id
JOIN students s ON ex.student_id = s.student_id
JOIN courses c ON ex.course_id = c.course_id;


SELECT s.name, r.marks
FROM results r
JOIN exams ex ON r.exam_id = ex.exam_id
JOIN students s ON ex.student_id = s.student_id
ORDER BY r.marks DESC
LIMIT 1;


SELECT name FROM students
WHERE student_id NOT IN (SELECT student_id FROM enrollment);


SELECT c.course_name
FROM courses c
LEFT JOIN exams e ON c.course_id = e.course_id
WHERE e.exam_id IS NULL;


SELECT c.course_name, AVG(r.marks)
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;


SELECT s.name
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
WHERE r.grade = 'A';


SELECT * FROM exams
WHERE MONTH(exam_date) = 2;


SELECT s.name, r.marks,
CASE
    WHEN r.marks >= 90 THEN 'A'
    WHEN r.marks >= 75 THEN 'B'
    WHEN r.marks >= 50 THEN 'C'
    ELSE 'F'
END AS grade
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id;


SELECT s.name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY total_courses DESC
LIMIT 1;