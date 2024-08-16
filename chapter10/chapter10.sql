-- statistical funtions in sql

-- measure correlation with corr(x,y)
--  a measure for quantifying the strength of a linear relationship between two variables
-- It shows the extent to which an increase or decrease in one variable correlates to a change in another variable. The r values fall between −1 and 1
-- 0 being no relationship , 1 being a perfect relationship


-- creating rankings with sql
-- rank() , dense_rank() - both are window functions
-- rank includes a gap in the rank order and dense_rank doesnt

CREATE TABLE widget_companies (
 id bigserial,
 company varchar(30) NOT NULL,
 widget_output integer NOT NULL
);

INSERT INTO widget_companies (company, widget_output)
VALUES
 ('Morse Widgets', 125000),
 ('Springfield Widget Masters', 143000),
 ('Best Widgets', 196000),
 ('Acme Inc.', 133000),
 ('District Widget Inc.', 201000),
 ('Clarke Amalgamated', 620000),
 ('Stavesacre Industries', 244000),
 ('Bowers Widget Emporium', 201000);

select company, widget_output, 
	rank() over (order by widget_output desc),
dense_rank() over (order by widget_output desc)
from widget_companies;

