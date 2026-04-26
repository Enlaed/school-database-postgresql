-- SCHEMA DESIGN (CORE TABLE STRUCTURE)

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    gender TEXT,
    date_of_birth DATE,
    email TEXT,
    enrollment_year INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name TEXT,
    department TEXT,
    credit_units INT
);

CREATE TABLE teachers (
	teacher_id INT PRIMARY KEY,
	name TEXT,
	department TEXT,
	email TEXT,
	hire_date DATE
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount INT,
    payment_date DATE,
    payment_status TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);


-- SCHEMA MODIFICATION (MODIFICATIONS AFTER INITIAL DESIGN)

ALTER TABLE courses
ADD COLUMN category TEXT;


-- SCHEMA STRUCTURE INSPECTION (INSPECT STRUCTURE & RULES)

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'students';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'courses';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'enrollments';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payments';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'teachers';


-- DATA VALIDATION
-- Verifies successful data ingestion across all entities
-- It confirms that data was successfully loaded into the database

SELECT 'students' AS table_name, COUNT(*) FROM students
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'enrollments', COUNT(*) FROM enrollments
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'teachers', COUNT(*) FROM teachers;


-- FOREIGN KEY VERIFICATION
-- Displays all foreign key relationships in the database
-- Used to verify that constraints were successfully created

SELECT 
    conname AS constraint_name,
    conrelid::regclass AS table_name,
    confrelid::regclass AS referenced_table
FROM pg_constraint
WHERE contype = 'f';


-- RELATIONAL QUERY (STUDENT - COURSE MAPPING)
-- This shows which students are enrolled in which courses
-- It demonstrates how multiple tables work together using JOINs

SELECT 
    s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;


-- INDEXING LAYER (B-TREE INDEX OPTIMIZATION)
-- Improves query performance for joins and filtering operations

CREATE INDEX idx_enrollments_student_id
ON enrollments(student_id);

CREATE INDEX idx_enrollments_course_id
ON enrollments(course_id);

CREATE INDEX idx_payments_student_id
ON payments(student_id);

CREATE INDEX idx_payments_date
ON payments(payment_date);

CREATE INDEX idx_students_email
ON students(email);

-- QUERY PERFORMANCE TESTING (EXPLAIN ANALYSIS)
-- Used AFTER schema design and indexing to evaluate performance

EXPLAIN ANALYZE
SELECT 
    s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- BUSINESS ANALYTICS (INSIGHTS FROM DATA)
-- Demonstration of basic data analysis using SQL queries

-- Top paying students (who has contributed the most revenue)

SELECT 
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total_paid
FROM payments p
JOIN students s ON p.student_id = s.student_id
GROUP BY s.first_name, s.last_name
ORDER BY total_paid DESC;

-- Most popular courses (by enrollment count)

SELECT 
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name
ORDER BY total_students DESC;

-- Students grouped by course department

SELECT 
    c.department,
    COUNT(e.student_id) AS total_students
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.department
ORDER BY total_students DESC;

-- Revenue over time

SELECT 
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS revenue
FROM payments
GROUP BY month
ORDER BY month;

-- Payment status breakdown

SELECT 
    payment_status,
    COUNT(*) AS total
FROM payments
GROUP BY payment_status;


-- Total KPI'S

SELECT COUNT(*) FROM students;
SELECT COUNT(*) FROM courses;
SELECT COUNT(*) FROM enrollments;
SELECT SUM(amount) FROM payments;

-- Enrollment trend

SELECT 
    DATE_TRUNC('month', enrollment_date) AS month,
    COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY month
ORDER BY month;

