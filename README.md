☁︎ Library SQL Analysis
☁️ Project Overview

✦ This project explores a Library Management Dataset using SQL. The dataset contains three tables — Books, Customers, and Orders — and I wrote 20 SQL queries (basic to advanced) to analyze customer behavior, book inventory, and revenue generation.

✦ The goal is to strengthen SQL fundamentals, practice joins, aggregations, and subqueries, and demonstrate practical problem-solving with relational databases.

☁️ Dataset Structure

1. Books Table

Book_ID (Primary Key)
Title
Author
Genre
Published_Year
Price
Stock

2. Customers Table
Customer_ID (Primary Key)
Name
Email
Phone
City
Country

3. Orders Table
Order_ID (Primary Key)
Customer_ID (Foreign Key)
Book_ID (Foreign Key)
Order_Date
Quantity
Total_Amount

☁️ Key Queries Solved
✦ Basic Queries

⟡ Retrieve all books in a specific genre (e.g., Fiction).
⟡ Find books published after a given year.
⟡ List all customers from a specific country.
⟡ Show orders placed in a particular month.
⟡ Find the most expensive book and the book with the lowest stock.

✦ Intermediate Queries

⟡ Identify customers who ordered more than one quantity.
⟡ Retrieve orders with total amount > $200.
⟡ Calculate total stock available and revenue generated.
⟡ List all unique genres.

✦ Advanced Queries

⟡ Total number of books sold per genre.
⟡ Average price of books in the “Fantasy” genre.
⟡ Customers who placed at least 2 orders.
⟡ Most frequently ordered book.
⟡ Total books sold per author.
⟡ Customers who spent the most on orders.
⟡ Stock remaining after fulfilling all orders.

☁️ Skills Practiced

⟡ SQL SELECT, WHERE, GROUP BY, HAVING, ORDER BY
  INNER JOIN / LEFT JOIN for relational queries
  Aggregate functions (SUM, AVG, COUNT, MAX, MIN)
  Subqueries & filtering

⟡ Real-world problem solving with relational data

☁️ Files in Repository
⟡ library_queries.sql → SQL file containing all queries.
⟡ README.md → Project documentation (this file).

☁️ Sample Insights

⟡ The most frequently ordered book generated the highest sales.
⟡ Customers from Canada placed multiple high-value orders.
⟡ Stock levels decreased significantly for Fantasy books compared to other genres.

☁︎About Me

★ I am an aspiring Data Analyst, building projects to strengthen my SQL, data analysis, and problem-solving skills. Connect with me on LinkedIn
to follow my journey!
