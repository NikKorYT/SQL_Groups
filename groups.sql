-- Creating 5 tables,
--1. students(ids and names)
--2. groupes (ids and names)
--3. tutors (ids and names)
--4. subjects (ids, names and tutors ids)
--5. marks (field id, students ids, subjects ids and marks)
-- Creating table students
DROP TABLE IF EXISTS students;

CREATE TABLE
    students (
        student_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL,
        group_id INTEGER,
        FOREIGN KEY (group_id) REFERENCES groups (group_id) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Creating table groups
DROP TABLE IF EXISTS groups;

CREATE TABLE
    groups (
        group_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL
    );

-- Creating table tutors
DROP TABLE IF EXISTS tutors;

CREATE TABLE
    tutors (
        tutor_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL
        
    );

-- Creating table subjects
DROP TABLE IF EXISTS subjects;

CREATE TABLE
    subjects (
        subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL,
        tutor_id INTEGER,
        FOREIGN KEY (tutor_id) REFERENCES tutors (tutor_id) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Creating table marks
DROP TABLE IF EXISTS marks;

CREATE TABLE
    marks (
        mark_id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER,
        subject_id INTEGER,
        mark TINYINT,
        mark_time DATETIME,
        FOREIGN KEY (student_id) REFERENCES students (student_id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (subject_id) REFERENCES subjects (subject_id) ON DELETE CASCADE ON UPDATE CASCADE
    );