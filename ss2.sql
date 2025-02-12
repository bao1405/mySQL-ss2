CREATE database ss2;
USE ss2;

drop table tbl_UserDetails;
-- bai1 
CREATE Table tbl_UserDetails(
	Id int NOT NULL primary key,
    fullname varchar(255) NOT NULL,
    description text,
    phone_number char(10),
    created_at datetime,
    is_active bit,
    total_amount decimal(10,2),
    last_login timestamp
);
-- bai2
drop table tbl_OrdersDetails;
CREATE Table tbl_OrdersDetails(
	Id int primary key AUTO_INCREMENT,
    email varchar(250) unique NOT NULL,
    order_date date Not Null,
    total_price double ,
    quantity int check(length(quantity)>0),
    status bit,
    delivery_address varchar(255) not null,
    payment_method varchar(50) default 'cash',
    created_at datetime default now()
);
-- bai3
drop table tbl_orders;
drop table tbl_Customers;
Create Table tbl_Customers(
	ID int primary key AUTO_INCREMENT,
    name varchar(255) Not null,
    email varchar(255) not null unique,
    phone_number char(10) not null ,
    create_at datetime default now()
);

Create Table tbl_orders(
	ID int primary key AUTO_INCREMENT,
    order_date date not null,
    customer_Id Int,
    Foreign key (customer_Id) references tbl_Customers(ID)
);

-- bai4
drop table tbl_Customers;
Create Table tbl_Customers(
	customer_Id int primary key AUTO_INCREMENT,
    name varchar(255) Not null,
    email varchar(255) not null unique,
    phone char(15) ,
    create_at datetime default now()
);

Create Table tbl_orders(
	order_Id int primary key AUTO_INCREMENT,
    order_date date not null,
    amount decimal(10,2)
);

-- 1
alter table tbl_Customers drop phone;
-- 2
drop table tbl_orders;
-- 3
alter table tbl_Customers drop name;
alter table tbl_Customers add fullname varchar(255);
-- 4
alter table tbl_Customers drop index email ;
alter table tbl_Customers modify column email Text;
-- 5
alter table tbl_Customers add address Text;

-- bai5
drop table tbl_book;
drop table tbl_authors;
create table tbl_authors(
	ID int primary key AUTO_INCREMENT,
    name varchar(255) not null,
    email varchar(255) not null unique,
    bio text
);

create table tbl_book(
	ID int primary key AUTO_INCREMENT,
    title varchar(255) not null,
    price decimal(10,2) check(price>0),
    author_id int,
    foreign key (author_id) references tbl_authors(ID),
    published_at date not null,
    stock int check(stock>=0)
);

alter table tbl_authors modify column bio varchar(500);
alter table tbl_book add update_at datetime default now();
-- bai6
drop table tbl_Enrollments;
drop table tbl_Courses;
create table tbl_Courses(
	courses_id int primary key AUTO_INCREMENT,
    courses_name varchar(255) not null,
    description varchar(255) not null,
    start_date date
);

create table tbl_Enrollments(
	student_id int primary key AUTO_INCREMENT,
    course_id int not null,
	enrollment_date date,
    status bit
);

alter table tbl_Courses add max_student int;
alter table tbl_Enrollments drop status;
alter table tbl_Enrollments add enrollment_status bit;
alter table tbl_Enrollments add grade int;
alter table tbl_Courses drop start_date;
alter table tbl_Courses modify column courses_name varchar(1000);

-- bai7
