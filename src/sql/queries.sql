

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


SELECT * FROM observations LIMIT 10;

SELECT DISTINCT region_id FROM observations;

SELECT COUNT(DISTINCT species_id) AS total_species FROM observations;

SELECT * FROM observations WHERE region_id = 2;

SELECT * FROM observations WHERE observation_date = '1998-08-08';

SELECT o.region_id, r.name AS region_name, COUNT(*) AS total
FROM observations o
JOIN regions r ON o.region_id = r.id
GROUP BY o.region_id, r.name
ORDER BY total DESC;

SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
ORDER BY total DESC
LIMIT 5;

SELECT species_id, COUNT(*) AS count_observations
FROM observations
GROUP BY species_id
HAVING count_observations < 5
ORDER BY count ASC;

SELECT observer, COUNT(*) AS total_observations
FROM observations
GROUP BY observer
ORDER BY total_observations DESC;

SELECT o.id, r.name AS region_name, o.latitude, o.longitude, o.observation_date
FROM observations o
JOIN regions r ON o.region_id = r.id;

SELECT o.id, sp.scientific_name
FROM observations o
JOIN species sp ON o.species_id = sp.id;

SELECT r.name AS region, sp.scientific_name, COUNT(*) AS total
FROM observations o
JOIN species sp ON o.species_id = sp.id
JOIN regions r ON o.region_id = r.id
GROUP BY region, sp.scientific_name
ORDER BY region, total DESC;

-- Nivel 4 (Opcional) - 13
INSERT INTO observations (species_id, region_id, observer, observation_date, latitude, longitude, count) 
VALUES (5, 7, 'observer1111', '2026-02-05', -13.429111, 132.41847, 1 );

--
INSERT INTO observations (species_id, region_id, observer, observation_date, latitude, longitude, count) 
VALUES (5, 7, 'prueba', '2026-02-05', -13.429111, 132.41847, 1 );

-- 14
UPDATE species
SET scientific_name = 'Panthera leo'
WHERE scientific_name = 'Pantera leo';

-- 15
DELETE FROM observations
WHERE observer = 'prueba';



