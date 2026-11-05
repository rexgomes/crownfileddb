# Crownfield Eye Hospital Database

A secure, scalable relational database system developed for Crownfield Eye Hospital NHS Foundation Trust. This project replaces legacy paper records, Word documents, and Excel spreadsheets with a robust Third Normal Form (3NF) relational database built in MySQL.

---

## 📁 Repository Structure

To ensure correct execution order and maintain referential integrity, please run the SQL scripts in your environment in the following sequence:


├── 01_schema.sql             # DDL schema creation, constraints, and data population
├── 02_individual_queries.sql   # Aggregate queries, joins, subqueries, and views
├── 03_procedure_and_trigger.sql # Stored procedures and automated triggers
├── 04_security.sql           # Role-based access control (RBAC), hashing, and security
├── 05_ERD/                   # Conceptual Entity-Relationship diagram assets
└── README.md                 # Project documentation and setup instructions

# Execution Steps
Clone or download this repository to your local machine.

Open your MySQL client and execute the scripts sequentially:

Step 1: Run 01_schema.sql to construct the database schema, apply primary/foreign key constraints, and populate all tables with baseline and synthetic records.

Step 2: Run 02_individual_queries.sql to test the analytical queries, joins, and filters.

Step 3: Run 03_procedure_and_trigger.sql to install custom stored procedures and data validation triggers.

Step 4: Run 04_security.sql to configure user roles, least-privilege permissions, password hashing, and secure query statements.


