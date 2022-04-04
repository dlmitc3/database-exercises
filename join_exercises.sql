## Join Example Database

# 1. Use the join_example_db. Select all the records from both the users and roles tables.

use join_example_db;

select *
from users;

select *
from roles;

# 2. Use join, left join, and right join to combine results from the users and roles tables

SELECT *
from users
join roles on users.role_id = roles.id;

SELECT *
from users
left join roles on users.role_id = roles.id;

SELECT *
from users
right join roles on users.role_id = roles.id;

# 3. Use count and the appropriate join type to get a list of roles along with the number of users that has the role

SELECT roles.name, count(role_id)
from users
right join roles on users.role_id = roles.id
group by roles.name;


##PART TWO:
# 1. Use the employees database

USE employees;

/* 2. write a query that shows each department along with the name of the current manager for that department.
DEPARTMENT.         DEPARTMENT MANAGER
'Customer Service','Yuchang Weedman'
'Development','Leon DasSarma'
'Finance','Isamu Legleitner'
'Human Resources','Karsten Sigstam'
'Marketing','Vishwani Minakawa'
'Production','Oscar Ghazalie'
'Quality Management','Dung Pesch'
'Research','Hilary Kambil'
'Sales','Hauke Zhang' */


SELECT d.dept_name as 'Department Name', 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no 
WHERE dm.to_date > curdate()
ORDER BY d.dept_name;

/* 3. Find the name of all departments currently managed by women
DEPARTMENT NAME, DEPARTMENT MANAGER
'Development','Leon DasSarma'
'Finance','Isamu Legleitner'
'Human Resources','Karsten Sigstam'
'Research','Hilary Kambil' */


SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no 
WHERE dm.to_date > curdate() AND e.gender = 'F'
ORDER BY d.dept_name;

/* 4. Find the current titles of employees currently working in the Customer Service department
Title      Count
'Senior Staff','11268'
'Staff','3574'
'Senior Engineer','1790'
'Engineer','627'
'Technique Leader','241'
'Assistant Engineer','68'
'Manager','1' */


SELECT t.title AS 'Title', COUNT(*) AS Count
FROM dept_emp AS de
JOIN titles AS t 
	ON t.emp_no = de.emp_no
WHERE t.to_date > curdate()
    AND de.to_date > curdate()
	AND de.dept_no = 'd009'
GROUP BY t.title;

/* 5. Find the current salary of all current managers.
DEPARTMENT NAME,  NAME,  SALARY
'Customer Service','Yuchang Weedman','58745'
'Development','Leon DasSarma','74510'
'Finance','Isamu Legleitner','83457'
'Human Resources','Karsten Sigstam','65400'
'Marketing','Vishwani Minakawa','106491'
'Production','Oscar Ghazalie','56654'
'Quality Management','Dung Pesch','72876'
'Research','Hilary Kambil','79393'
'Sales','Hauke Zhang','101987'. */


SELECT d.dept_name AS 'Department Name', 
	CONCAT(e.first_name, ' ', e.last_name) AS 'Name',
	s.salary AS 'Salary'
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries AS s
  ON s.emp_no = e.emp_no
WHERE dm.to_date > curdate()
	AND s.to_date > curdate()
ORDER BY d.dept_name;

/* 6. Find the number of current employees in each department.
dept_no, dept_name,  current_employees
'd009','Customer Service','17569'
'd005','Development','61386'
'd002','Finance','12437'
'd003','Human Resources','12898'
'd001','Marketing','14842'
'd004','Production','53304'
'd006','Quality Management','14546'
'd008','Research','15441'
'd007','Sales','37701' */


SELECT d.dept_no, d.dept_name, COUNT(de.emp_no) AS 'current_employees'
FROM departments AS d
	JOIN dept_emp AS de ON de.dept_no = d.dept_no
WHERE de.to_date > curdate()
GROUP BY d.dept_no, d.dept_name;

/* 7. Which department has the highest average salary? 
Answer: 'Sales','88842.1590' */


SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments As d
JOIN dept_emp As de
ON de.dept_no = d.dept_no
JOIN salaries AS s 
ON de.emp_no = s.emp_no
WHERE s.to_date > curdate()
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1;


/*8. Who is the highest paid employee in the Marketing department
Answer: Akemi Warwick. */

SELECT
	e.first_name,
	e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

/* 9. Which current department manager has the highest salary?
Answer: 'Vishwani','Minakawa','106491','Marketing'. */


SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN salaries AS s
  ON s.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no 
WHERE dm.to_date > curdate()
ORDER BY s.salary DESC
LIMIT 1;


# 10. Determine the average salary for each department. Use all salary information and round your results.


SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM departments As d
JOIN dept_emp As de
ON de.dept_no = d.dept_no
JOIN salaries AS s 
ON de.emp_no = s.emp_no
WHERE s.to_date > curdate()
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;