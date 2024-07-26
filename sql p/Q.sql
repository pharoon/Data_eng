-- 1
SELECT 
    UPPER(e.FirstName) AS FirstName,
    LOWER(e.LastName) AS LastName,
    LENGTH(e.Position) AS PositionLength,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
-- 2
SELECT 
    d.DepartmentName,
    ROUND(SUM(e.Salary), -3) AS TotalSalary,
    COUNT(e.EmployeeID) AS NumberOfEmployees
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY 
    d.DepartmentID
ORDER BY 
    TotalSalary DESC;
-- 3
SELECT 
    UPPER(p.ProjectName) AS ProjectName,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    a.Role
FROM 
    Projects p
JOIN 
    Assignments a ON p.ProjectID = a.ProjectID
JOIN 
    Employees e ON a.EmployeeID = e.EmployeeID;
-- 4
SELECT 
    LOWER(c.FirstName) AS FirstName,
    LOWER(c.LastName) AS LastName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.Total_amount) AS TotalAmountSpent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID;
-- 5
SELECT 
    LEFT(p.ProductName, 10) AS ProductName,
    LEFT(p.ProductName, 2) AS ProductCategory,
    SUM(od.Quantity) AS TotalQuantity
FROM 
    Products p
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, p.ProductName;
    -- 6
SELECT 
    e.FirstName,
    e.LastName,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.Salary > (
        SELECT 
            AVG(e2.Salary)
        FROM 
            Employees e2
       
    );

    
-- 7
SELECT AVG(Salary) AS AvgSalary
FROM Employees;

-- 8
DELIMITER $$
CREATE FUNCTION CheckSalary(salary DECIMAL(10,2)) 
RETURNS VARCHAR(10)
deterministic
BEGIN
    DECLARE avg_salary DECIMAL(10,2);
    DECLARE result VARCHAR(10);
    SELECT AVG(Salary) INTO avg_salary FROM Employees;

    IF salary > avg_salary THEN
        SET result = 'Higher than';
    ELSE
        SET result = 'Lower than';
    END IF;

    RETURN result;
END $$
DELIMITER ;
-- 9
SELECT 
    CONCAT(FirstName, ' ', LastName) AS EmployeeName,
    Salary,
    CheckSalary(Salary) AS SalaryComparison
FROM Employees;

-- 10

SELECT 
    CONSTRAINT_NAME 
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE 
    TABLE_NAME = 'Assignments' 
    AND TABLE_SCHEMA = 'company'  -- Replace with your actual database name
    AND REFERENCED_TABLE_NAME IS NOT NULL;

ALTER TABLE Assignments
DROP FOREIGN KEY assignments_ibfk_1;  -- Replace with your actual foreign key name

ALTER TABLE Assignments
DROP FOREIGN KEY assignments_ibfk_2;

ALTER TABLE Assignments
ADD CONSTRAINT fk_employee
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE;

ALTER TABLE Assignments
ADD CONSTRAINT fk_project
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE;

DELETE p
FROM Projects p
JOIN Assignments a ON p.ProjectID = a.ProjectID
JOIN Employees e ON a.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

-- 11
SELECT p.*
FROM Projects p
JOIN Assignments a ON p.ProjectID = a.ProjectID
JOIN Employees e ON a.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';


SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';



