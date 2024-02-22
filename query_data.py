#!/usr/bin/env python3

import psycopg2

def connect():
    try:
        conn = psycopg2.connect(
            dbname="mydatabase",
            user="myuser",
            password="mypassword",
            host="db",
            port="5432"
        )
        return conn
    except psycopg2.Error as e:
        print("Error connecting to PostgreSQL database:", e)

def create_tables(conn):
    try:
        cur = conn.cursor()
        with open('create.sql', 'r') as f:
            cur.execute(f.read())
        conn.commit()
        print("Tables created successfully!")
    except psycopg2.Error as e:
        print("Error creating tables:", e)
        conn.rollback()

def seed_data(conn):
    try:
        cur = conn.cursor()
        with open('seed.sql', 'r') as f:
            cur.execute(f.read())
        conn.commit()
        print("Tables seeded successfully!")
    except psycopg2.Error as e:
        print("Error seeding tables with data:", e)
        conn.rollback()


def query_users(conn):
    try:
        cur = conn.cursor()
        cur.execute("SELECT * FROM users")
        rows = cur.fetchall()
        for row in rows:
            print(row)
    except psycopg2.Error as e:
        print("Error querying users:", e)


def query_data(conn):
	try:
		cur = conn.cursor()
		query = """
			SELECT u.username, a.app_name, c.computer_name
			FROM users u
			JOIN computers c ON u.user_id = c.user_id
			JOIN applications a ON c.computer_id = a.computer_id
		"""
		cur.execute(query)
		rows = cur.fetchall()
		for row in rows:
			print(f"Username: {row[0]}, Application Name: {row[1]}, Computer Name: {row[2]}")
	except psycopg2.Error as e:
		print("Error executing query:", e)

if __name__ == "__main__":
    conn = connect()
    if conn is not None:
        create_tables(conn)
        seed_data(conn)
        query_data(conn)
        conn.close()


