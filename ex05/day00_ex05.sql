SELECT
	(SELECT name
	FROM person
	WHERE id = person_order.person_id
	) AS NAME
FROM person_order
WHERE order_date = '2022-01-07'
	AND (menu_id = 13 OR menu_id = 14 OR menu_id = 18);