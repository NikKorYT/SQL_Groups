-- Find a list of subjects that tutor 3 teaches to student 18
-- subjects are not repeated
-- output columns with subject names

SELECT DISTINCT subjects.name AS subject_name
FROM marks
JOIN subjects ON marks.subject_id = subjects.subject_id
JOIN tutors ON subjects.tutor_id = tutors.tutor_id
WHERE marks.student_id = 18
AND tutors.tutor_id = 3;


