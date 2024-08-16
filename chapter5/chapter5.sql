-- basic math and stats

-- math operators
-- + , - , * , / , % , ^ , / , |/ , ||/ , !

-- math and data types
-- adding, subtraction and multiply
select 2 + 2 as addition;
select 9 - 1 as subtraction;
select 3 * 4 as multiplication;

-- division and modulo
select 11 / 6 as division;
select 11 % 6 as modulo;

select 11.0 / 6 as division;
select cast (11 as numeric(3,1)) / 6;

-- exponents, roots and factorials
select 3 ^ 4 as power_4;
select |/ 10 as square_root_of_10;
select sqrt(10);
select ||/ 10;

-- order of operations (precedence)
-- 1. exponents and roots
-- 2. multiplication, dividion, modulo
-- 3. addition and subtraction

-- example 
select 7 + 8 * 9;
select (7 + 8) * 9;

-- second example
select 3 ^ 3 -1;
select 3 ^ (3 - 1);

-- doing math across cencus table columns;
select geo_name,
 state_us_abbreviation as "st",
 p0010001 as "Total Population",
 p0010003 as "White Alone",
 p0010004 as "Black or African American Alone",
 p0010005 as "Am Indian/Alaska Native Alone",
 p0010006 as "Asian Alone",
 p0010007 as "Native Hawaiian and Other Pacific Islander Alone",
 p0010008 as "Some Other Race Alone",
 p0010009 as "Two or More Races"
from us_counties_2010;

-- adding and subtracting columns
select geo_name,
 state_us_abbreviation as "st",
 p0010003 as "White Alone",
 p0010004 as "Black Alone",
p0010003 + p0010004 as "Total White and Black"
from us_counties_2010;

-- checking census data totals
SELECT geo_name, 
 state_us_abbreviation AS "st", 
  p0010001 AS "Total",
  p0010003 + p0010004 + p0010005 + p0010006 + p0010007 
 + p0010008 + p0010009 AS "All Races",
  (p0010003 + p0010004 + p0010005 + p0010006 + p0010007 
 + p0010008 + p0010009) - p0010001 AS "Difference"
FROM us_counties_2010
 ORDER BY "Difference" DESC;

-- finding percentages of the whole
select geo_name,
 state_us_abbreviation as "st",
 (cast (p0010006 as numeric(8,1)) / p0010001) * 100 as "pct_asian"
from us_counties_2010
order by "pct_asian" desc;

-- tracking percent change (current number - old number) / old number

-- example
create table percent_change (
	department varchar(20),
	spend_2014 numeric(10,2),
	spend_2017 numeric(10,2)
);

insert into percent_change 
values 
 ('Building', 250000, 289000),
 ('Assessor', 178556, 179500),
 ('Library', 87777, 90001),
 ('Clerk', 451980, 650000),
 ('Police', 250000, 223000),
 ('Recreation', 199000, 195000);


select department,spend_2014,spend_2017 ,
	round( (spend_2017 - spend_2014) / spend_2014 * 100, 1) as "pct_change"
from percent_change;

-- aggregate functions for averages and sums

-- using the sum() and avg() aggregate functions
select sum(p0010001) as "County Sum",
 round(avg(p0010001), 0) as "County Average"
from us_counties_2010;

-- finding the median
-- the median is the middle value in an ordered set of values












