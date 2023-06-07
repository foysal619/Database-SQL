-- creating a database
CREATE DATABASE database_assignment;

-- creating a table
CREATE TABLE customers(
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
phone VARCHAR(15) NOT NULL,
address VARCHAR(200) NOT NULL,
city VARCHAR (50) NOT NULL,
state VARCHAR (50) NOT NULL,
points VARCHAR (50) NOT NULL
);

-- showing the table
SELECT * FROM customers;

-- inserting data/record into a table
INSERT INTO customers(first_name, last_name, date_of_birth, phone, address, city, state, points) VALUES
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA','2273'),
('Ines','Brushfield','1986-04-13','7804-427-9456','14187 Commercial Trail','Hampton','VA','947'),
('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO','2967'),
('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL','457'),
('Clemmie','Betchley','1973-11-07','','5 Spohn Circle','Arlington','TX','3675')
;

-- using WHERE clause for applying conditions
SELECT * FROM customers WHERE points > 1000;


-- using WHERE clause for applying conditions with between and or
SELECT * FROM customers WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31' OR points < 1000;


-- using WHERE clause for applying conditions order by with (asc)
SELECT * FROM customers ORDER BY points ASC


-- Regexp (Regular Expression)
SELECT * FROM customers WHERE first_name REGEXP 'burgh';

-- using WHERE clause for applying conditions of blank
SELECT * FROM customers WHERE phone = '';

-- modifying a column name with data type from the table
ALTER TABLE customers
    CHANGE COLUMN `date_of_birth`   -- old name; notice optional backticks
                   dob        -- new name
                   VARCHAR(255); 
 
 -- finding customer name of maximum points holder
SELECT first_name FROM customers ORDER BY points DESC LIMIT 2, 1;

-- case
SELECT first_name, points,
  CASE
    WHEN points < 1000 THEN 'Bronze Member'
    WHEN points >= 1000 AND points < 2000 THEN 'Silver Member'
    WHEN points >= 2000 AND points < 3000 THEN 'Gold Member'
    ELSE 'Platinum Member'
  END AS membership
FROM customers;