DROP DATABASE IF EXISTS Practical2_2026;
CREATE DATABASE Practical2_2026;

USE Practical2_2026;
---QUESTION 1
--CREATING TABLES

CREATE TABLE Department(
	deptNo VARCHAR(50) PRIMARY KEY NOT NULL,
	deptName VARCHAR(255),
	managerNo VARCHAR(50)
);

CREATE TABLE Employee(
	empID VARCHAR(50) PRIMARY KEY NOT NULL,
	empLName VARCHAR(255),
	emplFName VARCHAR(255),
	deptNo VARCHAR(50) NOT NULL,
	FOREIGN KEY (deptNo) REFERENCES Department(deptNo),
	jobTitle VARCHAR(255),
	years INT,
	salary MONEY,
	commission MONEY,
);

CREATE TABLE Project(
	projectNo VARCHAR(50) PRIMARY KEY NOT NULL,
	projectName VARCHAR(255),
	deptNo VARCHAR(50),
	FOREIGN KEY (deptNo) REFERENCES Department(deptNo),
	prManager VARCHAR(50),
	noEmp INT,
	prStartdate SMALLDATETIME,
	prEnddate SMALLDATETIME
);

---POPULATING TABLES

INSERT INTO Department(deptNo, deptName, managerNo)
VALUES
('DPT_01','FINANCIAL','EMP_20'),
('DPT_02','SALES','EMP_30'),
('DPT_03','OPERATIONS','EMP_50'),
('DPT_04','ADMIN','EMP_20');


INSERT INTO Employee(empID, empLName, emplFName, deptNo, jobTitle, years, salary, commission)
VALUES
('EMP_10', 'WALL', 'CHRIS', 'DPT_03', 'EDITOR', '2', '35000.00', NULL),
('EMP_20', 'ABBA', 'ZACK', 'DPT_02', 'ADVERTISING SALES EXECUTIVE', '5', '35000.00', '32500.00'),
('EMP_30', 'SILVA', 'JOEL', 'DPT_01', 'MANAGER EDITOR', '12', '65000.00', NULL),
('EMP_40', 'SILVA', 'ANNIE', 'DPT_01', 'FINANCIAL MANAGER', '12', '45000.00', NULL),
('EMP_50', 'KRUGER', 'SHAUN', 'DPT_02', 'SALES MANAGER', '12', '40000.00', '57000.00'),
('EMP_60', 'WELGEMOED', 'GERRIE', 'DPT_02', 'SALES EXECUTIVE', '4', '25000.00', '35000.00'),
('EMP_70', 'ROBINSON', 'DARRYL', 'DPT_03', 'OPERATIONS MANAGER', '12', '40000.00', NULL),
('EMP_80', 'MILLER', 'ANTHONY', 'DPT_03', 'GRAPHIC DESIGNER', '3', '20000.00', NULL),
('EMP_90', 'NOBLE', 'SHONEEZ', 'DPT_04', 'RECEPTIONIST AND PA', '2', '15000.00', NULL);

INSERT INTO Project(projectNo, projectName, deptNo, prManager, noEmp, prStartdate, prEnddate)
VALUES
('PR_001','NEW CONTRACT-SAB','DPT_02','EMP_50','3','2013/01/10 00:00','2013/03/30 00:00'),
('PR_002','GENERAL ADMIN SYSTEM','DPT_03','EMP_40','2','2013/04/01 00:00','2013/12/01 00:00'),
('PR_003','APPLICATIONS SUPPORT','DPT_03','EMP_40','5','2013/02/01 00:00','2013/05/31 00:00'),
('PR_004','ACCOUNT PROGRAMMING','DPT_01','EMP_70','3','2013/01/01 00:00','2013/07/31 00:00'),
('PR_005','NEW CONTRACT-ABSA','DPT_02','EMP_50','3','2013/01/01 00:00','2013/06/30 00:00');

SELECT * FROM Project;
SELECT * FROM Employee;
SELECT * FROM Department;

---QUESTION 2
SELECT empLName,salary
FROM Employee;

---QUESTION 3
SELECT projectName,prStartdate,prEnddate
FROM Project
where MONTH(prStartdate) = 4;

---QUESTION 4
SELECT empLName,salary
FROM Employee
ORDER BY salary ASC;

---QUESTION 5
SELECT MAX(salary) AS 'Highest Salary',MIN(salary)AS 'Lowest Salary',COUNT(salary) AS 'Number of Salaries'
FROM Employee

---QUESTION 6
SELECT empLName,emplFName,commission
FROM Employee
WHERE commission IS NOT NULL
ORDER BY empLName DESC;

---QUESTION 7
SELECT *
FROM Project
WHERE projectName LIKE '%Admin%';

---QUESTION 8
SELECT years +1 AS 'years'
FROM Employee;
