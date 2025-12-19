DROP DATABASE IF EXISTS bookdb;
CREATE DATABASE bookdb;

\c bookdb;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
id SERIAL PRIMARY KEY,
title VARCHAR(150) NOT NULL,
author VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(8,2) NOT NULL
);

INSERT INTO books (title, author, category, price) VALUES
('Clean Code', 'Robert C. Martin', 'Programming', 499.00),
('Effective Java', 'Joshua Bloch', 'Programming', 650.00),
('Atomic Habits', 'James Clear', 'Self Help', 399.00),
('The Alchemist', 'Paulo Coelho', 'Fiction', 299.00),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 350.00),
('Head First Java', 'Kathy Sierra', 'Programming', 550.00),
('Think Like a Monk', 'Jay Shetty', 'Self Help', 420.00),
('The Power of Habit', 'Charles Duhigg', 'Self Help', 380.00),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 450.00),
('The Psychology of Money', 'Morgan Housel', 'Finance', 390.00);

SELECT * FROM books;

---------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS bookdb1;
CREATE DATABASE bookdb1;

\c bookdb1;

DROP TABLE IF EXISTS book;

CREATE TABLE book (
id SERIAL PRIMARY KEY,
title VARCHAR(150) NOT NULL,
author VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(8,2) NOT NULL
);

INSERT INTO book (title, author, category, price) VALUES
('Clean Code', 'Robert C. Martin', 'Programming', 499.00),
('Effective Java', 'Joshua Bloch', 'Programming', 650.00),
('Atomic Habits', 'James Clear', 'Self Help', 399.00),
('The Alchemist', 'Paulo Coelho', 'Fiction', 299.00),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 350.00),
('Head First Java', 'Kathy Sierra', 'Programming', 550.00),
('Think Like a Monk', 'Jay Shetty', 'Self Help', 420.00),
('The Power of Habit', 'Charles Duhigg', 'Self Help', 380.00),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 450.00),
('The Psychology of Money', 'Morgan Housel', 'Finance', 390.00);

SELECT * FROM book;