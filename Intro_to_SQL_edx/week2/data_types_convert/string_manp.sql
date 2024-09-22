/*
	STRING MANIPULATION FUNCTIONS
	------------------------------
	LENGTH(str): 			     No.of Characters in str
	POSITION(char in str): 		 Position of char in str Eg: POSITION('v' in 'varun') = 1
	SUBSTRING(str, start, size):  Substring of length size from position in string
	                             Eg: SUBSTRING('Varun', 1, 3) = 'Var'

	REPLACE(str, substr, newstr): Replaces the substr of string with new string given
								   Eg: REPLACE('varun' , 'un', 'in') = 'varin'
*/

SELECT email
	, POSITION('@' IN email) AS at_position
	, POSITION('.' IN email) AS dot_position
	, SUBSTRING(email, 0, POSITION('.' IN email)-1) as first_name
	, SUBSTRING(email, POSITION('.' IN email)+1, POSITION('@' in email)-POSITION('.' in email)-1) as last_name
	, SUBSTRING(email , POSITION('@' IN email), LENGTH(email)) AS Email_Domain 
	, REPLACE(email, SUBSTRING(email , POSITION('@' IN email), LENGTH(email)), '@VARUN.COM') AS Replaced_Email 
FROM customer;