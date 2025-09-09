--books table

CREATE TABLE books(
			Book_ID SERIAL PRIMARY KEY,
			TITLE VARCHAR(100) NOT NULL,
			AUTHOR VARCHAR (50),
			GENRE VARCHAR (50),
			PUBLISHED_YEAR SMALLINT,
			PRICE NUMERIC (10,2),
			STOCK INT 

);

SELECT * FROM books;

--customers table


CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);

SELECT * FROM customers;


--orders table

CREATE TABLE Orders(
    Order_ID INT PRIMARY KEY,
    Customer_ID VARCHAR(100),
    Book_ID VARCHAR(100),
    ORDER_date VARCHAR(20),
    Quantity VARCHAR(10),
    Total_amount NUMERIC(10,2)
);

SELECT * FROM Orders;


--BASIC QUERRIES 
--1) Retrieve all books in the "Fiction" genre

SELECT title,genre,price,stock FROM books
WHERE genre='Fiction';


-- 2) Find books published after the year 1950

SELECT * FROM books 
WHERE published_year>1950 
ORDER BY published_year;


-- 3) List all customers from the Canada

SELECT name_ 
FROM customers 
WHERE country='Canada';


-- 4) Show orders placed in November 2023

SELECT * FROM orders 
WHERE order_date 
BETWEEN '2023-11-01' AND '2023-11-30';


-- 5) Retrieve the total stock of books available

SELECT  SUM(stock) AS Total_stock FROM books;


 -- 6) Find the details of the most expensive book

SELECT * 
FROM books
ORDER BY price DESC
LIMIT 1;

OR 

SELECT * 
FROM books
WHERE price = (SELECT MAX(price) FROM books);


-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM Orders;


SELECT 
c.name_,
o.quantity
FROM 
	customers c
INNER JOIN 
	orders o
ON c.Customer_ID=o.Customer_ID
WHERE o.quantity > 1;
	


 -- 8) Retrieve all orders where the total amount exceeds $200

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM Orders;

-- ALTER TABLE orders
-- ADD COLUMN total_price NUMERIC(10,2);

-- UPDATE orders o
-- SET total_price = o.quantity * b.price
-- FROM books b
-- WHERE o.book_id=b.book_id;

SELECT * 
FROM orders
WHERE total_price > 200.00;


-- 9) List all genres available in the Books table

SELECT DISTINCT genre FROM books;


-- 10) Find the book with the lowest stock

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM Orders ORDER BY book_id;

SELECT 
b.title,
b.author,
b.genre,
o.quantity
FROM 
	books b
INNER JOIN 
	orders o
ON b.book_id=o.book_id
WHERE o.quantity = (SELECT MIN(quantity) FROM orders);


-- 11) Calculate the total revenue generated from all orders

SELECT SUM(total_price) AS revenue_generated FROM orders;


--Advance queries
 -- 1) Retrieve the total number of books sold for each genre

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM Orders ORDER BY order_id;


SELECT 
b.genre,
SUM(o.quantity)
FROM 
	books b
JOIN 
	orders o
ON b.book_id=o.book_id
GROUP BY genre;


-- 2) Find the average price of books in the "Fantasy" genre

SELECT AVG(price) FROM books WHERE genre='Fantasy';


-- 3) List customers who have placed at least 2 orders

SELECT customer_id, COUNT(order_id) AS ORDERS_COUNT
FROM orders
GROUP BY customer_id 
HAVING COUNT (order_id) >=2
ORDER BY customer_id;


-- 4) Find the most frequently ordered book

SELECT 
b.book_id,
b.title, COUNT(o.order_id) AS order_count 
FROM orders o 
JOIN books b 
ON b.book_id=o.book_id
GROUP BY b.book_id
ORDER BY order_count DESC LIMIT 1;


 -- 5) Show the top 3 most expensive books of 'Fantasy' Genre 

SELECT price,title,author 
FROM books 
WHERE genre='Fantasy'
ORDER BY price DESC LIMIT 3;


-- 6) Retrieve the total quantity of books sold by each author

SELECT 
	b.author,
	SUM(o.quantity) AS Total_books_sold
FROM
	books b
JOIN
	orders o
ON b.book_id=o.book_id
GROUP BY author
ORDER BY total_books_sold;


-- 7) List the cities where customers who spent over $30 are located

SELECT 
	c.city,
	o.total_price
FROM 
	customers c
JOIN 
	orders o
ON c.customer_id=o.customer_id
WHERE o.total_price>30.00
ORDER BY total_price DESC;

-- 8) Find the customer who spent the most on orders

SELECT 
	c.customer_id,
	c.name_,
	SUM(o.total_amount) AS Total_spent
FROM 
	customers c
JOIN 
	orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.name_
ORDER BY Total_spent DESC LIMIT 1;


-- 9) Calculate the stock remaining after fulfilling all orders

SELECT 
    b.book_id,b.title,b.stock, COALESCE (SUM(o.quantity),0) AS Order_quantity,
	b.stock - COALESCE (SUM(o.quantity),0) AS stock_remaining
FROM books b
LEFT JOIN orders o
    ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;
