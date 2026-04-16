-- DATABASE SETUP

create database onlinebookstore;
use onlinebookstore;

-- TABLES CREATION
create table  books(
Book_ID int	auto_increment primary key,
Title varchar(100),
	Author varchar(100),
	Genre varchar(50),
	Published_Year int,
	Price numeric(10,2),
	Stock int
);


create table  customers(
Customer_ID int auto_increment primary key,
	Name varchar(100) ,
	Email varchar(100),
	Phone varchar(15),
	City varchar(100),
	Country varchar(150)
);

CREATE TABLE Orders (
    Order_ID int auto_increment PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (book_id) REFERENCES books(book_ID)
);
