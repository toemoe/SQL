SELECT menu.pizza_name AS pizza_name, menu.price AS price,
  pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM person_visits
INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
INNER JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;