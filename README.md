## Question 1: What is PostgreSQL?

PostgreSQL is a database software. It is relational database. It helps a user to save, search, update, or delete data easily.

## Question 2: What is the purpose of a database schema in PostgreSQL?

In PostgreSQL, a schema is used to keep the database organized. It works like a folder on a computer where we keep related files together. In a database, there can be many tables, views, and functions. If everything is in one place, it can become hard to find and manage. A schema helps to group related things so that the data is clean and easy to find. The main purpose of a schema is to keep the database neat and well-arranged.

## Question 3: Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key and Foreign Key are two important concepts used to manage data in tables.
A Primary Key is a column that uniquely identifies each row in a table. This means no two rows can have the same value in the primary key column, and it cannot be null. For example, in a table of students student_id can be the primary key because each student has a different ID.

A Foreign Key is used to create a link between two tables.It is a column in one table that refers to the Primary Key in another table. For example, if i have a results table to store students marks, i can use student_id as a foreign key in that table.

## Question 4: What is the difference between the VARCHAR and CHAR data types?

Both varchar and char are used to store text, but they work in different ways. The char data type is fixed in size. For example, if i use char(5) it will always take up 5 spaces. If i enter a shorter word, the remaining spaces will be filled with blank spaces. On the other hand, varchar is variable in size. It only takes up as much space as the text needs, so it does not waste space. If the text i want to store is always the same length, then char is fine. But if the length of the text can change, then varchar is a better choice.

## Question 5: Explain the purpose of the WHERE clause in a SELECT statement.

The WHERE clause in a SELECT statement is used to filter data in a table. It helps get only the rows that match a specific condition.For example, if a table has information about many people, but I want to see only the people who are older than 20, I can use WHERE age > 20. This way, the database will return only the rows where the age is more than 20.
