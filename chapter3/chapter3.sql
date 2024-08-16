-- data types

-- example of declaring a datatype
create table eagle_watch (
	observed_date date,
	eagles_seen integer
);

-- most used data types

-- characters - holds any character or symbol
-- Numbers - includes whole numbers and fractions
-- Dates and times - types holding temporal information
	
	-- characters
		-- char(n) adds space
		-- varchar(n) doesnt add space
		-- text -unlimited length

	-- numbers
		-- Integers - whole numbers, both positive and negative (smallint, integer, bigint)
		-- fixed-point and floating point - two formats of fraction of whole numbers

			-- auto-increamenting integers
				-- bigserial (smallserial , serial)
create table people (
	id serial,
	person_name varchar(100)
);

		-- decimal numbers
			-- fixed-point numbers - numeric(precision,scale -no. of digits allowable on the right)
			-- floating-point types (real, double) the difference is how much data they store

-- dates and time
	-- timestamp (date and time) 8 bytes
	-- date (date no time) 4 bytes
	-- time (time no date ) 8 bytes
	-- interval (time interval) 16 bytes

		-- examples 
		create table date_time_types (
			timestamp_column timestamp with time zone,
			interval_column interval
		);

		insert into date_time_types 
		values 
		 ('2018-12-31 01:00 EST','2 days'),
		 ('2018-12-31 01:00 -8','1 month'),
		 ('2018-12-31 01:00 Australia/Melbourne','1 century'),
		 (now(),'1 week');

		SELECT * FROM date_time_types;



