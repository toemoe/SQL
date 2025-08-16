SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_1, p.name AS pizzeria_name_2, menu.price
FROM menu
INNER JOIN menu AS m ON menu.price = m.price
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
INNER JOIN pizzeria AS p ON m.pizzeria_id = p.id
WHERE menu.id > m.id AND menu.pizza_name = m.pizza_name
ORDER BY pizza_name;