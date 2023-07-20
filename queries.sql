/*Queries that provide answers to the questions from all projects.*/

-- First activities queries

-- SELECT * from animals WHERE NAME LIKE '%mon';
-- SELECT NAME FROM animals WHERE DATE_OF_BIRTH >= '2016-01-01' and DATE_OF_BIRTH <= '2019-12-31';
-- SELECT NAME FROM animals WHERE NEUTERED = true AND SCAPE_ATTEMPTS < 3;
-- SELECT DATE_OF_BIRTH FROM animals WHERE NAME IN ('Agumon',' Pikachu');
-- SELECT NAME, SCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;
-- SELECT * FROM animals WHERE NEUTERED = true;
-- SELECT * FROM animals WHERE NAME != 'GABUMON';
-- SELECT * FROM animals WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;


-- =======================================
--  SECOND DAY QUERIES
-- =======================================

-- species column goes from null to unspecified and rollback
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- species are set to either digimon or pokemon
BEGIN;
UPDATE animals SET species = 'digimon' WHERE NAME LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

--  delete animals table and rollback
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- animals weight is multiplied by -1 and savepoint
BEGIN;
DELETE FROM animals WHERE DATE_OF_BIRTH > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET WEIGHT_KG = -1 * WEIGHT_KG;
ROLLBACK TO SAVEPOINT my_savepoint;
UPDATE animals SET WEIGHT_KG = -1 * WEIGHT_KG WHERE WEIGHT_KG < 0;
COMMIT;

-- how many animals are there?
SELECT COUNT(*) AS totalAnimals FROM animals;

--How many animals have never tried to escape?
SELECT COUNT(*) AS neverTriedEscape FROM animals WHERE SCAPE_ATTEMPTS = 0;

--What is the average weight of animals?
SELECT AVG(WEIGHT_KG) AS averageWeight FROM animals;

--Who escapes the most, neutered or not neutered animals?
SELECT NEUTERED, MAX(SCAPE_ATTEMPTS) AS maxEscapeAttempts
FROM animals
GROUP BY NEUTERED;

--What is the minimum and maximum weight of each type of animal?
SELECT NAME, MIN(WEIGHT_KG) AS minWeight, MAX(WEIGHT_KG) AS maxWeight
FROM animals
GROUP BY NAME;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT NAME, AVG(SCAPE_ATTEMPTS) AS midEscapeAttempts
FROM animals
WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY NAME;
