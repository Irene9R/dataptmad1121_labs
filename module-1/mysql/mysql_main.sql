/**********************************************************************************************************************************************

Lab | MySQL
The lab was done and SQL Server with (https://dbfiddle.uk/)

**********************************************************************************************************************************************/
/**********************************************************************************************************************************************
	
Challenge 2 - Create the Database and Tables

***********************************************************************************************************************************************/

CREATE TABLE Cars
(
	ID INT NOT NULL,
	VIN VARCHAR(30) NOT NULL,
	Manufacturer VARCHAR(30) NOT NULL,
	Model VARCHAR(30) NOT NULL,
	"Year" INT NOT NULL,
	Color VARCHAR(20) NOT NULL
);

CREATE TABLE Customers
(
	ID INT NOT NULL,
	"Customer ID" INT NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Phone VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	City VARCHAR(20) NOT NULL,
	"State/Province" VARCHAR(20) NOT NULL,
	Country VARCHAR(20) NOT NULL,
	Postal INT NOT NULL
);

CREATE TABLE SalesPersons
(
	ID INT NOT NULL,
	"Staff ID" INT NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Store VARCHAR(30) NOT NULL
);

CREATE TABLE Invoices
(
	ID INT NOT NULL
	, "Invoice Number" VARCHAR(50) NOT NULL
	, "Date" DATE NOT NULL
	, Car INT NOT NULL
	, Customer INT NOT NULL
	, "Sales Person" INT NOT NULL
);


/***********************************************************************************************************************************************

Challenge 3 - Seeding the Database

************************************************************************************************************************************************/


INSERT INTO Cars (ID, VIN, Manufacturer, Model, "Year", Color)
VALUES 
(0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion',	2018, 'White'),
(3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4',	2018, 'Silver'),
(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60',	2019, 'Gray'),
(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO Customers (ID, "Customer ID", Name, Phone, Email, Address, City, "State/Province", Country, Postal)
VALUES 
(0, 10001, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
(1, 20001, 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
(2, 30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');


INSERT INTO SalesPersons (ID, "Staff ID", Name, Store)
VALUES 
(0, '00001', 'Petey Cruiser', 'Madrid'),
(1, '00002', 'Anna Sthesia', 'Barcelona'),
(2, '00003', 'Paul Molive','Berlin'),
(3, '00004', 'Gail Forcewind', 'Paris'),
(4, '00005', 'Paige Turner', 'Mimia'),
(5, '00006', 'Bob Frapples','Mexico City'),
(6, '00007', 'Walter Melon', 'Amsterdam'),
(7, '00008', 'Shonda Leer', 'São Paulo');

INSERT INTO Invoices (ID, "Invoice Number", "Date", Car, Customer, "Sales Person")
VALUES
(0, '852399038', '20180822', 0, 1, 3),
(1, '731166526', '20181231', 3, 0, 5),
(2, '271135104', '20190122', 2, 2, 7);


/*********************************************************************************************************************************************

Bonus Challenge - Updating and Deleting Database Records
Now you find an error you need to fix in your existing data - in the Salespersons table, you mistakenly spelled Miami as Mimia for Paige Turner. 
Also, you received the email addresses of the three customers:

Name	Email
Pablo Picasso	ppicasso@gmail.com
Abraham Lincoln	lincoln@us.gov
Napoléon Bonaparte	hello@napoleon.me
Create update.sql to update your existing data.

In addition, you also find a duplicated car entry for VIN DAM41UDN3CHU2WVF6. You want to delete car ID #4 from the database. 
Create delete.sql to perform the deletion.

************************************************************************************************************************************************/

UPDATE SalesPersons SET Store = 'Miami' WHERE ID = 4;

UPDATE Customers SET Email = 'ppicaso@gmail.com' WHERE Name = 'Pablo Picasso';
UPDATE Customers SET Email = 'lincoln@us.gob' WHERE Name = 'Abraham Lincoln';
UPDATE Customers SET Email = 'hello@napoleon.me' WHERE Name = 'Napoléon Bonaparte';

DELETE FROM Cars WHERE ID = 4;

SELECT * from SalesPersons
SELECT * from Customers
SELECT * from Cars

/***********************************************************************************************************************************************

Practicing & Testing with JOIN functions to learn how they work

************************************************************************************************************************************************/

SELECT *
FROM Cars INNER JOIN Invoices
on Cars.ID = Invoices.Car

SELECT *
FROM Cars FULL JOIN Invoices
on Cars.ID = Invoices.Car

SELECT *
FROM Cars FULL JOIN Invoices
on Cars.ID = Invoices.Car
WHERE Cars.ID IS NULL OR
Invoices.Car IS NULL

SELECT *
FROM Cars LEFT JOIN Invoices
on Cars.ID = Invoices.Car

SELECT *
FROM Cars LEFT JOIN Invoices
on Cars.ID = Invoices.Car
WHERE Invoices.Car IS NULL

SELECT *
FROM Cars RIGHT JOIN Invoices
on Cars.ID = Invoices.Car

SELECT *
FROM Cars RIGHT JOIN Invoices
on Cars.ID = Invoices.Car
WHERE Cars.ID IS NULL

