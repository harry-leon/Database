Create database library_management;
Create schema library;
Create table library.books(
    id serial primary key,
    title varchar(255) not null,
    isbn varchar(20) not null unique,
    author varchar(255) not null,
    publication_year date not null,
    category_id INT
);

Create table library.readers(
    id serial primary key,
    name varchar(100) not null,
    year_of_birth date not null,
    address varchar(100) not null,
    phone varchar(20) unique
);

create table library.borrowings(
    id serial primary key,
    reader_id foreign key references library.readers(id),
    book_id int foreign key references library.books(id),
    borrow_date int date default current_date,
    due_date date not null,
    status varchar(20) default 'borrowed' check (status in ('borrowed', 'returned'))
);