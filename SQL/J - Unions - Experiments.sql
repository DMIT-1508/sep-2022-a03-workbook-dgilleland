USE [A03-School]
GO

-- Imagine we want all the names of the people at the school: Staff and Students
CREATE OR ALTER VIEW AllPeople
AS
    SELECT  FirstName, LastName, 'Staff' AS 'Role'
    FROM    Staff

    UNION

    SELECT  FirstName, LastName, 'Student' AS 'Role'
    FROM    Student
GO

SELECT * FROM AllPeople
