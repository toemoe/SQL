SELECT name, SUM(count) AS total_count
FROM (
SELECT pizzeria.name, COUNT(person_visits.id) AS count
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name

UNION ALL

SELECT pizzeria.name, COUNT(person_order.id) AS count
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
)
GROUP BY name
ORDER BY total_count DESC;