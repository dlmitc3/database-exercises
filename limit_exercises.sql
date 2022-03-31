USE employees;
SELECT database();

## 1. Create a new SQL script named limit_exercises.sql.

## 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
# For example, to find all the unique titles within the company, we could run the following query:


SELECT DISTINCT title FROM titles;

# List the first 10 distinct last name sorted in descending order.

SELECT DISTINCT(last_name)
FROM employees
ORDER BY last_name DESC
Limit 10;

## 3. Find all previous or current employees hired in the 90s and born on Christmas. 
# Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
# Write a comment in your code that lists the five names of the employees returned.
# Answer: Alselm, Utz, Bouchung, Baocal and Petter.

SELECT * 
FROM employees 
Where hire_date Like '%199%'
And birth_date Like '%12-25%'
ORDER BY hire_date ASC
Limit 5;


## 4. Try to think of your results as batches, sets, or pages. 
# The first five results are your first page. The five after that would be your second page, etc. 
# Update the query to find the tenth page of results.

SELECT * 
FROM employees 
Where hire_date Like '%199%'
And birth_date Like '%12-25%'
ORDER BY hire_date ASC
Limit 5 
Offset 45;

# LIMIT and OFFSET can be used to create multiple pages of data. 
# What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
# Answer: The Number set by Limit equals the lenght of a page, while offset helps you find what page you want to see.
# offset = (limit * pageNumber) - limit;

