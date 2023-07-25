/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    ID INT PRIMARY KEY NOT NULL,
    NAME varchar(50) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    SCAPE_ATTEMPTS INT NOT NULL,
    NEUTERED BOOLEAN,
    WEIGHT_KG DECIMAL    
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name varchar(255) not null,
    age INT
)

CREATE TABLE species (
    id serial PRIMARY KEY,
    NAME VARCHAR(20)
)


CREATE SEQUENCE animals_id_seq START 1;
ALTER TABLE animals DROP CONSTRAINT IF EXISTS animals_pkey;
ALTER TABLE animals ALTER COLUMN ID SET DEFAULT nextval('animals_id_seq');
ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER table animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id)  REFERENCES species (id);

ALTER table animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id)  REFERENCES owners (id);


-- PERFORMANCE AUDIT

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

CREATE INDEX ids_visits_animal_id ON visits(animal_id);
CREATE INDEX ids_visits_vet_id ON visits(vet_id ASC);
CREATE INDEX ids_owners_email ON owners(email);