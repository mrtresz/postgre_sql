-- data exploration with SELECT;

-- Querying all rows and columns from the teachers table;
select * from teachers;

-- querying a subset of columns;
select last_name, first_name, salary from teachers;

-- using DISTICT to find unique values, (eliminate duplicates);
select distinct school
from teachers;

-- Querying distict pairs of values in the school and salary columns
select distinct school, salary
from teachers;

-- sorting data with ORDER BY;
select first_name, last_name, salary
from teachers
order by salary desc;

-- sorting multiple columns
select last_name, school,hire_date 
from teachers
order by school asc, hire_date desc;

-- ? filtering rows with WHERE;
select last_name,school,hire_date
from teachers
where school = 'Myers Middle School';

-- = , <> , > , < , >= , <= , BETWEEN ? AND ? , IN('?' , (?) ) , LIKE 'Sam%' , ILIKE 'sam%', NOT ILIKE 'sam%'

-- example 1
select first_name , last_name, school
from teachers
where first_name = 'Janet';

-- example 2
select school
from teachers
where school <> 'F.D. Roosevelt HS';

-- example 3
select first_name, last_name, hire_date
from teachers
where hire_date < '2000-01-01';

-- example 4
select first_name, last_name, salary
from teachers
where salary >= 43500;

-- example 5
select first_name, last_name, school, salary
from teachers
where salary between 40000 and 65000;

-- using LIKE and ILIKE with WHERE
-- % - wildcard matching one or more characters
-- _ -wildcard matching just one character

-- case sensitive
select first_name
from teachers
where first_name like 'sam%';

-- case insensitive
select first_name
from teachers
where first_name ilike 'sam%';


-- combining comparision operators with AND & OR;

-- example 1
select * 
from teachers
where school = 'Myers Middle School' and salary < 40000;

-- example 2
select *
from teachers
where last_name = 'Cole' or last_name = 'Bush';

-- example 3
select *
from teachers
where school = 'F.D. Roosevelt HS' and (salary < 38000 or salary > 40000);

-- adding sorting
select first_name,last_name,school,hire_date,salary
from teachers
where school like '%Roos%'
order by hire_date desc;

-- exercise , write a query that finds one teacher whose first name starts with the letter s and who earns more than 40000
select first_name, salary
from teachers
where first_name ilike 's%' and salary > 40000;







