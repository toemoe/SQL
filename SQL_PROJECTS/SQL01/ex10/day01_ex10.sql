SELECT person.name AS person_name, menu.pizza_name, pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;