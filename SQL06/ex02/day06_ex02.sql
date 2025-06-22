SELECT person.name, menu.pizza_name, menu.price, ROUND(menu.price*(1 - pd.discount/100.0), 0) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_discounts AS pd
JOIN person ON pd.person_id = person.id
JOIN menu ON pd.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON pd.pizzeria_id = pizzeria.id
ORDER BY person.name, menu.pizza_name;