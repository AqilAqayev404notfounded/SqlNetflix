CREATE DATABASE TVNetflix
USE TVNetflix

CREATE TABLE Gender (
    ID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Actor (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    GenderId INT,
    FOREIGN KEY (GenderId) REFERENCES Gender(ID)
)

CREATE TABLE FilmCategory (
    ID INT PRIMARY KEY,
    Name VARCHAR(255)
)

CREATE TABLE Movie (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    ReleaseDate VARCHAR(255),
    Director VARCHAR(255),
    FilmCategoryID INT,
    FOREIGN KEY (FilmCategoryID) REFERENCES FilmCategory(ID)
)

CREATE TABLE MovieActor (
    MovieID INT,
    ActorID INT,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movie(ID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ID)
)

INSERT INTO Gender (ID, Name) VALUES
(1, 'Kisi'),
(2, 'Qadin')

INSERT INTO Actor (ID, Name, GenderId) VALUES
(1, 'Angelina Jolie', 2),
(2, 'Leonardo DiCaprio', 1),
(3, 'Kemal Sunal', 1)

INSERT INTO FilmCategory (ID, Name) VALUES
(1, 'Aksiyon'),
(2, 'Aglamali'),
(3, 'Gulmeli')

INSERT INTO Movie (ID, Name, ReleaseDate, Director, FilmCategoryID) VALUES
(1, 'Lara Croft: Tomb Raider', '2001', 'Simon West', 1),  
(2, 'Inception', '2010', 'Christopher Nolan', 2), 
(3, 'Tosun Paşa', '1976', 'Ertem Eğilmez', 3);   


INSERT INTO MovieActor (MovieID, ActorID) VALUES
(1, 1), 
(2, 2),
(3, 3)


SELECT 
    Movie.ID AS MovieID,
    Movie.Name AS MovieName,
    Movie.ReleaseDate,
    Movie.Director,
    FilmCategory.Name AS CategoryName,
    Actor.ID AS ActorID,
    Actor.Name AS ActorName,
    Gender.Name AS GenderName
FROM 
    Movie
JOIN 
    FilmCategory ON Movie.FilmCategoryID = FilmCategory.ID
JOIN 
    MovieActor ON Movie.ID = MovieActor.MovieID
JOIN 
    Actor ON MovieActor.ActorID = Actor.ID
JOIN 
    Gender ON Actor.GenderId = Gender.ID;




