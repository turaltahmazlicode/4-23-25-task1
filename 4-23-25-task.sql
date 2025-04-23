/*USE master
DROP DATABASE LiblaryDB*/

CREATE DATABASE LiblaryDB

USE LiblaryDB

CREATE TABLE Authors
(
    Id   INT IDENTITY (1,1) PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
)

CREATE TABLE Books
(
    Id            INT IDENTITY (1,1) PRIMARY KEY,
    Title         VARCHAR(50) NOT NULL,
    PublishedYear SMALLINT CHECK (PublishedYear > 2000),
    AuthorId      INT REFERENCES Authors (Id),
)

CREATE TABLE Genres
(
    Id   INT IDENTITY (1,1) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
)

CREATE TABLE BookGenres
(
    Id      INT IDENTITY (1,1) PRIMARY KEY,
    BookId  INT REFERENCES Books (Id),
    GenreId INT REFERENCES Genres (Id),
)

INSERT INTO Authors (Name)
VALUES ('Name1'),
       ('Name2'),
       ('Name3'),
       ('Name4'),
       ('Name5')

INSERT INTO Books (Title, PublishedYear, AuthorId)
VALUES ('Title1', 2003, 1),
       ('Title2', 2004, 2),
       ('ATitle3', 2005, 3),
       ('Title4', 2006, 4),
       ('aTitle5', 2007, 5)

INSERT INTO Genres (Name)
VALUES ('Genre5'),
       ('Genre3'),
       ('Genre2'),
       ('Genre1'),
       ('Genre4')

INSERT INTO BookGenres (BookId, GenreId)
VALUES (1, 5),
       (2, 4),
       (3, 3),
       (4, 2),
       (5, 1)

SELECT * FROM Books
WHERE PublishedYear >= 2005
ORDER BY Title

SELECT * FROM Books
WHERE Title LIKE 'A%'

SELECT * FROM Genres
ORDER BY Name DESC
