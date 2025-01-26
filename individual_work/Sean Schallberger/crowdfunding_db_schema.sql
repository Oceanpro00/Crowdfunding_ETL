-- SQL Schema for Crowdfunding Database (PostgreSQL)

-- The following commands are not compatible with PostgreSQL when used in a transactional block.
-- Refer to the README for instructions on how to recreate the database before running this script.

-- DROP DATABASE IF EXISTS crowdfunding_db;
-- CREATE DATABASE crowdfunding_db;
-- \c crowdfunding_db;

-- Drop tables if they exist (to ensure a fresh start)
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS category;

-- create category table
CREATE TABLE category (
    category_id VARCHAR(4) PRIMARY KEY,
    category VARCHAR(20) NOT NULL
);

-- create subcategory table
CREATE TABLE subcategory (
    subcategory_id VARCHAR(8) PRIMARY KEY,
    subcategory VARCHAR(30) NOT NULL
);

-- create contacts table
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- create campaign table
CREATE TABLE campaign (
    cf_id INT PRIMARY KEY,
	contact_id INT NOT NULL, 
    company_name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
	goal NUMERIC(10, 2) NOT NULL,
	pledged NUMERIC(10, 2) NOT NULL,
	outcome VARCHAR(10) NOT NULL,
	backers_count INT NOT NULL,
	country VARCHAR (20) NOT NULL,
	currency VARCHAR(5) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(4) NOT NULL,
    subcategory_id VARCHAR(8) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- The following queries can be run after creating the tables and importing data:
-- Uncomment the queries below to test your database.

-- Option 1: View all records from a specific table
-- SELECT * FROM category;
-- SELECT * FROM subcategory;
-- SELECT * FROM campaign;
-- SELECT * FROM contacts;

-- Option 2: Confirm the number of rows imported into each table
-- SELECT COUNT(*) FROM category;
-- SELECT COUNT(*) FROM subcategory;
-- SELECT COUNT(*) FROM campaign;
-- SELECT COUNT(*) FROM contacts;

-- Option 3: Validate data integrity by checking relationships between tables
-- SELECT c.category_name, s.subcategory_name
-- FROM category c
-- JOIN subcategory s ON c.category_id = s.category_id;