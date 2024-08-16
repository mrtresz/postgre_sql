-- inspecting and modifying data
-- importing the fsis meat,poultry and egg inpection directory

CREATE TABLE meat_poultry_egg_inspect (
    est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
    company varchar(100),
    street varchar(100),
    city varchar(30),
    st varchar(2),
    zip varchar(5),
    phone varchar(14),
    grant_date date,
    activities text,
    dbas text
);

COPY meat_poultry_egg_inspect
FROM 'C:\Users\ASUS\Downloads\practical-sql-main\practical-sql-main\Chapter_09\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

CREATE INDEX company_idx ON meat_poultry_egg_inspect (company);

SELECT count(*) FROM meat_poultry_egg_inspect;

-- interviewing data sets
-- finding multiple companies at the same adress
SELECT company,
 street,
 city,
 st,
 count(*) AS address_count
FROM meat_poultry_egg_inspect
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;

-- checking for missing values
SELECT st,
 count(*) AS st_count
FROM meat_poultry_egg_inspect
GROUP BY st
ORDER BY st;

-- using is null to find missing values in the st column
SELECT est_number,
 company,
 city, 
 st,
 zip
FROM meat_poultry_egg_inspect
WHERE st IS NULL;

-- modifying tables with alter table
ALTER TABLE table ADD COLUMN column data_type;

-- modifying values with update
UPDATE table
SET column = value;

-- deleting rows from a table
DELETE FROM table_name;

DELETE FROM table_name WHERE expression;



