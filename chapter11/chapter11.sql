-- working with dates and times

-- data types and functions for dates and times
-- date, time, timestamp, interval

-- manipulating dates and times

-- extracting components of a timestamp value using date_part()
SELECT 
 date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
 date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
 date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
 date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
 date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
 date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
 date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
 date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
 date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
 date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";

-- creating datetime values from timestamp components
-- make_date(year, month,day) - returns a value type date
-- make_time(hour,minute,seconds) - returns a value of type time without time zone
-- make_timestamptz(year,month,day,hour,minute,second,time zone) - return a timestamp with timezone

SELECT make_date(2018, 2, 22);
SELECT make_time(18, 4, 30.3); 
SELECT make_timestamptz(2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

-- retrieving the current date and time
select current_date;
select current_time;
select current_timestamp;
select localtime;
select localtimestamp;

-- showing your postgresql servers default time zone
show timezone;

-- calculations with date and times
SELECT '9/30/1929'::date - '9/27/1929'::date;

SELECT '9/30/1929'::date + '5 years'::interval;




