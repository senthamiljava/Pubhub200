DROP DATABASE bookapp_db;

CREATE DATABASE bookapp_db;

USE bookapp_db; 

DROP TABLE users;

CREATE TABLE users
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 NAME VARCHAR(200) UNIQUE NOT NULL,
 email VARCHAR(200) NOT NULL,
 PASSWORD VARCHAR(200) NOT NULL
);

insert into users ( name,email,password) values ('Janani', 'jananise@gmail.com', 'test@123');

DROP TABLE books;

CREATE TABLE books
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 NAME VARCHAR(200) NOT NULL,
 price FLOAT NOT NULL
);
 
DROP TABLE orders;

CREATE TABLE orders
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 user_id INT,
 total_price FLOAT NOT NULL DEFAULT 0,
 ordered_date TIMESTAMP DEFAULT NOW(),
 modified_date TIMESTAMP DEFAULT NOW(),
 STATUS VARCHAR(50) DEFAULT 'ORDERED' ,
 CONSTRAINT fk_users_id FOREIGN KEY(user_id) REFERENCES users(id));

DROP TABLE order_items;

CREATE TABLE order_items
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
book_id INT,
quantity INT NOT NULL,
ordered_date TIMESTAMP DEFAULT NOW(),
CONSTRAINT fk_orders_id FOREIGN KEY(order_id) REFERENCES orders(id),
CONSTRAINT fk_books_id FOREIGN KEY(book_id) REFERENCES books(id)
);

INSERT INTO books VALUES(1,'Java',500);

INSERT INTO books VALUES(2,'C',500);

INSERT INTO books VALUES(3,'C++',500);

SELECT SUM(a.qp) total_price
FROM
(SELECT quantity*price qp FROM order_items JOIN books ON books.id=order_items.book_id WHERE order_id=1) a;


