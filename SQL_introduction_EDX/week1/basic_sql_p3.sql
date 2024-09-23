-- DISTINCT 
-- used to select Unique column values from the records
SELECT DISTINCT last_name FROM actor
ORDER BY last_name;

-- Unique combinations of first and last names
SELECT DISTINCT first_name, last_name FROM actor
ORDER BY first_name, last_name;



-- COUNT() and GROUP BY
SELECT COUNT(*) FROM actor; -- No.of Rows in table

--  GROUP BY order: WHERE ->  GROUP BY -> ORDER BY 
SELECT first_name, last_name, COUNT(*) FROM actor
WHERE last_name <= 'Z'
GROUP BY first_name, last_name
ORDER BY count DESC; 				-- descending order by their counts



-- HAVING
-- helpful in filtering by aggergation functions such as COUNT()
SELECT first_name, last_name, COUNT(*) FROM actor
WHERE last_name <= 'Z'
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- Find all the first_names that occur more than 3 times and order them Descending
SELECT first_name, COUNT(*) FROM actor
WHERE first_name <= 'Z'
GROUP BY first_name
HAVING COUNT(*) > 3 AND COUNT(*) < 5;   -- this works like the where with all operators but on aggergate functions.



-- CONCAT function
-- can also use || operator for concatenation but,
-- 'actor' || null = null
SELECT first_name || ' ' || last_name as full_name FROM actor;

-- CONCAT('actor', null) = 'actor'
SELECT CONCAT(first_name ,' ', last_name) as full_name, actor_id
FROM actor
ORDER BY full_name;


-- LIMIT (limits the ouput rows)
SELECT DISTINCT first_name, last_name FROM actor
ORDER BY first_name, last_name
LIMIT 20;


/* 
	LEXICOGRAPHICAL ORDER is way is write sql
	LOGICAL ORDER is how the sql evaluated
	in LOGICAL ORDER SELCT DISTINCT ..... statement 
	is evaluated after the HAVING clause and before ORDER BY clause
*/


-- SINGLE LINE COMMENT
/* MULTI LINE 
COMMENT */