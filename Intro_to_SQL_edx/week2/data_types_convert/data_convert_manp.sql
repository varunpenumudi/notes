/*
	CASE STATEMENTS
	--------------------
	CASE
		WHEN [CONDITION 1] THEN [OUTPUT 1]
		WHEN [CONDITION 2] THEN [OUTPUT 2]
		WHEN [CONDITION 3] THEN [OUTPUT 3]
		ELSE [OUPUT 4]
	END
*/
SELECT title
	, length
	, rental_rate
	, CASE
		WHEN length <= 90 THEN 'Small Length Movie'
		ELSE 'Big Length Movie'
	  END movie_type
	, CASE 
		WHEN rental_rate > ( SELECT AVG(rental_rate) FROM film ) THEN 'More than AVG Price'
		WHEN rental_rate < ( SELECT AVG(rental_rate) FROM film ) THEN 'Less than AVG Price'
		ELSE 'No Idea'
	 END as Price_Type
FROM film
ORDER BY length, rental_rate;


-- GROUP BY with CASE
SELECT CASE
		WHEN length <= 90 THEN 'Small Length Movie'
		ELSE 'Big Length Movie'
	  END movie_length_type
	  , COUNT(*)
FROM film
GROUP BY CASE
			WHEN length <= 90 THEN 'Small Length Movie'
			ELSE 'Big Length Movie'
		  END 
ORDER BY 1;




/*
	COALESCE
	--------------------
	COALESCE(arg1, arg2, arg3, arg4, ...... ) 
	This returns the first not null argument from the args passed
	Eg: COALESCE(null, null, 'Text', 'Num') = 'Text'
*/
SELECT rental_id
	, rental_date
	, return_date
	, COALESCE(CAST(return_date as VARCHAR), 'Not Returned') as return_date_2
FROM rental
ORDER BY return_date DESC;