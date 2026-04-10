-- Create DB
Create database "LibraryDB";

-- Create schema
Create Schema library;

-- Create table
Create Table library.Books(
	book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
	published_year INT,
	price NUMERIC(10,2)
);

--Xem tất cả database
SELECT datname FROM pg_database;

--Xem tất cả schema trong database hiện tại
SELECT schema_name FROM information_schema.schemata;

-- Xem cấu trúc bảng Books
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'books' AND table_schema = 'library';