-- drop DATABASE color;

-- select datname from pg_database;
-- SELECT * from animals;
-- ALTER TABLE animals ADD COLUMN species VARCHAR(50);
select * from animals;
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (5, 'Charmander', '2020-02-08', 0, false, -11);
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (8, 'Angemon', '2005-06-12', 1, true, -45);
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (9, 'Boarmon', '2005-06-07', 7, true, 20.4);
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (10, 'Blossom', '1998-10-13', 3, true, 17);
-- INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
-- (11, 'Ditto', '2022-05-14', 4, true, 22);
-- fisrt transaction
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
-- seccond transaction
