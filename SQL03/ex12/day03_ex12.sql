WITH person_count AS (SELECT COUNT(*) AS count FROM person),
max_id AS (SELECT COALESCE(MAX(id), 0) AS max FROM person_order),
series AS (SELECT generate_series(0, (SELECT count FROM person_count) - 1) gs)


INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
	max_id.max + series.gs + 1,
	(SELECT id FROM person ORDER BY id LIMIT 1 OFFSET series.gs),
	(SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
	DATE '2022-02-25'
FROM series, max_id;
