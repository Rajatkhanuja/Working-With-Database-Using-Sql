create database assignment ;
use assignment ;
#----------------------------------------------
-- Q1 Statement to create the Contact table-- 
create table contact
(
ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12)
);   
#-------------------------------------
-- Q2 Statement to create the Employee table --
create table employee  (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

#-------------------------------------
-- Q3 Statement to create the ContactEmployee table 
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
#-----------------------------------------
-- Q4 ) In the Employee table, the statement that changes Lesley Bland’s phone number 
-- to 215-555-8800 --
insert into employee value
(
15, "lesley", "bland", 15000.00, '2003-05-15',
 "data", "lesley@gmail.com", "7737942845"
);

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

#-------------------------------------------------------------
-- Q5 In the Company table, the statement that changes the name of “Urban 
-- Outfitters, Inc.” to “Urban Outfitters” ---
create table company
(
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);
insert into company value
(307, "urban outfitters inc", "lanel", "udaipur", "rj", "313205");
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';
 
/*
Q6 ) In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement).
*/
# insert 'jack lee' employee's data in employee table
insert into Employee values
(
1616,"Jack Lee", "Jong",
3000.00, '2021-05-01', "UX Design", 
"jacklee10@gmail.com", "9789978789"
) ;
# insert 'Dianne Connor' contact data in contact table
INSERT INTO contact VALUES 
('3', '2345', 'Dianne Connor', 'Dianne Connor’s', 'bal kunj', 
'udaipur', 'RJ', '313205', '1', 'dianne.connor@urbanoutfiller.com', '7707342845');

# insert 'Dianne Connor' contacted 'jack lee' data in to contact employee table
INSERT INTO contactemployee VALUES 
('3', '3', '1616', '2022-05-10', 'positive');

# finally apply delete query to delete 'Dianne Connor’s contact data from 
# contactemployee table
delete from contactemployee where contactid =
(select ContactID from contact where firstname = "Dianne Connor") and
employeeid = (select employeeid from employee where firstname = 'jack lee');

/*
Q7 Write the SQL SELECT query that displays the names of the employees that
have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well. 
*/
select * from employee e, company c, contactemployee ce, contact ct where
(e.EmployeeID = ce.EmployeeID) and (ce.ContactID = ct.ContactID)  and
(c.CompanyName = "Toll brothers");

/*
Q8 What is the significance of “%” and “_” operators in the LIKE statement?
 
ans: %: Represents zero or more characters. It is used as a wildcard to match any sequence
 of characters.
Example: WHERE Name LIKE 'Jo%' matches "John", "Joan", etc.
         _: Represents exactly one character. It is used to match a single character
         in a specific position.
Example: WHERE Name LIKE 'J_n' matches "Jan", "Jon", etc.
*/ 

/*
Q9 Explain normalization in the context of databases. 
ans: Normalization is the process of organizing a database to reduce redundancy and 
improve data integrity. It involves dividing large tables into smaller tables and defining 
relationships between them. Key goals include:

Eliminate redundant data.
Ensure data dependencies make sense (e.g., each attribute is related to the primary key).
Normalization typically follows normal forms (1NF, 2NF, 3NF, etc.) to achieve these objectives.
*/ 

/*
Q10 What does a join in MySQL mean? 
ans: A join in MySQL is used to combine rows from two or more tables based on a related column.
 Joins are used to fetch data that is spread across multiple tables.
 */
 
 /*
 Q11 What do you understand about DDL, DCL, and DML in MySQL?
 ans: DDL (Data Definition Language): Statements that define or modify database structures.
Examples: CREATE, ALTER, DROP
DML (Data Manipulation Language): Statements that manipulate data in the tables.
Examples: INSERT, UPDATE, DELETE
DCL (Data Control Language): Statements that control access to data.
Examples: GRANT, REVOKE
*/

/*
Q12 What is the role of the MySQL JOIN clause in a query, and what are some 
common types of joins?
ans: The JOIN clause combines rows from two or more tables based on related columns,
 enabling retrieval of combined data.

Common types of joins:

INNER JOIN: Returns rows with matching values in both tables.
LEFT JOIN (OUTER JOIN): Returns all rows from the left table, and matching rows from the right 
table (null if no match).
RIGHT JOIN (OUTER JOIN): Returns all rows from the right table, and matching rows from the
 left table (null if no match).
FULL JOIN: Returns all rows from both tables, with nulls where no match exists.
*/

SELECT *
FROM Contact
WHERE CompanyID NOT IN (SELECT CompanyID FROM Company);

UPDATE Contact
SET CompanyID = 307
WHERE CompanyID NOT IN (SELECT CompanyID FROM Company);


ALTER TABLE Contact
ADD FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID);





