--Find an average mark that tutor 2 gives to his students

SELECT
    AVG(marks.mark)
FROM
    marks
JOIN
    subjects
ON
    marks.subject_id = subjects.subject_id
JOIN
    tutors
ON
    subjects.tutor_id = tutors.tutor_id
WHERE
    tutors.tutor_id = 2;
