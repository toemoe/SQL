SELECT order_date AS action_date, person.name
FROM person_order, person
WHERE person_order.person_id = person.id
INTERSECT -- общие строки
SELECT visit_date AS action_date, person.name
FROM person_visits, person
WHERE person_visits.person_id = person.id
ORDER BY action_date ASC, name DESC;