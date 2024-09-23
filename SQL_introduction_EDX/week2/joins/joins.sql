/*
	LEFT JOIN/ LEFT OUTER JOIN:
	
	In this join consider all the rows in Left table and
	for each row in left table find all the matching rows in Right table.
*/
SELECT film_actor.actor_id, first_name, last_name, film_actor.film_id, film.title
FROM actor 
	LEFT OUTER JOIN film_actor ON actor.actor_id = film_actor.actor_id
	LEFT JOIN film  ON film.film_id = film_actor.film_id
WHERE film.title BETWEEN 'A' AND 'Af'
ORDER BY film.title;




/*
	RIGHT JOIN/ RIGHT OUTER JOIN:
	In this join consider all the rows in Right table first then,
	for each row in right table find all the matching rows in Left table for it.
*/
SELECT film_actor.actor_id, first_name, last_name, film_actor.film_id, film.title
FROM actor 
	RIGHT OUTER JOIN film_actor ON actor.actor_id = film_actor.actor_id
	RIGHT JOIN film  ON film.film_id = film_actor.film_id
WHERE film.title BETWEEN 'A' AND 'Af'
ORDER BY film.title;




/*
	INNER JOIN/ JOIN
	Join the tables in way that we consider all the rows in one table or second table
	for each row in first table and find the matching rows in second table
	if no match exist don't consider that row.
	OR 
	similarily for each row in second table find all the matching rows
	in second table if no match exist that row.
*/
SELECT first_name, last_name, title
FROM actor
	 LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id 
	 -- Consider all the rows in left table and find their matches in second table
	 -- even if match didn't exist consider the rows in first table
	 LEFT JOIN film ON film.film_id = film_actor.film_id AND film.title BETWEEN 'A' and 'B'
WHERE first_name BETWEEN 'A' and 'B'
ORDER BY first_name, last_name;

SELECT first_name, last_name, title
FROM actor
	 LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id 
	 -- Consider all the rows in left table and find their matches in second table
	 -- if match didn't exist don't consider the rows in first table
	 INNER JOIN film ON film.film_id = film_actor.film_id AND film.title BETWEEN 'A' and 'B'
WHERE first_name BETWEEN 'A' and 'B'
ORDER BY first_name, last_name;




/*
 ANTI JOIN
 get non matching rows in left/right join
 no special syntax for it 
 only use the where clause
*/
SELECT customer.first_name
	, customer.last_name
	, rental.rental_date
	, rental.return_date 
	, inventory.film_id
	, film.title as "Film"
	, payment.amount
	, payment.payment_date
FROM customer
	INNER JOIN rental ON rental.customer_id = customer.customer_id
	INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
	INNER JOIN film ON film.film_id = inventory.film_id
	LEFT JOIN payment ON rental.rental_id = payment.rental_id AND customer.customer_id = payment.customer_id
WHERE payment.rental_id is NULL;

