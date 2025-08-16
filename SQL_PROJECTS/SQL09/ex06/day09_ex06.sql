CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(IN pperson varchar DEFAULT 'Dmitriy', IN pprice numeric DEFAULT 500, IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (name varchar) AS $$
BEGIN
	RETURN QUERY -- возвращает строки
	SELECT pizzeria.name
	FROM pizzeria
	JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
	JOIN menu ON pizzeria.id = menu.pizzeria_id
	JOIN person ON person_visits.person_id = person.id
	WHERE person.name = pperson
	AND menu.price < pprice
	AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

