show databases;
create database real_estate;
use real_estate;

CREATE TABLE Properties (
    PropertyID INT NOT NULL AUTO_INCREMENT,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Size INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    PRIMARY KEY (PropertyID)
);

CREATE TABLE Agents (
    AgentID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    CommissionRate DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (AgentID),
    UNIQUE KEY uc_Agents_ContactNumber (ContactNumber)
);

CREATE TABLE Clients (
    ClientID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Preferences TEXT,
    PRIMARY KEY (ClientID),
    UNIQUE KEY uc_Clients_ContactNumber (ContactNumber),
    UNIQUE KEY uc_Clients_Email (Email)
);

CREATE TABLE Transactions (
    TransactionID INT NOT NULL AUTO_INCREMENT,
    PropertyID INT NOT NULL,
    AgentID INT NOT NULL,
    ClientID INT NOT NULL,
    TransactionType VARCHAR(10) NOT NULL,
    Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

select *  from Clients;


CREATE TABLE Properties (
    PropertyID INT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Type VARCHAR(50) CHECK (Type IN ('Residential', 'Commercial', 'Industrial')),
    Size INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Available', 'Sold', 'Rented'))
);

INSERT INTO Properties (PropertyID, Address, City, Type, Size, Price, Status)
VALUES
(1, '123 Elm St', 'Kampala', 'Residential', 1200, 150000.00, 'Available'),
(2, '456 Maple Ave', 'Kampala', 'Commercial', 5000, 450000.00, 'Available'),
(3, '789 Oak Ln', 'Entebbe', 'Industrial', 10000, 750000.00, 'Sold'),
(4, '101 Pine St', 'Jinja', 'Residential', 2000, 180000.00, 'Available'),
(5, '202 Cedar Ave', 'Kampala', 'Commercial', 7000, 600000.00, 'Rented'),
(6, '303 Birch Rd', 'Entebbe', 'Residential', 1500, 200000.00, 'Available'),
(7, '404 Willow Way', 'Jinja', 'Industrial', 15000, 900000.00, 'Available'),
(8, '505 Acacia Blvd', 'Kampala', 'Commercial', 3000, 350000.00, 'Sold'),
(9, '606 Palm Court', 'Entebbe', 'Residential', 2500, 250000.00, 'Rented'),
(10, '707 Magnolia Dr', 'Kampala', 'Industrial', 12000, 800000.00, 'Available');
SELECT * FROM Properties;

SELECT * FROM Properties WHERE City = 'Kampala' AND Status = 'Available';

UPDATE Properties SET Status = 'Sold' WHERE PropertyID = 1;
SELECT * FROM Properties;

-- CHECK (Status IN ('Available', 'Sold', 'Rented'));
-- CHECK (Amount <= (SELECT Price FROM Properties WHERE Properties.PropertyID = Transactions.PropertyID)


