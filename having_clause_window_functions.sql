-- Having clause in SQL
SELECT
	jobtitle, COUNT(jobtitle)
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY jobtitle
HAVING COUNT(jobtitle) > 1;


SELECT
	jobtitle, AVG(salary)
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY jobtitle
HAVING AVG(salary) > 45000
ORDER BY AVG(salary); 

-- Window Functions

SELECT
	jobtitle, COUNT(jobtitle), gender
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY jobtitle,gender;

-- Partition By
SELECT
	jobtitle,
	salary, 
	COUNT(jobtitle) OVER(PARTITION BY jobtitle),
	gender
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- Let's rank the employees by their salaries (rank() over())
SELECT
	first_name,
	last_name,
	salary,
	gender,
	jobtitle,
	rank() OVER (ORDER BY salary DESC)
FROM
	employeedemographics AS dem
	JOIN employeesalary AS sal ON dem.employeeid = sal.employeeid;