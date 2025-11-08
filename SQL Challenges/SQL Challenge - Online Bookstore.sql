create database if not exists Bookstore_DB;
use Bookstore_DB;

create table Books(
	Book_ID int primary key,
    ISBN int unique,
    Title varchar(100),
    Author varchar(100),
    Price decimal(10,2),
    Stock_Qty int
);

create table Orders(
	Order_ID int auto_increment primary key,
	Book_ID int,
    Quantity int,
    foreign key (Book_ID) references Books(Book_ID) on delete cascade
);

CREATE TABLE Order_History (
    Order_ID INT,
    Book_ID INT,
    Deleted_At DATETIME
);

INSERT INTO Books (Book_ID, ISBN, Title, Author, Price, Stock_Qty)
VALUES
(1, 12345, 'The Great Gatsby', 'F. Scott Fitzgerald', 499.00, 10),
(2, 64587, 'To Kill a Mockingbird', 'Harper Lee', 399.00, 15),
(3, 98765, '1984', 'George Orwell', 299.00, 8),
(4, 45678, 'Pride and Prejudice', 'Jane Austen', 450.00, 12),
(5, 11223, 'The Hobbit', 'J.R.R. Tolkien', 550.00, 5);


INSERT INTO Orders (Book_ID, Quantity)
VALUES (1, 2), (2, 1), (3, 3), (1, 1), (4, 2), (5, 1), (2, 2);   

select * from books;
select * from orders;


-- TRIGGER - AFTER INSERT

delimiter //
create trigger after_deletion
after delete on Orders
for each row
BEGIN
	insert into Order_History
    values (old.order_id, old.book_id, now());
END //
delimiter ;

select * from orders;
select * from order_history;

delete from orders where order_id = 4;
rollback;

select * from books;
select * from orders;

-- TCL COMMANDS 
start transaction;
update books
set Stock_qty = Stock_qty - 3
where Book_id = 1;

savepoint Book1_orders;
rollback; 

update books
set Stock_qty = Stock_qty - 2
where Book_id = 4;

commit;













































/*create table Books(
	Book_ID int primary key
);

create table Orders(
	Order_ID int auto_increment primary key,
	Book_ID int,
    foreign key (Book_ID) references Books(Book_ID) on delete cascade
);

alter table Books add column ISBN int unique;

insert into Books values (1, 12345), (2, 64587);
insert into Orders (Book_ID) values (1) , (2);

select * from books;
select * from orders;

delete from books
where Book_ID = 1;

truncate table orders;

drop table orders;
drop table books; */

