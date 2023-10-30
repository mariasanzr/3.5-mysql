--  average rental duration for films in each language

SELECT l.name, AVG(f.rental_duration) AS avg_rental_duration

FROM language AS l
INNER JOIN film AS f 
ON l.language_id = f.language_id
GROUP BY l.name;


-- average rental rate for films in each language

SELECT l.name, AVG(f.rental_rate) AS avg_rental_rate

FROM language AS l
INNER JOIN film AS f 
ON l.language_id = f.language_id
GROUP BY l.name;

-- selects the film titles and their replacement costs, ordering them in descending order to find the films with the highest replacement costs

SELECT f.title, f.replacement_cost

FROM blockbuster.film f
ORDER BY f.replacement_cost DESC
LIMIT 5;