use onlinebookstore;

select * from books;
select * from customers;
select * from orders;

-- BASIC QUERIES

-- 1 retrieve all books in the 'fiction' genre:
select * from books
 where genre ='fiction';

-- 2 find books published after year 1950:
 select * from books 
 where published_year >1950;
 
 -- 3 list all customers from the canada:
 select * from customers 
 where country ="canada";
 
 -- 4 show orders placed in november 2023:
 select * from  orders 
 where order_date between '2023-11-01' and '2023-11-30';
 
 -- 5 find the details of the most expensive books;
 select * from books 
 order by Price desc limit 1;
 
 -- 6 retrieve the total stock of books available ;
 select sum(stock) as totalstock from books;
 
 -- 7 show all customers who ordered more than 1 quantity of a book;
 select * from orders where Quantity > 1;
 
-- 8 retrieve all orders where the total ampunt exceeds $20;
select * from orders
 where Total_Amount>20;

-- 9 list all genre available in the books table ;
select distinct genre from books;

-- 10 find the book with lowest stock;
 select * from books order by stock asc limit 1 ;
 
 -- 11 calculate the total revenue from all orders;
 select sum(total_amount) as revenue from orders;
 
 -- ADVANCE QUERIES
 
 -- 1 retreive total number of books sold for each genre;
 select b.genre,sum(o.quantity ) as total_quantity
 from books b
 join orders o
 on b.Book_ID = o.Book_ID
 group by b.genre;
 
 -- 2 find the average price of books in the fantacy genre;
 select avg(price) as average_price from books
 where genre ="fantasy";
 
 -- 3 list customers who have placed at least 2 orders;
 select customer_id ,count(order_id)as order_count
 from orders
 group by customer_id
 having count(order_id)>=2;

-- 4 find the more frequent ordered book;
select o.book_id,b.title,count(o.order_id) as number_of_orders 
from orders o
join books b
on o.book_id=b.book_id
group by book_id
order by number_of_orders desc limit 1;

-- 5 show the top 3 most expensive books in fantasy genre;
select * from books
 where genre='fantasy' 
 order by price 
 desc limit 3;

-- 6 retrieve the total quantity of books sold by each author;
select b.author,sum(o.quantity)as total_books
 from books b
 join orders o
 on b.book_id=o.Book_ID
group by b.author;

-- 7 list the cities where customers who spent over $30 are located;
select c.city,sum(o.total_amount) as total_spent
from customers c
join orders o
on c.customer_id=o.customer_id
where o.total_amount>30
group by city;

-- 8 find the cutomers who spent the most on orders;
select c.customer_id,c.name,sum(o.total_amount) as total_spent
from customers c
join orders o
on c.customer_id=o.Customer_ID
group by c.Customer_ID,c.Name
order by Total_spent desc;

