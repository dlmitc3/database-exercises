USE employees;

## 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

SELECT COUNT(*)
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT COUNT(*)
FROM employees 
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';

SELECT 
COUNT(emp_no) 
FROM employees 
WHERE gender = 'M'
	AND first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';

SELECT *
FROM employees 
WHERE last_name LIKE 'E%';

SELECT *
FROM employees 
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';

SELECT *
FROM employees 
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%';

SELECT *
FROM employees 
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%';


SELECT * 
FROM employees 
Where hire_date Like '199%';

SELECT * 
FROM employees 
Where hire_date Like '199%';

SELECT * 
FROM employees 
Where birth_date Like '%12-25%';

SELECT * 
FROM employees 
Where last_name Like '%q%';

SELECT * 
FROM employees 
Where last_name Like '%q%'
And NOT last_name Like '%qu%';


## 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
# In your comments, answer: What was the first and last name in the first row of the results? 
# What was the first and last name of the last person in the table?
# Answer 1: First person was Irena Ferretti
# Answer 2: Last person Vidya Simmen

SELECT *
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;



## 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
# In your comments, answer: What was the first and last name in the first row of the results? 
# What was the first and last name of the last person in the table?
# Answer 1: First person was Irena Acton
# Answer 2: Last person Vidya Zweizig

SELECT *
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;


## 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
# In your comments, answer: What was the first and last name in the first row of the results? 
# What was the first and last name of the last person in the table?
# Answer 1: First person was Irena Acton
# Answer 2: Last person Maya Zyda

SELECT *
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

## 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
# Enter a comment with the number of employees returned. Answer 899 returned,
# the first employee number and their first and last name. Answer emp_no 10021, Ramzi Erde
# and the last employee number with their first and last name. Answer emp_no 499648 Tadahiro Edre

SELECT *
FROM employees 
WHERE last_name LIKE 'E%'
ANd last_name LIKE '%E'
ORDER BY emp_no;

## 6. Write a query to to find all employees whose last name starts and ends with 'E'. 
# Sort the results by their hire date, so that the newest employees are listed first. 
# Enter a comment with the number of employees returned.  Answer 899 employees returned
# the name of the newest employee. Answer Teiji Eldridge
# and the name of the oldest employee. Answer Sergi Erde

SELECT *
FROM employees 
WHERE last_name LIKE 'E%'
ANd last_name LIKE '%E'
ORDER BY hire_date ASC;


## 7. Find all employees hired in the 90s and born on Christmas. 
# Sort the results so that the oldest employee who was hired last is the first result. 
# Enter a comment with the number of employees returned, Answer: 362
# the name of the oldest employee who was hired last, Answer: Khun Bernini
# and the name of the youngest employee who was hired first. Answer: Douadi Pettis

SELECT *
FROM employees 
Where hire_date Like '199%'
And birth_date Like '%12-25%'
ORDER BY Birth_date, hire_date DESC;

