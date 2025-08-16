CREATE VIEW v_price_with_discount AS
SELECT person.name, menu.pizza_name, menu.price, CAST(menu.price - menu.price * 0.1 AS INTEGER) AS discount_price
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
ORDER BY person.name, menu.pizza_name;
