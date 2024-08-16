-- advanced query techniques

-- subqueries
-- a subquery is nested inside another query
UPDATE table
SET column = (SELECT column
 FROM table_b
 WHERE table.column = table_b.column)
WHERE EXISTS (SELECT column
 FROM table_b
 WHERE table.column = table_b.column);

-- using a subquery in a where clause
SELECT geo_name,
 state_us_abbreviation,
 p0010001
FROM us_counties_2010
 WHERE p0010001 >= (
 SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY p0010001)
 FROM us_counties_2010
 )
ORDER BY p0010001 DESC;

-- Cross Tabulations
-- Cross tabulations provide a simple way to summarize and compare variables by displaying them in a table layout, or matrix.

-- installing the crosstab function
create extension tablefunc;

CREATE TABLE ice_cream_survey (
 response_id integer PRIMARY KEY,
 office varchar(20),
 flavor varchar(20)
);

-- filling the ice cream_survey table
COPY ice_cream_survey
FROM 'C:\Users\ASUS\Downloads\practical-sql-main\practical-sql-main\Chapter_12\ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);


SELECT * 
FROM ice_cream_survey
LIMIT 5;

-- generating the ice cream survey crosstab
SELECT *
FROM crosstab('SELECT office,
 flavor,
count(*)
 FROM ice_cream_survey
 GROUP BY office, flavor
 ORDER BY office',
 
 'SELECT flavor 
 FROM ice_cream_survey
 GROUP BY flavor
 ORDER BY flavor')
 AS (office varchar(20),
 chocolate bigint,
 strawberry bigint,
 vanilla bigint);
