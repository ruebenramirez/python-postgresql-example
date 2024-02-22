-- Drop foreign key constraints if they exist
ALTER TABLE IF EXISTS applications DROP CONSTRAINT IF EXISTS applications_computer_id_fkey;
ALTER TABLE IF EXISTS computers DROP CONSTRAINT IF EXISTS computers_user_id_fkey;

-- Drop tables if they exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS computers;
DROP TABLE IF EXISTS applications;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE computers (
    computer_id SERIAL PRIMARY KEY,
    computer_name VARCHAR(100) UNIQUE NOT NULL,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE applications (
    app_id SERIAL PRIMARY KEY,
    app_name VARCHAR(100) UNIQUE NOT NULL,
    computer_id INT REFERENCES computers(computer_id) ON DELETE CASCADE
);
