INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id,
	sub.person_id, sub.pizzeria_id,
	CASE
		WHEN sub.orders = 1 THEN 10.5
		WHEN sub.orders = 2 THEN 22
		ELSE 30
	END AS discount
FROM (
	SELECT person_id, pizzeria_id,
	COUNT(*) AS orders
	FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	GROUP BY person_id, pizzeria_id
) AS sub;
