\connect library_management
SET search_path = library, public;

CREATE TABLE IF NOT EXISTS members (
    member_id SERIAL PRIMARY KEY,
    fullname VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    address VARCHAR(200),
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE IF NOT EXISTS authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    biography TEXT
);

CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL PRIMARY KEY,
    ISBN VARCHAR(20),
    title VARCHAR(200),
    publisher VARCHAR(100),
    publication_year INT,
    category_id INT,
    total_copies INT,
    available_copies INT
);

CREATE TABLE IF NOT EXISTS book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE IF NOT EXISTS borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    member_id INT,
    borrow_date DATE DEFAULT CURRENT_DATE,
    due_date DATE,
    return_date DATE
);

CREATE TABLE IF NOT EXISTS borrowing_detail (
    borrowing_id INT,
    book_id INT,
    PRIMARY KEY (borrowing_id, book_id)
);
