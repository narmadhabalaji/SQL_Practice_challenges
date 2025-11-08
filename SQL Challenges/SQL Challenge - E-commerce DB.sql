/* ORDER BY & LIMIT - E-Commerce*/
create database Ecommerce;
use Ecommerce;

create table Products(
	product_id int auto_increment primary key,
    product_name varchar(100) not null,
    price double
);

select * from products;

insert into products (product_name, price)
values 
('Laptop', 65000),
('Smartphone', 48000),
('Headphones', 3500),
('Smartwatch', 12000),
('Tablet', 30000),
('Monitor', 18000),
('Keyboard', 2500);

select * from products
order by price desc limit 3;








