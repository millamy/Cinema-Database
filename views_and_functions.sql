
--1 This view lists the titles of all movies that have available tickets for purchase
CREATE VIEW AvailableMovies AS
SELECT Title FROM Movie WHERE TicketsAvailable>0;

--2 This view displays the title, date, and time of cinema seances for movies.
CREATE VIEW MovieSchedule AS
SELECT Title, Date, Time
FROM Movie M INNER JOIN MovieShowtime MS ON M.MovieID=MS.MovieID

--3 This view presents the names of film directors and the titles of the movies they have contributed to.

CREATE VIEW MovieDirectors AS
SELECT DISTINCT Title,Name DirectorName FROM
Movie M INNER JOIN MoviePeople MP ON M.MovieID=MP.MovieID
  INNER JOIN People P ON MP.PersonID=P.PersonID
  INNER JOIN Directors D ON D.PersonID=P.PersonID

--4 This function returns a table of movies available in the specified language
CREATE FUNCTION MovieInSertainLanguage (@language VARCHAR(200))
RETURNS TABLE AS
RETURN
SELECT Title from Movie
WHERE Language LIKE @language

--5 This view provides the names of movies and the corresponding hall numbers where they are being screened
CREATE VIEW HallForMovie AS
SELECT CH.HallID, Title
FROM Movie M INNER JOIN MovieShowtime MS ON M.MovieID=MS.MovieID
     INNER JOIN CinemaHall CH ON MS.HallID=CH.HallID

--6 This view showcases all directors and their additional information, such as their person ID, name, date of birth, gender, and number of awards.

CREATE VIEW ShowDirectors AS
SELECT P.PersonID, Name, DOB, Gender, AwardsNumber FROM People P JOIN Directors D ON (P.PersonID = D.PersonID)

--7 This view presents film producers and their additional information, including their person ID, name, date of birth, gender, and role.
CREATE VIEW ShowProducers AS
SELECT P.PersonID, Name, DOB, Gender, Role FROM People P JOIN Producers S ON (S.PersonID = P.PersonID)

--8  This function calculates and returns the total income generated by the specified movie title
CREATE FUNCTION MovieRevenue
( @movieTitle VARCHAR(200))
RETURNS INT
BEGIN
declare @movieRevenue int;
         set @movieRevenue = (select SUM(price) from Tickets T INNER JOIN MovieShowtime MS ON T.MovieShowtimeID=MS.MovieShowtimeID
                               JOIN Movie M ON MS.MovieID=M.MovieID
          where Title like @movieTitle);
RETURN @movieRevenue
END

--9 This function retrieves and returns the total number of tickets sold on the specified date
CREATE FUNCTION ticketsSoldByDate (@date DATE)
RETURNS int
AS
BEGIN
         declare @ticketsSold int;
         set @ticketsSold = (select Count(*) from Tickets where Date like @date);
         return @ticketsSold;
END

--10 This view lists the titles of all movies that are currently unavailable to clients due to the unavailability of tickets
CREATE VIEW SoldMovies AS
SELECT Title FROM Movie WHERE TicketsAvailable=0;