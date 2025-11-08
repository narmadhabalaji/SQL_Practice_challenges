/* Aggregate Functions - Sales*/
create database sales_db;
use sales_db;

create table sales(
	Order_id int auto_increment primary key,
    product_id int unique,
    quantity int not null,
    total_amount double
);

select* from sales;

INSERT INTO sales (product_id, quantity, total_amount) VALUES
(1, 2, 130000),
(2, 3, 135000),
(4, 5, 60000),
(3, 10, 35000),
(6, 4, 72000);

-- sum
select sum(total_amount) as Total_Revenue from sales;

-- count
select count(order_id) No_of_Orders from sales;

-- avg
select avg(total_amount) Avg_Rev from sales;
 /*
 select round(avg(total_amount), 2) as Avg_Rev from sales;
*/
-- min
select min(total_amount) Lowest_price from sales;

-- max
select max(total_amount) highest_price from sales;



 