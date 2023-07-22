/*Queries that provide answers to the questions from all projects.*/

--What animals belong to Melody Pond?
SELECT a.*
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
select a.* FROM animals a join species s ON a.species_id = s.id where s.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT o.full_name AS owner_name, a.*
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;

--How many animals are there per species?
SELECT species_id, COUNT(*) AS total_animals
FROM animals
GROUP BY species_id;

--List all Digimon owned by Jennifer Orwell.
SELECT a.*
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.*
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.scape_attempts = 0;

--Who owns the most animals?
SELECT o.full_name, COUNT(a.id) AS num_animals_owned
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.id, o.full_name
ORDER BY num_animals_owned DESC
LIMIT 1;
