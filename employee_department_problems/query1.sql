--return highest salary, employee name, department name for each department
---sol1
CREATE TABLE #tmpTable(
	salary INT,
	department INT
);

INSERT INTO #tmpTable(#tmpTable.salary,#tmpTable.department)
SELECT max(e.salary),e.department_id
FROM dbo.Employee e 
GROUP BY e.department_id;

SELECT e.salary,e.first_name+' '+e.last_name,d2.department_name
FROM dbo.Employee e
JOIN dbo.Department d2 ON e.department_id = d2.department_id
JOIN #tmpTable tt ON tt.department=d2.department_id
WHERE e.salary=tt.salary;


--sol2
WITH cteTable(salary,department_id)
AS
(
	SELECT max(e.salary),e.department_id
	FROM dbo.Employee e
	GROUP BY e.department_id
)
SELECT e.salary,e.first_name+' '+e.last_name,d.department_name
FROM dbo.Employee e
JOIN dbo.Department d ON e.department_id = d.department_id
JOIN cteTable ct ON d.department_id=ct.department_id
WHERE e.salary=ct.salary

--sol3
SELECT e.salary,e.first_name+' '+e.last_name,d.department_name
FROM dbo.Employee e
JOIN dbo.Department d ON e.department_id = d.department_id
WHERE e.salary in (SELECT max(e2.salary) 
				   FROM dbo.Employee e2 
				   GROUP BY e2.department_id)