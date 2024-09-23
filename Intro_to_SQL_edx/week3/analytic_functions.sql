/*
   Analytic Functions / Window Functions
   ---------------------------------------
   BASIC SYNTAX:
   AGGEREGATE_FUNCTION(col1) OVER (
		PARTITION BY col2
		ORDER BY col3
   )
*/

SELECT customer.customer_id
	, customer.first_name
	, customer.last_name
	, rental.rental_date
	, payment.payment_date
	, payment.amount
	
	, SUM(payment.amount) OVER (
		PARTITION BY customer.customer_id 
		ORDER BY payment.payment_date
	) as CummulativeRentalAmount
	
	, MIN(payment.amount) OVER (
		PARTITION BY customer.customer_id
	) AS minPayment
FROM customer
	INNER JOIN 
		rental ON customer.customer_id = rental.customer_id
	INNER JOIN
		payment ON payment.customer_id = customer.customer_id 
				AND payment.rental_id = rental.rental_id

WHERE EXTRACT(MONTH FROM payment_date) = 2
	  AND EXTRACT(YEAR FROM payment_date) = 2007

ORDER BY customer.customer_id, payment.payment_date;




/*
  RANK AND DENSE_RANK
  Below Example clearly illustrate the how rank and dense_rank work:
  
  COL   RANK   DENSE_RANK
  ------------------------
  34     1         1
  34     1         1
  56    [3         2]       (Focus On this Column)
  78     4         3
  78     4         3
  90     6         4


  ROW_NUMBER: Starts at 1 and just increases continously
*/
WITH CTE AS (
	SELECT customer.customer_id
		, customer.first_name
		, customer.last_name
		, COUNT(rental.rental_id) as RentalsCount
	FROM customer
		INNER JOIN rental
			ON rental.customer_id = customer.customer_id
	GROUP BY customer.customer_id
		, customer.first_name
		, customer.last_name
)

SELECT cte.customer_id
	, cte.first_name
	, cte.last_name
	, cte.rentalsCount
	, ROW_NUMBER() OVER (ORDER BY cte.rentalsCount)
	, RANK() OVER (ORDER BY cte.rentalsCount)
	, DENSE_RANK() OVER (ORDER BY cte.rentalsCount)
FROM CTE;



/*
   LEAD/LAG
   ---------------
   LEAD(col, n): next nth row in col
   LAG(col, n): prev nth row in col
*/

with weekly_revenue as (
 select extract(week from payment_date) as payment_week
 	, sum(payment.amount) as payment_total
 from rental
 	inner join payment
		on rental.customer_id = payment.customer_id
		   and rental.rental_id = payment.rental_id
 group by extract(week from payment_date)
)

select payment_week
	, payment_total
	--, LAG(payment_total, 2) OVER (order by payment_week) as prev_2week_revenue
	--, LAG(payment_total, 3) OVER (order by payment_week) as prev_3week_revenue
	, LAG(payment_total) OVER (order by payment_week) as prev_week_revenue
	, payment_total - LAG(payment_total) OVER (order by payment_week) as prev_week_increment
	, LEAD(payment_total) OVER (order by payment_week) as next_week_revenue
	, payment_total - LEAD(payment_total) OVER (order by payment_week) as next_week_decrement
from weekly_revenue
	