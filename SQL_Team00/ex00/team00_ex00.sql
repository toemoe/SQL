CREATE TABLE nodes (
	point1 CHAR(1),
	point2 CHAR(1),
	cost INTEGER
);

INSERT INTO nodes VALUES
('a', 'b', 10), ('a', 'd', 20), ('a', 'c', 15),
('d', 'b', 25), ('d', 'c', 30), ('c', 'b', 35),
('b', 'a', 10), ('d', 'a', 20), ('c', 'a', 15),
('b', 'd', 25), ('c', 'd', 30), ('b', 'c', 35);

WITH RECURSIVE travel(cities_visited, current_city, total_cost) AS (
	SELECT ARRAY['a']::bpchar[] AS cities_visited,
	       'a'::bpchar AS current_city,
	       0 AS total_cost
	UNION
	SELECT cities_visited || nodes.point2,
	       nodes.point2,
	       total_cost + nodes.cost
	FROM travel
	JOIN nodes ON travel.current_city = nodes.point1
	WHERE nodes.point2 <> ALL(cities_visited)
)



SELECT total_cost + nodes.cost AS total_cost,
       cities_visited || 'a'::bpchar AS tour
FROM travel
JOIN nodes ON travel.current_city = nodes.point1 AND nodes.point2 = 'a'::bpchar
WHERE array_length(cities_visited, 1) = 4
AND total_cost + nodes.cost = (SELECT MIN(total_cost + nodes.cost)
		FROM travel
		JOIN nodes ON travel.current_city = nodes.point1 AND nodes.point2 = 'a'::bpchar
		WHERE array_length(cities_visited, 1) = 4)
ORDER BY total_cost, tour;