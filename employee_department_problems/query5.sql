----------query 3-------------------
--select 2nd highest salary in employee table

---sol1
SELECT TOP 1 t.salary
FROM (SELECT TOP 2 e.salary AS salary FROM dbo.Employee e ORDER BY e.salary DESC) t
ORDER BY t.salary ASC

---sol2
SELECT max(e.salary)
FROM dbo.Employee e
WHERE e.salary != (SELECT max(e2.salary) FROM dbo.Employee e2)
