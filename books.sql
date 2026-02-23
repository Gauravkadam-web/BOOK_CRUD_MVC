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



INSERT INTO books (title, author, category, price) VALUES
('The Silent Forest', 'Arun Sharma', 'Fiction', 499.00),
('Java Fundamentals', 'James Gosling', 'Programming', 799.00),
('Spring Boot in Action', 'Craig Walls', 'Programming', 899.00),
('The Lost Kingdom', 'Ravi Verma', 'Fantasy', 599.00),
('Data Structures Made Easy', 'Narasimha Karumanchi', 'Education', 650.00),
('Clean Code', 'Robert C. Martin', 'Programming', 950.00),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 550.00),
('Think and Grow Rich', 'Napoleon Hill', 'Self-Help', 450.00),
('Atomic Habits', 'James Clear', 'Self-Help', 699.00),
('The Alchemist', 'Paulo Coelho', 'Fiction', 399.00),

('Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 499.00),
('The Power of Habit', 'Charles Duhigg', 'Self-Help', 620.00),
('Head First Java', 'Kathy Sierra', 'Programming', 870.00),
('Effective Java', 'Joshua Bloch', 'Programming', 990.00),
('The Pragmatic Programmer', 'Andrew Hunt', 'Programming', 920.00),
('Introduction to Algorithms', 'Thomas H. Cormen', 'Education', 1200.00),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 550.00),
('Harry Potter 1', 'J.K. Rowling', 'Fantasy', 600.00),
('The Psychology of Money', 'Morgan Housel', 'Finance', 700.00),
('Deep Work', 'Cal Newport', 'Self-Help', 650.00),

('Zero to One', 'Peter Thiel', 'Business', 480.00),
('The Lean Startup', 'Eric Ries', 'Business', 750.00),
('The 7 Habits of Highly Effective People', 'Stephen Covey', 'Self-Help', 680.00),
('Digital Fortress', 'Dan Brown', 'Thriller', 520.00),
('The Da Vinci Code', 'Dan Brown', 'Thriller', 560.00),
('Angels and Demons', 'Dan Brown', 'Thriller', 530.00),
('The Monk Who Sold His Ferrari', 'Robin Sharma', 'Self-Help', 450.00),
('You Can Win', 'Shiv Khera', 'Self-Help', 400.00),
('C Programming Language', 'Dennis Ritchie', 'Programming', 880.00),
('Python Crash Course', 'Eric Matthes', 'Programming', 770.00),

('Artificial Intelligence Basics', 'Tom Taulli', 'Technology', 820.00),
('Machine Learning Yearning', 'Andrew Ng', 'Technology', 910.00),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 300.00),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 350.00),
('1984', 'George Orwell', 'Dystopian', 420.00),
('The Catcher in the Rye', 'J.D. Salinger', 'Classic', 380.00),
('Sapiens', 'Yuval Noah Harari', 'History', 880.00),
('Homo Deus', 'Yuval Noah Harari', 'History', 920.00),
('Ikigai', 'Hector Garcia', 'Self-Help', 500.00),
('The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'Self-Help', 650.00),

('The Road Less Traveled', 'M. Scott Peck', 'Self-Help', 540.00),
('Grit', 'Angela Duckworth', 'Self-Help', 600.00),
('Rework', 'Jason Fried', 'Business', 520.00),
('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 'Programming', 1100.00),
('Design Patterns', 'Erich Gamma', 'Programming', 980.00),
('Refactoring', 'Martin Fowler', 'Programming', 930.00),
('The Shining', 'Stephen King', 'Horror', 560.00),
('Dracula', 'Bram Stoker', 'Horror', 420.00),
('The Fault in Our Stars', 'John Green', 'Romance', 450.00),
('Pride and Prejudice', 'Jane Austen', 'Classic', 390.00);

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


INSERT INTO book (title, author, category, price) VALUES
('The Silent Forest', 'Arun Sharma', 'Fiction', 499.00),
('Java Fundamentals', 'James Gosling', 'Programming', 799.00),
('Spring Boot in Action', 'Craig Walls', 'Programming', 899.00),
('The Lost Kingdom', 'Ravi Verma', 'Fantasy', 599.00),
('Data Structures Made Easy', 'Narasimha Karumanchi', 'Education', 650.00),
('Clean Code', 'Robert C. Martin', 'Programming', 950.00),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 550.00),
('Think and Grow Rich', 'Napoleon Hill', 'Self-Help', 450.00),
('Atomic Habits', 'James Clear', 'Self-Help', 699.00),
('The Alchemist', 'Paulo Coelho', 'Fiction', 399.00),

('Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 499.00),
('The Power of Habit', 'Charles Duhigg', 'Self-Help', 620.00),
('Head First Java', 'Kathy Sierra', 'Programming', 870.00),
('Effective Java', 'Joshua Bloch', 'Programming', 990.00),
('The Pragmatic Programmer', 'Andrew Hunt', 'Programming', 920.00),
('Introduction to Algorithms', 'Thomas H. Cormen', 'Education', 1200.00),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 550.00),
('Harry Potter 1', 'J.K. Rowling', 'Fantasy', 600.00),
('The Psychology of Money', 'Morgan Housel', 'Finance', 700.00),
('Deep Work', 'Cal Newport', 'Self-Help', 650.00),

('Zero to One', 'Peter Thiel', 'Business', 480.00),
('The Lean Startup', 'Eric Ries', 'Business', 750.00),
('The 7 Habits of Highly Effective People', 'Stephen Covey', 'Self-Help', 680.00),
('Digital Fortress', 'Dan Brown', 'Thriller', 520.00),
('The Da Vinci Code', 'Dan Brown', 'Thriller', 560.00),
('Angels and Demons', 'Dan Brown', 'Thriller', 530.00),
('The Monk Who Sold His Ferrari', 'Robin Sharma', 'Self-Help', 450.00),
('You Can Win', 'Shiv Khera', 'Self-Help', 400.00),
('C Programming Language', 'Dennis Ritchie', 'Programming', 880.00),
('Python Crash Course', 'Eric Matthes', 'Programming', 770.00),

('Artificial Intelligence Basics', 'Tom Taulli', 'Technology', 820.00),
('Machine Learning Yearning', 'Andrew Ng', 'Technology', 910.00),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 300.00),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 350.00),
('1984', 'George Orwell', 'Dystopian', 420.00),
('The Catcher in the Rye', 'J.D. Salinger', 'Classic', 380.00),
('Sapiens', 'Yuval Noah Harari', 'History', 880.00),
('Homo Deus', 'Yuval Noah Harari', 'History', 920.00),
('Ikigai', 'Hector Garcia', 'Self-Help', 500.00),
('The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'Self-Help', 650.00),

('The Road Less Traveled', 'M. Scott Peck', 'Self-Help', 540.00),
('Grit', 'Angela Duckworth', 'Self-Help', 600.00),
('Rework', 'Jason Fried', 'Business', 520.00),
('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 'Programming', 1100.00),
('Design Patterns', 'Erich Gamma', 'Programming', 980.00),
('Refactoring', 'Martin Fowler', 'Programming', 930.00),
('The Shining', 'Stephen King', 'Horror', 560.00),
('Dracula', 'Bram Stoker', 'Horror', 420.00),
('The Fault in Our Stars', 'John Green', 'Romance', 450.00),
('Pride and Prejudice', 'Jane Austen', 'Classic', 390.00);
