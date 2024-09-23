-- SELECT first_name, last_name FROM actor 
-- WHERE (first_name LIKE 'W%') OR
-- 	(first_name LIKE 'X%') OR
-- 	(first_name LIKE 'Y%') OR
-- 	(first_name LIKE 'Z%')
-- ORDER BY first_name


-- To do the things like the above statement does we can user LESS THAN/GREATER THAN
-- GREATER THAN, GREATER THAN or EQUAL
SELECT first_name, last_name FROM actor WHERE first_name > 'Wa' ORDER BY first_name;   
SELECT first_name, last_name FROM actor WHERE first_name >= 'Wa' ORDER BY first_name;  --includes Wa

-- LESS THAN, LESS THAN or EQUAL
SELECT first_name, last_name FROM actor WHERE first_name < 'Ben' ORDER BY first_name;
SELECT first_name, last_name FROM actor WHERE first_name <= 'Ben' ORDER BY first_name; -- includes Ben


-- NOT EQUAL OPERATOR (To don't include a specific record)
-- ANSI Way
SELECT first_name FROM actor WHERE first_name <= 'Am' and first_name <> 'Al' ORDER BY 1;
-- Other way
SELECT first_name FROM actor WHERE first_name <= 'Am' and first_name != 'Al' ORDER BY 1;


-- BETWEEN Keyword
-- Gives the records that are from Lower limit upto before Upper limit
SELECT first_name, last_name FROM actor 
WHERE first_name 
BETWEEN 'F' AND 'G' 
ORDER BY first_name, last_name;

-- NOT BETWEEN Keyword
-- Gives the records that are below Lower limit and above from Upper limit
SELECT first_name, last_name FROM actor 
WHERE first_name 
NOT BETWEEN 'Al' AND 'wo'
ORDER BY first_name, last_name;