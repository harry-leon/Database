CREATE SCHEMA sales;

CREATE TABLE sales.Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    price NUMERIC(10,2),
    stock_quantity INTEGER
);

CREATE TABLE sales.Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    member_id INTEGER,
    member_id not null REFERENCES library.Members(member_id)
);

CREATE TABLE sales.OrderDetails (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    order_id not null REFERENCES sales.Orders(order_id),
    product_id not null REFERENCES sales.Products(product_id)
);