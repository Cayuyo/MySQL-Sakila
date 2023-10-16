/*
-- Sakila --
Objetivo: Practica tus consultas SQL.
*/

use sakila;

SELECT * FROM city;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM payment;

-- Consulta 1
SELECT city.city_id, c.first_name, c.last_name, c.email, address.address
FROM customer c
JOIN address ON c.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city.city_id = 312;

-- Consulta 2
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, category.name AS category
FROM film f
JOIN film_category ON f.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

-- Consulta 3
SELECT a.actor_id, CONCAT(a.first_name," ",a.last_name) AS actor_name, film.film_id, film.title, film.description, film.release_year
FROM actor a
JOIN film_actor ON a.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE a.actor_id = 5;

-- Consulta 4 
SELECT s.store_id, ci.city_id, c.first_name, c.last_name, c.email, address.address
FROM customer c
JOIN store s ON c.store_id = s.store_id
JOIN address ON c.address_id = address.address_id
JOIN city ci ON address.city_id = ci.city_id
WHERE ci.city_id IN (1, 42, 312, 459) AND s.store_id = 1;

-- Consulta 5
SELECT f.title, f.description, f.release_year, f.rating, f.special_features
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.rating = 'G' AND f.special_features LIKE '%Behind the Scenes%' AND a.actor_id = 15;

-- Consulta 6
SELECT f.film_id, f.title, a.actor_id, CONCAT(a.first_name," ",a.last_name) AS actor_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id = 369;

-- Consulta 7
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name, f.rental_rate
FROM film f
JOIN film_category fa ON f.film_id = fa.film_id
JOIN category c ON fa.category_id = c.category_id
WHERE c.name = "Drama" AND f.rental_rate = 2.99;

-- Consulta 8
SELECT a.actor_id, CONCAT(a.first_name," ",a.last_name) AS actor_name, f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE c.name = "Action" AND a.first_name = "SANDRA" AND a.last_name = "KILMER";