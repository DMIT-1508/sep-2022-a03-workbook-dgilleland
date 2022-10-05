/* **********************************************
 * Simple Table Creation - Columns and Primary Keys
 *
 * School Transcript
 *  Version 1.0.0
 *
 * Author: Dan Gilleland
 ********************************************** */
-- Create the database
IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'SchoolTranscript')
BEGIN
    CREATE DATABASE [SchoolTranscript]
END
/*
USE MASTER
GO
DROP DATABASE [SchoolTranscript]
GO
*/
GO

-- Switch execution context to the database
USE [SchoolTranscript] -- remaining SQL statements will run against the SchoolTranscript database
GO

IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'StudentCourses')
    DROP TABLE StudentCourses
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Courses')
    DROP TABLE Courses
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Students')
    DROP TABLE Students

GO

-- Create Tables...
CREATE TABLE Students
(
    -- Our column definitions will describe the
    -- name of the column and its data type as well as
    -- any "constraints" or "restrictions" around the
    -- data that can be stored in that column
    [StudentID]         int
        CONSTRAINT PK_Students_StudentID PRIMARY KEY
        -- A PRIMARY KEY constraint prevents duplicate data
            IDENTITY (2000, 5)
            -- The IDENTITY constraint does not need a name.
            -- An IDENTITY constraint means that the database server
            -- will take responsibility to put a value in this column
            -- every time a new row is added to the table.
            -- IDENTITY constraints can only be applied to the PRIMARY KEY
            -- columns that are of a whole-number numeric type.
            -- The IDENTITY constraint takes two values
            --      - The "seed" or starting value for the first row
            --      - The "increment" or value by which we increment
                                    NOT NULL,
    [GivenName]         varchar(50) NOT NULL,
    [Surname]           varchar(50) NOT NULL,
    [DateOfBirth]       datetime    NOT NULL,
    [Enrolled]          bit         NOT NULL
)

CREATE TABLE Courses
(
    [Number]        varchar(10)
        CONSTRAINT PK_Courses_Number PRIMARY KEY
                                    NOT NULL,
    [Name]          varchar(50)     NOT NULL,
    [Credits]       decimal(3, 1)   NOT NULL,
    [Hours]         tinyint         NOT NULL,
    [Active]        bit             NOT NULL,
    [Cost]          money           NOT NULL
)

CREATE TABLE StudentCourses
(
    [StudentID]     int
        CONSTRAINT FK_StudentCourses_Students
            FOREIGN KEY REFERENCES Students(StudentID)
        -- A FOREIGN KEY constraint means that the only values
        -- acceptable for this column must be values that exist
        -- in the referenced table.
                                    NOT NULL,
    [CourseNumber]  varchar(10)
        CONSTRAINT FK_StudentCourses_Courses -- All constraint names must be unique
            FOREIGN KEY REFERENCES Courses([Number])
                                    NOT NULL,
    [Year]          int             NOT NULL,
    [Term]          char(3)         NOT NULL,
    [FinalMark]     tinyint             NULL,
    [Status]        char(1)         NOT NULL,
    -- Table-Level Constraint - when a constraint involves more than one column
    CONSTRAINT PK_StudentCourses_StudentID_CourseNumber
        PRIMARY KEY (StudentID, CourseNumber)
        -- Composite Primary Key Constraint
)



