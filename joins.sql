-- Table employees schema creation 
CREATE TABLE employeeDemographics (
	employeeID INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	age INT,
	gender VARCHAR(50)
);

-- Table employee salary schema creation
CREATE TABLE employeeSalary (
	employeeID INT,
	jobTitle VARCHAR(50),
	salary INT
);

-- Employees table data insertion

INSERT INTO employeedemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

-- Employee salaries data insertion

INSERT INTO employeesalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

Insert into employeedemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male');

Insert into employeesalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000);

-- Inner join
SELECT
	*
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- Full outer join 
SELECT
	*
FROM
	employeedemographics
	FULL OUTER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- Left join
SELECT
	*
FROM
	employeedemographics
	LEFT JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- Right join
SELECT
	*
FROM
	employeedemographics
	RIGHT JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- Let's check the highest paid employee
SELECT
	first_name,
	last_name,
	salary
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
ORDER BY
	salary DESC
LIMIT 1;

-- Let's check the lowest paid employee
SELECT
	first_name,
	last_name,
	salary
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
ORDER BY
	salary
LIMIT 1;

-- Let's check the most paid employee based onjob title
SELECT
	jobtitle,
	SUM(salary) AS sum
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY
	jobtitle
ORDER BY
	sum DESC;

-- Let's check if this entreprise is gender neutral(parity).
SELECT
	gender, COUNT(gender)
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY gender;
-- Result : 6 males vs 3 females, so there's work to do.

--We will see gap between male and female about salaries
SELECT
	gender, COUNT(gender), SUM(salary) as salary_sum
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY gender;

-- Let's check the repartition of females and males based on jobtitle
SELECT
	jobtitle, COUNT(jobtitle), gender
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY jobtitle,gender;	

-- Let's check the salary difference between female and male for the same jobtitle
SELECT
	*
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
WHERE jobtitle = 'Accountant';
-- For the same accountant job female are more paid than male. Maybe this is of the female experience year in this field
--	and also her level
-- What's the average salary based on jobtitle

SELECT
	jobtitle,
	AVG(salary) as avg_salary
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY jobtitle
ORDER BY avg_salary DESC;
-- If you have to chose a job go for Regional Manager because it's the most paid one 