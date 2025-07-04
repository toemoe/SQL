SELECT person.name, COUNT(person_visits.id) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name ORDER BY count_of_visits DESC, person.name
LIMIT 4;