-- SchoolTranscript-TestData.sql

-- Remember to always start your scripts with a USE statement to be in the right database
USE SchoolTranscript
GO

-- **** DML Statements ********

-- Testing our Scripts
--    Good Data
-- Let's add some data to our tables. We do this with an INSERT statement.
-- We'll begin by adding a single row of data.
INSERT INTO Students(GivenName, Surname, DateOfBirth, Enrolled)
VALUES ('Stewart', 'Dent', 'JAN 15, 2000', 1)

-- Let's use the INSERT INTO statement to add more than one row of data.
INSERT INTO Students(GivenName, Surname, DateOfBirth, Enrolled)
VALUES ('Crystal', 'Clear', 'SEP 21, 1999', 1),
       ('Len', 'Der', 'MAR 8, 2001', 1)


-- If I don't specify a value for Enrolled, it will use the DEFAULT
INSERT INTO Students(GivenName, SurName, DateOfBirth)
VALUES ('Ken Tuck', 'Ederby', 'OCT 3, 1997')

INSERT INTO Courses([Number], [Name], Credits, [Hours], Active, Cost)
VALUES ('DMIT-1508', 'Database Fundamentals', 4.5, 90, 1, 800.00)

INSERT INTO StudentCourses(StudentID, CourseNumber, [Year], Term, [Status])
VALUES  (2000, 'DMIT-1508', 2020, 'SEP', 'E')

-- Test the CHECK constraints with Bad data
INSERT INTO Courses([Number], [Name], Credits, [Hours], Active, Cost)
VALUES ('DMIT1208', 'Other Fundamentals', 4.5, 90, 1, 800.00) -- Missing dash in the [Number]

-- ****************************
-- **** Query Statements ******

-- Let's look at the data in the tables.
SELECT  StudentID, GivenName, SurName, DateOfBirth, Enrolled
FROM    Students

SELECT  [Number], [Name], Credits, [Hours]
FROM   Courses

SELECT  StudentID, [CourseNumber], [Year], FinalMark
FROM    StudentCourses
