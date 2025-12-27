/* =========================================================
Name   : ROHAN NAMDEO VAIDYA
Batch  : DA NOV 2025
Project: Employee and Department Management System
========================================================= */


/* =========================================================
1] SITUATIONAL QUESTIONS ON INSERT
========================================================= */

/* Situation -1
We have hired two employees in IT department (DepartmentID: 3)
*/
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
VALUES
('Siddharth','Gupta',3,70000,'2024-01-01','siddharth.gupta@example.com'),
('Aarav','Jain',3,72000,'2024-01-02','aarav.jain@example.com');

/* Situation -2
Create Marketing department
*/
INSERT INTO Departments (DepartmentName, Location, HeadOfDepartment, AnnualBudget)
VALUES ('Marketing','Pune','Rakesh Mehta',1300000);

/* Situation -3
Add employees to Marketing department
*/
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
VALUES
('Rahul','Mehra',11,58000,'2024-01-10','rahul.mehra@example.com'),
('Sara','Kapoor',11,62000,'2024-01-11','sara.kapoor@example.com'),
('Nitin','Shah',11,60000,'2024-01-12','nitin.shah@example.com');

/* Situation -4
Add employees to HR department
*/
INSERT INTO Employees VALUES
(NULL,'Riya','Sharma',1,50000,'2024-02-01','riya.sharma@example.com'),
(NULL,'Mohit','Desai',1,55000,'2024-02-02','mohit.desai@example.com');

/* Situation -5
Add Sneha Rao to Finance department
*/
INSERT INTO Employees VALUES
(NULL,'Sneha','Rao',2,60000,'2024-02-15','sneha.rao@example.com');

/* Situation -6
Add employees to Legal department
*/
INSERT INTO Employees VALUES
(NULL,'Aditya','Malhotra',7,65000,'2024-03-01','aditya.malhotra@example.com'),
(NULL,'Priyanka','Kapoor',7,67000,'2024-03-02','priyanka.kapoor@example.com'),
(NULL,'Kunal','Singh',7,68000,'2024-03-03','kunal.singh@example.com');

/* Situation -7
Create Research department
*/
INSERT INTO Departments VALUES
(12,'Research','Hyderabad','Dr. Meera Joshi',2000000);

/* Situation -8
Add employees to Research department
*/
INSERT INTO Employees VALUES
(NULL,'Arjun','Shah',12,75000,'2024-04-01','arjun.shah@example.com'),
(NULL,'Riya','Patel',12,72000,'2024-04-02','riya.patel@example.com');

/* Situation -9
Create Logistics department
*/
INSERT INTO Departments VALUES
(13,'Logistics','Chennai','Ravi Verma',900000);

/* Situation -10
Add employees to Logistics department
*/
INSERT INTO Employees VALUES
(NULL,'Kavita','Desai',13,50000,'2024-05-01','kavita.desai@example.com'),
(NULL,'Amit','Jain',13,52000,'2024-05-02','amit.jain@example.com');


/* =========================================================
2] SITUATIONAL QUESTIONS ON WHERE CLAUSE
========================================================= */

/* Situation -1 */
SELECT * FROM Employees WHERE DepartmentID = 3;

/* Situation -2 */
SELECT * FROM Employees WHERE DateOfJoining > '2024-01-01';

/* Situation -3 */
SELECT * FROM Employees WHERE Salary > 60000;

/* Situation -4 */
SELECT * FROM Employees WHERE Email LIKE '%@example.com';

/* Situation -5 */
SELECT * FROM Employees
WHERE DepartmentID = 11 AND Salary < 60000;

/* Situation -6 */
SELECT * FROM Employees WHERE FirstName LIKE 'S%';

/* Situation -7 */
SELECT * FROM Employees
WHERE DateOfJoining BETWEEN '2024-02-01' AND '2024-02-29';

/* Situation -8 */
SELECT * FROM Employees
WHERE Salary BETWEEN 50000 AND 70000;

/* Situation -9 */
SELECT * FROM Employees
WHERE DateOfJoining < '2024-03-01' AND Salary > 55000;

/* Situation -10 */
SELECT * FROM Employees WHERE FirstName LIKE '%Manager%';

/* Situation -11 */
SELECT * FROM Departments WHERE Location = 'Pune';

/* Situation -12 */
SELECT * FROM Departments WHERE AnnualBudget > 1000000;

/* Situation -13 */
SELECT * FROM Departments WHERE HeadOfDepartment = 'Rakesh Mehta';

/* Situation -14 */
SELECT * FROM Departments WHERE DepartmentName LIKE 'M%';

/* Situation -15 */
SELECT * FROM Departments
WHERE AnnualBudget BETWEEN 800000 AND 1500000;


/* =========================================================
3] SITUATIONAL QUESTIONS ON GROUP BY CLAUSE
========================================================= */

/* Situation -1 */
SELECT DepartmentID, SUM(Salary) FROM Employees GROUP BY DepartmentID;

/* Situation -2 */
SELECT DepartmentID, COUNT(*) FROM Employees GROUP BY DepartmentID;

/* Situation -3 */
SELECT DepartmentID, AVG(Salary) FROM Employees GROUP BY DepartmentID;

/* Situation -4 */
SELECT DepartmentID, MIN(DateOfJoining) FROM Employees GROUP BY DepartmentID;

/* Situation -5 */
SELECT DepartmentID, MAX(Salary) FROM Employees GROUP BY DepartmentID;

/* Situation -6 */
SELECT DepartmentID, MIN(Salary) FROM Employees GROUP BY DepartmentID;

/* Situation -7 */
SELECT DepartmentID, SUM(Salary)
FROM Employees
WHERE Salary > 60000
GROUP BY DepartmentID;

/* Situation -8 */
SELECT DepartmentID, COUNT(*)
FROM Employees
WHERE YEAR(DateOfJoining) = 2024
GROUP BY DepartmentID;

/* Situation -9 */
SELECT DepartmentID, COUNT(*)
FROM Employees
WHERE Salary BETWEEN 50000 AND 70000
GROUP BY DepartmentID;

/* Situation -10 */
SELECT LEFT(FirstName,1), COUNT(*)
FROM Employees
GROUP BY LEFT(FirstName,1);

/* Situation -11 */
SELECT Location, COUNT(*) FROM Departments GROUP BY Location;

/* Situation -12 */
SELECT Location, SUM(AnnualBudget) FROM Departments GROUP BY Location;

/* Situation -13 */
SELECT HeadOfDepartment, COUNT(*) FROM Departments GROUP BY HeadOfDepartment;

/* Situation -14 */
SELECT Location, AVG(AnnualBudget) FROM Departments GROUP BY Location;

/* Situation -15 */
SELECT Location, MAX(AnnualBudget), MIN(AnnualBudget)
FROM Departments
GROUP BY Location;


/* =========================================================
4] SITUATIONAL QUESTIONS ON CONCAT
========================================================= */

/* Situation -1 */
SELECT CONCAT(FirstName,' ',LastName) FROM Employees;

/* Situation -2 */
SELECT CONCAT(DepartmentName,' - ',Location) FROM Departments;

/* Situation -3 */
SELECT CONCAT('Hello ',FirstName,',') FROM Employees;

/* Situation -4 */
SELECT CONCAT(DepartmentID,'_',EmployeeID) FROM Employees;

/* Situation -5 */
-- Not applicable (phone number not present)

/* Situation -6 */
-- Not applicable (address fields not present)

/* Situation -7 */
SELECT CONCAT(FirstName,LastName,DepartmentID) FROM Employees;

/* Situation -8 */
-- Not applicable (position not present)

/* Situation -9 */
-- Not applicable (job title/project not present)

/* Situation -10 */
SELECT CONCAT(YEAR(DateOfJoining),'_',FirstName) FROM Employees;


/* =========================================================
5] SITUATIONAL QUESTIONS ON UPDATE CLAUSE
========================================================= */

/* Situation -1 */
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentID = 3;

/* Situation -2 */
-- Not applicable (JobTitle column not present)

/* Situation -3 */
-- Not applicable (PhoneNumber column not present)

/* Situation -4 */
UPDATE Employees
SET Email = CONCAT(SUBSTRING_INDEX(Email,'@',1),'@newcompany.com')
WHERE DateOfJoining > '2023-01-01';

/* Situation -5 */
UPDATE Departments
SET DepartmentName = 'Human Resources'
WHERE DepartmentID = 5;

/* Situation -6 */
UPDATE Employees
SET Salary = Salary + 5000
WHERE Salary < 50000;

/* Situation -7 */
UPDATE Departments
SET Location = 'Mumbai'
WHERE DepartmentID = 11;

/* Situation -8 */
UPDATE Employees
SET Salary = 60000
WHERE EmployeeID = 135;

/* Situation -9 */
-- Not applicable (Project column not present)

/* Situation -10 */
UPDATE Employees
SET DateOfJoining = '2024-03-15'
WHERE EmployeeID = 103;


/* =========================================================
6] SITUATIONAL QUESTIONS ON DELETE CLAUSE
========================================================= */

/* Situation -1 */
DELETE FROM Employees WHERE EmployeeID = 101;

/* Situation -2 */
DELETE FROM Employees
WHERE DepartmentID = 2 AND DateOfJoining < '2022-01-01';

/* Situation -3 */
DELETE FROM Employees WHERE Salary < 30000;

/* Situation -4 */
-- Not applicable (Project column not present)

/* Situation -5 */
-- Not applicable (Project column not present)

/* Situation -6 */
DELETE FROM Employees WHERE EmployeeID = 135;

/* Situation -7 */
DELETE FROM Employees
WHERE DepartmentID = 3 AND DateOfJoining < '2021-01-01';

/* Situation -8 */
DELETE FROM Employees
WHERE Email IS NULL;

/* Situation -9 */
-- Not applicable (Contract column not present)

/* Situation -10 */
-- Not applicable (Region column not present)


/* =========================================================
7] SITUATIONAL QUESTIONS ON TABLE SCHEMA MODIFICATIONS
========================================================= */

/* Situation -1 */
RENAME TABLE Employees TO Staff;
RENAME TABLE Staff TO Employees;

/* Situation -2 */
ALTER TABLE Employees ADD MaritalStatus VARCHAR(20);

/* Situation -3 */
ALTER TABLE Employees ADD DateOfBirth DATE;

/* Situation -4 */
ALTER TABLE Employees MODIFY Salary DECIMAL(10,2);

/* Situation -5 */
ALTER TABLE Employees ADD EmployeeCategory VARCHAR(20);

/* Situation -6 */
ALTER TABLE Employees ADD DepartmentName VARCHAR(50);

/* Situation -7 */
ALTER TABLE Employees ADD Status VARCHAR(20) DEFAULT 'Active';

/* Situation -8 */
ALTER TABLE Employees CHANGE DepartmentID TeamID INT;
ALTER TABLE Employees CHANGE TeamID DepartmentID INT;

/* Situation -9 */

/*  Partition the Employees table by DateOfJoining
to separate employees who joined before 2020
*/

ALTER TABLE Employees
PARTITION BY RANGE (YEAR(DateOfJoining)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020_and_after VALUES LESS THAN MAXVALUE
);

/* Retrieve partition information for consistency check */
SELECT PARTITION_NAME
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Employees';


/* Situation -10 */
ALTER TABLE Employees
ADD CONSTRAINT fk_department
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);


/* ======================= END OF PROJECT ======================= */
