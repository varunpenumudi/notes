/* 
   PIVOTING
   ----------
   PIVOTING is process of generally transforming the ROW based data into a COLUMN Based data
*/
select count(*) as count_all
	, sum(case when rating='PG' then 1 else 0 end) as pg
	, sum(case when rating='R' then 1 else 0 end) as R
	, sum(case when rating='NC-17' then 1 else 0 end) as NC_17
	, sum(case when rating='PG-13' then 1 else 0 end) as PG_13
	, sum(case when rating='G' then 1 else 0 end) as G
from film;


/*
   FILTER
   -----------
   use this to pivot data in postgres like we did above
*/
select count(*) as count_all
	, count(*) filter (where rating='G') as g_count
	, count(*) filter (where rating='PG') as pg_count
	, count(*) filter (where rating='PG-13') as pg_13_count
	, count(*) filter (where rating='NC-17') as nc_17_count
	, count(*) filter (where rating='R') as r_count
from film;


-- rental count by each customer for every film rating
select concat(customer.first_name, ' ', customer.last_name) as customer_name
	, count(rental.rental_id) as total_rentals_count
	, count(rental.rental_id) filter(where film.rating = 'PG') as pg_film_rentals_count
	, count(rental.rental_id) filter(where film.rating = 'PG-13') as pg13_film_rentals_count
	, count(rental.rental_id) filter(where film.rating = 'NC-17') as nc17_film_rentals_count
	, count(rental.rental_id) filter(where film.rating = 'R') as r_film_rentals_count
	, count(rental.rental_id) filter(where film.rating = 'G') as g_film_rentals_count
from rental
	inner join customer 
		on rental.customer_id = customer.customer_id
	inner join inventory
		on rental.inventory_id = inventory.inventory_id
	inner join film
		on inventory.film_id = film.film_id
group by customer.first_name, customer.last_name;
