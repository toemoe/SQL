SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
LEFT JOIN person_order ON person.id = person_order.person_id
	AND person_order.order_date = person_visits.visit_date
WHERE person.name = 'Andrey'
AND person_order.order_date IS NULL
AND person_visits.visit_date IS NOT NULL;