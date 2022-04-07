USE sakila;

## SELECT statements:

/* a.Select all columns from the actor table.*/

SELECT *
FROM actor;

/* b.Select only the last_name column from the actor table.*/

SELECT last_name
FROM actor;

/* c.Select only the film_id, title, and release_year columns from the film table.*/

SELECT film_id, title, release_year
FROM film;

## DISTINCT operator

/* a.Select all distinct (different) last names from the actor table.
Answer 121 rows 
*/

SELECT DISTINCT(last_name)
FROM actor;

/* b.Select all distinct (different) postal codes from the address table.
Answer: 597 rows
*/

SELECT DISTINCT(postal_code)
FROM address;

/* c.Select all distinct (different) ratings from the film table.
'PG'
'G'
'NC-17'
'PG-13'
'R'
*/

SELECT DISTINCT(rating)
FROM film;

## WHERE clause:

/* a.Select the title, description, rating, movie length columns 
from the films table that last 3 hours or longer.*/

SELECT title, description, rating, length
FROM film
where length > 180;


/* b.Select the payment id, amount, and payment date columns from 
the payments table for payments made on or after 05/27/2005.*/

SELECT payment_id, amount, payment_date
FROM payment
Where payment_date > '2005-05-27';


/* c.Select the primary key, amount, and payment date columns from the 
payment table for payments made on 05/27/2005.*/

SELECT payment_id, amount, payment_date
FROM payment
Where payment_date LIKE '2005-05-28%';


/* d.Select all columns from the customer table for rows that have a 
last names beginning with S and a first names ending with N.*/


/* e.Select all columns from the customer table for rows where the 
customer is inactive or has a last name beginning with "M".*/


/* f.Select all columns from the category table for rows where the 
primary key is greater than 4 and the name field begins with either C, S or T.*/


/* g.Select all columns minus the password column from the staff table 
for rows that contain a password.*/


/* h.Select all columns minus the password column from the staff table for 
rows that do not contain a password.*/

