## Use CASE statements or IF() function to explore information in the employees database

# Create a file named case_exercises.sql and craft queries to return the results for the following criteria:

/* 1. Write a query that returns all employees, their department number, 
their start date, their end date, and a new column 'is_current_employee' 
that is a 1 if the employee is still with the company and 0 if not.*/

USE employees;

SELECT emp_no, dept_no, from_date, to_date, CONCAT(first_name,' ', last_name) AS Full_Name,
IF (to_date > NOW(), true, false) AS is_current_employee
From dept_emp  
JOIN employees USING (emp_no)
Where to_date IN (SELECT MAX(to_date) as max_date
FROM dept_emp
GROUP BY emp_no);


/* 2. Write a query that returns all employee names (previous and current), 
and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending 
on the first letter of their last name. */

SELECT CONCAT(last_name,', ',SUBSTR(first_name,1,1)) Last_Name,
 	CASE 
 	WHEN SUBSTR(last_name,1,1) BETWEEN 'a' AND 'h' THEN 'A-H'
 	WHEN SUBSTR(last_name,1,1) BETWEEN 'i' AND 'q' THEN 'I-Q'
 	WHEN SUBSTR(last_name,1,1) BETWEEN 'r' AND 'z' THEN 'R-Z'
 	ELSE "N/A"
 	END AS Alpha_Group
 FROM employees;

/* 3. How many employees (current or previous) were born in each decade? */

SELECT birth_date
 FROM employees;
 SELECT MAX(birth_date)
 FROM employees;
 SELECT MIN(birth_date)
 FROM employees;


 SELECT COUNT(birth_date) AS Int_Total,
 	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 5 THEN birth_date ELSE NULL END) AS '1950\'s',
 	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 6 THEN birth_date ELSE NULL END) AS '1960\'s',

 	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 5 THEN birth_date ELSE NULL END) +
 	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 6 THEN birth_date ELSE NULL END) AS Total_Births
 FROM employees;

/* 4. What is the current average salary for each of the following department groups: 
R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?*/

SELECT
 	CASE 
            WHEN dept_name IN ('research', 'development') THEN 'R&D'
            WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
            WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
            WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
            ELSE dept_name
            END AS Dept_Group,
            AVG(s.salary) AVG_Salary
 FROM salaries s
 	JOIN dept_emp de
 	USING (emp_no)
 	JOIN departments d
 	USING (dept_no)
 WHERE de.to_date > NOW() AND s.to_date > NOW()
 GROUP BY dept_group; 
