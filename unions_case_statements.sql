CREATE TABLE WareHouseEmployeeDemographics (
	employeeID int,
	first_name varchar(50),
	last_name varchar(50),
	age int,
	gender varchar(50));
	
INSERT INTO WareHouseEmployeeDemographics
		VALUES(
			1013, 'Darryl', 'Philbin', NULL, 'Male'), (
			1050, 'Roy', 'Anderson', 31, 'Male'), (
			1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'), (
			1052, 'Val', 'Johnson', 31, 'Female');

-- Union
SELECT * FROM employeedemographics
UNION
SELECT * FROM warehouseemployeedemographics;

-- Case statement
SELECT
	first_name,
	last_name,
	age,
	CASE WHEN age > 30 THEN
		'Old'
	ELSE
		'Young'
	END
FROM
	employeedemographics
WHERE
	age IS NOT NULL
ORDER BY age; 

SELECT
	first_name,
	last_name,
	jobtitle,
	salary,
	CASE WHEN jobtitle = 'Salesman' THEN
		salary * 1.10
	WHEN jobtitle = 'Accountant' THEN
		salary * 1.05
	WHEN jobtitle = 'HR' THEN
		salary * 1.000001
	ELSE
		salary * 1.03
	END AS salary_after_raise
FROM
	employeedemographics
	JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;