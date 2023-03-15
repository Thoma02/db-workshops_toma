USE hr

--@block
SELECT e.first_name, 
e.last_name,
d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;
