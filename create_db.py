import sqlite3
import os
def create_db():
    # Read the SQL script
    with open("groups.sql") as f:
        sql = f.read()

    # Create a new database and execute the SQL script
    with sqlite3.connect("groups.db") as con:
        cur = con.cursor()
        cur.executescript(sql)


if __name__ == "__main__":
    create_db()
