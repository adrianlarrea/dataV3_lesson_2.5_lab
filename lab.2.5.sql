
-- 1.Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT * 
FROM actor
WHERE first_name = "Scarlett";

-- 2.How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(rental_id)
FROM rental;

-- 3.What are the shortest and longest movie duration?
-- Name the values max_duration and min_duration.

SELECT MIN(length) as "min_duration" , MAX(length) as "max_duration"
FROM film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT left((AVG(length) / 60),1)  AS hours, 
       ROUND(AVG(length) % 60,0) AS minutes
FROM film;


-- 5.How many distinct (different) actors' last names are there?
SELECT 
COUNT(DISTINCT last_name)
FROM actor;

-- 6-Since how many days has the company been operating (check DATEDIFF() function)?

SELECT *
FROM payment;

SELECT datediff(left(MAX(last_update,11)), left(MIN(payment_date),11)) )AS )A operating_days
FROM payment;

-- 7-Show rental info with additional columns month and weekday. Get 20 results.

SELECT * , date_format(rental_date, '%M') AS 'month', date_format(rental_date, '%a') AS 'weekday'
 FROM rental;


-- 8.Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.

SELECT * , date_format(rental_date, '%M') AS 'month', date_format(rental_date, '%a') AS 'weekday',
  CASE
  WHEN date_format(rental_date, '%a') = 'Sat' or 'Sun' then 'Weekend'
  WHEN date_format(rental_date, '%a') != 'Sat' or 'Sun' then 'Weekday'
  ELSE 'No status'
  END AS 'day_type'
  FROM rental;

-- 9.Get release years.

select distinct(release_year)
FROM film;


-- 10.Get all films with ARMAGEDDON in the title.

SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%'; 

-- 11.Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title LIKE '%APOLLO';

-- 12.Get 10 the longest films.

SELECT title
FROM film
ORDER BY length ASC
LIMIT 10;


-- 13.How many films include Behind the Scenes content?

SELECT COUNT(title)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
