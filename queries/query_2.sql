-- find the sudent with the highest average grade in one subject(may, subject_id = 1)
SELECT
    subjects.name AS subject_name,
    students.name AS student_name,
    AVG(marks.mark) AS average_mark
FROM
    students
    JOIN marks ON students.student_id = marks.student_id
    JOIN subjects ON marks.subject_id = subjects.subject_id
GROUP BY
    subjects.subject_id,
    students.student_id
HAVING
    AVG(marks.mark) = (
        SELECT
            MAX(avg_mark)
        FROM
            (
                SELECT
                    AVG(marks.mark) AS avg_mark
                FROM
                    students
                    JOIN marks ON students.student_id = marks.student_id
                WHERE
                    marks.subject_id = subjects.subject_id
                GROUP BY
                    students.student_id
            ) AS subquery
    )
ORDER BY
    subjects.name,
    average_mark DESC;