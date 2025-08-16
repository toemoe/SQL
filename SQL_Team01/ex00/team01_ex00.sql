SELECT 
	COALESCE("user".name, 'not defined') AS name,
	COALESCE("user".lastname, 'not defined') AS lastname,
	balance.type,
	SUM(balance.money) AS volume,
	COALESCE(latest_currency.name, 'not defined') AS currency_name,
	ROUND(COALESCE(latest_currency.rate_to_usd, 1), 1) AS last_rate_to_usd,
	TRUNC(SUM(balance.money) * COALESCE(latest_currency.rate_to_usd, 1)) AS total_volume_in_usd
FROM balance
LEFT JOIN "user" ON balance.user_id = "user".id
LEFT JOIN (
	SELECT cur1.id, cur1.name, cur1.rate_to_usd
	FROM currency cur1
	WHERE cur1.updated = (
		SELECT MAX(cur2.updated)
		FROM currency cur2
		WHERE cur1.id = cur2.id
	)
) latest_currency ON balance.currency_id = latest_currency.id
GROUP BY "user".id, "user".lastname, balance.type, latest_currency.name, latest_currency.rate_to_usd
ORDER BY name DESC, lastname ASC, balance.type ASC;