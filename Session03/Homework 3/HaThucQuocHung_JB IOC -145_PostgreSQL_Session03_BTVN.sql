CREATE DATABASE sales_management;

CREATE SCHEMA retail;

CREATE TABLE retail.customers (
    customer_id serial PRIMARY KEY,
    full_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    phone varchar(20),
    address varchar(500)
);

CREATE TABLE retail.products (
    product_id serial PRIMARY KEY,
    product_code varchar(50) NOT NULL UNIQUE,
    product_name varchar(255) NOT NULL,
    price numeric(12,2) NOT NULL,
    product_type varchar(100)
);

CREATE TABLE retail.orders (
    order_id serial PRIMARY KEY,
    order_date date NOT NULL DEFAULT current_date,
    total_amount numeric(14,2) NOT NULL,
    customer_id int NOT NULL REFERENCES retail.customers(customer_id)
);

CREATE TABLE retail.order_details (
    order_detail_id serial PRIMARY KEY,
    quantity int NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    product_id int NOT NULL REFERENCES retail.products(product_id),
    order_id int NOT NULL REFERENCES retail.orders(order_id)
);
