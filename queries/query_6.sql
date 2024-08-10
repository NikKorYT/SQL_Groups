-- Find a list of students in group 2

SELECT
    students.name
FROM
    students
JOIN
    groups
ON
    students.group_id = groups.group_id
WHERE
    groups.group_id = 2;
