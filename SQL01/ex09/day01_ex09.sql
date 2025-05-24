SELECT name
FROM pizzeria
WHERE ID NOT IN (
	SELECT pizzeria_id
	FROM person_visits
);

SELECT name
FROM pizzeria AS p
WHERE NOT EXISTS (
	SELECT pizzeria_id
	FROM person_visits AS pv
	WHERE pv.pizzeria_id = p.id
);