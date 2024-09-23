/*
	TEMPORARY TABLES
	------------------
	- Tables that exist only in their session
	- can be created by 'CREATE TEMP TABLE'/'CREATE TEMPORARY TABLE' queries
	- inserting, deleting, updating altering are same as the normal table
*/
drop table company_staff;

CREATE TEMP TABLE IF NOT EXISTS company_staff (
	staff_id smallserial primary key not null,
	staff_name varchar unique not null,
	job varchar not null,
	salary int not null,
	join_date timestamp not null,
	updated_date timestamp null
);

insert into company_staff (staff_name, job, salary, join_date) 
values ('Hitesh', 'Data Scientist', 11_00_000, current_timestamp ), 
	('Varun', 'Django Developer', 9_00_000, current_timestamp ), 
	('Mohan', 'Dataset Manager', 4_00_000, current_timestamp ), 
	('Venkatesh', 'SQL Engineer', 7_00_000, current_timestamp ), 
	('Threenadh', 'ML Engineer', 6_00_000, current_timestamp );

select * from company_staff;

update company_staff 
	set job = 'Data Analyst', updated_date=current_timestamp
	where staff_name = 'Hitesh';

select * from company_staff;

-- Running query below causes error
-- insert into company_staff (staff_name, job, salary, join_date) 
-- 	values ('Hitesh', 'Data Scientist', 12_00_000, current_timestamp )




/*
	CTE VS TEMP TABLES
	------------------
	- CTE's Exist for only single query
	- TEMP tables exists for whole connection
	- you can index TEMP TABLES but not CTE's
*/
-- you can Label the Columns in cte
with customer_cte ("Id", "Full Name") as (
	select customer_id 
		, concat(first_name, ' ', last_name) 
	from customer
)
select * from customer_cte;


-- This is error because the cte only existed for befor query
select * from customer_cte;


/* 
   RECURSIVE CTE
   --------------
   useful highly in finding the hierarchial relations in data
*/

-- CREATING TABLE FOR THE RECURSVIE CTE EXAMPLE
drop table temp_staff_table;

create temp table if not exists temp_staff_table (
	staff_id smallserial primary key not null,
	name varchar unique not null,
	position varchar not null
)

insert into temp_staff_table (name, position) 
values ('varun', 'founder'), ('threenadh', 'other ceo'),  ('hitesh', 'ceo'),
	('mohan', 'finance manager'),  ('venkatesh', 'human resource'), ('mani', 'swe');

alter table temp_staff_table 
	add column boss_id smallint;

select * from temp_staff_table order by staff_id;

update temp_staff_table
	set boss_id=(
		select staff_id from temp_staff_table
		where name = 'hitesh'
	) 
	where name in ('mohan', 'venkatesh');

update temp_staff_table
	set boss_id=(
		select staff_id from temp_staff_table
		where name = 'varun'
	)  
	where name in ('hitesh', 'threenadh');

update temp_staff_table
	set boss_id=(
		select staff_id from temp_staff_table
		where name = 'threenadh'
	)  
	where name = 'mani';

-- RECURSVIE CTE EXAMPLE
WITH RECURSIVE employees AS (
	select staff_id, name as employee_name , boss_id from temp_staff_table
	where name='hitesh'

	UNION ALL

	SELECT c.staff_id, c.name, c.boss_id 
	FROM temp_staff_table c
		INNER JOIN 
			employees emp ON c.boss_id = emp.staff_id
)
select * from employees order by staff_id;