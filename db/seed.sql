
-- Seed data for users
INSERT INTO users (username, email) VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com'),
    ('user3', 'user3@example.com');

-- Seed data for computers
INSERT INTO computers (computer_name, user_id) VALUES
    ('laptop1', 1),
    ('desktop1', 1),
    ('laptop2', 2),
    ('desktop2', 3);

-- Seed data for applications
INSERT INTO applications (app_name, computer_id) VALUES
    ('app1', 1),
    ('app2', 1),
    ('app3', 2),
    ('app4', 3),
    ('app5', 4);
