CREATE TABLE IF NOT EXISTS STUDENT_TABLE(
	  STUDENTID          SMALLSERIAL PRIMARY KEY NOT NULL
	, FIRST_NAME        VARCHAR(50) NOT NULL
	, MIDDLE_NAME       VARCHAR(50) NULL
	, LAST_NAME     	VARCHAR(50) NOT NULL
	, JOIN_DATE 		TIMESTAMP NOT NULL
);

/*
	SELECT * FROM TABLE
	
	INSERT INTO TABLE (col1, col2, col3) VALUES (val1, val2, val3)
												, (val2.1, val2.2, val2.3) .......
	UPDATE TABLE SET column=... 
	             WHERE ....
	
	DELETE FROM TABLE 
	            WHERE ....
	
	DROP TABLE STUDENT_TABLE
*/

/*
	SELECT * FROM STUDENT_TABLE;
*/

INSERT INTO STUDENT_TABLE (FIRST_NAME, MIDDLE_NAME, LAST_NAME, JOIN_DATE) VALUES ('Threnadh', NULL, 'Polasani', CURRENT_TIMESTAMP)
							,  ('Hitesh', NULL, 'Gottapu', CURRENT_TIMESTAMP)
							,  ('Varun', NULL, 'Penumudi', CURRENT_TIMESTAMP)
							,  ('Manish', NULL, 'Chowdary', CURRENT_TIMESTAMP)
							,  ('Mohith', NULL, 'Majeti', CURRENT_TIMESTAMP);


UPDATE STUDENT_TABLE SET MIDDLE_NAME = 'Reddy' WHERE first_name = 'Threnadh'; 


DELETE FROM STUDENT_TABLE 
	   WHERE FIRST_NAME = 'Manish';





/*
	TABLE CREATION WAYS 
	--------------------
	This code shows other ways to create the table

	Way1:    CREATE TABLE_NAME AS (QUERY......)

	Way2:    SELECT .... INTO TABLE_NAME FROM ..... .......

DROP TABLE SciFiFilms
*/

select * from SciFiFilms;

-- METHOD 1
CREATE TABLE SciFiFilms AS

SELECT  film.title as Film_title
	, film.length as Film_length
	, category.name AS Category
FROM film
	INNER JOIN film_category fc ON film.film_id = fc.film_id
	INNER JOIN category on fc.category_id = category.category_id
WHERE category.name = 'Sci-Fi';

-- METHOD 2
SELECT  film.title as Film_title
	, film.length as Film_length
	, category.name AS Category
INTO SciFiFilms  					-- INTO Table
FROM film
	INNER JOIN film_category fc ON film.film_id = fc.film_id
	INNER JOIN category on fc.category_id = category.category_id
WHERE category.name = 'Sci-Fi';