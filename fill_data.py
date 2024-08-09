import faker
import sqlite3
from random import randint

students_number = randint(30, 50)
groups_number = 3
tutors_number = randint(3, 5)
subjects_number = randint(5, 8)

def generate_students():
    fake = faker.Faker()
    students = []
    for _ in range(students_number):
        students.append((fake.first_name(), fake.last_name(), randint(1, groups_number)))
    return students