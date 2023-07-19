/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    ID INT PRIMARY KEY NOT NULL,
    NAME varchar(50) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    SCAPE_ATTEMPTS INT NOT NULL,
    NEUTERED BOOLEAN,
    WEIGHT_KG DECIMAL
);
