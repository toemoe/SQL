SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;