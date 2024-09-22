/*
	BASIC TYPES
	-------------------
	BOOLEAN (TRUE/FALSE)
	STRING/TEXT
	NUMERIC(INTEGER, FLOAT)
*/
-- True Datatype
SELECT True AS "Boolean"
UNION ALL
SELECT '1'
UNION ALL
SELECT 'Yes'
UNION ALL
SELECT 'y'
UNION ALL
SELECT 'True'
UNION ALL
SELECT 'true';

-- False
SELECT False AS "Boolean"
UNION ALL
SELECT '0'
UNION ALL
SELECT 'No'
UNION ALL
SELECT 'n'
UNION ALL
SELECT 'False'
UNION ALL
SELECT 'false';

-- String/Text
SELECT 'TEXT EXAMPLE' AS TextExample;

-- Numeric
SELECT 25 as IntegerExample;
SELECT 25.43 as NumericExample;




/*
	TIME(Temporal)
	-------------------
	LOCALTIME
	LOCALTIMESTAMP
	CURRENT_TIME
	CURRENT_TIMESTAMP

	EXTRACT(PART FROM DATE): the "PART" can be (YEAR, MONTH, HOUR, DAY, MINUTE) etc 
	DATE_PART(PART DATE):    the "PART" can be (YEAR, MONTH, HOUR, DAY, MINUTE) etc

	AGE(TIME1, TIME2): Duration Between Two times
*/
-- Local Timestamp
SELECT LOCALTIMESTAMP
	, CURRENT_DATE
	, CAST(LOCALTIMESTAMP as date) as "Date"
	, LOCALTIME
	, CAST(LOCALTIMESTAMP as time) as "Time"
	, CURRENT_TIMESTAMP
	, CURRENT_TIME at time zone 'Asia/Macau';


/*
    SELECT * from pg_timezone_names;
*/
SELECT EXTRACT(YEAR FROM CURRENT_TIMESTAMP) as "Year"
	, EXTRACT(MONTH FROM CURRENT_TIMESTAMP) as "Month"
	, EXTRACT(DAY FROM CURRENT_TIMESTAMP) as "Date"
	, EXTRACT(HOUR FROM CURRENT_TIMESTAMP) as "Hour" 
	, EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) as "Hour" 

	, DATE_PART('Year', CURRENT_DATE) as "Today's Year"
	, DATE_PART('Month', CURRENT_DATE) as "Today's Month"
	, DATE_PART('Day', CURRENT_TIMESTAMP) as "Today's Day";


SELECT DATE_TRUNC('Year', CURRENT_DATE) as "TRUNC Year"
	, DATE_TRUNC('Month', CURRENT_DATE) as "TRUNC Month"
	, DATE_TRUNC('Day', CURRENT_TIMESTAMP) as "TRUNC Day"
	, DATE_TRUNC('Hour', CURRENT_TIMESTAMP) as "TRUNC Day";


SELECT AGE(LOCALTIMESTAMP, DATE_TRUNC('Year', LOCALTIMESTAMP));


-- Most Rented Hour for rentals
SELECT EXTRACT('Hour' FROM  rental.rental_date) as Rental_Hour
	, COUNT(rental.rental_id) as Rentals_Count
FROM rental
GROUP BY EXTRACT('Hour' FROM rental.rental_date) 
ORDER BY rentals_count DESC;

-- RentalDuration for each of rental
SELECT rental_id
    , rental_date
	, return_date
	, AGE(return_date, rental_date) as RentalDuration
FROM rental
WHERE return_date IS NOT NULL
ORDER BY RentalDuration;

-- AVG Rental Duration for all rentals
SELECT AVG(AGE(return_date, rental_date))
FROM rental
WHERE return_date IS NOT NULL;


