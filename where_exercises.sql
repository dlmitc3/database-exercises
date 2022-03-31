USE employees;
# 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
# Enter a comment with the number of records returned. 
# Count 709

SELECT COUNT(*)
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
# Enter a comment with the number of records returned. Returned 55 records
# Does it match number of rows from Q2? NO

SELECT COUNT(*)
FROM employees 
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';

# 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
# Enter a comment with the number of records returned. returned 612 records

SELECT 
COUNT(emp_no) 
FROM employees 
WHERE gender = 'M'
	AND first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';


# 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

SELECT *
FROM employees 
WHERE last_name LIKE 'E%';

# 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

SELECT *
FROM employees 
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';

SELECT *
FROM employees 
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%';

# 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?


SELECT *
FROM employees 
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%';


# 8. Find all current or previous employees hired in the 90s. 
# Enter a comment with the number of employees returned.


SELECT * 
FROM employees 
Where hire_date Like '199%';


# 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

SELECT * 
FROM employees 
Where hire_date Like '199%';


# 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

SELECT * 
FROM employees 
Where birth_date Like '%12-25%';


# 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

SELECT * 
FROM employees 
Where last_name Like '%q%';

# 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

SELECT * 
FROM employees 
Where last_name Like '%q%'
And NOT last_name Like '%qu%';

