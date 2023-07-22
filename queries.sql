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


--===============================================
-- JOIN TABLE FOR VISITS QUERIES
--===============================================
SELECT A.NAME
FROM ANIMALS A
JOIN VISITS V ON A.ID = V.ANIMAL_ID
JOIN VETS VE ON V.VET_ID = VE.ID
WHERE VE.NAME = 'William Tatcher'
ORDER BY V.VISIT_DATE DESC LIMIT 1;

SELECT COUNT( DISTINCT A.NAME)
FROM ANIMALS A
JOIN VISITS V ON A.ID = V.ANIMAL_ID
JOIN VETS VE ON V.VET_ID = VE.ID
WHERE VE.NAME = 'Stephanie Mendez';

select vet.name as vet_name, s.name as speciality_name
FROM vets vet
left join specialitations esp  on esp.vet_id = vet.id  
left join species s on esp.species_id = s.id;  

SELECT vet.name as vet_name, a.name as animal_name, v.visit_date 
from animals a    
join visits v on v.animal_id = a.id
join vets vet on v.vet_id = vet.id
WHERE vet.name = 'Stephanie Mendez' 
and v.visit_date BETWEEN '2020-04-01' and '2020-08-30'; 

SELECT  A.NAME , COUNT( V.ANIMAL_ID) AS VCOUNT
FROM ANIMALS A  
JOIN visits V  ON V.animal_id = A.id
GROUP BY A.NAME
ORDER BY VCOUNT DESC LIMIT 1;

SELECT A.NAME, V.VISIT_DATE as date 
FROM ANIMALS A  
JOIN VISITS V ON V.animal_id = A.id
JOIN vets VET ON V.vet_id = VET.id  
WHERE VET.name = 'Maisy Smith'
ORDER BY date LIMIT 1;

SELECT
V.VISIT_DATE,
VET.NAME VET_NAME,
VET.AGE,
A.NAME AS ANIMAL_NAME, 
A.DATE_OF_BIRTH, 
A.SCAPE_ATTEMPTS, 
A.NEUTERED,
A.WEIGHT_KG  
FROM visits V
JOIN animals A ON V.animal_id = A.id
JOIN  vets VET ON V.VET_ID = VET.ID
ORDER BY V.visit_date DESC LIMIT 1;

SELECT COUNT(*) AS num_visits
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
LEFT JOIN specialitations s ON vt.id = s.vet_id AND a.species_id = s.species_id
WHERE s.vet_id IS NULL;

SELECT a.species_id, COUNT(*) AS visit_count, sp.name AS species_name
FROM visits v
INNER JOIN vets ve ON ve.id = v.vet_id
INNER JOIN animals a ON a.id = v.animal_id
INNER JOIN species sp ON sp.id = a.species_id
WHERE ve.name = 'Maisy Smith'
GROUP BY a.species_id, sp.name
ORDER BY visit_count DESC
LIMIT 1;