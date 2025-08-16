SELECT DISTINCT person.name
FROM person_order
JOIN person ON person_order.person_id = person.id
WHERE order_date IS NOT NULL
ORDER BY person.name;