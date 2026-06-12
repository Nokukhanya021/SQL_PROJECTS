CREATE DATABASE Retail_Store_DB;
USE Retail_Store_DB;

--RUN THE ABOVE TWO QUERIES SEPARATELY THEN REMOVE THEM AND PRESS EXECUTE 
--Customer Table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY IDENTITY(10,1),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  PostalCode VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(200,1),
    ProductName VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    UnitsInStock INT NOT NULL,
);

CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY IDENTITY(300,1),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  PostalCode VARCHAR(20),
  HireDate DATETIME,
  Salary DECIMAL(10, 2)
);

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY IDENTITY(400,1),
  CustomerID INT,
  EmployeeID INT,
  OrderDate DATETIME,
  TotalAmount DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Order_Items (
  OrderID INT,
  ProductID INT,
  Quantity INT,
  UnitPrice DECIMAL(10, 2),
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY IDENTITY(500,1),
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  PostalCode VARCHAR(20)
);

--Purchase Orders
CREATE TABLE Purchase_Orders (
  PurchaseOrderID INT PRIMARY KEY IDENTITY(600,1),
  SupplierID INT,
  EmployeeID INT,
  OrderDate DATETIME,
  TotalAmount DECIMAL(10, 2),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

--Purchase Orders Items
CREATE TABLE Purchase_Order_Items (
  PurchaseOrderID INT,
  ProductID INT,
  Quantity INT,
  UnitPrice DECIMAL(10, 2),
  PRIMARY KEY (PurchaseOrderID, ProductID),
  FOREIGN KEY (PurchaseOrderID) REFERENCES Purchase_Orders(PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Store location Table
CREATE TABLE Store_Locations (
  StoreLocationID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  PostalCode VARCHAR(20)
);
--Store Inventory Table
CREATE TABLE Store_Inventory (
  StoreLocationID INT,
  ProductID INT,
  Quantity INT,
  PRIMARY KEY (StoreLocationID, ProductID),
  FOREIGN KEY (StoreLocationID) REFERENCES Store_Locations(StoreLocationID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--INSERTING DATA
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, PostalCode)
VALUES 
('Thabo', 'Mthembu', 'thabo.mthembu@example.com', '0821234567', '123 Main St.', 'Johannesburg', 'Gauteng', '2000'),
('Zanele', 'Mabaso', 'zanele.mabaso@example.com', '0722345678', '456 Maple Ave.', 'Durban', 'KwaZulu-Natal', '4001'),
('Bongani', 'Ngubane', 'bongani.ngubane@example.com', '0823456789', '789 Long St.', 'Cape Town', 'Western Cape', '8000'),
('Nomvula', 'Dlamini', 'nomvula.dlamini@example.com', '0824567890', '456 Short St.', 'Pretoria', 'Gauteng', '0083'),
('Sipho', 'Mahlangu', 'sipho.mahlangu@example.com', '0715678901', '234 Pine St.', 'Nelspruit', 'Mpumalanga', '1200'),
('Nombuso', 'Mkhize', 'nombuso.mkhize@example.com', '0826789012', '789 Oak St.', 'Pietermaritzburg', 'KwaZulu-Natal', '3201'),
('Musa', 'Nkosi', 'musa.nkosi@example.com', '0737890123', '567 Cedar St.', 'East London', 'Eastern Cape', '5200'),
('Lindiwe', 'Zulu', 'lindiwe.zulu@example.com', '0828901234', '890 Walnut St.', 'Bloemfontein', 'Free State', '9301'),
('Mandla', 'Mkhwanazi', 'mandla.mkhwanazi@example.com', '0769012345', '123 Oak Ave.', 'Polokwane', 'Limpopo', '0700'),
( 'Nkosinathi', 'Moyo', 'nkosinathi.moyo@example.com', '0830123456', '456 Maple St.', 'Klerksdorp', 'North West', '2571');


INSERT INTO Products (ProductName, Category, Description, UnitPrice, UnitsInStock)
VALUES 
('T-shirt', 'Clothing', 'Cotton t-shirt with round neck', 25.00, 100),
('Jeans', 'Clothing', 'Blue denim jeans with slim fit', 50.00, 50),
('Sneakers', 'Shoes', 'White canvas sneakers with rubber sole', 100.00, 25),
('Smartphone', 'Electronics', 'Latest smartphone with 6-inch OLED display', 8000.00, 10),
('Laptop', 'Electronics', '15.6-inch laptop with Intel Core i7 processor', 15000.00, 5),
('Backpack', 'Accessories', 'Black backpack with multiple compartments', 200.00, 20),
('Watch', 'Accessories', 'Stainless steel wristwatch with leather strap', 500.00, 15),
('Glasses', 'Accessories', 'Trendy sunglasses with UV protection', 250.00, 30),
('Headphones', 'Electronics', 'Wireless headphones with noise cancellation', 500.00, 10),
('Camera', 'Electronics', 'Mirrorless camera with 24MP sensor', 12000.00, 5);


INSERT INTO Employees (FirstName, LastName, Email, Phone, Address, City, State, PostalCode, HireDate, Salary)
VALUES 
('Lerato', 'Mthembu', 'lerato.mthembu@example.com', '084-123-4567', '1234 Main St', 'Johannesburg', 'Gauteng', '2000', '2022-01-01', 50000.00),
('Bongani', 'Nkosi', 'bongani.nkosi@example.com', '082-234-5678', '5678 Market St', 'Durban', 'KwaZulu-Natal', '4000', '2022-02-01', 55000.00),
('Sipho', 'Mhlongo', 'sipho.mhlongo@example.com', '071-345-6789', '9101 Broadway St', 'Cape Town', 'Western Cape', '8001', '2022-03-01', 60000.00),
('Thabo', 'Modise', 'thabo.modise@example.com', '078-456-7890', '1212 University Ave', 'Pretoria', 'Gauteng', '0083', '2022-04-01', 65000.00),
('Zinhle', 'Nkosi', 'zinhle.nkosi@example.com', '083-567-8901', '1414 State St', 'Port Elizabeth', 'Eastern Cape', '6001', '2022-05-01', 70000.00);


INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount)
VALUES 
(10, 301, '2022-01-01', 250.00),
(12, 301, '2022-02-01', 350.00),
(13, 303, '2022-03-01', 450.00),
(13, 303, '2022-04-01', 550.00),
(12, 300, '2022-05-01', 650.00),
(11, 300, '2022-06-01', 750.00),
(17, 302, '2022-07-01', 850.00),
(11, 303, '2022-08-01', 950.00),
(19, 304, '2022-09-01', 1050.00),
(10, 301, '2022-10-01', 1150.00),
(11, 301, '2022-11-01', 1250.00),
(11, 302, '2022-12-01', 1350.00),
(13, 303, '2023-01-01', 1450.00),
(14, 304, '2023-02-01', 1550.00),
(19, 300, '2023-03-01', 1650.00),
(10, 301, '2020-05-03', 250.00),
(12, 302, '2020-06-07', 350.00),
(13, 303, '2020-07-13', 450.00),
(13, 304, '2020-08-19', 550.00),
(12, 300, '2020-09-21', 650.00),
(11, 301, '2020-10-26', 750.00),
(17, 302, '2020-11-30', 850.00),
(11, 303, '2020-12-03', 950.00),
(19, 304, '2021-01-15', 1050.00),
(10, 300, '2021-02-21', 1150.00),
(11, 301, '2021-03-27', 1250.00),
(11, 302, '2021-04-30', 1350.00),
(13, 303, '2021-06-03', 1450.00),
(14, 304, '2021-07-09', 1550.00),
(19, 300, '2022-02-14', 1650.00),
(17, 301, '2022-03-21', 1750.00),
(10, 304, '2022-04-25', 1850.00),
(13, 303, '2022-05-30', 1950.00),
(14, 304, '2022-07-04', 2050.00),
(19, 300, '2022-08-08', 2150.00);

INSERT INTO Order_Items (OrderID, ProductID, Quantity, UnitPrice) VALUES
  (400, 200, 5, 10.99),
  (400, 201, 3, 5.99),
  (404, 200, 10, 20.99),
  (403, 203, 2, 8.99),
  (403, 202, 1, 15.99),
  (411, 209, 5, 10.99),
  (410, 206, 3, 5.99),
  (410, 207, 10, 20.99),
  (410, 203, 2, 8.99),
  (410, 205, 1, 15.99);

INSERT INTO Suppliers (Name, Email, Phone, Address, City, State, PostalCode)
VALUES 
  ('Nomalizo Ngcobo', 'nomalizo.ngcobo@example.com', '084-123-4567', '123 Main St', 'Johannesburg', 'Gauteng', '2000'),
  ('Sibusiso Nkosi', 'sibusiso.nkosi@example.com', '082-987-6543', '456 Smith St', 'Durban', 'KwaZulu-Natal', '4000'),
  ('Thandeka Zulu', 'thandeka.zulu@example.com', '083-456-7890', '789 Oak St', 'Cape Town', 'Western Cape', '8000'),
  ('Bongani Mbatha', 'bongani.mbatha@example.com', '071-234-5678', '234 Pine St', 'Pretoria', 'Gauteng', '0001'),
  ('Nokuthula Mthembu', 'nokuthula.mthembu@example.com', '072-345-6789', '567 Cedar St', 'Bloemfontein', 'Free State', '9301'),
  ('Lwazi Khumalo', 'lwazi.khumalo@example.com', '083-987-6543', '890 Elm St', 'Port Elizabeth', 'Eastern Cape', '6000'),
  ('Siyabonga Ndlovu', 'siyabonga.ndlovu@example.com', '081-234-5678', '1234 Maple St', 'Johannesburg', 'Gauteng', '2001'),
  ('Ntombizodwa Moyo', 'ntombizodwa.moyo@example.com', '083-765-4321', '567 Pineapple St', 'Durban', 'KwaZulu-Natal', '4001'),
  ('Sandile Dlamini', 'sandile.dlamini@example.com', '073-456-7890', '901 Orange St', 'Cape Town', 'Western Cape', '8001'),
  ('Sanelisiwe Ncube', 'sanelisiwe.ncube@example.com', '072-345-6789', '234 Lemon St', 'Pretoria', 'Gauteng', '0002'),
  ('Thabo Mabuza', 'thabo.mabuza@example.com', '082-987-6543', '567 Cherry St', 'Bloemfontein', 'Free State', '9302'),
  ('Zinhle Mkhize', 'zinhle.mkhize@example.com', '084-123-4567', '890 Grape St', 'Port Elizabeth', 'Eastern Cape', '6001');

INSERT INTO Purchase_Orders (SupplierID, EmployeeID, OrderDate, TotalAmount)
VALUES 
    (500, 301, '2023-04-26', 500.00),
    (503, 303, '2023-04-25', 1200.00),
    (511, 302, '2023-04-24', 300.00),
    (508, 304, '2023-04-23', 750.00),
    (506, 300, '2023-04-22', 1000.00),
    (504, 304, '2023-04-21', 400.00),
    (510, 300, '2023-04-20', 600.00),
    (509, 302, '2023-04-19', 800.00),
    (502, 303, '2023-04-18', 1500.00),
    (501, 301, '2023-04-17', 900.00);

INSERT INTO Purchase_Order_Items (PurchaseOrderID, ProductID, Quantity, UnitPrice)
VALUES 
    (600, 200, 10, 50.00),
    (600, 201, 5, 100.00),
    (602, 202, 2, 250.00),
    (603, 203, 15, 30.00),
    (600, 204, 3, 200.00),
    (606, 205, 8, 80.00),
    (606, 206, 12, 40.00),
    (607, 207, 7, 150.00),
    (608, 208, 6, 120.00),
    (609, 209, 4, 300.00);

INSERT INTO Store_Locations (StoreLocationID, Name, Address, City, State, PostalCode)
VALUES 
    (1, 'East Rand Mall', 'Bentel Avenue', 'Boksburg', 'Gauteng', '1459'),
    (2, 'Canal Walk', 'Century Blvd', 'Cape Town', 'Western Cape', '7441'),
    (3, 'Gateway Theatre of Shopping', 'No. 1 Palm Boulevard', 'Umhlanga', 'KwaZulu-Natal', '4319'),
    (4, 'Menlyn Park Shopping Centre', 'Atterbury Road & Lois Avenue', 'Pretoria', 'Gauteng', '0063'),
    (5, 'Sandton City', '5th Street & Rivonia Road', 'Sandton', 'Gauteng', '2196'),
    (6, 'The Pavilion Shopping Centre', 'Jack Martens Drive & Centenary Blvd', 'Westville', 'KwaZulu-Natal', '3630'),
    (7, 'Fourways Mall', 'William Nicol Drive', 'Fourways', 'Gauteng', '2055'),
    (8, 'Tyger Valley Centre', 'Willie Van Schoor Drive', 'Bellville', 'Western Cape', '7536'),
    (9, 'Greenstone Shopping Centre', 'Stoneridge Dr & Modderfontein Rd', 'Edenvale', 'Gauteng', '1610'),
    (10, 'Cresta Shopping Centre', 'Randburg, Beyers Naude Drive', 'Randburg', 'Gauteng', '2118');

INSERT INTO Store_Inventory (StoreLocationID, ProductID, Quantity)
VALUES 
    (1, 200, 20),
    (1, 201, 10),
    (3, 202, 5),
    (4, 202, 30),
    (5, 204, 15),
    (6, 204, 12),
    (7, 206, 8),
    (7, 207, 18),
    (9, 208, 6),
    (10, 209, 3),
	(9, 200, 20),
    (9, 201, 10),
    (1, 202, 5),
    (7, 202, 30),
    (5, 203, 15),
    (6, 203, 12),
    (7, 209, 8),
    (3, 207, 18),
    (5, 208, 6),
    (4, 203, 3);
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Suppliers;
SELECT * FROM Purchase_Orders;
SELECT * FROM Purchase_Order_Items;
SELECT * FROM Store_Locations;
SELECT * FROM Store_Inventory;


---QUESTION 1
SELECT * FROM Customers
ORDER BY CustomerID
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;


---QUESTION 2
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName,  COUNT (Orders.OrderID) AS 'ORDERS  SERVED'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID,Employees.FirstName,Employees.LastName;

---QUESTION 3
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName, COUNT ( DISTINCT Orders.CustomerID) AS 'CUSTOMER SERVED'
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID,Employees.FirstName,Employees.LastName;


---QUESTION 4
SELECT Order_Items.OrderID, COUNT (Products.ProductID) AS ' NUMBER ODF PRODUCTS',SUM (Order_Items.Quantity) AS ' TOTAL ITEMS'
FROM Order_Items
INNER JOIN Products ON Order_Items.ProductID = Products.ProductID
GROUP BY Order_Items.OrderID;


---QUESTION 5
SELECT Suppliers.Name, COUNT (Purchase_Order_Items.PurchaseOrderID) AS 'ORDERS'
FROM Suppliers
INNER JOIN Purchase_Orders ON Suppliers.SupplierID = Purchase_Orders.SupplierID
INNER JOIN Purchase_Order_Items ON Purchase_Orders.PurchaseOrderID = Purchase_Order_Items.PurchaseOrderID
GROUP BY Suppliers.Name;


---QUESTION 6

SELECT TOP 1 Suppliers.Name,COUNT (Purchase_Order_Items.PurchaseOrderID) AS ' ORDERS'
FROM Suppliers
INNER JOIN Purchase_Orders ON Suppliers.SupplierID = Purchase_Orders.SupplierID
INNER JOIN Purchase_Order_Items ON Purchase_Orders.PurchaseOrderID = Purchase_Order_Items.PurchaseOrderID
GROUP BY Suppliers.Name 
ORDER BY COUNT (Purchase_Order_Items.PurchaseOrderID) DESC;
--OR 
--SELECT Suppliers.Name, COUNT (Purchase_Order_Items.PurchaseOrderID) AS ' ORDERS'
--FROM Suppliers
--JOIN Purchase_Orders ON Suppliers.SupplierID = Purchase_Orders.SupplierID
--JOIN Purchase_Order_Items ON Purchase_Orders.PurchaseOrderID = Purchase_Order_Items.PurchaseOrderID
--GROUP BY Suppliers.Name
--HAVING COUNT (Purchase_Order_Items.PurchaseOrderID) =(
--        SELECT  MAX(ORDERS)
--        FROM (
--        SELECT  
--        COUNT (Purchase_Order_Items.PurchaseOrderID) AS 'ORDERS'                                          
--        FROM Purchase_Orders
--        JOIN Purchase_Order_Items ON Purchase_Orders.PurchaseOrderID = Purchase_Order_Items.PurchaseOrderID
--        GROUP BY Purchase_Orders.PurchaseOrderID
--        )AS ORDERS
--);


---QUESTION 7
SELECT DISTINCT Products.ProductName,Products.Description,Products.UnitPrice,Suppliers.Name as 'SUPPLIER NAME'
FROM Products
INNER JOIN Store_Inventory ON Products.ProductID = Store_Inventory.ProductID
INNER JOIN Purchase_Order_Items ON Products.ProductID = Purchase_Order_Items.ProductID
INNER JOIN Purchase_Orders ON Purchase_Order_Items.PurchaseOrderID = Purchase_Orders.PurchaseOrderID
INNER JOIN Suppliers ON Purchase_Orders.SupplierID =Suppliers.SupplierID
GROUP BY Products.ProductName,Products.Description,Products.UnitPrice,Suppliers.Name;

---QUESTION 8
SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName,Orders.OrderID,Orders.OrderDate,Orders.TotalAmount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerID ASC;


---QUESTION 9
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName,Orders.OrderID,Orders.OrderDate,Orders.TotalAmount
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
ORDER BY  Employees.EmployeeID ASC;


---QUESTION 10
SELECT Store_Locations.Name,Store_Locations.Address,Store_Locations.City,Store_Locations.State
FROM Store_Locations
INNER JOIN Store_Inventory ON Store_Locations.StoreLocationID = Store_Inventory.StoreLocationID
WHERE Store_Locations.State ='Gauteng' 
GROUP BY Store_Locations.Name,Store_Locations.Address,Store_Locations.City,Store_Locations.State
HAVING SUM(Store_Inventory.Quantity)>=5;
