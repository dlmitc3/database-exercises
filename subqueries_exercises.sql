/* Use sub queries to find information in the employees database
Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
*/

USE employees;

/* Find all the current employees with the same hire date as employee 101010 using a sub-query.
Answer: 55 employees*/

SELECT first_name, last_name, hire_date
 FROM employees
 JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
 Where dept_emp.to_date > CURDATE()
 and hire_date = (SELECT
                        hire_date
                    FROM employees
                    WHERE emp_no = 101010
                  );


/* Find all the titles ever held by all current employees with the first name Aamod.
'Assistant Engineer'
'Engineer'
'Senior Engineer'
'Senior Staff'
'Staff'
'Technique Leader'
*/

select DISTINCT(title)
 from titles
 where emp_no IN (
     select emp_no
     from employees
     where first_name = 'Aamod'
     )
 order by title;
  

/* How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.
Answer:  59900 Former Employees*/

SELECT COUNT(*) AS 'Former Employees'
   FROM employees
  WHERE emp_no NOT IN(
        SELECT emp_no
          FROM salaries
         WHERE to_date > NOW());


/* Find all the current department managers that are female. List their names in a comment in your code.*/


SELECT CONCAT(first_name,' ', last_name) AS 'Employee Name', gender
FROM employees
WHERE gender LIKE 'F' AND
        emp_no IN(SELECT emp_no FROM dept_manager
         WHERE to_date > NOW());

/* Find all the employees who currently have a higher salary than the companies overall, 
historical average salary.*/

SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name', salary
 from salaries
 where emp_no = (
     select emp_no
     from salaries)
  and salaries.to_date > curdate()
  Order by salary ASC;

/* How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this? 
Answer:'0.0325'
*/

SELECT (COUNT(*) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW())) * 100
   FROM salaries
  WHERE salary >= (
 	   SELECT MAX(salary) - STDDEV(salary)
 	     FROM salaries
 	   )
    AND to_date > NOW();

/* Hint Number 1 You will likely use a combination of different kinds of subqueries.
*/

/*Hint Number 2 Consider that the following code will produce the z score for current salaries. 
*/
 
        
/* BONUS Find all the department names that currently have female managers. */

select dept_name
 from departments
 where dept_no in (
 		select dept_no
 		from dept_manager
 		where dept_manager.to_date > curdate()
 		and emp_no in (
 				select emp_no
 				from employees
 				where gender = "f"));

/* BONUS Find the first and last name of the employee with the highest salary. */

 SELECT CONCAT(first_name,
               ' ',
               last_name) AS 'Employee Name'
   FROM employees
  WHERE emp_no = 
  (
 	   SELECT emp_no
          FROM salaries
 	    ORDER By salary DESC
         LIMIT 1
  );


/* Bonus: Find the department name that the employee with the highest salary works in.
*/

select concat(first_name, " ", last_name) as "Employee", salary
 from employees 
 join salaries using(emp_no)
 where emp_no in (
 		select emp_no
 		from salaries
 		where salary in (
 				select Max(salary)
 				from salaries
 				where salaries.to_date > curdate()));
