SELECT (c.cancoes) AS cancao,
COUNT(r.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN reproducao AS r
ON c.cancao_id = r.cancao_id
GROUP BY c.cancoes
ORDER BY reproducoes DESC, c.cancoes
LIMIT 2;