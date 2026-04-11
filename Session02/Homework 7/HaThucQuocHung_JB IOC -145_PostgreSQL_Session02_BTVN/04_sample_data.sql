\connect library_management
SET search_path = library, public;

INSERT INTO categories (name, description) VALUES
    ('Science Fiction', 'Science fiction and futuristic stories'),
    ('Programming', 'Books about programming and software engineering'),
    ('Business', 'Business, management, and leadership');

INSERT INTO authors (name, biography) VALUES
    ('Isaac Asimov', 'Science fiction author known for the Foundation series'),
    ('Robert C. Martin', 'Software engineer and author of Clean Code'),
    ('Peter Drucker', 'Management consultant and author of business classics');

INSERT INTO books (ISBN, title, publisher, publication_year, category_id, total_copies, available_copies) VALUES
    ('9780451524935', 'Foundation', 'Gnome Press', 1951, 1, 5, 5),
    ('9780132350884', 'Clean Code', 'Prentice Hall', 2008, 2, 3, 3),
    ('9780060853983', 'The Effective Executive', 'HarperBusiness', 1966, 3, 2, 2);

INSERT INTO book_author (book_id, author_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO members (fullname, email, phone, date_of_birth, address, status) VALUES
    ('Nguyen Van A', 'a.nguyen@example.com', '0123456789', '1995-04-10', '123 Le Loi, HCMC', 'active'),
    ('Le Thi B', 'b.le@example.com', '0987654321', '1998-09-21', '456 Nguyen Trai, HCMC', 'active');

INSERT INTO borrowings (member_id, borrow_date, due_date, return_date) VALUES
    (1, '2026-04-01', '2026-04-15', NULL),
    (2, '2026-04-05', '2026-04-19', '2026-04-18');

INSERT INTO borrowing_detail (borrowing_id, book_id) VALUES
    (1, 1),
    (1, 2),
    (2, 3);
