/*
DAY 1
Filtering Patients by Weight Range in SQLite
Your challenge is to construct an SQL query to achieve the following:

Retrieve the first_name and last_name of patients table.
The query should only select patients whose weight is within the range of 100 to 120 (inclusive).
Table Schema
You have to make use of the patients table. Here is the complete schema of the table for your reference

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Key Concepts
SQLite: A C-language library that provides a lightweight disk-based database. It doesn’t require a separate server process.
SQL SELECT Statement: Used to select data from a database and fetch the result table. The result can be stored in a table or used as it is.
SQL WHERE Clause: Used to filter the results and extract only the necessary records.
BETWEEN Operator: In SQL, the BETWEEN operator is used to filter the result set based on a range. It can be used with numbers, text and even dates.
*/
select 
    first_name
    , last_name
from patients
where weight between 100 and 120
;

/*
DAY 2
Finding Patients from Hamilton with Allergies Using SQL
Write an SQL query to find a list of patients' first_name, last_name, and allergies who are from the city of Hamilton and have non-null values in the allergies column.

Tables Used: patients
Important Concepts
SQL Keywords: Understanding SQL keywords like SELECT, FROM, and WHERE will be essential.
NULL Values: Know how to handle NULL values in SQL, especially when you want to include or exclude them in your results.
*/
SELECT 
    first_name
    , last_name
    , allergies
FROM patients    
WHERE  city = 'Hamilton' 
    AND allergies IS NOT NULL
;

/*
DAY 3
Filtering and Sorting Customer Data by City and Contact Name in SQLite
In this lab, you will be working with the SQLite database northwind.sqlite. Your main task is to construct an SQL query to retrieve specific information from the customers table.

Objective
Your SQL query should fulfill the following requirements:

Retrieve the city, company_name, and contact_name columns from the customers table.
Filter the records to only include rows where the city name contains the letter 'L'.
Sort the resulting data set by contact_name in ascending order.
Key Concepts
To complete this lab, you should be familiar with the following SQL operations:

SELECT for specifying the columns you want to retrieve
WHERE for filtering rows based on a condition
ORDER BY for sorting the results
*/
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE '%L%'
ORDER BY contact_name ASC
;

/*
DAY 4
Finding the Tallest Patient's Name and Height
Your goal is to retrieve specific information about patients based on certain criteria. Specifically, you are tasked with the following:

Retrieve the first_name, last_name, and height of the patient with the greatest height from the patients table
Schema
Schema of the patients table for reference

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Concepts:
SELECT Statement: Used to select data from a database. The result is then stored in a result table.
Aggregate Functions: SQL aggregate functions return a single value, calculated from values in a column. The function MAX() is one such function which returns the maximum value of the selected column.
*/

SELECT first_name
    , last_name
    , MAX(height) AS height
FROM patients
;

/*
DAY 5
Filtering Patients by Specific IDs in a Hospital Database
Easy
128
1
93.9% Acceptance
The database focuses on hospital data, and for this particular exercise you'll be using the patients table.

Schema
patients table schema

patient_id
first_name
last_name
gender
birth_date
city
province_id
allergies
height
weight
Task
Write a SQL query to show all columns for patients who have specific patient_ids: 1, 45, 534, 879, 1000.

Concepts to Know
SELECT: To specify the columns you want to retrieve.
WHERE: To filter the records based on certain conditions.
IN: To specify multiple values in a WHERE clause.
*/

SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000)
;

/*
DAY 6
Counting Total Admissions for a Specific Patient in a Hospital Database

Write an SQL query to show the patient id and the total number of admissions for a patient with a patient_id of 579. Your query should return the patient_id and the total count of admissions for that patient with the column name alias total_admissions

Tables Used: admissions
Concepts
SELECT: To specify the columns you want in your result set.
COUNT(): An aggregate function to count the number of rows.
WHERE: To filter the records based on a condition.
*/

SELECT 
    patient_id
    , COUNT() AS total_admissions
FROM admissions
WHERE patient_id = 579
;

/*
DAY 7
Customer names (chinook database)

Database Details
You will primarily work with the Customer table in this lab. Here's a brief overview:

Customer
CustomerId (Primary Key)
FirstName
LastName
Company
Address
City
State
Country
PostalCode
Email
SupportRepId (Foreign Key to Employee)
Instructions
Challenge 1: American Music Lovers

Objective: Extract a list of names and countries of customers.

Task Details:

Use the table "Customer".
Retrieve the following columns:
"FirstName"
"Country"
Filter the results to include only customers residing in the 'USA'.
Order the results by the column "FirstName" in ascending order.
Make sure to use double quotes for table and column names for clarity and to prevent any potential SQL errors.

Remember, the expectation is that you write queries which produce outputs exactly matching the specified criteria. The challenge has been designed with specific "ORDER BY" clauses to ensure consistent and comparable outputs. Ensure you adhere to these specifications to successfully pass the lab.

Challenges Information
Challenge 1: American Music Lovers
Objective:
Assess the participant's proficiency in filtering, selecting specific columns, and ordering the results.

Description:
You need to create a list for an exclusive music event. Retrieve the first names and countries of customers, but only for those residing in the USA. Ensure your list is in order by first name.

Tables Involved:

Customer
Columns to be Retrieved:

FirstName
Country
Constraints:

Only include records of customers from the USA.
Results should be ordered by the FirstName.
Expected Output Columns:

FirstName
Country
*/
SELECT 
    FirstName
    , Country
FROM 
    Customer
WHERE Country = 'USA'
ORDER BY FirstName ASC
;    
