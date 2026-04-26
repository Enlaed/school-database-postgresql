\# School Database System (PostgreSQL)



\##  Overview

This project is a relational database system built using PostgreSQL to simulate and analyze school operations. It focuses on designing a structured database, enforcing relationships, and extracting meaningful insights through SQL analysis.



The system manages students, courses, enrollments, payments, and teachers, with emphasis on data integrity, query optimization, and business-oriented reporting.



\---



\##  Objectives

The goal of this project is to:



\- Design a normalized relational database structure

\- Establish relationships using primary and foreign keys

\- Ensure data integrity across multiple tables

\- Perform analytical SQL queries to extract insights

\- Improve query performance using indexing and EXPLAIN ANALYZE

\- Translate raw data into meaningful business insights



\---



\##  Database Structure



The database consists of five main entities:



\- Students

\- Courses

\- Teachers

\- Enrollments

\- Payments



Each table is interconnected using foreign key relationships to maintain consistency and enable relational queries.



\---



\##  Relationships



\- One student can have multiple enrollments

\- One course can have multiple enrollments

\- One student can make multiple payments



These relationships allow cross-table analysis using JOIN operations.



\---



\##  Key Implementations



\### 1. Schema Design

Tables were created using appropriate data types, primary keys, and structured fields to represent real-world school data.



\---



\### 2. Data Integrity

Foreign key constraints were implemented to ensure referential integrity between tables and prevent orphan records.



\---



\### 3. Data Analysis

SQL queries were used to analyze:

\- Revenue trends

\- Enrollment distribution

\- Course popularity

\- Student contribution patterns

\- Payment status behavior



\---



\### 4. Performance Optimization

Indexes were created on frequently queried columns, and EXPLAIN ANALYZE was used to evaluate query execution plans and improve performance understanding.



\---



\##  Key Insights



\- Revenue shows fluctuations over time with a peak in 2021 and decline in 2023  

\- A small group of students contributes a large share of total revenue  

\- Computer Science has the highest enrollment demand  

\- Business is the most populated department  

\- Payment completion is nearly balanced between paid and pending statuses  



\---



\##  Tools \& Technologies



\- PostgreSQL

\- SQL (DDL, DML, Joins, Aggregations)

\- EXPLAIN ANALYZE

\- Excel (data visualization)

\- PowerPoint (presentation layer)



\---



\##  Project Workflow



1\. Database schema design and creation  

2\. Data import and cleaning  

3\. Relationship setup using foreign keys  

4\. Analytical SQL queries  

5\. Performance tuning with indexing  

6\. Insight generation and visualization  



\---



\## 🚀 Outcome

This project demonstrates the ability to design a relational database system, enforce data integrity, optimize queries, and derive actionable insights from structured data.



\---



\## 👤 Author

Emmanuella N. Okonkwo



