SELECT first_name, last_name FROM actor;

-- "*" is a wild card character which means everything
SELECT * FROM actor;


-- to slect two columns and order them by first_name in descending order, second name in ascending order
-- ASC means Ascending and DESC means Descending
SELECT first_name,last_name FROM actor ORDER BY first_name DESC, second_name ASC

-- LOGICAL OPERATORS

-- AND, OR operators usage
SELECT * FROM actor WHERE first_name='Nick' AND last_name='Stallone';
SELECT * FROM actor WHERE first_name='Nick' OR last_name='Davis';

-- IN, NOT IN usage
-- SELECT * FROM actor WHERE first_name='Nick' OR first_name='Henry';
SELECT * FROM actor WHERE first_name IN ('Nick', 'Henry');
SELECT * FROM actor WHERE first_name NOT IN ('Johnny','Bob','Nick', 'Henry');

-- LIKE, NOT LIKE usage
SELECT * FROM actor WHERE first_name LIKE '%lle'; 
SELECT * FROM actor WHERE first_name NOT LIKE '%e%';