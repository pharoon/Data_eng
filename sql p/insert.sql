-- Insert data into Departments
INSERT INTO Departments VALUES (1, 'HR', 'New York');
INSERT INTO Departments VALUES (2, 'IT', 'San Francisco');

-- Insert data into Employees
INSERT INTO Employees VALUES (1, 'John', 'Doe', 1, '2022-01-10', 'Manager', 80000);
INSERT INTO Employees VALUES (2, 'Jane', 'Smith', 2, '2023-03-15', 'Developer', 90000);

-- Insert data into Projects
INSERT INTO Projects VALUES (1, 'Project A', '2023-01-01', '2023-12-31', 500000);
INSERT INTO Projects VALUES (2, 'Project B', '2023-02-01', '2023-11-30', 300000);

-- Insert data into Assignments
INSERT INTO Assignments VALUES (1, 1, 1, 'Lead', '2023-01-01');
INSERT INTO Assignments VALUES (2, 2, 2, 'Developer', '2023-03-01');

-- Insert data into Products
INSERT INTO Products VALUES (1, 'Product X', 'Category 1', 19.99, 100);
INSERT INTO Products VALUES (2, 'Product Y', 'Category 2', 29.99, 200);

-- Insert data into OrderDetails
INSERT INTO OrderDetails VALUES (1, 1, 1, 2, 19.99);
INSERT INTO OrderDetails VALUES (2, 2, 2, 1, 29.99);