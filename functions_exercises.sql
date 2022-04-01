## 1. Copy the order by exercise and save it as functions_exercises.sql.

USE employees;
SELECT Database ();

## 2. Write a query to to find all employees whose last name starts and ends with 'E'. 
#Use concat() to combine their first and last name together as a single column named full_name.

SELECT CONCAT(First_Name, '  ' , Last_name) AS full_name
FROM employees 
WHERE First_name LIKE 'E%'
ANd last_name LIKE '%E';


## 3. Convert the names produced in your last query to all uppercase.

SELECT UPPER (CONCAT(First_Name, '  ' , Last_name)) AS full_name
FROM employees 
WHERE First_name LIKE 'E%'
ANd last_name LIKE '%E';

/* 4. Find all employees hired in the 90s and born on Christmas. 
# Use datediff() function to find how many days they have been working at the company 
##(Hint: You will also need to use NOW() or CURDATE()), */

SELECT First_name, Last_name,
DATEDIFF(CURDATE(), hire_date)/365 AS Tenure
FROM employees 
Where hire_date Like '199%'
And birth_date Like '%12-25%';


## 5. Find the smallest and largest current salary from the salaries table
# Answer MIN:28623. MAX:158220

Select MIN(salary), MAX(salary)
from salaries
where to_Date > CURDATE();


/*6. Use your knowledge of built in SQL functions to generate a username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, an underscore, the month the employee was born, 
and the last two digits of the year that they were born. 
Below is an example of what the first 10 rows will look like:*/


Select LOWER(CONCAT(substr(first_name,1,1)||last_name,1,4)) "_" ,
SUBSTR(Birth_date, 6, 2),
SUBSTR(Birth_date, 3,2)
from employees;


