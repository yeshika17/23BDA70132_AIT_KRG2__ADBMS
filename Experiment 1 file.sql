-- Step 1: Create the Director table
CREATE TABLE Director (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(100),
    nationality VARCHAR(50)
);

-- Step 2: Create the Movie table with a foreign key reference to Director
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(150),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES Director(director_id)
);

-- Step 3: Insert dummy records into Director
INSERT INTO Director (director_id, director_name, nationality) VALUES
(1, 'Christopher Nolan', 'UK'),
(2, 'Bong Joon-ho', 'South Korea'),
(3, 'Greta Gerwig', 'USA');

-- Step 4: Insert dummy records into Movie
INSERT INTO Movie (movie_id, title, director_id) VALUES
(201, 'Inception', 1),
(202, 'Parasite', 2),
(203, 'Lady Bird', 3);

-- Step 5: Perform an INNER JOIN to get the required data
SELECT
    M.title AS movie_title,
    D.director_name,
    D.nationality
FROM
    Movie M
INNER JOIN
    Director D ON M.director_id = D.director_id;
