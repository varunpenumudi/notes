/*
  SubQuery: query with in a query
  placed after WHERE/FROM CLAUSES in main query
*/
-- QUESTION: select films that have more than average rental rate?
SELECT film.title
	, film.rental_rate
FROM film
WHERE film.rental_rate > (
	SELECT AVG(film.rental_rate) 
	FROM film
)
ORDER BY film.rental_rate;

-- QUESTION: select customers who paid rentals on the date 2005-05-25?
SELECT customer.customer_id,
	 customer.first_name,
	 customer.last_name
FROM customer
WHERE customer.customer_id IN (
	SELECT rental.customer_id
	FROM rental
	WHERE rental.rental_date BETWEEN '2005-05-25' AND '2005-05-26'
);

-- QUESTION: Most recent films rented by each customer
SELECT DISTINCT customer.customer_id
	, customer.first_name
	, customer.last_name
	, MAX(rental.rental_date) AS "Last Rental Date"
	, STRING_AGG(film.title, ',  ' ORDER BY film.title)
FROM customer
	INNER JOIN rental ON customer.customer_id = rental.customer_id
	INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
	INNER JOIN film ON film.film_id = inventory.film_id
-- select this row only if it is the latest rental by that customer
WHERE rental.rental_date = (
	SELECT MAX(R1.rental_date) 
	FROM rental R1
	WHERE R1.customer_id = rental.customer_id
)
GROUP BY customer.customer_id
ORDER BY customer_id;




/*
  SubQuery in FROM CLAUSE (Derived Tabes)
  the SubQuery resultant table after FROM CLAUSE is called the derived table
*/

-- SELECT customer.customer_id
-- 	, customer.first_name
-- 	, customer.last_name
-- 	, customer.email
-- 	, SUM(amount)
-- FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id
-- GROUP BY customer.customer_id
-- ORDER BY SUM(amount) DESC
-- LIMIT 5;

SELECT customer.customer_id
	, customer.first_name
	, customer.last_name
	, customer.email
	, top_five.sum_amount
FROM (
	SELECT customer.customer_id
		, SUM(amount) as sum_amount
	FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id
	GROUP BY customer.customer_id
	ORDER BY SUM(amount) DESC
	LIMIT 5
) AS top_five 
	INNER JOIN customer 
		ON top_five.customer_id = customer.customer_id
ORDER BY 5;




/*
  NESTED SubQuery
  Query within a Subquery
*/
SELECT customer_id
	, first_name
	, last_name
	, email
FROM customer
-- SubQuery
WHERE customer_id IN (
	SELECT customer.customer_id
	-- Nested SubQuery
	FROM (
		SELECT customer.customer_id
			, SUM(amount) as sum_amount
		FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id
		GROUP BY customer.customer_id
		ORDER BY SUM(amount) DESC
		LIMIT 5
	) AS top_five 
		INNER JOIN customer 
			ON top_five.customer_id = customer.customer_id
);




/*
  EXISTS/ NOT EXISTS
  EXISTS: true if atleast one record returned from subquery
  NOT EXIST: reverse of EXISTS
*/

SELECT customer_id
	, first_name
	, last_name
FROM customer
WHERE EXISTS (
	SELECT customer_id
	FROM payment
	WHERE payment_date BETWEEN '2007-02-15' AND '2007-02-19'
		AND payment.customer_id = customer.customer_id
	GROUP BY customer_id
	HAVING SUM(amount) > 30
);


SELECT customer_id
	, first_name
	, last_name
FROM customer
WHERE NOT EXISTS (
	SELECT customer_id
	FROM payment
	WHERE payment_date BETWEEN '2007-02-15' AND '2007-02-19'
		AND payment.customer_id = customer.customer_id
	GROUP BY customer_id
	HAVING SUM(amount) > 30
)