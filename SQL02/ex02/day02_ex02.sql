SELECT
  COALESCE(person.name, '-') AS person_name,
  days.visit_date,
  COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
  SELECT *
  FROM person_visits
  WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS days
FULL JOIN person ON days.person_id = person.id
FULL JOIN pizzeria ON days.pizzeria_id = pizzeria.id
ORDER BY person_name, pizzeria_name, visit_date;
