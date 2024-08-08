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
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL
    );

-- Creating table groups
DROP TABLE IF EXISTS groups;
CREATE TABLE
    groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL
    );

-- Creating table tutors
DROP TABLE IF EXISTS tutors;
CREATE TABLE
    tutors (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL
    );

-- Creating table subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE
    subjects (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL,
        tutor_id INTEGER,
        FOREIGN KEY (tutor_id) REFERENCES tutors (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Creating table marks
DROP TABLE IF EXISTS marks;
CREATE TABLE
    marks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER,
        subject_id INTEGER,
        mark TINYINT,
        FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE ON UPDATE CASCADE
    );