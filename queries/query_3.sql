-- find an average mark for a group 1 in each subject

SELECT
    subjects.name AS subject_name,
    AVG(marks.mark) AS average_mark
FROM
    subjects
    JOIN marks ON subjects.subject_id = marks.subject_id
    JOIN students ON marks.student_id = students.student_id
WHERE
    students.group_id = 1
GROUP BY
    subjects.subject_id
ORDER BY
    subjects.name;


