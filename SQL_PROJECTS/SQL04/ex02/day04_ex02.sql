SELECT DISTINCT v.generated_date AS missing_date
FROM v_generated_dates AS v
LEFT JOIN person_visits ON v.generated_date = person_visits.visit_date
ORDER BY v.generated_date;