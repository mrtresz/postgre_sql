-- table design
-- naming tables columns and other identifiers
-- camelCase, PascalCase, snake_case

-- using quotes around identifiers to enable mixed case
CREATE TABLE customers (
 customer_id serial,
 --snip--
);

CREATE TABLE Customers (
 customer_id serial,
 --snip--
);
CREATE TABLE "Customers" (
 customer_id serial,
 --snip--
);

-- guidelines for naming identifiers:
-- use snake case, readable and reliable
-- make names easy to understand
-- for table names use plurals
-- mind the length

-- controlling column values with constraints
-- primary keys
-- check - evaluates whether data falls withing values we specify
-- unique - ensurea values are unique in rows
-- not null - prevents null values in a column
-- auto incrementing surrogate key (big serial)

-- foreign keys - 
-- A foreign key is one or more columns in a table that match the primary key of another table

-- Speeding up queries with indexes
--  The database uses the index as a shortcut rather than scanning each row to find data
-- b-tree (postgre default index), created automatically , GIN,GiST(generalized search tree)
CREATE INDEX street_idx ON new_york_addresses (street);









