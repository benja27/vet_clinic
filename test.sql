SELECT a.species_id, COUNT(*) AS visit_count, sp.name AS species_name
FROM visits v
INNER JOIN vets ve ON ve.id = v.vet_id
INNER JOIN animals a ON a.id = v.animal_id
INNER JOIN species sp ON sp.id = a.species_id
WHERE ve.name = 'Maisy Smith'
GROUP BY a.species_id, sp.name
ORDER BY visit_count DESC
LIMIT 1;