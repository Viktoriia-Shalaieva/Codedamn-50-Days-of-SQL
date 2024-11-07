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

/*
DAY 8
Identifying Same-Day Hospital Admissions and Discharges
Your task is to write a SQL query to show all the columns from the admissions table where the patient was admitted and discharged on the same day.

Important Concepts:
SELECT Statement: This SQL command selects specific columns from a table. To select all columns, you'd use the asterisk (*).
WHERE Clause: This clause filters records based on specific conditions.
It's essential to understand the relationships and the nature of data in the admissions table. As you craft your solution, make sure to test your query and ensure it produces the expected results.

Best of luck, and happy coding!
*/
SELECT *
FROM 
    admissions
WHERE 
    admission_date = discharge_date
;

/*
DAY 9
Distinct city names (chinook database)
In this exercise, you'll be working with the chinook database. Your task is to solve a series of challenges that test your SQL skills.

Lab Dataset
You'll be using the chinook database, which represents a digital music shop. Here's a quick breakdown of the tables and the key columns:

Artist: "ArtistId", "Name"
Album: "AlbumId", "Title", "ArtistId"
Track: "TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Composer", "Milliseconds", "Bytes", "UnitPrice"
MediaType: "MediaTypeId", "Name"
Genre: "GenreId", "Name"
Playlist: "PlaylistId", "Name"
PlaylistTrack: "PlaylistId", "TrackId"
Invoice: "InvoiceId", "CustomerId", "InvoiceDate", "BillingAddress", "BillingCity", "BillingState", "BillingCountry", "BillingPostalCode", "Total"
InvoiceLine: "InvoiceLineId", "InvoiceId", "TrackId", "UnitPrice", "Quantity"
Customer: "CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Email", "SupportRepId"
Employee: "EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email"
Instructions
Writing SQL Queries: Write SQL queries to solve the challenges. Make sure to name all the columns exactly as mentioned in the challenge statement.
Using Double Quotes: Whenever referencing column names or table names, use double quotes for clarity, e.g., SELECT "Name" FROM "Artist".
Order Matters: Always ensure that the ordering specified in the challenge is strictly followed. This is important to make sure your solution matches the expected output, as the evaluation may involve direct comparison of rows.
Be Precise: Ensure that the queries you write follow the exact specifications of the challenges. Avoid adding or removing columns that are not explicitly mentioned.
When you're ready to submit, ensure your SQL query matches the problem statement's requirements, and remember to test your solution to ensure accuracy!

Good luck, and happy querying!

Challenges Information
Challenge 1: Distinct Customer Cities
Objective: Fetch a list of all the unique cities in which the customers live.

Details:

Dataset: Use the Customer table from the chinook database.
Columns to Display: Display the City column.
Ordering: Results should be ordered alphabetically by the city name.
Uniqueness: Ensure that each city name appears only once in the result.
*/
SELECT 
    DISTINCT "City" 
FROM 
    "Customer"
ORDER BY 
    "CITY"
;
/*
DAY 10
Retrieve Even-Numbered Order IDs from the Orders Table

Retrieve all the even-numbered Order_id from the orders table.

Concepts to Review:
SELECT Statement: The fundamental SQL command used to retrieve data from a table.
WHERE Clause: Used in SQL to filter records based on specific conditions.
MOD Function: In SQL, the MOD function returns the remainder of a division. For example, MOD(column_name, n) will give the remainder when column_name is divided by n.
*/
SELECT 
    Order_id
FROM orders
WHERE 
    MOD(Order_id, 2) = 0
;

/*
DAY 11
In this lab, you'll be working with the Chinook database, which simulates a digital media store. You'll be tasked with a series of SQL challenges that will test your ability to retrieve, manipulate, and structure data effectively.

Dataset
The primary dataset you'll be working with is the Chinook database. It has various tables including Track, Album, Artist, and many others. Here's a brief overview:

"Track": Contains details about individual music tracks including their Name, duration (Milliseconds), and which Album they belong to (AlbumId).
"Album": Stores information about music albums including their Title and which Artist made them (ArtistId).
... (Other tables follow a similar descriptive format.)
Ensure that you use exact table names and column names as defined in the schema, and always use double quotes around them for clarity.

For each challenge, make sure to read the problem statement carefully and craft your SQL queries accordingly. Always ensure the columns in your output match the expected column names exactly, as discrepancies can lead to failed evaluations.

Task
You are required to retrieve track names ("Name") and their corresponding album IDs ("AlbumId") for tracks that have a duration longer than 5 minutes.

Conditions:

Use the "Track" table.
Filter by track duration ("Milliseconds") to get tracks longer than 300,000 milliseconds (5 minutes).
Order your result by the track name ("Name") in ascending order.
Your output should have columns named "Name" and "AlbumId".

Submission
Once you've crafted your SQL queries, you can submit them for evaluation. Remember to always check the expected output format and ensure your queries match them closely to maximize your chances of passing the challenges.

Best of luck!

Challenges
Challenge 1: Long Tracks Listing
Objective: Retrieve track names and their corresponding album IDs for tracks that have a duration longer than 5 minutes.

Details:

Database Tables to Use: Track
Columns to Display:
Name: Name of the track
AlbumId: ID of the album to which the track belongs
Conditions/Criteria:
Track duration (Milliseconds) should be greater than 300,000 (which is equivalent to 5 minutes).
Ordering: The resulting list should be ordered by the track name (Name) in ascending order.
Expected Output Format:

| Name          | AlbumId |
|---------------|---------|
| Track A       | 5       |
| Track B       | 7       |
| ...           | ...     |
*/

SELECT
    Name
    , AlbumID
FROM 
    Track
WHERE 
    Milliseconds > 300000
ORDER BY
    Name
;
/*
DAY 12
Calculating Average Unit Price, Total Stock, and Discontinued Products in SQLite
In this lab, you will be specifically focusing on the products table. Your task is to write a SQL query to address the following question:

Question: Show the average unit_price rounded to 2 decimal places as average_price , the total units in stock (use units_in_stock) across all products as total_stock, and the total discontinued products (use discontinued) from as total_discontinued the products table.

products Table Schema
product_id
product_name
supplier_id
category_id
quantity_per_unit
unit_price
units_in_stock
units_on_order
reorder_level
discontinued
Concepts Needed
Aggregate Functions (AVG, SUM)
Rounding (ROUND)
SELECT statements
The column names must be average_price, total_stock, total_discontinued, any other name would fail the tests. Make sure to add proper aliases to your columns.
*/
SELECT
    ROUND(AVG(unit_price), 2) AS average_price
    , SUM(units_in_stock) AS total_stock
    , SUM(discontinued) AS total_discontinued
FROM
    products
;

/*
DAY 13
Filtering Patients by Specific First Name Criteria in SQLite

Your task is to write a SQL query to fetch specific patient information from the patients table.

Schema
patients table schema for reference

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
Show the patient_id and first_name from the patients table where the first_name starts and ends with the letter 's' and is at least 6 characters long and ordered by patient_id in ascending order

Important Concepts
SQLite syntax: You will be writing your query in SQLite.
Wildcards: This query will require you to use wildcards to filter data.
*/

SELECT 
    patient_id
    , first_name
FROM
    patients
WHERE
    LOWER(first_name) LIKE 's%s' 
    AND
    LENGTH(first_name) >=6
ORDER BY 
    patient_id
;
/*
DAY 14
Identifying Duplicate Patient Records by First and Last Names

Welcome to this SQL lab where you'll be working with a database named hospital.sqlite. This database contains a table named patients that, as you might guess, holds data related to patients. Your task is to delve into this data and extract valuable insights.

Objective:

Write an SQL query to display the number of duplicate patients based on their first_name and last_name.

Concepts to Understand:

GROUP BY Clause: This allows you to arrange identical data into groups. For this lab, you'll be grouping based on two columns: first_name and last_name.

HAVING Clause: Works in conjunction with the GROUP BY clause to filter the grouped records based on a condition. You'll be using this to ensure you're only considering duplicate records.

Get started and try to come up with the solution on your own! Remember to focus on the task at hand and leverage the power of SQL's aggregation and filtering capabilities.

Make sure the column names are first_name, last_name, num_of_duplicates
*/
SELECT
    first_name
    , last_name
    , COUNT(*) AS num_of_duplicates
FROM
    patients
GROUP BY 
    first_name
    , last_name
HAVING 
    COUNT(*) >= 2
;

/*
DAY 15
Identifying Patients with Multiple Admissions for the Same Diagnosis

In this lab, you are presented with a database that contains hospital admission records. Your task is to write an SQL query to find patients who have been admitted multiple times for the same diagnosis. You are required to display the patient_id and diagnosis for these cases.

Important Concepts
GROUP BY: Useful for aggregating data based on one or more columns.
HAVING: Allows you to filter records after performing an aggregation.
COUNT(): SQL function for counting the number of rows in a result set.
*/
SELECT
    patient_id
    , diagnosis
FROM 
    admissions
GROUP BY 
    patient_id
    , diagnosis
HAVING 
    COUNT(*) >= 2
;
/*
DAY 16
Retrieve Most Recent Admission Details for a Specific Patient in SQLite

Your task is to interact with the admissions table to retrieve specific information. Your goal is to write a SQL query to show all columns for a patient with a patient_id of 542 based on their most recent admission_date.

Schema
Table Schema for admissions table

patient_id
admission_date
discharge_date
diagnosis
attending_doctor_id
*/
SELECT *
FROM
    admissions
WHERE 
    patient_id = 542
ORDER BY 
    admission_date DESC
LIMIT 1
;

/*
DAY 17
Calculating Weight Difference for Maroni Patients in SQLite

Your task is to write an SQL query to find the difference between the largest and smallest weight among patients with the last name 'Maroni'.

Concepts
SELECT: To specify the columns that should be returned in the result set.
MAX(): SQL function to get the maximum value in a numeric dataset.
MIN(): SQL function to get the minimum value in a numeric dataset.
WHERE: To filter records based on specific conditions.
Requirements
Your query should only return a single column named weight_delta that contains the weight difference.
You must use the patients table
Your query should run without errors to pass the lab.
*/
SELECT
    MAX(weight) - MIN(weight) AS weight_delta
FROM 
    patients
WHERE 
    last_name = 'Maroni'
; 

/*
DAY 18
Filtering Customers by Country in Northwind Database

Retrieve the following columns: contact_name, address, and city from the table customers
The query should only include customers that are NOT from the countries Germany, Mexico, or Spain.
customers table schema
customer_id
company_name
contact_name
contact_title
address
city
region
postal_code
country
phone
fax
Important Concepts
SQL SELECT statement: Used to specify the columns that should be returned in the result set.
SQL WHERE clause: Used for filtering records based on specific conditions.
SQL NOT IN clause: Used to exclude records that match values in a list.
*/
SELECT
    contact_name
    , address
    , city
FROM 
    customers
WHERE 
    country NOT IN ('Germany', 'Mexico', 'Spain')
;
/*
DAY 19
Filter and Sort Unique Cities Starting with a Vowel from Patient Data

Your task is to write an SQL query to retrieve a list of unique cities where patients in the patients table reside. The catch is, you only need to list cities that start with a vowel (A, E, I, O, U), and sort them in ascending order.

Concepts
To accomplish this task, you'll likely need to be familiar with the following SQL concepts:

SELECT: To specify the columns that should be returned in the result set.
DISTINCT: To ensure that the result set contains unique records.
WHERE: To filter the records based on specific conditions.
LIKE: To search for a specified pattern in a column.
ORDER BY: To sort the result set in ascending or descending order.
*/
SELECT DISTINCT city
FROM 
patients
WHERE 
   city LIKE 'A%' 
   OR city LIKE 'E%' 
   OR city LIKE 'I%' 
   OR city LIKE 'O%' 
   OR city LIKE 'U%'
ORDER BY 
   city ASC
;

/*
DAY 20
Counting and Sorting Patients by City in SQLite

Your task is to write a SQL query that returns the name of each city and the total number of patients residing in that city with the column name as num_patients. Your query should order the results first by the total number of patients (num_patients) in descending order, and then by the city name in ascending alphabetical order.

Concepts Covered
Aggregate Functions (COUNT)
GROUP BY Clause
Sorting (ORDER BY, ASC, DESC)
Database Schema
patients: This table contains information related to patients. You'll primarily be querying this table to solve the exercise.

Patients Table Schema

product_id
product_name
supplier_id
category_id
quantity_per_unit
unit_price
units_in_stock
units_on_order
reorder_level
discontinued
Requirements
Use the SELECT statement to specify the columns you want to retrieve.
Utilize the COUNT function to get the total number of patients for each city give the column an alias num_patients
Apply the GROUP BY clause to group the results by the city.
Use the ORDER BY clause to sort the results based on the conditions specified.
*/

SELECT
    city
    , COUNT(*) AS num_patients
FROM 
    patients
GROUP BY 
    city
ORDER BY
    num_patients DESC
    , city ASC
;

/*
DAY 21

Customers by Country (chinook database)

The dataset you're working with represents a digital media store. You'll find information about artists, albums, tracks, media types, genres, playlists, invoices, customers, and employees.

Instructions
Carefully read through the challenge requirements.
Stick strictly to the column and table names provided in the Chinook database schema.
After constructing your SQL query, test it to ensure it works as expected.
Once you're confident in your solution, submit it for evaluation.
Challenges
Objective:

Determine the number of customers from each country.

Description:

Write an SQL query that counts the number of customers from each country. You should group the results by Country and order them alphabetically by Country.

Tables Used:

Customer
Expected Columns in Output:

Country
CustomerCount (this should represent the count of customers for each country)
Hints/Tips:

Make sure to use the COUNT function and the GROUP BY clause.
When writing your query, make sure to name the count column as CustomerCount.
Your result should be ordered by Country.
Example of Expected Output:

Country	CustomerCount
Brazil	5
Canada	8
*/

SELECT
    Country
    , COUNT(*) AS CustomerCount
FROM
    Customer
GROUP BY 
    Country
ORDER BY
    Country
;

/*
DAY 22
Invoices by Year (chinook database)

Your main task in this lab is to craft SQL queries to extract specific data from the Chinook database. You should be able to understand the database schema, apply various SQL techniques, and come up with the required solution.

Database Schema
Here's a brief rundown of the tables and columns you will be working with:

"Artist": Contains "ArtistId" and "Name" columns.
"Album": Important columns include "AlbumId", "Title", and "ArtistId".
"Track": Some key columns are "TrackId", "Name", "AlbumId", and "InvoiceDate".
"Invoice": The main columns to note are "InvoiceId", and "InvoiceDate".
Instructions
Stick to the SQLite syntax as we are working with the SQLite version of the Chinook database.
Ensure your queries are optimized for performance.
Properly format and structure your SQL for readability.
Always include an "ORDER BY" clause where specified to ensure consistent and correct output.
Challenge
Objective: Your task is to count the number of invoices generated each year from the Invoice table.

Expected Output:

Columns:
Year: Extracted from the InvoiceDate column representing the year the invoices were generated. (Hint: Use string functions to extract the year part).
InvoiceCount: Represents the total number of invoices generated in that specific year.
Order: Ensure your results are sorted by the Year column in ascending order.

SQL Components to Use:

substr() function to extract the year from the InvoiceDate column.
GROUP BY clause to group results by year.
COUNT() function to count the invoices per year.
ORDER BY clause to sort the results by year.
Evaluation:
Ensure your query returns the correct counts for each year.
While the primary requirement is the SQLite syntax, try to keep your queries optimized.
Your solution should be clear and easily understandable, with proper SQL formatting.
*/

SELECT
    SUBSTR(InvoiceDate, 1, 4) AS Year
    , COUNT(*) AS InvoiceCount
FROM
    Invoice
GROUP BY
    SUBSTR(InvoiceDate, 1, 4)
ORDER BY
    SUBSTR(InvoiceDate, 1, 4)
;

/*
DAY 23
Customers Without Invoices (chinook database)

You will be working on challenges that involve multiple tables from the Chinook database, such as Customer, Invoice, and more.

Database Schema
You can find the full schema of the database in your lab resources. However, for a quick reference, you'll be primarily working with the following tables:

Customer
Invoice
Challenge
Objective:

Your task is to identify customers from the Customer table who have never made a purchase. This means they do not have any corresponding records in the Invoice table.

Tables Involved:
Customer
Invoice

Sorting Criteria:
Your query should order the results by Customer.CustomerId.

Output Columns:
Your query should return the following columns explicitly named:
Customer.FirstName
Customer.LastName

Note:
You should use a LEFT JOIN between Customer and Invoice tables to achieve this. 
Make sure to handle cases where there may be no matching records in the Invoice table for a Customer. Your query should explicitly mention all column names and tables involved.
*/

SELECT
    Customer.FirstName
    , Customer.LastName
FROM 
    Customer
LEFT JOIN 
    Invoice
ON 
    Customer.CustomerId = Invoice.CustomerId
WHERE
    Customer.CustomerId NOT IN 
    (SELECT 
        Invoice.CustomerId
    FROM 
        Invoice
    )
;

/*
DAY 24
Identifying Provinces with More Male Patients than Female

Your task is to write a SQL query to answer the following question. Show the provinces that have more patients identified as 'M' than 'F'. You should only display the full province_name.

Database Information
You will be working with a database. The relevant tables for this exercise are:

patients
province_names
You are encouraged to explore the structure of these tables to understand their relationships and the data they contain.

Important Concepts
Joins: You'll need to join multiple tables to gather all the necessary data.
Aggregate Functions: These functions allow you to perform calculations on a group of rows, potentially subdividing them based on the values of one or more columns. For this exercise, understanding how to count rows based on certain conditions will be crucial.
Grouping: It's essential to group your results by certain columns to aggregate data correctly.
Having Clause: Once you've grouped your results, you might want to filter them based on the aggregated data.
Make sure the column name is province_name

Remember to think critically about each step in your query, and ensure your final output matches the question's requirements. Good luck!
*/
SELECT
    pr.province_name
FROM 
    province_names pr
JOiN 
    patients p
ON pr.province_id = p.province_id
GROUP BY 
    p.province_id
HAVING 
    COUNT(CASE WHEN p.gender = 'M' THEN 1 END) > 
    COUNT(CASE WHEN p.gender = 'F' THEN 1 END)
;

/*
DAY 25
Combining Patient and Doctor Data Using SQL UNION

The hospital.sqlite database consists of multiple tables, but for this challenge, you will primarily be focused on two tables:

patients
doctors
Each table represents different roles within a hospital: "Patient" and "Doctor".

Task Description
Your challenge is to retrieve the first_name, last_name, and role of every person present in both the patients and doctors tables. You must ensure that the role for each person is correctly labeled as either "Patient" or "Doctor". Make sure to name this column as "role"

Key Concepts
UNION: SQL's UNION clause allows you to combine rows from two or more tables based on a related column. The primary condition is that the columns should be of the same datatype.
ALIAS: In SQL, aliases are used to give a temporary name to a table or a column for the purpose of a specific SQL query. It can be beneficial for making column names more readable.
Good luck with your task! Remember, practice makes perfect.
*/

SELECT 
    first_name
    , last_name
    , 'Patient' AS role
FROM 
    patients
UNION ALL
SELECT 
    first_name
    , last_name
    , 'Doctor' AS role
FROM 
    doctors
;

/*
DAY 26
Incomplete Albums (chinook database)
In this lab, you will be tasked with writing SQL queries to solve specific challenges. The dataset used in this lab is based on the "Chinook" database, which simulates a digital media store, including tables for artists, albums, media tracks, invoices, and customers.

Dataset Schema
Here's a brief overview of the tables and their important columns:

"Artist": Represents music artists.

"ArtistId": Unique identifier for each artist.
"Name": Name of the artist.
"Album": Represents a collection of tracks.

"AlbumId": Unique identifier for each album.
"Title": Name of the album.
"ArtistId": Identifier of the artist of the album.
"Track": Represents individual media tracks.

"TrackId": Unique identifier for each track.
"Name": Name of the track.
"AlbumId": Identifier of the album containing the track.
Challenges
You will be given specific challenges that test various aspects of SQL, including but not limited to joins, subqueries, and aggregation functions.

Objective:
Identify albums that have tracks missing. For the purpose of this challenge, any album that does not have an associated track in the tracks table is considered to have missing tracks.

Tables Involved:

albums
tracks
Instructions:

Join the albums table with the tracks table using the appropriate keys.
Find albums where there are no tracks associated.
Your result should only include albums that are missing tracks.
Expected Output Columns:

albums.Title
Ordering:
Order your results based on albums.AlbumId.
*/




/*
DAY 27
Aggregating Data with Window Functions

The goal here is to solve a set of challenges that revolve around querying a musical database.

Database Details:
The Chinook dataset simulates a digital music shop and contains information about albums, tracks, invoices, customers, and more.

Important Notes:
Exact Match: The column names in your final output must match exactly with the ones described in the challenge. Pay close attention to the column names and make sure they match what's required.
Double Quotes: For clarity, always wrap table and column names with double quotes like "ColumnName".

Ordering: Ensure that you always order your results as specified in the problem statement. This ensures that the output matches the expected results.

Challenges
Objective:

Calculate a running total for each customer based on their invoices. This should reflect the cumulative sum of invoice totals for every customer over time.

Instructions:
Table Used: Use the Invoice table.
Output Columns: Your result should have the following columns:
CustomerId: The unique identifier of the customer.
InvoiceDate: The date the invoice was created.
RunningTotal: The cumulative sum of the invoice total for the specific customer up to and including the current invoice date.
Ordering: Order your results first by CustomerId and then by InvoiceDate in ascending order.
Hint:

To achieve the desired output, you might need to perform a JOIN on the Invoice table with itself. Use the SUM aggregate function to calculate the running total. Ensure your final output has columns named CustomerId, InvoiceDate, and RunningTotal.
*/

SELECT 
    CustomerId
    , InvoiceDate
    , SUM(Total) OVER
         (PARTITION BY CustomerId ORDER BY InvoiceDate) AS RunningTotal
FROM 
    Invoice 
ORDER BY
    CustomerId
    , InvoiceDate
;   

/*
DAY 29
Multi-table Subquery

Welcome to this SQLite lab where you will be honing your SQL skills using the Chinook dataset. The Chinook dataset represents a digital media store, including tables for artists, albums, media tracks, invoices, and customers.

Objective
Your goal is to complete SQL challenges based on the data and relationships in the Chinook database.

Dataset Description
The Chinook dataset consists of the following tables:

"Artist" with columns: "ArtistId" and "Name".
"Album" with columns: "AlbumId", "Title", and "ArtistId".
"Track" with columns: "TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Composer", "Milliseconds", "Bytes", and "UnitPrice".
... [and so on for each table]
Challenges
Retrieve the track with the longest duration for each genre.

Instructions:

From the "Track" table, fetch the "GenreId" and the name of the track corresponding to the maximum duration for each genre.
Your result should have two columns: "GenreId" and the track's name with the maximum duration, named as "MaxDurationTrackName".
Order your results by "GenreId" in ascending order to ensure consistency in output.
Expected Output Columns:

"GenreId"
"MaxDurationTrackName"
To ensure success:

Stick closely to the given schema, table names, and column names.
Use double quotes around table and column names for clarity.
Remember to order your results when necessary to match the expected output.
*/
-- solution 1
WITH MaxDurationPerGenre AS (
    SELECT 
        "GenreId", 
        MAX("Milliseconds") AS "MaxMilliseconds"
    FROM 
        "Track"
    GROUP BY 
        "GenreId"
)

SELECT 
    t."GenreId",
    t."Name" AS "MaxDurationTrackName"
FROM 
    "Track" t
JOIN 
    MaxDurationPerGenre md
ON 
    t."GenreId" = md."GenreId" AND t."Milliseconds" = md."MaxMilliseconds"
ORDER BY 
    t."GenreId" ASC;

-- solution 2 
SELECT 
    "GenreId"
    , "Name" AS "MaxDurationTrackName"
FROM 
    "Track"
WHERE 
    ("GenreId", "Milliseconds") IN (
        SELECT 
            "GenreId"
            , MAX("Milliseconds")
        FROM 
            "Track"
        GROUP BY 
            "GenreId"
    )
ORDER BY 
    "GenreId" ASC;

/*
DAY 32
Invoice Line Count (chinook database)

Your task is to write SQL queries to solve a series of challenges based on the chinook database. While constructing your queries, make sure to keep the following points in mind:

Stick to the table and column names exactly as defined in the chinook database schema. Deviations from the original names may result in incorrect results.

Use double quotes around table and column names for clarity, like "TableName".

When creating your solution, ensure the ORDER BY clause is used wherever applicable to avoid potential output mismatches.

Ensure your output column names match exactly with what's mentioned in the challenge description.

Database Schema
Here's a quick rundown of the chinook database schema:

Tables:
Artist: Contains columns "ArtistId" and "Name".
Album: Contains columns "AlbumId", "Title", and "ArtistId".
Track: Holds information related to individual tracks.
MediaType, Genre, Playlist, PlaylistTrack, Invoice, InvoiceLine, Customer, and Employee: Various other tables with their respective columns.
Challenges
Objective: Your task is to determine the number of line items associated with each invoice.

Description:
In any business, an invoice can contain multiple line items detailing the products or services being charged. For this challenge, you need to find out how many line items are there in every invoice.

Tables to Use:

Invoice
InvoiceLine
Instructions:

Join the Invoice and InvoiceLine tables using the appropriate key.
Group the results by Invoice.InvoiceId.
Count the number of line items for each invoice. The result should have a column named LineCount that represents this count.
Display the Invoice.InvoiceId and LineCount.
Order your results by Invoice.InvoiceId.
Expected Output Columns:

Invoice.InvoiceId
LineCount
*/

SELECT
    i.InvoiceId
    , COUNT(il.InvoiceLineId) AS LineCount
FROM
    Invoice i
    JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY 
    i.InvoiceId
ORDER BY 
    i.InvoiceId
;

/*
DAY 33
Category-Wise Average Product Price in Northwind

Your task is to explore the database and craft an SQL query to answer the given challenge.

Relevant Tables:

products
categories
Challenge:
Show the category name and the average product unit price for each category, rounding the result to two decimal places. The column names must be category_name, average_unit_price and ordered by average_unit_price in descending order

Important Concepts:

JOIN: Understand how to use the JOIN clause to combine rows from two or more tables based on a related column.
GROUP BY: Grasp the concept of grouping rows that have the same values in specified columns into summary rows.
Aggregate Functions: Familiarize yourself with SQL aggregate functions, like AVG, to compute a single result value from a set of input values.
ROUND: Know how to use this function to round the numbers to the desired decimal places.
ORDER BY: To show the desired rows in the required order based on the column name
Best of luck! Craft your query keeping these concepts in mind.
*/
SELECT
    c.category_name
    , ROUND(AVG(p.unit_price),2) AS average_unit_price
FROM products p
    JOIN categories c
    ON c.category_id = p.category_id
GROUP BY 
    c.category_name
ORDER BY
    average_unit_price DESC
;
