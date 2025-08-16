CREATE FUNCTION in_usd(op_data TIMESTAMP, c_id BIGINT, money NUMERIC)
RETURNS NUMERIC
AS $$
DECLARE usd NUMERIC;
BEGIN
	SELECT rate_to_usd INTO usd FROM currency
	WHERE updated < op_data+interval '1 day' and id=c_id
	ORDER BY updated DESC
	LIMIT 1;
	IF usd IS NULL THEN
		SELECT rate_to_usd INTO usd FROM currency
		WHERE updated > op_data+interval '1 day' and id=c_id
		ORDER BY updated
		LIMIT 1;
	END IF;
	IF usd IS NULL THEN
		RETURN NULL;
	END IF;

	RETURN MONEY * usd;
END;
$$ LANGUAGE plpgsql;

SELECT COALESCE(u.name, 'not defined') AS name,
COALESCE(u.lastname, 'not defined') AS lastname,
(SELECT name FROM currency WHERE id=b.currency_id GROUP BY name) AS currency_name,
ROUND(in_usd(b.updated, b.currency_id, b.money), 2) AS currency_in_usd FROM "user" u
RIGHT JOIN "balance" b ON b.user_id = u.id
WHERE in_usd(b.updated, b.currency_id, b.money) IS NOT NULL
ORDER BY 1 DESC, 2, 3;