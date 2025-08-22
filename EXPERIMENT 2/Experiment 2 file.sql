
USE NEW;
-- Create the Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Ename VARCHAR(50),
    Department VARCHAR(50),
    ManagerID INT
);

-- Insert sample employee data
INSERT INTO Employee (EmpID, Ename, Department, ManagerID) VALUES
(10, 'Neha', 'Sales', NULL),
(11, 'Ravi', 'Marketing', 10),
(12, 'Suman', 'IT', 10),
(13, 'Karan', 'Marketing', 11),
(14, 'Anjali', 'IT', 12),
(15, 'Vikram', 'Sales', 10);

-- Generate a report mapping employees to their managers
SELECT
    E1.Ename AS EmployeeName,
    E1.Department AS EmployeeDept,
    E2.Ename AS ManagerName,
    E2.Department AS ManagerDept
FROM
    Employee E1
LEFT OUTER JOIN
    Employee E2
ON
    E1.ManagerID = E2.EmpID;
