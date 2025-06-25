WITH calculate AS (
SELECT address, MAX(age::numeric) AS max_age,
	MIN(age::numeric) AS min_age,
	AVG(age::numeric) AS average_age
FROM person
GROUP BY address
)
SELECT address,
	ROUND((max_age - (min_age/max_age)), 2) AS formula,
	ROUND(average_age, 2) AS average,
	CASE WHEN (max_age - (min_age/max_age)) > average_age THEN 'true'
        ELSE 'false'
	END AS comparison
FROM calculate
ORDER BY address;
