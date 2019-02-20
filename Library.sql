CREATE DATABASE Library;

/* TABLE CREATION */

CREATE TABLE Library_Branch (
	Branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Branch_Name VARCHAR(50) NOT NULL,
	Branch_Address VARCHAR(50) NOT NULL
);


CREATE TABLE Publisher (
	Publisher_Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Publisher_Address VARCHAR(50) NOT NULL,
	Publisher_Phone VARCHAR(50) NOT NULL
);


CREATE TABLE Books (
	Book_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL UNIQUE,
	Publisher_Name VARCHAR(50) NOT NULL CONSTRAINT fk_Publisher_Name FOREIGN KEY REFERENCES Publisher(Publisher_Name) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Book_Authors (
	Book_ID INT NOT NULL CONSTRAINT fk_Book_ID FOREIGN KEY REFERENCES Books(Book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Author_Name VARCHAR(50) NOT NULL
);


CREATE TABLE Book_Copies (
	Book_ID VARCHAR(50) NOT NULL CONSTRAINT UC_Title FOREIGN KEY REFERENCES Books(Title) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_ID INT NOT NULL CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES Library_Branch(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);


CREATE TABLE Book_Loans (
	Book_ID VARCHAR(50) NOT NULL CONSTRAINT fk_Title FOREIGN KEY REFERENCES Books(Title) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_ID INT NOT NULL CONSTRAINT UC_Branch_ID FOREIGN KEY REFERENCES Library_Branch(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Card_No INT NOT NULL CONSTRAINT fk_Card_No FOREIGN KEY REFERENCES Borrower(Card_No) ON UPDATE CASCADE ON DELETE CASCADE,
	Date_Out DATE NOT NULL,
	Date_Due DATE NOT NULL
);


CREATE TABLE Borrower (
	Card_No INT PRIMARY KEY NOT NULL IDENTITY (4500,1),
	Borrower_Name VARCHAR(50) NOT NULL,
	Borrower_Address VARCHAR(50) NOT NULL,
	Borrower_Phone VARCHAR(50) NOT NULL
);

/* INSERT VALUES */


INSERT INTO Library_Branch
	(Branch_Name,Branch_Address)
	VALUES 
	('Sharpstown', '25 Main St.'),
	('Central', '1234 MLK Blvd.'),
	('Northgate', '553 Burnside Ave.'),
	('Springfield','1167 Wayland Rd.')
;


INSERT INTO Publisher
	(Publisher_Name, Publisher_Address, Publisher_Phone)
	VALUES 
	('McGraw Hill', '83 S. King St. Seattle, WA 98104','800-338-3987'),
	('Scholastic', '5127 NE 158th Ave. Portland, OR 97230', '800-252-8486'),
	('Harper Collins', '195 Broadway New York, NY 10007', '800-242-7737'),
	('Simon & Schuster','1230 6th Ave. New York, NY 10020','800-223-2336'),
	('Penguin Random House','1745 Broadway New York, NY 10022','800-726-0600')
;


INSERT INTO Books
	(Title, Publisher_Name)
	VALUES 
	('The Lost Tribe', 'Harper Collins'),
	('IT', 'McGraw Hill'),
	('Cujo','McGraw Hill'),
	('Infinite Jest','Penguin Random House'),
	('Vineland','Scholastic'),
	('Villa Incognito','Simon & Schuster'),
	('The Windup Bird Chronicles','Harper Collins'),
	('Feast of Snakes','McGraw Hill'),
	('White Noise','Penguin Random House'),
	('The Blind Assassin','Scholastic'),
	('The White Album','Simon & Schuster'),
	('White Teeth','Harper Collins'),
	('What is the What?','McGraw Hill'),
	('Holidays on Ice','Penguin Random House'),
	('M is for Murder','Scholastic'),
	('Hells Angels','Simon & Schuster'),
	('Fight Club','Harper Collins'),
	('The Lorax','McGraw Hill'),
	('Fences','Penguin Random House'),
	('Mother Night','Scholastic')
;


INSERT INTO Book_Authors
	(Book_ID, Author_Name)
	VALUES 
	(1, 'Mark Lee'),
	(2,'Stephen King'),
	(3,'Stephen King'),
	(4,'David Foster Wallace'),
	(5,'Thomas Pynchon'),
	(6,'Tom Robbins'),
	(7,'Haruki Murakami'),
	(8,'Harry Crews'),
	(9,'Don DeLillo'),
	(10,'Margaret Atwood'),
	(11,'Joan Didion'),
	(12,'Zadie Smith'),
	(13,'Dave Eggers'),
	(14,'David Sedaris'),
	(15,'Agatha Christie'),
	(16,'Hunter S. Thompson'),
	(17,'Chuck Palahnuik'),
	(18,'Dr. Seuss'),
	(19,'August Wilson'),
	(20,'Kurt Vonnegut')
;


INSERT INTO Book_Copies
	(Book_ID, Branch_ID, Number_Of_Copies)
	VALUES 
	('The Lost Tribe', 1, 4),
	('IT', 1, 4),
	('Cujo', 1, 5),
	('Infinite Jest', 1, 4),
	('Vineland', 1, 3),
	('Villa Incognito', 1, 4),
	('The Windup Bird Chronicles', 1, 4),
	('Feast of Snakes', 1, 4),
	('White Noise', 1, 5),
	('The Blind Assassin', 1, 5),
	('The White Album', 1, 4),
	('White Teeth', 1, 5),
	('What is the What?', 1, 4),
	('Holidays on Ice', 1, 3),
	('M is for Murder', 1, 3),
	('Hells Angels', 1, 4),
	('Fight Club', 1, 5),
	('The Lorax', 1, 4),
	('Fences', 1, 3),
	('Mother Night', 1, 5),
	('The Lost Tribe', 2, 5),
	('IT', 2, 3),
	('Cujo', 2, 4),
	('Infinite Jest', 2, 5),
	('Vineland', 2, 4),
	('Villa Incognito', 2, 3),
	('The Windup Bird Chronicles', 2, 2),
	('Feast of Snakes', 2, 3),
	('White Noise', 2, 2),
	('The Blind Assassin', 2, 4),
	('The White Album', 2, 3),
	('White Teeth', 2, 2),
	('What is the What?', 2, 3),
	('Holidays on Ice', 2, 2),
	('M is for Murder', 2, 5),
	('Hells Angels', 2, 3),
	('Fight Club', 2, 2),
	('The Lorax', 2, 2),
	('Fences', 2, 4),
	('Mother Night', 2, 4),
	('The Lost Tribe', 3, 5),
	('IT', 3, 3),
	('Cujo', 3, 3),
	('Infinite Jest', 3, 3),
	('Vineland', 3, 4),
	('Villa Incognito', 3, 5),
	('The Windup Bird Chronicles', 3, 5),
	('Feast of Snakes', 3, 3),
	('White Noise', 3, 2),
	('The Blind Assassin', 3, 3),
	('The White Album', 3, 3),
	('White Teeth', 3, 2),
	('What is the What?', 3, 3),
	('Holidays on Ice', 3, 5),
	('M is for Murder', 3, 2),
	('Hells Angels', 3, 2),
	('Fight Club', 3, 3),
	('The Lorax', 3, 3),
	('Fences', 3, 5),
	('Mother Night', 3, 2),
	('The Lost Tribe', 4, 2),
	('IT', 4, 3),
	('Cujo', 4, 4),
	('Infinite Jest', 4, 2),
	('Vineland', 4, 5),
	('Villa Incognito', 4, 3),
	('The Windup Bird Chronicles', 4, 3),
	('Feast of Snakes', 4, 2),
	('White Noise', 4, 4),
	('The Blind Assassin', 4, 3),
	('The White Album', 4, 2),
	('White Teeth', 4, 4),
	('What is the What?', 4, 3),
	('Holidays on Ice', 4, 5),
	('M is for Murder', 4, 5),
	('Hells Angels', 4, 3),
	('Fight Club', 4, 2),
	('The Lorax', 4, 2),
	('Fences', 4, 5),
	('Mother Night', 4, 3)
;


INSERT INTO Book_Loans
	(Book_ID, Branch_ID, Card_No, Date_Out, Date_Due)
	VALUES 
	('The Lost Tribe', 1, 4500, '2019-01-05', '2019-03-05'),
	('The Lost Tribe', 2, 4501, '2019-02-08', '2019-04-08'),
	('The Lost Tribe', 3, 4502, '2019-02-15', '2019-04-15'),
	('IT', 1, 4500, '2019-01-05', '2019-03-05'),
	('IT', 2, 4501, '2019-02-08', '2019-04-08'),
	('IT', 3, 4502, '2019-02-15', '2019-04-15'),
	('IT', 4, 4503, '2019-01-22', '2019-03-22'),
	('Cujo', 1, 4500, '2019-01-05', '2019-03-05'),
	('Cujo', 2, 4501, '2019-02-08', '2019-04-08'),
	('Cujo', 3, 4502, '2019-02-15', '2019-04-15'),
	('Cujo', 4, 4503, '2019-01-22', '2019-03-22'),
	('Infinite Jest', 1, 4500, '2019-01-05', '2019-03-05'),
	('Vineland', 1, 4500, '2019-01-05', '2019-03-05'),
	('Villa Incognito', 1, 4500, '2019-01-05', '2019-03-05'),
	('The Windup Bird Chronicles', 2, 4501, '2019-02-08', '2019-04-08'),
	('The Windup Bird Chronicles', 4, 4506, '2019-02-07', '2019-04-07'),
	('Feast of Snakes', 2, 4501, '2019-02-08', '2019-04-08'),
	('Feast of Snakes', 4, 4506, '2019-02-07', '2019-04-07'),
	('Feast of Snakes', 1, 4504, '2019-02-02', '2019-04-02'),
	('White Noise', 2, 4501, '2019-02-08', '2019-04-08'),
	('The Blind Assassin', 1, 4504, '2019-02-02', '2019-04-02'),
	('The White Album', 3, 4505, '2019-01-04', '2019-03-04'),
	('White Teeth', 4, 4506, '2019-02-07', '2019-04-07'),
	('White Teeth', 3, 4505, '2019-01-04', '2019-03-04'),
	('What is the What?', 1, 4507, '2019-01-04', '2019-03-04' ),
	('What is the What?', 4, 4503, '2019-01-22', '2019-03-22' ),
	('Holidays on Ice', 1, 4507, '2019-01-04', '2019-03-04'),
	('Holidays on Ice', 3, 4505, '2019-01-04', '2019-03-04'),
	('M is for Murder',4, 4503, '2019-01-22', '2019-03-22'),
	('M is for Murder',3, 4505, '2019-01-04', '2019-03-04'),
	('Hells Angels',4, 4506, '2019-02-07', '2019-04-07'),
	('Hells Angels',4, 4503, '2019-01-22', '2019-03-22'),
	('Fight Club',4, 4506, '2019-02-07', '2019-04-07'),
	('Fight Club',3, 4505, '2019-01-04', '2019-03-04'),
	('The Lorax',1, 4507, '2019-01-04', '2019-03-04'),
	('The Lorax',3, 4502, '2019-02-15', '2019-04-15'),
	('Fences',1, 4507, '2019-01-04', '2019-03-04'),
	('Fences',3, 4502, '2019-02-15', '2019-04-15'),
	('Mother Night',3, 4505, '2019-01-04', '2019-03-04'),
	('Mother Night',4, 4503, '2019-01-22', '2019-03-22'),
	('Mother Night',3, 4502, '2019-02-15', '2019-04-15'),
	('Infinite Jest', 1, 4500, '2019-01-05', '2019-03-05'),
	('Vineland', 3, 4502, '2019-02-15', '2019-04-15'),
	('Villa Incognito', 4, 4503, '2019-01-22', '2019-03-22'),
	('The White Album', 2, 4501, '2019-02-08', '2019-04-08'),
	('White Teeth', 2, 4501, '2019-02-08', '2019-04-08'),
	('The Lorax',1, 4507, '2019-01-04', '2019-03-04'),
	('Fences', 4, 4503, '2019-01-22', '2019-03-22'),
	('Hells Angels',1, 4507, '2019-01-04', '2019-03-04'),
	('Fight Club',3, 4502, '2019-02-15', '2019-04-15'), 
	('Hells Angels', 2, 4501, '2018-12-20', '2019-02-20'),
	('Fight Club',1, 4502, '2018-12-20', '2019-02-20');



INSERT INTO Borrower
	(Borrower_Name, Borrower_Address, Borrower_Phone)
	VALUES 
	('Fedir Merritt', '12 Stone Dr.', '503-322-0987'),
	('Priya Akkerman', '88 Jefferson Blvd.', '503-657-3324'),
	('Burt Hermanson','4356 SE Stark St.','503-451-7219'),
	('Vera Donaldson','566 NE Alberta St.','503-617-5592'),
	('George Young','2353 SW Salmon St. Apt.2','503-338-2124'),
	('Michael Rothbauer','71 N Russell Ave.','503-559-6511'),
	('Cathy Fornier','4297 SE Hawthorne Blvd.','503-917-0085'),
	('Theo Simpson','22 Cherry Rd.','503-225-1181'),
	('Rachel Thomas', '790 Stereo Dr.', '503-382-8947')
;

/*TEST TABLE*/
SELECT * FROM Library_Branch;
SELECT * FROM Book_Copies;
SELECT * FROM Books;
SELECT * FROM Publisher;
SELECT * FROM Book_Authors;
SELECT * FROM Book_Loans;
SELECT * FROM Borrower;



/*Drill 1*//* Procedure for # of copies 'The Lost Tribe' @ Sharpstown */

USE Library
GO
CREATE PROC spTLTCopiesSharpstown
AS
SELECT Number_Of_Copies
	FROM Book_Copies a1
		INNER JOIN Library_Branch a2 ON a2.Branch_ID = a1.Branch_ID
		INNER JOIN Books a3 ON a3.Title = a1.Book_ID
	WHERE a1.Book_ID = 'The Lost Tribe'
	AND a2.Branch_Name = 'Sharpstown'
	;
GO

/*Drill 2*//* Procedure for Copies of The Lost Tribe @ All Locations*/

USE Library
GO
CREATE PROC spTLTAllLocations
AS
SELECT Number_Of_Copies, a2.Branch_Name
	FROM Book_Copies a1
		INNER JOIN Library_Branch a2 ON a2.Branch_ID = a1.Branch_ID
		INNER JOIN Books a3 ON a3.Title = a1.Book_ID
	WHERE a1.Book_ID = 'The Lost Tribe'
	;
GO

/*Drill 3*//* Procedure for Borrowers without books*/ 

USE Library
GO
CREATE PROC spBorrowersWithoutBooks
AS
SELECT Borrower_Name
	FROM Borrower a1
	INNER JOIN Book_Loans a2 On a2.Card_No = a1.Card_No
	WHERE a1.Card_No NOT IN (SELECT a2.Card_No FROM Book_Loans a2)
;
GO

/*Drill 4*//* Procedure for Due Date */

USE Library
GO
CREATE PROC spDueToday
AS
SELECT a1.Book_ID AS 'Title', a2.Borrower_Name, a2.Borrower_Address
FROM Book_Loans a1
INNER JOIN Borrower a2 ON a2.Card_No = a1.Card_No
INNER JOIN Library_Branch a3 ON a3.Branch_ID = a1.Branch_ID
WHERE a3.Branch_Name = 'Sharpstown' AND a1.Date_Due = CAST(CURRENT_TIMESTAMP AS DATE); 
GO


/*Drill 5*//* Procedure For Branch Name & Total Books */

USE Library
GO
CREATE PROC spNumberofBooksonLoanSharpstown
AS
SELECT COUNT(a1.Branch_ID) AS 'Number of Books on Loan', a2.Branch_Name
FROM Book_Loans a1
INNER JOIN Library_Branch a2 ON a2.Branch_ID = a1.Branch_ID
WHERE a1.Branch_ID = 1
GROUP BY a2.Branch_Name;
GO

USE Library
GO
CREATE PROC spNumberofBooksonLoanCentral
AS
SELECT COUNT(a1.Branch_ID) AS 'Number of Books on Loan', a2.Branch_Name
FROM Book_Loans a1
INNER JOIN Library_Branch a2 ON a2.Branch_ID = a1.Branch_ID
WHERE a1.Branch_ID = 2
GROUP BY a2.Branch_Name;
GO

USE Library
GO
CREATE PROC spNumberofBooksonLoanNorthgate
AS
SELECT COUNT(a1.Branch_ID) AS 'Number of Books on Loan', a2.Branch_Name
FROM Book_Loans a1
INNER JOIN Library_Branch a2 ON a2.Branch_ID = a1.Branch_ID
WHERE a1.Branch_ID = 3
GROUP BY a2.Branch_Name;
GO

USE Library
GO
CREATE PROC spNumberofBooksonLoanSpringfield
AS
SELECT COUNT(a1.Branch_ID) AS 'Number of Books on Loan', a2.Branch_Name
FROM Book_Loans a1
INNER JOIN Library_Branch a2 ON a2.Branch_ID = a1.Branch_ID
WHERE a1.Branch_ID = 4
GROUP BY a2.Branch_Name;
GO

/*Drill 6 *//* Procedure for Name, Address, # of Books for Borrowers with more than 5 books.*/

USE Library
GO
CREATE PROC spInfoBorrowersWith6orMoreBooks
AS
SELECT a1.Borrower_Name, a1.Borrower_Address, COUNT(a2.Card_No) AS 'Number of Books on Loan'
FROM Borrower a1
INNER JOIN Book_Loans a2 ON a2.Card_No = a1.Card_No
GROUP BY Borrower_Name, Borrower_Address
HAVING COUNT(*) > 5;
GO

/*Drill 7 *//* Procedure for Stephen King Books at Central Branch */

USE Library
GO
CREATE PROC spStephenKingBooksatCentral
AS
SELECT a1.Book_ID AS 'Title', a1.Number_Of_Copies
FROM Book_Copies a1
INNER JOIN Books a2 ON a2.Title = a1.Book_ID
INNER JOIN Book_Authors a3 ON a3.Book_ID = a2.Book_ID
INNER JOIN Library_Branch a4 ON a4.Branch_ID = a1.Branch_ID
WHERE a3.Author_Name = 'Stephen King' AND a4.Branch_Name = 'Central'
;
GO
