import faker
import sqlite3
import random
from random import randint

students_number = randint(30, 50)
groups_number = 3
tutors_number = randint(3, 5)
subjects_number = randint(5, 8)


def generate_students():
    """Generate students' names and surnames, and randomly choose group_id (1-3)"""
    fake = faker.Faker()
    students = []
    for student_name in range(students_number):
        students.append(
            (f"{fake.first_name()} {fake.last_name()}", randint(1, groups_number))
        )
    return students


def generate_groups():
    """Generate names for 3 groups"""
    fake = faker.Faker()
    groups = []
    for group_name in range(groups_number):
        groups.append((fake.word(),))
    return groups


def generate_tutors():
    """Generate tutors' names and surnames"""
    fake = faker.Faker()
    tutors = []
    for tutor_name in range(tutors_number):
        tutors.append((f"{fake.first_name()} {fake.last_name()}", ))
    return tutors


def generate_subjects():
    """Generate names for subjects, and randomly choose tutor_id (1-5).
    Each tutor must have at least one subject, but can have more than one.
    """
    fake = faker.Faker()
    subjects = []

    # Step 1: Assign one subject to each tutor
    for tutor_id in range(1, tutors_number + 1):
        subjects.append((fake.word(), tutor_id))

    # Step 2: Assign remaining subjects randomly
    for _ in range(subjects_number - tutors_number):
        subjects.append((fake.word(), random.randint(1, tutors_number)))

    return subjects


def generate_marks():
    """Generate marks for each subject for each student
    there must be from 1 to 3 marks for each student for each subject
    mark is a random number from 1 to 100
    also there must be a random time for each mark
    """
    marks = []
    for student_id in range(1, students_number + 1):
        for subject_id in range(1, subjects_number + 1):
            for mark in range(randint(1, 3)):
                marks.append((student_id, subject_id, randint(1, 100), faker.Faker().date_this_year()))
    return marks


def fill_tables():
    """Fill tables with generated data"""
    with sqlite3.connect("groups.db") as con:
        cur = con.cursor()
        # Clear existing data
        cur.execute("DELETE FROM students")
        cur.execute("DELETE FROM groups")
        cur.execute("DELETE FROM tutors")
        cur.execute("DELETE FROM subjects")
        cur.execute("DELETE FROM marks")

        # Reset auto-increment counters
        cur.execute("DELETE FROM sqlite_sequence WHERE name='students'")
        cur.execute("DELETE FROM sqlite_sequence WHERE name='groups'")
        cur.execute("DELETE FROM sqlite_sequence WHERE name='tutors'")
        cur.execute("DELETE FROM sqlite_sequence WHERE name='subjects'")
        cur.execute("DELETE FROM sqlite_sequence WHERE name='marks'")

        # tables are alredy created, so we can fill them with data

        cur.executemany(
            "INSERT INTO students (name, group_id) VALUES (?, ?)", generate_students()
        )
        cur.executemany("INSERT INTO groups (name) VALUES (?)", generate_groups())
        cur.executemany("INSERT INTO tutors (name) VALUES (?)", generate_tutors())
        cur.executemany("INSERT INTO subjects (name, tutor_id) VALUES (?, ?)", generate_subjects())
        cur.executemany(
            "INSERT INTO marks (student_id, subject_id, mark, mark_time) VALUES (?, ?, ?, ?)",
            generate_marks(),
        )
        con.commit()


if __name__ == "__main__":
    fill_tables()
    print("Data has been filled successfully!")
