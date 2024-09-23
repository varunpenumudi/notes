/*
	CROSS JOIN
	all the different combinations of rows in each table
	also called as cartesian product
	for each row in table1 consider all rows in table2
*/
-- CTE (Common Table Expressions)
-- Creating Tables on the fly with CTE(Common Table Expressions)
WITH SetA AS (
	select 'A' as A
	UNION ALL
	select 'B' 
	UNION ALL
	select 'C'
)
, SetB AS (
	select '1' as B
	UNION ALL
	select '2' 
	UNION ALL
	select '3'
)
SELECT * FROM SetA CROSS JOIN SetB;

-- GENERATE_SERIES(start, end) generates series (start, start+1, .... end-1, end)
with TableA as (
	SELECT GENERATE_SERIES(1,3) as A
)
-- CHR converts Ascii Values into Characters
,TableB as (
	SELECT CHR(GENERATE_SERIES(65, 69)) as B
)
select * from TableA CROSS JOIN TableB;


/*
  FULL OUTER JOIN
  kind of mix/union of LEFT AND RIGHT JOIN results
*/
WITH setA as (
	SELECT GENERATE_SERIES(1,3) as A
)
, setB as (
	SELECT GENERATE_SERIES(7,9) as B
)

SELECT * FROM setA FULL JOIN setB ON setA.A = setB.B;
	