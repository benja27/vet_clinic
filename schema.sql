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


CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) not null,
    age INT NOT null,
    date_of_graduation DATE
);

CREATE TABLE specialitations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
    id serial PRIMARY key, 
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    visit_date date
);