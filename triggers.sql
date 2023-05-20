-- Trigger 1: Checks if the given date is not a "journey into the past" for movie seances.
CREATE TRIGGER CheckShowtimeDate
ON dbo.MovieShowtime
FOR INSERT, UPDATE
AS
BEGIN
     SET NOCOUNT ON;

     IF EXISTS (
         SELECT 1
         FROM Inserted I
         WHERE Date < CAST(GETDATE() AS DATE)
         )
     BEGIN
         THROW 51000, 'Error: Date is from the past', 1;
     END;
END;

-- Trigger 2: Prints the names of newly added movies to the movie database.
CREATE TRIGGER NewMovie ON dbo.Movie
FOR INSERT
AS
BEGIN
     SELECT 'Here are new movies:' + Title
     FROM inserted;
END;

-- Trigger 3: Checks if the employee has not been assigned a salary less than the minimum wage.
CREATE TRIGGER CheckSalary
ON dbo.Staff
FOR INSERT, UPDATE
AS
BEGIN
     SET NOCOUNT ON;

     IF EXISTS (
         SELECT 1
         FROM Inserted I
         WHERE Salaries < 3500
         )
     BEGIN
         THROW 51000, 'Error: Minimum salary is 3500', 1;
     END;
END;

-- Trigger 4: Checks whether a minor has been added to the customer base.
CREATE TRIGGER CheckAge
ON dbo.Customer
FOR INSERT, UPDATE
AS
BEGIN
     SET NOCOUNT ON;

     IF EXISTS (
         SELECT 1
         FROM Inserted I
         WHERE (DATEPART(yyyy, GETDATE()) - YEAR(CustomerDOB)) < 18
         )
     BEGIN
         THROW 51000, 'Error: Customer is younger than 18 years old', 1;
     END;
END;

-- Trigger 5: Prevents modification of the number of cinema halls.
CREATE TRIGGER HallNumber
ON dbo.CinemaHall
FOR DELETE, INSERT
AS
BEGIN
     THROW 51000, 'Error: The number of cinema halls cannot be changed', 1;
END;
