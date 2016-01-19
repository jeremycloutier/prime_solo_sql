--Exercise
--Write a comment that specifies which question you are answering. (SQL comments are two dashes, followed by text.)
--Write the SQL query that answers the question, below that comment.

--1.Which authors are represented in our store?
SELECT * FROM authors;

--2. Which authors are also distinguished authors?
SELECT * FROM distinguished_authors;

--3. Which authors are not distinguished authors?
SELECT * FROM authors LEFT JOIN distinguished_authors ON authors.first_name = distinguished_authors.first_name WHERE award IS null;

--4. How many authors are represented in our store?
SELECT COUNT(id) FROM authors;

--5. Who are the favorite authors of the employee with the first name of Michael?
SELECT * FROM favorite_authors;

--6. What are the titles of all the books that are in stock today?
SELECT title FROM books JOIN editions
ON books.id = editions.book_id JOIN stock
ON editions.isbn = stock.isbn WHERE stock != 0;

--7. Insert one of your favorite books into the database. Hint: You’ll want to create data in at least 2 other tables to completely create this book.
INSERT INTO books (id, title, author_id, subject_id)
    VALUES (12345, 'The Unifying Force', 6789, 2456);
INSERT INTO book_backup (id, title, author_id, subject_id)
    VALUES (12345, 'The Unifying Force', 6789, 2456);

--8. What authors have books that are not in stock?
SELECT first_name, last_name FROM authors JOIN books
ON authors.id = books.author_id JOIN editions
ON books.id = editions.book_id JOIN stock
ON editions.isbn = stock.isbn WHERE stock = 0;

--9. What is the title of the book that has the most stock?
SELECT title FROM books INNER JOIN editions
ON books.id = editions.book_id WHERE isbn IN
(SELECT isbn FROM stock WHERE stock = (SELECT MAX(stock) FROM stock));