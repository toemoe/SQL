SELECT order_date AS action_date, person_id
FROM person_order
INTERSECT -- пересечения
SELECT visit_date AS action_date, person_id
FROM person_visits
ORDER BY action_date ASC, person_id DESC;