SELECT DISTINCT days::date AS missing
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS days
LEFT JOIN (
	SELECT DISTINCT visit_date
	FROM person_visits
	WHERE person_id IN (1, 2)
) AS visits ON visits.visit_date = days
WHERE visits.visit_date IS NULL
ORDER BY missing;
