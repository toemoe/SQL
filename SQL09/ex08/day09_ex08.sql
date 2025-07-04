CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci INTEGER) AS $$
BEGIN
	RETURN QUERY
	WITH RECURSIVE fib(n1, n2) AS (
		SELECT 0, 1
		UNION ALL
		SELECT n2, n1 + n2
		FROM fib
		WHERE n1 < pstop
	)
	SELECT n1 FROM fib WHERE n1 < pstop;
END;
$$ LANGUAGE plpgsql;