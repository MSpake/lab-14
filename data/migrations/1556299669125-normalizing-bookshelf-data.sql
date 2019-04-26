-- Creates a new table called bookshelves that has two columns, id and name. 
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Selects all unique bookshelf names from the books table and inserts them into the bookshelves table name column.
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- Adds a bookshelf_id column to the books table.
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- Updates the books table bookshelf_id column by setting the bookshelf_id value to the id value of the bookshelf row where the bookshelf names match.
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- Removes the bookshelf column from the books table.
ALTER TABLE books DROP COLUMN bookshelf;

-- Sets the relation between books and bookshelf on bookshelf_id/bookshelves(id).
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
