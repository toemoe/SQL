CREATE FUNCTION fnc_persons_female()
RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
AS $$
	SELECT id, name, age, gender, address
	FROM person
	WHERE person.gender = 'female';
$$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
AS $$
	SELECT id, name, age, gender, address
	FROM person
	WHERE person.gender = 'male';
$$ LANGUAGE sql;