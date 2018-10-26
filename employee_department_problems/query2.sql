--return employee name, highest salary and department
SELECT e.first_name+' '+e.last_name,e.salary,d.department_name
FROM dbo.Employee e
JOIN dbo.Department d ON e.department_id = d.department_id
WHERE e.salary=(SELECT max(e2.salary) FROM dbo.Employee e2)