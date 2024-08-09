-- Find the 5 students with the highest average score in all subjects.

SELECT students.name, 
AVG(marks.mark) AS average_mark
FROM students
JOIN marks ON students.student_id = marks.student_id
GROUP BY
    students.student_id
ORDER BY    
    average_mark DESC   
LIMIT 5;