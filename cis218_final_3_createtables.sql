# CIS218 Final Project Group 5
# Written by: Sungmin Moon

DROP DATABASE IF EXISTS CIS218FINAL_GROUP5;
CREATE DATABASE CIS218FINAL_GROUP5;

USE CIS218FINAL_GROUP5;

DROP TABLE IF EXISTS EmployeeData;
CREATE TABLE EmployeeData (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

DROP TABLE IF EXISTS SupplierDetails;
CREATE TABLE SupplierDetails (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

DROP TABLE IF EXISTS PaymentDetails;
CREATE TABLE PaymentDetails (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_details VARCHAR(255),
    paid_employee_id INT DEFAULT NULL,
    supplier_id INT DEFAULT NULL,
    paid_date DATE,
    paid_amount DECIMAL(10, 2)
    #FOREIGN KEY (supplier_id) REFERENCES SupplierDetails(supplier_id),
    #FOREIGN KEY (paid_employee_id) REFERENCES EmployeeData(employee_id)
);
DROP TABLE IF EXISTS InventoryDetails;
CREATE TABLE InventoryDetails (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255),
    payment_id INT
);

DROP TABLE IF EXISTS MaintenanceDetails;
CREATE TABLE MaintenanceDetails (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    maintenance_details VARCHAR(255),
    payment_id INT
    #FOREIGN KEY (payment_id) REFERENCES PaymentDetails(payment_id)
);

DROP TABLE IF EXISTS AquaticSpeciesList;
CREATE TABLE AquaticSpeciesList (
    species_id INT AUTO_INCREMENT PRIMARY KEY,
    species_name VARCHAR(255),
    species_quantity INT,
	payment_id INT
    #FOREIGN KEY (payment_id) REFERENCES PaymentDetails(payment_id)
);

DROP TABLE IF EXISTS SalaryData;
CREATE TABLE SalaryData (
    employee_id INT PRIMARY KEY,
   	payment_id INT
   	#FOREIGN KEY (payment_id) REFERENCES PaymentDetails(payment_id) 
);

INSERT INTO EmployeeData (employee_name, phone_number, email) VALUES
('John Doe', '123-456-7890', 'doe@abc.com'),
('Sam Smith', '098-765-4321', 'smith@abc.com'),
('Jane Johnson', '012-345-6789', 'johnson@abc.com');

SELECT * FROM EmployeeData;


INSERT INTO SupplierDetails (supplier_name, phone_number, email) VALUES
('Aqua Supplies Co.', '321-456-7890', 'contact@aqua-supplies.com'),
('Fish World', '654-321-7890', 'sales@fishworld.com'),
('Coral Beauties', '789-123-4560', 'info@coralbeauties.com');

SELECT * FROM SupplierDetails;

INSERT INTO PaymentDetails ( payment_details, paid_employee_id, supplier_id, paid_date, paid_amount) VALUES
('Filter Purchase', NULL, NULL, '2023-03-15', 150.00),
('Tank Cleaning', NULL, NULL, '2023-03-15', 100.00),
('Clownfish Purchase', NULL, 1, '2023-03-15', 50.00),
('Blue Tang Purchase', NULL, 2, '2023-03-15', 50.00),
('Salary Payment for John', 1, NULL, '2023-03-20', 50000.00),
('Filter Replacement', NULL, NULL, '2023-03-20', 150.00),
('Water Conditioner Purchase', NULL, NULL, '2023-03-22', 20.00),
('Water Testing', NULL, NULL, '2023-03-22', 50.00),
('Salary Payment for Sam', 2, NULL, '2023-03-28', 52000.00),
('Salary Payment for Jane', 3, NULL, '2023-03-29', 55000.00);

SELECT * FROM PaymentDetails;

INSERT INTO InventoryDetails (item_name, payment_id) VALUES
('Aquarium Filter', 1),
('Water Conditioner', 7),
('Aquarium Heater', NULL);

SELECT * FROM InventoryDetails;

INSERT INTO MaintenanceDetails (maintenance_details, payment_id) VALUES
('Tank Cleaning', 2),
('Filter Replacement', 6),
('Water Testing', 8);

SELECT * FROM MaintenanceDetails;

INSERT INTO AquaticSpeciesList (species_name, species_quantity, payment_id) VALUES
('Angelfish', 10, NULL),
('Blue Tang', 5, 4),
('Clownfish', 7, 3);

SELECT * FROM AquaticSpeciesList;

INSERT INTO SalaryData (employee_id, payment_id) VALUES (1, 5), (2, 9), (3, 10);

SELECT * FROM EmployeeData;