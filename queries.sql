/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE NAME LIKE '%mon';
SELECT NAME FROM animals WHERE DATE_OF_BIRTH >= '2016-01-01' and DATE_OF_BIRTH <= '2019-12-31';
SELECT NAME FROM animals WHERE NEUTERED = true AND SCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM animals WHERE NAME IN ('Agumon',' Pikachu');
SELECT NAME, SCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;
SELECT * FROM animals WHERE NEUTERED = true;
SELECT * FROM animals WHERE NAME != 'GABUMON';
SELECT * FROM animals WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;