-- joining tables in a relational database

-- linking tables using join
-- syntax
select *
from table_a join table_b
on table_a.key_column = table_b.foreign_key_column

-- relating tables with key columns
CREATE TABLE departments (
 dept_id bigserial,
 dept varchar(100),
 city varchar(100),
 CONSTRAINT dept_key PRIMARY KEY (dept_id),
 CONSTRAINT dept_city_unique UNIQUE (dept, city)
);
CREATE TABLE employees (
 emp_id bigserial,
 first_name varchar(100),
 last_name varchar(100),
 salary integer,
 dept_id integer REFERENCES departments (dept_id),
 CONSTRAINT emp_key PRIMARY KEY (emp_id),
 CONSTRAINT emp_dept_unique UNIQUE (emp_id, dept_id)
);
INSERT INTO departments (dept, city)
VALUES
 ('Tax', 'Atlanta'),
 ('IT', 'Boston');
 
INSERT INTO employees (first_name, last_name, salary, dept_id)
VALUES
 ('Nancy', 'Jones', 62500, 1),
 ('Lee', 'Smith', 59300, 1),
 ('Soo', 'Nguyen', 83000, 2),
 ('Janet', 'King', 95000, 2);


-- querying multiple tables using join
-- joining the employees and departments table
select * 
from employees join departments
on employees.dept_id = departments.dept_id;

-- join types
-- join, left join, right join, full outer join, cross join;

-- 3 types of table relationships
-- one to one, one to many, many to many



