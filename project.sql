create database netflix_db;

use netflix_db;
-- See the first few rows of the dataset
SELECT * FROM netflix_titles LIMIT 10;
-- Count total records
SELECT COUNT(*) AS total_titles FROM netflix_titles;
-- Count movies vs TV shows
SELECT type, COUNT(*) AS total_count 
FROM netflix_titles 
GROUP BY type;
-- Count titles released each year
SELECT release_year, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;
-- Top 10 countries producing the most content
SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
WHERE country != 'Unknown'
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;
-- Most common genres on Netflix
SELECT listed_in, COUNT(*) AS genre_count
FROM netflix_titles
GROUP BY listed_in
ORDER BY genre_count DESC
LIMIT 10;
-- Top 10 directors with most shows/movies
SELECT director, COUNT(*) AS total_directed
FROM netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_directed DESC
LIMIT 10;
-- Count titles added per year (based on date_added)
SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS added_year,
       COUNT(*) AS total_added
FROM netflix_titles
WHERE date_added != 'Not Available'
GROUP BY added_year
ORDER BY added_year DESC;
-- Count titles added per year (based on date_added)
SELECT title, rating 
FROM netflix_titles 
WHERE rating = 'TV-MA';
-- Search for shows with specific keywords
SELECT title, description 
FROM netflix_titles 
WHERE description LIKE '%love%';





