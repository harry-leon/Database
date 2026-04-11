\connect library_management
SET search_path = library, public;

ALTER TABLE members ADD CONSTRAINT members_email_unique UNIQUE (email);
ALTER TABLE members ADD CONSTRAINT members_phone_unique UNIQUE (phone);
ALTER TABLE members ADD CONSTRAINT members_status_check CHECK (status IN ('active', 'inactive'));

ALTER TABLE categories ADD CONSTRAINT categories_name_unique UNIQUE (name);

ALTER TABLE books ADD CONSTRAINT books_isbn_unique UNIQUE (ISBN);
ALTER TABLE books ADD CONSTRAINT books_total_copies_check CHECK (total_copies >= 0);
ALTER TABLE books ADD CONSTRAINT books_available_copies_check CHECK (available_copies >= 0 AND available_copies <= total_copies);
ALTER TABLE books ADD CONSTRAINT books_category_fk FOREIGN KEY (category_id) REFERENCES categories(category_id);

ALTER TABLE book_author ADD CONSTRAINT book_author_book_fk FOREIGN KEY (book_id) REFERENCES books(book_id);
ALTER TABLE book_author ADD CONSTRAINT book_author_author_fk FOREIGN KEY (author_id) REFERENCES authors(author_id);

ALTER TABLE borrowings ADD CONSTRAINT borrowings_member_fk FOREIGN KEY (member_id) REFERENCES members(member_id);
ALTER TABLE borrowings ADD CONSTRAINT borrowings_return_date_check CHECK (return_date IS NULL OR return_date >= borrow_date);

ALTER TABLE borrowing_detail ADD CONSTRAINT borrowing_detail_borrowing_fk FOREIGN KEY (borrowing_id) REFERENCES borrowings(borrowing_id);
ALTER TABLE borrowing_detail ADD CONSTRAINT borrowing_detail_book_fk FOREIGN KEY (book_id) REFERENCES books(book_id);
