/*1.Using the example from the lesson, create a temporary table called employees_with_departments that 
contains first_name, last_name, and dept_name for employees currently with that department. 
Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", 
it means that the query was attempting to write a new table to a database that you can only read.*/

USE jemison_1746;

drop table if exists employees_with_departments;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_name, to_date
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
where dept_emp.to_date > curdate()
limit 100;

SELECT * 
FROM employees_with_departments;

/* a. Add a column named full_name to this table. It should be a VARCHAR whose 
length is the sum of the lengths of the first name and last name columns*/

ALTER TABLE employees_with_departments
ADD full_name VARCHAR(31);

/* b. Update the table so that full name column contains the correct data*/


UPDATE employees_with_departments
SET full_name = CONCAT(first_name,' ', last_name);



/* C. Remove the first_name and last_name columns from the table.*/

ALTER TABLE employees_with_departments 
DROP COLUMN first_name,
DROP COLUMN last_name;


/* d. What is another way you could have ended up with this same table?*/

drop table if exists employees_with_departments2;

CREATE TEMPORARY TABLE employees_with_departments2 AS
SELECT emp_no, dept_name, to_date, CONCAT(first_name,'  ',last_name) AS full_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
where dept_emp.to_date > curdate()
limit 100;

SELECT * 
FROM employees_with_departments2;

/* 2. Create a temporary table based on the payment table from the sakila database.*/

drop table if exists amount_paid;

CREATE TEMPORARY TABLE amount_paid AS
SELECT payment_id, customer_id, payment_date, amount
FROM sakila.payment
limit 100;

SELECT *
FROM amount_paid;

/* Write the SQL necessary to transform the amount column such that it is stored as 
an integer representing the number of cents of the payment. For example, 1.99 should become 199.
*/

ALTER TABLE amount_paid ADD hole_amount int;

UPDATE amount_paid SET hole_amount = amount * 100;

ALTER TABLE amount_paid drop amount;

SELECT *
FROM amount_paid;

/* 3. Find out how the current average pay in each department compares to the overall, 
historical average pay. (In order to make the comparison easier, you should use the 
Z-score for salaries).*/

drop table if exists Pay_avg2; 

SELECT avg(salary), std(salary) from employees.salaries;

create temporary table Hist_avgsalary as (SELECT avg(salary), std(salary) from employees.salaries);

SELECT *
FROM Hist_avgsalary;

CREATE TEMPORARY TABLE Pay_avg2 AS
SELECT AVG(salary), dept_name
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
GROUP BY dept_name;

SELECT *
FROM Pay_avg2;

select avg(salary) as mean, stddev(sales) as sd
from zscore;

CREATE TEMPORARY TABLE current_info AS
SELECT dept_name, AVG(salary) as dept_current_avg
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;

select * from current_info;

alter table current_info add hist_avg float(10,2);
alter table current_info add hist_std float(10,2);
alter table current_info add zscore float(10.2);

update current_info set hist_avg = (select avg_salary from hist_aggregrates);
update current_info set hist_std= (select avg_salary from hist_aggregrates);

update current_info
SET zscore = (dept_current_avg - hist_avg) / hist_std;

/*In terms of salary, what is the best department right now to work for? 
The worst?
BEST:SALES
WORST:HUMAN RESOURSES*/


