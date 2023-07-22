/* Populate database with sample data. */

INSERT INTO animals VALUES ( 1,'Agumon','2020-02-03',0,true, 10.23), ( 2,'Gabumon','2018-11-15',2,true, 8),(  3,'Pikachu','2021-01-07',1,false, 15.04),(  4,'Devimon','2017-05-12',5,true, 11);

INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(5, 'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, SCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES
(11, 'Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age) values ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Whittaker', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie whittaker', 38);

INSERT INTO species name values ('Pokemon');
INSERT INTO species (name) VALUES ("Digimon");

UPDATE animals SET species_id = (
  CASE 
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END
);

UPDATE animals SET owner_id = (
  CASE 
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    when name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    when name IN ('Angemon', 'Boarmon') THEN (SELECT id from owners WHERE full_name = 'Dean Winchester')
  END
);

INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE animals
SET species_id = (
    CASE
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END
);

UPDATE animals
SET owner_id = (
    CASE
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
        WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
        WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
        WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
    END
);



--===========================
-- join tables --============
--===========================


INSERT INTO vets ( name, age, date_of_graduation)
values('William Tatcher', 45 , '2000-04-23' ),
('Maisy Smith', 26 , '2019-01-17' ),
('Stephanie Mendez', 64 , '1981-05-04' ),
('Jack Harkness', 38 , '2008-06-08' );

INSERT INTO specialitations (vet_id, species_id)
VALUES (1, 1),
       (3, 1),
       (3, 2),
       (4, 2);


INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-02-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,2,'2019-12-21'),
(6,1,'2020-08-10'),
(6,2,'2021-04-07'),
(7,3,'2019-09-19'),
(8,4,'2020-10-03'),
(8,4,'2020-11-04'),
(9,2,'2019-01-24'),
(9,2,'2019-05-15'),
(9,2,'2020-02-27'),
(9,2,'2020-08-03'),
(10,3,'2020-05-24'),
(10,1,'2021-01-11');