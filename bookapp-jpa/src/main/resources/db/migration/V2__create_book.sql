
CREATE TABLE books
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 NAME VARCHAR(200) NOT NULL,
 price FLOAT NOT NULL,
 released_date date 
);

insert into books ( name,price,released_date) values ('Core Java', 350,'2017-04-10');
insert into books ( name,price,released_date) values ('MySQL', 200,'2017-01-20');
insert into books ( name,price,released_date) values ('Javascript', 250, '2017-03-12');