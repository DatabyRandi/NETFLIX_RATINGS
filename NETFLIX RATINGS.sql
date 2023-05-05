
DROP TABLE IF EXISTS Reviewers
CREATE TABLE Reviewers (
id INT IDENTITY(1,1) PRIMARY KEY,
First_name varchar(255),
Last_name varchar(255)
)

DROP TABLE IF EXISTS Series
CREATE TABLE series(
	id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255),
    released_year INT,
    genre VARCHAR(255)
	)

DROP TABLE IF EXISTS Reviews
CREATE TABLE Reviews
(id INT IDENTITY(1,1) PRIMARY KEY,
Rating DECIMAL(2,1),
Series_ID INT,
Reviewer_ID INT,
FOREIGN KEY (series_id) REFERENCES series(id),
FOREIGN KEY (reviewer_id) REFERENCES reviewers(id))


INSERT INTO Reviewers (first_name, last_name) VALUES
('Anna','Smith'),
('Mary','Johnson'),
('Helen','Williams'),
('Lucy','Miller'),
('Ruth','Garcia'),
('Bernice','King'),
('Irene','Davis')

INSERT INTO Series (title,released_year,genre) VALUES
    ('The Starling', 2021, 'Comedy'),
    ('Sankofa', 1993, 'Drama'),
    ('Intrusion', 2021, 'Psychological Thriller'),
    ('Jeans', 1998, 'Comedy'),
    ('Grown Ups', 2010, 'Comedy'),
    ('Dark Skies', 2013, 'Horror'),
    ('Paranoia', 2013, 'Thriller'),
    ('The Stronghold', 2021, 'Thriller'),
    ('Jaws', 1975, 'Thriller'),
    ('Jaws 2', 1978, 'Thriller'),
    ('Safe House', 2012, 'Action'),
    ('Nightbooks', 2021, 'Mystery'),
    ('Kate', 2021, 'Thriller'),
    ('Prey', 2021, 'Thriller')

INSERT INTO Reviews(series_id,reviewer_id,rating) VALUES
	(1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

--Average rating next to its title for each movie on Netflix in ascending order

SELECT title, AVG(rating) as Avg_Rating
FROM Series
INNER JOIN reviews
ON series.id=reviews.series_id
GROUP BY title
ORDER BY avg_rating

--Find unreviewed series present in the database

SELECT title AS missing_rating
FROM series
LEFT JOIN reviews
ON series.id=reviews.series_id
WHERE rating is NULL

--Find genres and the average rating for each genre and make it only 2 decimal places

SELECT genre, ROUND(Avg(Rating), 2) AS Avg_rating
FROM series
INNER JOIN reviews
ON series.id=reviews.series_id
GROUP BY genre;

-- Find the first name, last name, title, and rating for each user using all 3 tables

SELECT first_name, last_name, title, rating
FROM reviewers
INNER JOIN reviews
ON reviewers.id=reviews.Reviewer_ID
INNER JOIN series
ON series.id=reviews.series_id
ORDER BY title;

-- Find the first & last name, title, and rating foronly the user with the last name Miller

SELECT first_name, last_name, title, rating
FROM reviewers
INNER JOIN reviews
ON reviewers.id=reviews.Reviewer_ID
INNER JOIN series
ON series.id=reviews.series_id
WHERE Last_name='Miller'
ORDER BY title;






