
--1 The procedure for the given movie title @Title shows available movie seances, otherwise it returns a message about the unavailability of the movie

CREATE PROCEDURE dbo.FilmExhibition @Title NVARCHAR(MAX) AS
     IF @Title IN (SELECT Title FROM Movie)
         SELECT * FROM MovieSchedule
         WHERE Title LIKE @Title
     ELSE
         PRINT 'Movie is not available in our cinema'
HIM

--2 The procedure prints the cinemas total revenue

CREATE PROCEDURE dbo.TotalRevenue AS
SELECT SUM(Price) FROM Tickets
HIM


--3 The procedure returns a table containing the cinemas revenue for each film
CREATE PROCEDURE dbo.SalesForEachMovie AS
SELECT SUM(price) MovieSales, Title from Tickets T
INNER JOIN
(SELECT Title, MovieShowtimeID from Movie M INNER JOIN ( SELECT MovieShowtimeID,MovieID FROM MovieShowtime) MS ON MS.MovieID=M.MovieID ) MO
ON MO.MovieShowtimeID = T.MovieShowtimeID
GROUP BY Title

--4 The procedure allows you to perform a salary increase for a specific employee, accepts the arguments @increaseRate - increase amount (e.g. 1.4) and @empID - individual employee number
CREATE PROCEDURE IncreaseSalary @increaseRate FLOAT, @empID INT AS
UPDATE Staff
SET
SALARY = ROUND(Salary*CAST((1+@increaseRate*0.01)AS MONEY),2)
WHERE employeeID=@empID

--5 The procedure changes the number of tickets sold and remaining for a specific movie. It accepts arguments @title – movie title, @sold – number of tickets sold. In the case of incorrect data, it returns an appropriate message.

CREATE PROCEDURE UpdateTickets @title VARCHAR(200), @sold INT AS
IF @Title IN (SELECT Title FROM Movie) AND @sold>0
     UPDATE Movie
     SET
     TicketsAvailable=TicketsAvailable-@sold,
     TicketsSold=TicketsSold+@sold
     WHERE Title = @title
ELSE
     PRINT 'Error:check input data'