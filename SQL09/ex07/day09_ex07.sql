CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $$
    SELECT MIN(val)
    FROM unnest(arr) AS val;
$$ LANGUAGE sql;