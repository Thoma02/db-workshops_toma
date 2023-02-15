USE hr;


-- @block 
SELECT *
FROM employees;


-- @block
-- 1. Find all employees with `job_id` equals `IT_PROG`
SELECT;


-- @block
-- 2. Find all employees with salary more than `10000`
SELECT;


-- @block
-- 3. Find all employees with salary between 10 000 and 20 000 (including ends)
SELECT;


-- @block
-- 4. Find all employees that are not form `60`, `30` and `100` departments
SELECT;


-- @block
-- 5. Find all employees whose names doesn't contain `ll` in the middle
SELECT;


-- @block
-- 6. Find all employees with names ended with `a`
SELECT first_name,
  last_name
FROM employees
WHERE first_name LIKE '%a';


-- @block
SELECT first_name,
  last_name,
  commission_pct,
  job_id
FROM employees
WHERE commission_pct IS NOT NULL;

-- @block
SELECT first_name AS firstName
FROM hr.employees as e
WHERE e.first_name = 'John';