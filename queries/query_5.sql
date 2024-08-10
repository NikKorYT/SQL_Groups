-- Find what subjects does tutor 2 teach

SELECT
    subjects.name
FROM
    subjects
JOIN
    tutors
ON
    subjects.tutor_id = tutors.tutor_id
WHERE
    tutors.tutor_id = 2;
