-- Find marks of group 1 students in subject 4
-- output colums with grades and students names

SELECT
    students.name,
    marks.mark
FROM
    students
JOIN
    marks
ON
    students.student_id = marks.student_id
JOIN
    subjects
ON
    marks.subject_id = subjects.subject_id
JOIN
    groups
ON
    students.group_id = groups.group_id
WHERE
    groups.group_id = 1
AND
    subjects.subject_id = 4;
