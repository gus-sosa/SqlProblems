--return employee record with max salary

--solution 1
SELECT TOP 1 * FROM dbo.Employee e ORDER BY e.salary DESC;
--solution 2
SELECT * FROM dbo.Employee e WHERE e.salary=(SELECT max(e2.salary) FROM dbo.Employee e2);


