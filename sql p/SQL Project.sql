create database company;
use company;

create table Customers (CUstomerID int primary key ,
 FirstName VARCHAR(50) Not NULL,
 LastName VARCHAR(50) Not NULL, 
 Contact_number int ,
 Email varchar(100) check (Email like "%@gmail.com" or Email like "%@outlook.com"),
 Address varchar(50) ) ;
 
 ALTER TABLE Customers
modify Contact_number VARCHAR(15);

create table Orders ( OrderID int primary key ,
 CUstomerID int not null , 
 Order_date date check (Order_date < '2025-1-1'),
 Total_amount float check (Total_amount > 0) ,
foreign key (CustomerID) references Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Contact_number, Email, Address)
VALUES
(1, 'Alice', 'Johnson', '123-456-7890', 'alice@gmail.com', '123 Main St, Springfield'),
(2, 'Bob', 'Smith', '234-567-8901', 'bob@outlook.com', '456 Elm St, Springfield'),
(3, 'Charlie', 'Brown', '345-678-9012', 'charlie@gmail.com', '789 Maple St, Springfield'),
(4, 'David', 'Wilson', '456-789-0123', 'david@outlook.com', '101 Pine St, Springfield'),
(5, 'Eve', 'Davis', '567-890-1234', 'eve@gmail.com', '202 Oak St, Springfield'),
(6, 'Frank', 'Miller', '678-901-2345', 'frank@gmail.com', '303 Birch St, Springfield'),
(7, 'Grace', 'Lee', '789-012-3456', 'grace@outlook.com', '404 Cedar St, Springfield'),
(8, 'Henry', 'Clark', '890-123-4567', 'henry@gmail.com', '505 Walnut St, Springfield'),
(9, 'Ivy', 'Harris', '901-234-5678', 'ivy@outlook.com', '606 Chestnut St, Springfield'),
(10, 'Jack', 'Green', '012-345-6789', 'jack@gmail.com', '707 Fir St, Springfield'),
(11, 'Karen', 'White', '123-456-7891', 'karen@gmail.com', '808 Pine St, Springfield'),
(12, 'Leo', 'Black', '234-567-8902', 'leo@outlook.com', '909 Maple St, Springfield'),
(13, 'Mona', 'Taylor', '345-678-9013', 'mona@gmail.com', '1010 Elm St, Springfield'),
(14, 'Nina', 'Scott', '456-789-0124', 'nina@outlook.com', '1111 Birch St, Springfield'),
(15, 'Oscar', 'Young', '567-890-1235', 'oscar@gmail.com', '1212 Cedar St, Springfield'),
(16, 'Paula', 'King', '678-901-2346', 'paula@outlook.com', '1313 Walnut St, Springfield'),
(17, 'Quincy', 'Allen', '789-012-3457', 'quincy@gmail.com', '1414 Chestnut St, Springfield'),
(18, 'Rachel', 'Martin', '890-123-4568', 'rachel@outlook.com', '1515 Fir St, Springfield'),
(19, 'Steve', 'Turner', '901-234-5679', 'steve@gmail.com', '1616 Pine St, Springfield'),
(20, 'Tina', 'Adams', '012-345-6781', 'tina@outlook.com', '1717 Maple St, Springfield'),
(21, 'Victor', 'Brown', '123-456-7892', 'victor@gmail.com', '1818 Oak St, Springfield'),
(22, 'Wendy', 'Davis', '234-567-8903', 'wendy@outlook.com', '1919 Elm St, Springfield'),
(23, 'Xavier', 'Evans', '345-678-9014', 'xavier@gmail.com', '2020 Birch St, Springfield'),
(24, 'Yvonne', 'Foster', '456-789-0125', 'yvonne@outlook.com', '2121 Cedar St, Springfield'),
(25, 'Zack', 'Green', '567-890-1236', 'zack@gmail.com', '2222 Walnut St, Springfield'),
(26, 'Amy', 'Hill', '678-901-2347', 'amy@outlook.com', '2323 Chestnut St, Springfield'),
(27, 'Benjamin', 'King', '789-012-3458', 'benjamin@gmail.com', '2424 Fir St, Springfield'),
(28, 'Cathy', 'Lopez', '890-123-4569', 'cathy@outlook.com', '2525 Pine St, Springfield'),
(29, 'Daniel', 'Moore', '901-234-5680', 'daniel@gmail.com', '2626 Maple St, Springfield'),
(30, 'Emily', 'Nelson', '012-345-6782', 'emily@outlook.com', '2727 Elm St, Springfield');

INSERT INTO Orders (OrderID, CustomerID, Order_Date, Total_Amount)
VALUES
(1, 10, '2023-06-15', 150.75),
(2, 5, '2023-07-20', 200.50),
(3, 15, '2023-08-05', 300.00),
(4, 8, '2024-01-10', 450.25),
(5, 12, '2024-02-14', 120.00),
(6, 3, '2023-03-22', 250.40),
(7, 7, '2023-04-18', 175.75),
(8, 14, '2023-05-30', 340.60),
(9, 2, '2023-06-25', 290.00),
(10, 19, '2023-07-17', 220.30),
(11, 6, '2023-08-21', 310.50),
(12, 1, '2023-09-15', 410.20),
(13, 18, '2023-10-12', 500.75),
(14, 4, '2023-11-20', 305.45),
(15, 20, '2023-12-22', 195.60),
(16, 9, '2024-01-15', 245.75),
(17, 13, '2024-02-10', 275.90),
(18, 17, '2024-03-18', 315.40),
(19, 11, '2024-04-25', 335.80),
(20, 16, '2024-05-30', 355.60),
(21, 21, '2024-06-10', 165.85),
(22, 22, '2024-07-05', 185.95),
(23, 23, '2024-08-12', 305.50),
(24, 24, '2024-09-18', 455.75),
(25, 25, '2024-10-20', 125.00),
(26, 26, '2024-11-15', 255.50),
(27, 27, '2024-12-22', 180.75),
(28, 28, '2023-01-05', 345.60),
(29, 29, '2023-02-18', 295.00),
(30, 30, '2023-03-25', 225.30),
(31, 1, '2023-04-21', 315.50),
(32, 2, '2023-05-19', 415.20),
(33, 3, '2023-06-13', 505.75),
(34, 4, '2023-07-22', 310.45),
(35, 5, '2023-08-27', 200.60),
(36, 6, '2023-09-18', 250.75),
(37, 7, '2023-10-22', 280.90),
(38, 8, '2023-11-12', 320.40),
(39, 9, '2023-12-18', 340.80),
(40, 10, '2024-01-30', 360.60);

