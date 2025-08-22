USE Experiments;

--EASY
CREATE TABLE Employee (
  Emp_ID INT
);

INSERT INTO Employee (Emp_ID) VALUES
(2), (4), (4), (6), (6), (7), (8), (8), (8);

--Finding max Emp_ID excluding duplicates
SELECT MAX(Emp_ID) AS Max_Unique_ID
FROM Employee
WHERE Emp_ID IN (
    SELECT Emp_ID
    FROM Employee
    GROUP BY Emp_ID
    HAVING COUNT(*) = 1
);

--MEDIUM
CREATE TABLE TBL_EMP_SALARY (
  Emp_ID INT Primary Key ,
  Emp_Name VARCHAR(MAX),
  Salary INT,
  Dept_ID VARCHAR(MAX)
);

CREATE TABLE TBL_DEPT_SALARY (
	Dept_ID INT Primary Key,
	Dept_Name VARCHAR(MAX)
);

INSERT INTO TBL_EMP_SALARY(Emp_ID, Emp_Name, Salary, Dept_ID)
VALUES 
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000,2),
(4, 'Sam', 60000,2),
(5, 'Max', 90000,1);

INSERT INTO TBL_DEPT_SALARY(Dept_ID, Dept_Name)
Values
(1,'HR'),
(2, 'Tech');

Select * from TBL_EMP_SALARY;
Select * from TBL_DEPT_SALARY;

Select D.Dept_Name, E.Emp_Name, E.Salary
From TBL_EMP_SALARY AS E
Inner Join
TBL_DEPT_SALARY AS D
ON
E.Dept_ID = D.Dept_ID
Where E.Salary IN
(
	Select Max(Salary)
	From TBL_EMP_SALARY AS E2
	Where E2.Dept_ID = E.Dept_ID
)
Order by D.Dept_Name;


--HARD
Create Table TBL_A(
	Emp_ID INT Primary Key,
	Ename Varchar(MAX),
	Salary INT
);

Create Table TBL_B(
	Emp_ID INT Primary Key,
	Ename Varchar(MAX),
	Salary INT
);

Insert Into TBL_A (Emp_ID, Ename, Salary)
Values
(1, 'AA', 1000),
(2, 'BB', 300);

Insert Into TBL_B(Emp_ID, Ename, Salary)
Values
(2, 'BB', 400),
(3, 'CC', 100);

Select * from TBL_B;

SELECT Emp_ID, Ename, Min(Salary) as Emp_Salary
From
	(	Select * from TBL_A
		UNION
		Select * from TBL_B
	) AS Inter_Mediate
Group BY Emp_ID, Ename;

