-- find what subject does student 29 take
-- output columns with course names
--delete the repeated course names

SELECT DISTINCT subjects.name AS course_name
FROM marks
JOIN subjects ON marks.subject_id = subjects.subject_id
WHERE marks.student_id = 29;
