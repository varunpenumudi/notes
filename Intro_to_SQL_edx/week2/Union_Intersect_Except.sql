/*
	UNION ALL
	Stacks one set of records on another vertically
	Rules:
		both sets of records should have same no.of columns
		the respective columns should also have same datatypes
		Should use ORDER BY only on the last line after unioning
*/

SELECT 'TABLE1' AS table_name, first_name, last_name FROM actor where first_name='Susan'
UNION ALL
SELECT 'TABLE2',first_name, last_name FROM customer where first_name='Susan'
ORDER BY last_name;



/*
  UNION
  just like UNION ALL but no duplicate records
  same rules as union all
*/
select first_name, last_name FROM actor where first_name='Susan'
UNION
select first_name, last_name FROM customer where first_name='Susan';



/*
  INTERSECT
  selects the common among two sets of records
*/

SELECT customer_id, first_name, last_name FROM customer WHERE customer_id BETWEEN 1 AND 7
INTERSECT
SELECT customer_id, first_name, last_name FROM customer WHERE customer_id BETWEEN 6 AND 12;



/*
  EXCEPT 
  return all rows in first set of records
  that are not in intersection of two sets records
*/
SELECT customer_id, first_name, last_name FROM customer WHERE customer_id BETWEEN 1 AND 7
EXCEPT
SELECT customer_id, first_name, last_name FROM customer WHERE customer_id BETWEEN 6 AND 12