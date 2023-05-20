CREATE TABLE Movie(

       MovieID INT PRIMARY KEY,

       Title NVARCHAR(100) NOT NULL,

       Language NVARCHAR(50) NOT NULL,

       Genre NVARCHAR(50) NOT NULL,

       TicketsSold INT NOT NULL,

       TicketsAvailable INT NOT NULL

)
 

CREATE TABLE CinemaHall(

       HallID INT NOT NULL,

       NumberOfSeats INT NOT NULL,

       CONSTRAINT pk_HallID  PRIMARY KEY(HallID),


)

CREATE TABLE Staff(

       EmployeeID INT PRIMARY KEY,

       FirstName NVARCHAR(50) NOT NULL,

       LastName NVARCHAR(50) NOT NULL,

       Salary MONEY NOT NULL
)


CREATE TABLE CinemaHallStaff(

		HallID INT NOT NULL,

		EmployeeID INT NOT NULL,

		FOREIGN KEY(HallID) REFERENCES CinemaHall(HallID),

		FOREIGN KEY(EmployeeID) REFERENCES Staff(EmployeeID)
)
 

 

CREATE TABLE People(

       PersonID INT NOT NULL,

       Name NVARCHAR(255) NOT NULL,

       DOB DATE NOT NULL,

       Gender CHAR NOT NULL,

       CONSTRAINT pk_PersonID PRIMARY KEY(PersonID)

)

CREATE TABLE MoviePeople(
		MovieID INT NOT NULL,

		PersonID INT NOT NULL,

		FOREIGN KEY(MovieID) REFERENCES Movie(MovieID),

		FOREIGN KEY(PersonID) REFERENCES People(PersonID)
)
 

CREATE TABLE MovieShowtime(

       MovieShowtimeID INT PRIMARY KEY,

       Date DATE NOT NULL,

       Time TIME NOT NULL,

       MovieID INT,

       FOREIGN KEY(MovieID) REFERENCES Movie(MovieID),

       HallID INT,

       FOREIGN KEY(HallID) REFERENCES CinemaHall(HallID)

)

 

CREATE TABLE Customer(

       CustomerID INT NOT NULL,

       CustomerName NVARCHAR(255) NOT NULL,

       CustomerDOB DATE NOT NULL,

       CustomerGender CHAR NOT NULL,

       CONSTRAINT pk_CustomerID PRIMARY KEY(CustomerID)

)

 

CREATE TABLE Tickets(

       TicketID INT PRIMARY KEY,

       Price MONEY NOT NULL,

       MovieShowtimeID INT,

       FOREIGN KEY(MovieShowtimeID) REFERENCES MovieShowtime(MovieShowtimeID),

       CustomerID INT NOT NULL,

       FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),

       Date DATE NOT NULL

)

 

 

CREATE TABLE MovieOperator(

       employeeID INT,

       FOREIGN KEY(employeeID) REFERENCES Staff(employeeID),

       OperatorID INT PRIMARY KEY,

       ProjectorType NVARCHAR(25)

)

 

CREATE TABLE Cleaners(

       employeeID INT,

       FOREIGN KEY(employeeID) REFERENCES Staff(employeeID),

       CleanerID INT PRIMARY KEY,

       CompanyName NVARCHAR(200)

)
 

CREATE TABLE Directors(

       DirectorID INT PRIMARY KEY,

       PersonID INT NOT NULL,

       AwardsNumber INT NOT NULL,

       FOREIGN KEY(PersonID) REFERENCES People(PersonID)

)

 

CREATE TABLE Producers(

       ProducerID INT PRIMARY KEY,

       PersonID INT NOT NULL,

       Role VARCHAR(50) NOT NULL,

       FOREIGN KEY(PersonID) REFERENCES People(PersonID)

)

INSERT INTO People (PersonID,Name,DOB,Gender) VALUES (1,'Christopher Nolan','1998-11-25','M'),
 (2,'Tom Hanks','1978-10-07','F'),
 (3,'Moana F. Hall','1991-01-25','M'),
 (4,'Ori Lucas','1988-01-03','M'),
 (5,'Kirestin V. Cabrera','1986-07-04','M'),
 (6,'Byron Emerson','1995-01-19','F'),
 (7,'Teagan Dixon','1978-04-15','F'),
 (8,'Odessa Lara','2000-11-30','M'),
 (9,'Patricia A. Stephens','1984-08-12','F'),
 (10,'Lillith C. Oconnor','1983-12-03','F')

 

 

INSERT INTO Movie(MovieID,Genre,Language,TicketsSold,TicketsAvailable,Title) VALUES

(1,'Romance','English',287,100,'A Nous la Liberte'),

(2,'Action','French',312,100,'About Schmidt'),

(3,'Comedy','French',192,100,'Absence of Malice'),

(4,'Romance','French',352,100,'Adams Rib'),

(5,'Action','French',156,100,'Adaptation'),

(6,'Thriller','English',143,100,'The Adjuster'),

(7,'Thriller','English',203,100,'The Adventures of Robin Hood'),

(8,'Thriller','French',159,100,'Affliction'),

(9,'Thriller','German',328,100,'The African Queen'),

(10,'Action','German',283,50,'The Bad and the Beautiful'),

(11,'Comedy','German',284,50,'Billy Liar'),

(12,'Thriller','English',187,70,'Biloxi Blues'),

(13,'Comedy','German',112,110,'The Birds');

INSERT INTO MoviePeople (PersonID, MovieID) VALUES (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (6,6),
 (7,7),
 (8,8),
 (9,9),
 (10,10)

INSERT INTO Directors (DirectorID,PersonID,AwardsNumber) VALUES (1,1,2),(2,2,0),(3,3,4),(4,4,0),(5,5,2),(6,6,1)
INSERT INTO Producers (ProducerID,PersonID,Role) VALUES (1,7,'Executive'),(2,8,'Associate'),(3,9,'Lead'),(4,10,'Co-producer')

 

INSERT INTO Customer (CustomerID,CustomerName,CustomerDOB,CustomerGender) VALUES

(1,'Griffin Mayer','1979-01-16','F'),

 (2,'Leroy Travis','1983-02-26','F'),

 (3,'Beau Tanner','1987-01-01','F'),

 (4,'Rigel Clemons','1983-06-07','M'),

 (5,'Silas Warner','1974-01-31','M'),

 (6,'Uriah Ball','2000-10-10','M'),

(7,'Arden Hutchinson','1977-01-24','F'),

 (8,'Arden Roberts','1954-08-03','F'),

 (9,'Peter Moss','1982-02-03','M'),

 (10,'Darius Obrien','2000-01-08','F'),

 (11,'Levi Sawyer','1963-06-18','F'),

 (12,'Lyle Barrett','1965-11-29','M'),

 (13,'Henry Chan','1986-03-07','F'),

(14,'Kamal Welch','1969-10-12','F'),

(15,'Randall Duran','1950-03-28','F');

 

INSERT INTO Staff(employeeID, FirstName, LastName, Salary) VALUES

(1,'Macon','Mcgee',4000.00),

(2,'Adena','Mathews',4000.00),

(3,'Griffin','Mcpherson',4000.00),

(4,'Kessie','Kline',4000.00),

(5,'Deborah', 'Brady',5000.00),

(6,'Francesca', 'Hensley',5000.00),

(7,'Stacy', 'Beach',5000.00),

(8,'Shea', 'Peck',5000.00),

(9,'Quentin', 'Britt',5000.00)

 

INSERT INTO CinemaHall(HallID, NumberOfSeats) VALUES (1, 50), (2,70), (3,100), (4,120), (5,150)

INSERT INTO CinemaHallStaff(employeeID, HallID) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1),
(7,2),
(8,3),
(9,4)

INSERT INTO MovieOperator(employeeID, OperatorID, ProjectorType) VALUES (5,5,'LCD'),(6,1,'DLP'),(7,2,'CRT'),(8,3,'Light Valve'),(9,4,'DLP')

INSERT INTO Cleaners(employeeID,CleanerID,CompanyName) VALUES (1,1,'Clean 007'),(2,2,'Shine'),(3,3,'Fresh'), (4,4,'Clean 007')

 

insert into MovieShowtime values

(1,'2022-10-11','09:10:00',1,3),

(2,'2022-10-11','12:30:00',1,2),

(3,'2022-11-11','09:00:00',7,3),

(4,'2022-11-11','18:15:00',7,3),

(5,'2022-11-12','11:00:00',2,1),

(6,'2022-11-20','12:20:00',11,2),

(7,'2022-11-20','17:20:00',11,2),

(8,'2022-11-23','13:00:00',3,1),

(9,'2022-11-24','15:30:00',4,4),

(10,'2022-11-25','12:20:00',5,3),

(11,'2022-11-26','10:10:00',6,1),

(12,'2022-11-27','14:20:00',7,2),

(13,'2022-11-28','21:30:00',8,3),

(14,'2022-11-29','13:00:00',9,4),

(15,'2022-11-30','17:00:00',10,1),

(16,'2022-12-01','18:20:00',11,2),

(17,'2022-12-03','09:15:00',12,3),

(18,'2022-12-19','14:20:00',13,2)

 

insert into Tickets values

(1,25.00,1,1,'2022-09-08'),

(2,25.00,1,2,'2022-09-08'),

(3,25.00,3,3,'2022-09-08'),

(4,25.00,3,4,'2022-09-08'),

(5,25.00,3,5,'2022-09-08'),

(6,25.00,1,6,'2022-10-07'),

(7,25.00,1,7,'2022-10-07'),

(8,25.00,1,8,'2022-10-07'),

(9,25.00,2,9,'2022-10-07'),

(10,25.00,4,10,'2022-10-07'),

(11,25.00,5,11,'2022-10-07'),

(12,25.00,6,12,'2022-10-07'),

(13,25.00,7,13,'2022-11-01'),

(14,25.00,8,14,'2022-11-01'),

(15,25.00,9,15,'2022-11-02'),

(16,25.00,10,15,'2022-11-02'),

(17,25.00,11,1,'2022-11-03'),

(18,25.00,12,2,'2022-11-05'),

(19,25.00,13,3,'2022-11-05'),

(20,25.00,14,4,'2022-11-05'),

(21,25.00,15,5,'2022-11-06'),

(22,25.00,16,6,'2022-11-07'),

(23,25.00,17,7,'2022-11-07'),

(24,25.00,18,8,'2022-11-08'),

(25,25.00,5,9,'2022-11-09'),

(26,25.00,6,10,'2022-11-09'),

(27,25.00,8,11,'2022-11-09'),

(28,25.00,7,12,'2022-11-09'),

(29,25.00,9,13,'2022-11-09'),

(30,25.00,10,13,'2022-11-11'),

(31,25.00,11,13,'2022-11-11'),

(32,25.00,12,14,'2022-11-12'),

(33,25.00,13,2,'2022-11-20'),

(34,25.00,14,2,'2022-11-27')
