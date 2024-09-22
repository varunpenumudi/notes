/*
	Precision: Total Digits in number, eg: 8.64 has precision of 3
	Scale: No.of Digits after decimal point in number, eg: 8.64 has scale of 2
	COUNT(col) - counts no.of values in column
	SUM(col) - sum of all values in a column
	MIN(col) - min of all values in a column
	MAX(col) - max of all values in column
	ROUND(val, n) - Round the value to n decimal places, 
					if don't give n round to integer
	TRUNC(val, n) - cuts the remaining places after n decimal places, 
					if don't give n cuts all decimal places
*/


SELECT customer.customer_id,
	customer.first_name,
	customer.last_name,
	COUNT(*) as "Payments Count",
	AVG(film.length) as "Avg Film Duration",
	ROUND(AVG(film.length)) as "Rounded Avg Film Duration",
	TRUNC(AVG(film.length)) as "Trunced Avg Film Duration",
	ROUND(AVG(film.length), 2) as "Round2 Avg Film Duration",
	TRUNC(AVG(film.length), 2) as "Trunc2 Avg Film Duration",
	SUM(payment.amount) as "Payments Sum",
	MIN(payment.payment_date) as "First Payment",
	MAX(payment.payment_date) as "Last Payment"
FROM film
	INNER JOIN inventory
		ON inventory.film_id = film.film_id
	INNER JOIN rental
		ON rental.inventory_id = inventory.inventory_id 
	INNER JOIN customer
		ON customer.customer_id = rental.customer_id
	LEFT JOIN payment
		ON customer.customer_id = payment.customer_id
		AND rental.rental_id = payment.rental_id
GROUP BY customer.customer_id
ORDER BY 4;