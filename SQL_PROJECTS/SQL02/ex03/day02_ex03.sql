WITH RECURSIVE days AS (
  SELECT DATE '2022-01-01' AS day
  UNION ALL
  SELECT (day + INTERVAL '1 day')::date
  FROM days
  WHERE day + INTERVAL '1 day' <= DATE '2022-01-10'
)
SELECT days.day AS missing
FROM days
LEFT JOIN (
  SELECT DISTINCT visit_date
  FROM person_visits
  WHERE person_id IN (1, 2)
) 
ON visit_date = days.day
WHERE visit_date IS NULL
ORDER BY missing;
