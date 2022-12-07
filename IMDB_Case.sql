-- Problem Statement 1 : 
-- From the IMDb dataset, print the title and rating of those movies which have a genre starting from 'C' released in 2014 with a budget higher than 4 Crore.
-- SOLUTION : 

SELECT i.title, i.rating FROM IMDB i
JOIN genre g ON i.movie_id = g.movie_id 
WHERE g.genre LIKE 'C%'
AND i.title LIKE '%2014%'
AND i.Budget > 40000000;

-- Problem Statement 2 :  
-- Print the title and ratings of the movies released in 2012 whose metacritic rating is more than 60 and Domestic collections exceed 10 Crores.
-- Solution : 

SELECT i.title, i.rating
FROM IMDB i 
JOIN earning e 
ON i.movie_id = e.movie_id 
WHERE i.title LIKE '%2012%'
AND i.metaCritic > 60 
AND e.domestic > 100000000 ;

-- Problem Statement 3 : 
-- Print the genre and the maximum net profit among all the movies of that genre released in 2012 per genre. 
-- NOTE - 
-- 1. Do not print any row where either genre or the net profit is empty/null.
-- 2. net_profit = Domestic + Worldwide - Budget
-- 3. Keep the name of the columns as 'genre' and'net_profit'
-- 4. The genres should be printed in alphabetical order. 

-- Solution :  

WITH cte AS (
SELECT i.title, i.movie_id,
(e.domestic + e.worldwide - i.budget) AS net_profit
FROM earning e 
JOIN IMDB i 
ON i.movie_id = e.movie_id )

SELECT g.genre AS genre, MAX(net_profit) AS net_profit 
FROM cte c
JOIN genre g 
ON c.movie_id = g.movie_id 
WHERE c.title LIKE '%2012%' AND g.genre IS NOT NULL AND c.net_profit IS NOT NULL
GROUP BY g.genre 
ORDER BY g.genre ASC; 

-- Problem Statement 4 : 
-- Print the genre and the maximum weighted rating among all the movies of that genre released in 2014 per genre.
-- Note:
-- 1. Do not print any row where either genre or the weighted rating is empty/null.
-- 2. weighted_rating = avgerge of (rating + metacritic/10.0)
-- 3. Keep the name of the columns as 'genre' and 'weighted_rating'
-- 4. The genres should be printed in alphabetical order.

-- Solution : 
WITH cte AS (
 SELECT g.genre AS genre, (i.rating + i.metacritic / 10.0)/2 AS weighted_rating
 FROM IMDB i 
 JOIN genre g 
 ON i.movie_id = g.movie_id 
 WHERE i.title LIKE '%2014%')
 
 SELECT genre, MAX(weighted_rating) AS weighted_rating
 FROM cte 
 WHERE genre IS NOT NULL AND weighted_rating IS NOT NULL
 GROUP BY genre 
 ORDER BY genre ASC;




