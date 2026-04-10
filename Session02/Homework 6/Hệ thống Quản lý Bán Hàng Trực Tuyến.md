CREATE DATABASE ecommercedb;
CREATE SCHEMA shop;

CREATE TABLE shop.Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
        CHECK (role IN ('Customer','Admin'))
);

CREATE TABLE shop.Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE shop.Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    category_id INT NOT NULL REFERENCES shop.Categories(category_id)
);

CREATE TABLE shop.Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES shop.Users(user_id),
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Pending','Shipped','Delivered','Cancelled'))
);

CREATE TABLE shop.OrderDetails (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES shop.Orders(order_id) ON DELETE CASCADE,
    product_id INT N REFERENCES shop.Products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    price_each NUMERIC(10,2) NOT NULL CHECK (price_each > 0)
);

CREATE TABLE shop.Payments (
    payment_id SERIAL PRIMARY KEY,REFERENCES shop.Orders(order_id),
    amount NUMERIC(10,2) CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    method VARCHAR(30)CHECK (method IN ('Credit Card','Momo','Bank Transfer','Cash'))
);