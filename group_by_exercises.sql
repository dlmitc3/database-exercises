## 1. Create a new file named group_by_exercises.sql

USE employees;
SELECT database();


/* ## 2. In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? Answer that in a comment in your SQL file.
Answer:
'Assistant Engineer'
'Engineer'
'Manager'
'Senior Engineer'
'Senior Staff'
'Staff'
'Technique Leader'
*/

SELECT DISTINCT(title)
FROM titles;

/* ## 3. Write a query to to find a list of all unique last names of all employees 
that start and end with 'E' using GROUP BY.
Answer: 5 rows */

SELECT last_name
FROM employees 
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E'
GROUP BY last_name;

/*## 4. Write a query to to find all unique combinations of first and last names of all 
employees whose last names start and end with 'E'.
Answer: 846 rows */

SELECT DISTINCT last_name, first_name
FROM employees 
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E'
Group By last_name, first_name;

/*## 5. Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code.
Answer:
'Chleq'
'Lindqvist'
'Qiwen'
*/

SELECT last_name
FROM employees 
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE '%qu%'
Group by last_name;

/* ## 6.Add a COUNT() to your results (the query above) to find the number of employees with the same last name. 
Answer: 
'Chleq','189'
'Lindqvist','190'
'Qiwen','168'
*/

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE '%qu%'
Group by last_name;

/* ## 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
Answer:
'Vidya','M','151'
'Irena','M','144'
'Irena','F','97'
'Maya','F','90'
'Vidya','F','81'
'Maya','M','146'
*/

SELECT First_name, Gender, COUNT(*)
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
Group By First_name, Gender;

/* ## 8. Using your query that generates a username for all of the employees, 
generate a count employees for each unique username. Are there any duplicate usernames? 
BONUS: How many duplicate usernames are there?
Answer: 13251 duplicate usernames
*/

select lower(concat(
    substr(first_name, 1, 1),
    substr(last_name, 1, 4),
		 "_",
		 substr(birth_date, 6, 2),
		 substr(birth_date, 3, 2)
)) as username, COUNT(*)
from employees
group by username
having COUNT(*)> 1;

/* ## 9. More practice with aggregate functions:

-Determine the historic average salary for each employee. 
When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
-Using the dept_emp table, count how many current employees work in each department. 
The query result should show 9 rows, one for each department and the employee count.
-Determine how many different salaries each employee has had. 
This includes both historic and current.
-Find the maximum salary for each employee.
-Find the standard deviation of salaries for each employee.
-Now find the max salary for each employee where that max salary is greater than $150,000.
-Find the average salary for each employee where that average salary is between $80k and $90k.*/