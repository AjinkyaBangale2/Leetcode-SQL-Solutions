# https://leetcode.com/problems/department-highest-salary/
SELECT
    d.name AS 'Department',
    e.name AS 'Employee',
    Salary
FROM
    Employee e
        JOIN
    Department d ON e.DepartmentId = d.Id
WHERE
    (e.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
    )
;


# Another solution
SELECT 
    department, 
    employee, 
    Salary
FROM (SELECT
    d.Name Department,
    e.Name Employee,
    Salary,
    Rank() OVER (Partition by e.DepartmentId ORDER BY Salary desc) as srank
FROM Employee e JOIN Department d ON e.DepartmentId = d.Id
) s
WHERE srank = 1
